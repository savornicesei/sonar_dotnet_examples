@ECHO OFF

IF [%1]==[] (
	SET configuration=SonarQube
) ELSE (
	SET configuration=%1
)

SET nunit_console=Tools\Nunit\nunit3-console.exe
SET opencover_console=Tools\OpenCover\OpenCover.Console.exe
SET report_generator=Tools\ReportGenerator\ReportGenerator.exe
SET cobertura_converter=Tools\OpenCoverToCoberturaConverter\OpenCoverToCoberturaConverter.exe

ECHO.
ECHO Clear reports folder
RMDIR /S /Q reports
MKDIR reports

ECHO ====================================================
ECHO                 UNIT TESTS
ECHO ====================================================
ECHO.
ECHO Running nunit tests with %nunit_console% and configuration %configuration%
ECHO %nunit_console% WebApplication1.Tests\WebApplication1.Tests.csproj --result=reports\nunit_results.xml;format=nunit2 --err=reports\nunit_err.log --output=reports\nunit_out.log --framework=net-4.5 --config=%configuration% --dispose-runners --workers=10 -v
%nunit_console% WebApplication1.Tests\WebApplication1.Tests.csproj --result=reports\nunit_results.xml;format=nunit2 --err=reports\nunit_err.log --output=reports\nunit_out.log --framework=net-4.5 --config=%configuration% --dispose-runners --workers=10 -v

ECHO.
ECHO Running code coverage on nunit tests
ECHO %opencover_console% -register:user -target:%nunit_console% -targetargs:"WebApplication1.Tests\WebApplication1.Tests.csproj --err=reports\nunit_err.log --out=reports\nunit_out.log --framework=net-4.5 --config=%configuration% --dispose-runners --workers=10 --noresult -v" -filter:"+[WebApplication1*]* -[WebApplication1.Tests*]*" -mergebyhash -hideskipped:Filter -output:reports\opencover_results.xml
%opencover_console% -register:user -target:%nunit_console% -targetargs:"WebApplication1.Tests\WebApplication1.Tests.csproj --err=reports\nunit_err.log --out=reports\nunit_out.log --framework=net-4.5 --config=%configuration% --dispose-runners --workers=10 --noresult -v" -filter:"+[WebApplication1*]* -[WebApplication1.Tests*]*" -mergebyhash -hideskipped:Filter -output:reports\opencover_results.xml


: fail_build
ECHO Error %ERRORLEVEL%
REM exit %ERRORLEVEL%