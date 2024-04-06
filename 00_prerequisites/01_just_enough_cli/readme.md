# Just Enough CLI for Data Roles

A shell is a program that runs commands, like the ones that users enter into a terminal window. These commands can be other programs or built-in features of the shell. The shell also serves as a small programming environment. Unix programmers often break common tasks into smaller components and use the shell to manage tasks and piece things together.

There are many different Unix shells, but all derive features from the Bourne shell (/bin/sh), a standard shell developed at Bell Labs for early versions of Unix.

Linux uses an enhanced version of the Bourne shell called bash or the “Bourne-again” shell. The bash shell is the default shell on most Linux distributions, and `/bin/sh` is normally a link to `bash` on a Linux system.

`$`, `#`, `%` symbols indicate the user account type you are logged in to.

- Dollar sign `$` means you are a normal user.
- hash `#` means you are the system administrator (root).
- In the C shell, the prompt ends with a percentage sign `%`.

# Use Cases for data professionals

Technical (engineer) and Non Technical (analyst)

## Data Engineer
1. SSH - connect VM via CLI (tunnel)
2. Modify configs files - Software/Server
	2.1 Nano
	2.2 VIM
3. Admin duties (ETL, BI)
4. Git
5. IDE
6. AWS/Azure/GCP - CLI (save time)
7. Shortcuts (Alias)
8. Cron
9. Run scripts, automation

## Data Analyst
1. SSH - connect VM via CLI (tunnel)
2. Git
3. Modify configs files - Software/Server
	3.1 Nano
	3.2 VIM
4. Cron
5. Run scripts, automation

But overall it is about  Engineering Excellence


# Linux environment on Windows

Windows Subsystem for Linux (WSL) is a feature of Windows that allows you to run a Linux environment on your Windows machine, without the need for a separate virtual machine or dual booting.


https://learn.microsoft.com/en-us/windows/wsl/install

We can install:

> Opne CMD as an Administrator

```bash
wsl --install
```


## Install OhMyZsh on Mac

Mac is using ZSH starting from Catalina OS.

>Zsh is called Z Shell, which is an extension of Bash that has many new features and themes. Zsh was released in 1990 by Paul Falstad. Zsh has similarities with Korn shell as well. Linux and Mac OS use Bash as their default shell.

Mac:

https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

Install oh-my-zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

> Uninstall `uninstall_oh_my_zsh`

Themes and plugins: https://github.com/ohmyzsh/ohmyzsh

Plugins: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

### Autocomplete

```
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Modify the file:

```
nano ~/.zshrc

plugins=(
  ...
  zsh-autosuggestions
)
```
### Zsh sytax highlighting

```bash
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

```
plugins=(
  ...
  zsh-syntax-highlighting
)
```

# Linux Commands


## Standard Input and Standard Output

Unix processes use I/O streams to read and write data. Processes read data from input streams and write data to output streams.

Standard input and output are often abbreviated as `stdin` and `stdout`. There is a third standard I/O stream, called `stderr`.



## Basic Commands

### cat

The `cat` program is one of the easiest in Unix to understand; it simply outputs the contents of one or more files or another source of input.

```bash
cat file1 file2 ...
```

### ls

The `ls` command lists the contents of a directory. The default is the current directory, but you can add any directory or file as an argument, and there are many useful options. For example, use `ls -l` for a detailed (long) listing and `ls -F` to display file type information.

```bash
ls -l
```

### cp

In its simplest form, `cp` copies files.

```bash
cp file1 file2
cp file dir
```

### mv

The `mv` (move) command works much like cp. In its simplest form, it renames a file.

```bash
mv file1 file2
```

### touch

The touch command can create a file. If the target file already exists, touch doesn’t change the file, but it does update the file’s modification timestamp.

```bash
touch file
```

### rm

The `rm` command deletes (removes) a file.

```bash
rm file
```

### echo

The `echo` command prints its arguments to the standard output:

```bash
echo Hello world!
```

### cd

The current working directory is the directory that a process (such as the shell) is currently in.

```bash
cd dir
```

> `~` usually home directory

### mkdir

The mkdir command creates a new directory dir:

```bash
mkdir dir
```

## rmdir

The rmdir command removes the directory dir:

```bash
rmdir dir
```

If dir isn’t empty, this command fails. However, if you’re impatient, you probably don’t want to laboriously delete all the files and subdirectories inside dir first. You can use `rm -r` dir to delete a directory and its contents.

### Wildcards

- `at*` expands to all filenames that start with at.
- `*at` expands to all filenames that end with at.
- `*at*` expands to all filenames that contain at.

> In Windows we can use `*.*` to search all files, in Linux - `*`.

`?` - match 1 symbol.

### grep

The `grep` command prints the lines from a file or input stream that match an expression.

```bash
grep root /etc/passwd

grep root /etc/*
```

Available options:

- `-i` for case-insensitive matches
- `v` which inverts the search—that is, prints all lines that don’t match

`grep` understands regular expressions, patterns that are grounded in computer science theory and are very common in Unix utilities. Regular expressions are more powerful than wildcard-style patterns, and they have a different syntax. There are three important things to remember about regular expressions:

- `.*` matches any number of characters, including none (like the * in globs and wildcards).
- `.+` matches any one or more characters.
- `.` matches exactly one arbitrary character.

### less

The less command comes in handy when a file is really big or when a command’s output is long and scrolls off the top of the screen.

```bash
less /usr/share/dict/words
```

### pwd

The `pwd` (print working directory) program simply outputs the name of the current working directory.

```bash
pwd
```

### diff

To see the differences between two text files, use diff:

```bash
diff file1 file2
```

### file

If you see a file and are unsure of its format, try using the file command to see if the system can guess it:

```bash
file file
```

### find and locate

It’s frustrating when you know that a certain file is in a directory tree somewhere but you just don’t know where. Run `find` to find file in dir as follows:

```bash
find dir -name file -print
```

Most systems also have a `locate` command for finding files. Rather than searching for a file in real time, `locate` searches an index that the system builds periodically. Searching with `locate` is much faster than find, but if the file you’re looking for is newer than the index, `locate` won’t find it.

### head and tail

The head and tail commands allow you to quickly view a portion of a file or stream of data. For example, `head /etc/passwd` shows the first 10 lines of the password file, and `tail /etc/passwd` shows the last 10 lines.

### sort

The `sort` command quickly puts the lines of a text file in alphanumeric order.

## Dot Files

We can run:

```bash
ls -a
```

And it will show us the configuration files i.e. dot files.

## Environment and Shell Variables

The shell can store temporary variables, called *shell variables*, containing the values of text strings. Shell variables are very useful for keeping track of values in scripts, and some shell variables control the way the shell behaves.

To assign a value to a shell variable, use the equal sign (=). Here’s a simple example:

```
HOST=127.0.0.1
```
o access this variable, use `$HOST` (for example, try running `echo $HOST`).

An *environment variable* is like a shell variable, but it’s not specific to the shell. All processes on Unix systems have environment variable storage. The main difference between environment and shell variables is that the operating system passes all of your shell’s environment variables to programs that the shell runs, whereas shell variables cannot be accessed in the commands that you run.

Assign an environment variable with the shell’s export command. For example, if you’d like to make the `$STUFF` shell variable into an environment variable, use the following:

```bash
$ STUFF=blah
$ export STUFF
```

## The Command Path

`PATH` is a special environment variable that contains the command path (or path for short), a list of system directories that the shell searches when trying to locate a command.

```bash
echo $PATH
/usr/local/bin:/usr/bin:/bin
```

## Special Characters

- `*`	star, asterisk	Regular expression, glob character
- `.`	dot	Current directory, file/hostname delimiter
- `!`	bang	Negation, command history
- `|`	pipe	Command pipes
- `/`	(forward) slash	Directory delimiter, search command
- `\`	backslash	Literals, macros (never directories)
- `$`	dollar	Variables, end of line
- `'`	tick, (single) quote	Literal strings
- `"`	double quote	Semi-literal strings
- `^`	caret	Negation, beginning of line
- `~`	tilde, squiggle	Negation, directory shortcut
- `#`	hash, sharp, pound	Comments, preprocessor, substitutions
- `[ ]`	(square) brackets	Ranges
- `{ }`	braces, (curly) brackets	Statement blocks, ranges
- `_`	underscore, under	Cheap substitute for a space used when `spaces` aren’t wanted or allowed, or when autocomplete algorithms get confused

## Command-Line Editing

The most powerfull is `vi` and `emacs`.

Simple editor is `nano`.

## File Modes and Permissions

Every Unix file has a set of permissions that determine whether you can read, write, or run the file. Running `ls -l` displays the permissions.

Each permission set can contain four basic representations:

- `r` means that the file is readable.
- `w` means that the file is writable.
- `x` means that the file is executable (you can run it as a program).
- `-` means “nothing” (more specifically, the permission for that slot in the set has not been granted).

### Modifying Permissions

To change permissions on a file or directory, use the `chmod` command.

```bash
chmod 644 file
```

- `644`	user: read/write; group, other: read	files
- `600`	user: read/write; group, other: none	files
- `755`	user: read/write/execute; group, other: read/execute	directories, programs
- `700`	user: read/write/execute; group, other: none	directories, programs
- `711`	user: read/write/execute; group, other: execute

## Symbolic Link

A symbolic link is a file that points to another file or a directory, effectively creating an alias (like a shortcut in Windows). Symbolic links offer quick access to obscure directory paths.

## Archiving and Compressing Files

The program `gzip` (GNU Zip) is one of the current standard Unix compression programs. A file that ends with `.gz` is a GNU Zip archive. Use `gunzip` file.gz to uncompress <file>.gz and remove the suffix; to compress the file again, use `gzip` file.

Unlike the ZIP programs for other operating systems, `gzip` does not create archives of files; that is, it doesn’t pack multiple files and directories into a single file. To create an archive, use `tar` instead:

```bash
tar cvf archive.tar file1 file2 ...
```

To unpack a .tar file with tar use the x flag:

```bash
tar xvf archive.tar
```

## Running Commands as the Superuser

Most distributions use a package called `sudo` to allow administrators to run commands as root when they are logged in as themselves.

### Shortcuts

- CTRL-B	Move the cursor left
- CTRL-F	Move the cursor right
- CTRL-P	View the previous command (or move the cursor up)
- CTRL-N	View the next command (or move the cursor down)
- CTRL-A	Move the cursor to the beginning of the line
- CTRL-E	Move the cursor to the end of the line
- CTRL-W	Erase the preceding word
- CTRL-U	Erase from cursor to beginning of line
- CTRL-K	Erase from cursor to end of line
- CTRL-Y	Paste erased text (for example, from CTRL-U)



# Apendix

## Steps for Windows
Windows
1. Open CMD as Admin
2. run wsl --install
3. Open Ubuntu
4. sudo apt-get install zsh
	sudo apt-get install git
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Configuring zsh/oh-my-zsh

```
nano ~/.bashrc
```

```
if test -t 1; then
exec zsh
fi
```

Changing the Theme of oh-my-zsh
```
nano ~/.zshrc
```

Broken theme

Installing missing Powerline Fonts with PowerShell.
```
git clone https://github.com/powerline/fonts.git
```

admin PowerShell

Run this command:

```
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force
```
and then install
```
.\install.ps1
```

If not working make a change in Ubunto fonts
Windows:

https://learn.microsoft.com/en-us/windows/wsl/install

>Opne CMD as an Administrator
