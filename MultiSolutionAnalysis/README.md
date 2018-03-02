

Environment
=============
* [.NET] 4.7.1
* [SonarQube](http://www.sonarqube.org/downloads/) 6.7.1 Community Edition
* [SonarQube Scanner for MSBuild](http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild) 4.0.2.892
* [SonarC# Plugin](http://docs.sonarqube.org/display/PLUG/C%23+Plugin) 6.8.1 (build 4648)
* [Compatible .NET Build Environment](http://docs.sonarqube.org/display/SCAN/From+the+Command+Line) MSBuild 14 + Visual Studio 2017 (for MSBuild 15)

Usage
=====
* Run SonarQube Scanner for MSBuild begin phase:

        SonarQube.Scanner.MSBuild.exe begin /k:MultiSolution /n:MultiSolution /v:1.10 /d:sonar.host.url=http://localhost:9000 /d:sonar.login=%SQTOKEN%

* Build the project using the provided nant file:

        ..\nant.cmd -f:calc.build Build.Debug.NoInstall

* Run SonarQube Scanner for MSBuild end phase:

        MSBuild.SonarQube.Runner.exe end /d:sonar.login=%SQTOKEN%