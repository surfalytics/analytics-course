# Just Enough CLI for Data Roles

Windows:

https://learn.microsoft.com/en-us/windows/wsl/install

Opne CMD as an Administrator

Mac:

Use Cases:

Technical (engineer) and Non Technical (analyst)


Engineer
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

Analyst
1. SSH - connect VM via CLI (tunnel)
2. Git
3. Modify configs files - Software/Server
	3.1 Nano
	3.2 VIM
4. Cron
5. Run scripts, automation

Engineering Excellence


Plugin:

Mac OS: https://ohmyz.sh/
Windows: 


Install 


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

Opne CMD as an Administrator

Mac:



Use Cases:

Technical (engineer) and Non Technical (analyst)


Engineer
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

Analyst
1. SSH - connect VM via CLI (tunnel)
2. Git
3. Modify configs files - Software/Server
	3.1 Nano
	3.2 VIM
4. Cron
5. Run scripts, automation

Engineering Excellence


Plugin:

Mac OS: https://ohmyz.sh/
Windows: 


Install 


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

Next:

```
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
```

```
nano ~/.zshrc


## set colors for LS_COLORS
eval `dircolors ~/.dircolors`
```




Symbolic Link

Project
	config_file
	Dev
		file1
		file2
		config_file (symbolic link)
	Prod
		file1
		file2
		config_file (symbolic link)
Next:

```
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
```

```
nano ~/.zshrc


## set colors for LS_COLORS
eval `dircolors ~/.dircolors`
```

Symbolic Link

```
Project
	config_file
	Dev
		file1
		file2
		config_file (symbolic link)
	Prod
		file1
		file2
		config_file (symbolic link)
```