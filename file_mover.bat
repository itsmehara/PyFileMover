@echo off
setlocal

rem Define source and destination folder paths
set /p sourceFolder="Enter source folder path: "
set /p destFolder="Enter destination folder path: "

rem List of supported file extensions
set "supportedExtensions=.txt .csv .xml .json"

rem Ensure source and destination folders exist
if not exist "%sourceFolder%" (
    echo Source folder does not exist.
    exit /b
)
if not exist "%destFolder%" (
    echo Destination folder does not exist.
    exit /b
)

rem Create directory with current date and time in destination folder
set "currentDateTime=%date:/=-%_%time::=-%"
set "currentDateTime=%currentDateTime: =0%"
set "destSubfolder=%destFolder%\%currentDateTime%"
mkdir "%destSubfolder%"

rem Iterate over files in the source folder
for %%F in ("%sourceFolder%\*") do (
    for %%E in (%supportedExtensions%) do (
        if /i "%%~xF" equ "%%~E" (
            rem Move the file to destination subfolder
            move "%%F" "%destSubfolder%"
            rem Log moved file details
            echo %currentDateTime%^|%destSubfolder%^|%sourceFolder%^|%%~nxF>> file_movement_log.txt
        )
    )
)

echo Files moved successfully.
