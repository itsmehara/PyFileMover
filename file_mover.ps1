function Move-Files {
    param(
        [string]$sourceFolder,
        [string]$destFolder
    )

    # List of supported file extensions
    $supportedExtensions = ".txt", ".csv", ".xml", ".json"

    # Ensure source and destination folders exist
    if (-not (Test-Path $sourceFolder)) {
        Write-Host "Source folder does not exist."
        return
    }
    if (-not (Test-Path $destFolder)) {
        Write-Host "Destination folder does not exist."
        return
    }

    # Create directory with current date and time in destination folder
    $currentDateTime = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $destSubfolder = Join-Path -Path $destFolder -ChildPath $currentDateTime
    New-Item -ItemType Directory -Path $destSubfolder | Out-Null

    # Iterate over files in the source folder
    $movedFiles = @()
    Get-ChildItem -Path $sourceFolder | ForEach-Object {
        # Check if file has supported extension
        if ($_.Extension -in $supportedExtensions) {
            # Move the file to destination subfolder
            $destFile = Join-Path -Path $destSubfolder -ChildPath $_.Name
            Move-Item -Path $_.FullName -Destination $destFile
            $movedFiles += $_.Name
        }
    }

    # Log moved file details to file_movement_log.txt
    $logFile = "file_movement_log.txt"
    $logContent = foreach ($file in $movedFiles) {
        "$currentDateTime|$destSubfolder|$sourceFolder|$file"
    }
    $logContent | Out-File -Append -FilePath $logFile

    Write-Host "Files moved successfully."
}

# Get source and destination folder paths from user input
$sourceFolder = Read-Host "Enter source folder path"
$destFolder = Read-Host "Enter destination folder path"
Move-Files -sourceFolder $sourceFolder -destFolder $destFolder
