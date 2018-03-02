.NET projects for SonarQube analysis using SonarQube Scanner for MSBuild.

Environment
=============
* [.NET] 4.6.1
* [SonarQube](http://www.sonarqube.org/downloads/) 6.0
* [SonarQube Scanner for MSBuild](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild) 2.1
* [SonarSource C# Plugin](http://docs.sonarqube.org/display/PLUG/C%23+Plugin) 5.3.2
* [Compatible .NET Build Environment](http://docs.sonarqube.org/display/SCAN/From+the+Command+Line) MSBuild 14

Usage
=====
* Run SonarQube Scanner for MSBuild begin phase:

        MSBuild.SonarQube.Runner.exe begin /k:"webproject1.src" /n:"C# :: WebProject1" /v:"1.0" /d:sonar.sources="." /d:sonar.sourceEncoding="UTF-8" /d:sonar.exclusions="file:**/aspnet_client/**/*.*,file:**/WebHelp/**/*.*,file:**/Web?References/**/*.*,**/Reference.cs,**/*.designer.cs,**/*.Designer.cs,**/*.g.cs,**/*.AssemblyInfo.cs,**/*_references.js,**/bootstrap-theme.css,**/bootstrap-theme.min.css,**/bootstrap.css,**/bootstrap.min.css,**/angular-mocks.js,file:**/angular-ui/**/*.*,**/angular*.js,**/jquery*.js,**/lodash.js,**/polyfills.js,**/jquery*.css,**/font-awesome*.css,**/ui-bootstrap*.css,**/html5-dataset.js,**/lodash*.js" /d:sonar.cs.nunit.reportsPaths="reports/nunit_results.xml" /d:sonar.cs.opencover.reportsPaths="reports/opencover_results.xml"

* Build the project with MSBuild:

        MSBuild.exe /target:Clean;Build /property:Configuration=SonarQube /p:Platform="Any CPU" /p:RunCodeAnalysis=True /p:RunCodeAnalysisOnThisProject=true

* Run unit tests and coverage (results will be generated in ./reports folder):

        CALL run_dotnet_tests.bat

* Run SonarQube Scanner for MSBuild end phase:

        MSBuild.SonarQube.Runner.exe end