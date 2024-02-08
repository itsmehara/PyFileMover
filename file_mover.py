import os
import shutil
from datetime import datetime


def move_files(source_folder, dest_folder):
    # List of supported file extensions
    supported_extensions = ['.txt', '.csv', '.xml', '.json']

    # Ensure source and destination folders exist
    if not os.path.exists(source_folder):
        print("Source folder does not exist.")
        return
    if not os.path.exists(dest_folder):
        print("Destination folder does not exist.")
        return

    # Create directory with current date and time in destination folder
    current_datetime = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    dest_subfolder = os.path.join(dest_folder, current_datetime)
    os.makedirs(dest_subfolder)

    # Create file movement log file if not exists
    log_file = 'file_movement_log.txt'
    if not os.path.exists(log_file):
        with open(log_file, 'w'):
            pass

    # Iterate over files in the source folder
    moved_files = []
    for filename in os.listdir(source_folder):
        # Check if file has supported extension
        if any(filename.endswith(ext) for ext in supported_extensions):
            # Move the file to destination subfolder
            src_file = os.path.join(source_folder, filename)
            dest_file = os.path.join(dest_subfolder, filename)
            shutil.move(src_file, dest_file)
            moved_files.append(filename)

    # Log moved file details to file_movement_log.txt
    with open(log_file, 'a') as f:
        for file_name in moved_files:
            log_entry = f"{datetime.now()}|{dest_subfolder}|{source_folder}|{file_name}\n"
            f.write(log_entry)

    print("Files moved successfully.")


if __name__ == "__main__":
    source_folder = input("Enter source folder path: ")
    dest_folder = input("Enter destination folder path: ")
    move_files(source_folder, dest_folder)
