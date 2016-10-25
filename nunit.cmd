:: Runs nunit-console from ./Tools/Nunit folder
@IF EXIST "%~dp0\.\Tools\Nunit\nunit3-console.exe" (
  "%~dp0\.\Tools\Nunit\nunit3-console.exe" %*
) ELSE (
  ECHO Please download nunit3 to Tools\Nunit folder (only the content of the bin folder)
)
