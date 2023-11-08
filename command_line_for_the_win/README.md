### COMMAND LINE FOR THE WIN

this is an amazing oppurtunity to lear the application of SFTP (Secure File Transfer Protocol) command-line tool to move your local screenshots to the sandbox environment or any virtual environment.

#### HOW TO CONNECT WITH SFTP

- open your command prompt on your local machine

- use the command `sftp username@hostname`
**note: your username, hostname and password have been provided in your sandbox environment**

- enter your `password`

Now you are connected and would see a `sftp` prompt displayed.

- navigate to the target directory on your sandbox using the `cd` command like this: `cd root/alx-system_engineering-devops/command_line_for_the_win`

- next you upload the screenshots of files using the `put` command:
1. to upload a single file use `put -r file_path`. In my case I used `put -r "C:\Users\User\Pictures\Screenshots\0-first.png.png"`
2. to upload an entire directory `put -r the_directory_path`

- now go to your sandbox and `ls` to check if your files were successfully uploaded.

- Now back at your command prompt use the `exit` command to exit the sftp prompt.

``Now you can push it to your github``
