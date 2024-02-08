' Define source and destination folder paths
$sourceFolder = 'C:\path\to\source'
$destFolder = 'C:\path\to\destination'

' List of supported file extensions
$supportedExtensions = ['.txt', '.csv', '.xml', '.json']

' Ensure source and destination folders exist
if not Exists($sourceFolder) then
    Print('Source folder does not exist.')
    exit(1)
endif
if not Exists($destFolder) then
    Print('Destination folder does not exist.')
    exit(1)
endif

' Create directory with current date and time in destination folder
$currentDateTime = FormatDate(CurrentDate(), 'YYYY-MM-DD') + '_' + FormatDate(CurrentTime(), 'HH-MM-SS')
$destSubfolder = $destFolder || '\' || $currentDateTime
MkDir($destSubfolder)

' Iterate over files in the source folder
$files = GetFileList($sourceFolder, '*.*')
foreach $file in $files
    $fileExt = GetFileExtension($file)
    if InList($fileExt, $supportedExtensions) then
        ' Move the file to destination subfolder
        MoveFile($file, $destSubfolder || '\' || GetFileName($file))
        ' Log moved file details
        $logEntry = $currentDateTime || '|' || $destSubfolder || '|' || $sourceFolder || '|' || GetFileName($file)
        WriteToFile('C:\path\to\file_movement_log.txt', $logEntry, 'Append')
    endif
endforeach

Print('Files moved successfully.')
