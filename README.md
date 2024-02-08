
## File Mover

FileMover is a Python script that allows you to move files from a source folder to a destination folder. It supports moving files of various types such as .txt, .csv, .xml, and .json. Additionally, it logs the names of moved files into a file_movement_log.txt file.

### FileMover
FileMover is a Python script that allows you to move files from a source folder to a destination folder while keeping track of the movement details.

### Features
Move files from a source folder to a destination folder.
Supports various file types: .txt, .csv, .xml, .json.
Creates a new subfolder in the destination folder with the current date and time each time the script is run.
Logs the details of file movements including date & time, destination path, source path, and file name into a file_movement_log.txt file.


### Installation
Clone the repository:

bash
Copy code
git clone https://github.com/your_username/FileMover.git
Navigate to the project directory:

```bash

cd FileMover
Install dependencies (none required):
```

```bash
# No dependencies to install
Usage
Run the Python script file_mover.py:
```

```bash
python file_mover.py
```

Follow the prompts to provide the source folder path and destination folder path.

Files from the source folder matching the supported file types will be moved to a new subfolder in the destination folder with the current date and time.
The details of the file movements including date & time, destination path, source path, and file name will be logged into file_movement_log.txt.

Example
```bash
$ python file_mover.py
Enter source folder path: /path/to/source
Enter destination folder path: /path/to/destination
Files moved successfully.
```

### File Movement Log Format
The file_movement_log.txt file has the following format:

```mathematica
DateTime|DestinationPath|SourcePath|FileName
```
DateTime: Date and time of the file movement.
DestinationPath: Path of the destination folder where the file was moved.
SourcePath: Path of the source folder from where the file was moved.
FileName: Name of the moved file.



### Usage
- Run the Python script file_mover.py:

```bash
python file_mover.py
```
- Follow the prompts to provide the source folder path and destination folder path.
- Files from the source folder matching the supported file types will be moved to the destination folder.
- The names of moved files will be appended to file_movement_log.txt.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
