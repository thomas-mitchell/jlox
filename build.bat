@echo off
setlocal enabledelayedexpansion

REM Set paths to Java tools
set JAVAC=C:\Java\jdk-oracle-1.8u371\bin\javac.exe
set JAVA=C:\Java\jdk-oracle-1.8u371\bin\java.exe

REM Set source files (add more as needed)
set SOURCES=com\craftinginterpreters\lox\*.java

REM Clear and recreate the output directory
if exist out rmdir /s /q out
mkdir out

REM Compile
echo Compiling...
%JAVAC% -d out %SOURCES%

if errorlevel 1 (
    echo Compilation failed.
    exit /b 1
)

REM Run
echo.
echo Running:
%JAVA% -cp out com.craftinginterpreters.lox.Lox
@REM %JAVA% -cp out com.craftinginterpreters.lox.Lox program.lox

endlocal