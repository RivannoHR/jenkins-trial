@echo off
set CONTAINER_NAME=containerexpressjs

for /f "tokens=*" %%i in ('docker ps --filter "name=%CONTAINER_NAME%" -q') do (
    set CONTAINER_ID=%%i
)

:: Check if a container ID was found
if defined CONTAINER_ID (
    echo Killing container with ID %CONTAINER_ID%
) else (
    echo No container named %CONTAINER_NAME% found.
)
echo Do you want to continue? (Y/N)
choice /c:YN /m "Press Y for Yes or N for No."
if errorlevel 2 goto :end
echo Continuing...
goto :eof
:end
echo Script aborted.