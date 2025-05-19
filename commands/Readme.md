# Lets start with some shell commands
```
date - shows date
cal  - calender
df   - To see the current amount of free space on your disk drives
du   - To see the directory space uses
exit - it is what the name says
cd   - change directory
file - filename tells a lot about file
ls 	 - list(it has lot of arguments like ls -l/-a/...)
less - command is a program to smaller view of text files.
apropos     search the manual page names and descriptions
whoami   	Displays current username.
id   	    Returns users identity
hostname 	Sets or prints the name of current host system.
uname 	    Prints basic information about the operating system name and system hardware.
pwd      	Returns working directory name.
ifconfig   	The ifconfig utility is used to assign or to view an address to a network interface and/or configure network interface parameters.
ip 	        Ip is a utility to show or manipulate routing, network devices, interfaces and tunnels.
netstat 	Shows network status.
ss 	        Another utility to investigate sockets.
ps  	    Shows process status.
who     	Displays who is logged in.
env 	    Prints environment or sets and executes command.
lsblk 	    Lists block devices.
lsusb    	Lists USB devices
lsof 	    Lists opened files.
lspci 	    Lists PCI devices.
uname       Print system information
cp          Copy files and directories
mv          Move/rename files and directories
mkdir       Create directories
    -> mkdir -p (parents) can make sub directory (mkdir -p foo/bar/)
rm  	   	Remove files and directories
ln	        Create hard and symbolic links(like copy but change in one file change in other file)
    -> ln = https://www.youtube.com/watch?v=zfSa-PEU3h4&ab_channel=LearnLinuxTV
```
# Wildcard
```
*   All files
	g*  Any file beginning with “g”
	b*.txt  Any file beginning with “b” followed by any characters and ending with “.txt”
? 	Match exactly one character
	ls file?.txt -> matches file1.txt file2.txt etc but not file10.txt
[]	Any one of the characters inside.
	ls file[12].txt ->  matches file1.txt to file12.txt
	ls file[a-c].txt
[^] or [! ] (Negation)
	ls file[!0-9].txt -> Matches files that don’t have a number in that position.
\ 	Escaping Wild cartridges
	ls \*.txt -> Matches file named *.txt

```
# Create own command

```
alias foo='cd /usr'
type foo	#foo is an alias for cd /usr
remove alias
unalias foo

These alias are temporary for the session so to make the alias permanent alias foo='cd /usr' should be appended in the .bashrc

```

```

type – Display A Command's Type
which – Display An Executable's Location
man – Display A Program's Manual Page
whatis – Display A Very Brief Description Of A Command
info – Display A Program's Info Entry
cat – Concatenate Files(In most cases, you can think of cat as being analogous to the TYPE command in DOS.
You can use it to display files without paging)
cat > lazy_dog.txt
The quick brown fox jumped over the lazy dog.
ctrl+d to say it is the end of file
and again cat lazy_dog.txt to copy file to stdout in terminal
```
# Pipelines
```The ability of commands to read data from standard input and send to standard output is utilized by a shell feature called pipelines.
Using the pipe operator “|” (vertical bar), the standard output of one command can be piped into the standard input of another:
for eg : ls -l /usr/bin | less
```
### The Difference Between > and |

```
At first glance, it may be hard to understand the redirection performed by the
pipeline operator | versus the redirection operator >. Simply put, the redirection
operator connects a command with a file while the pipeline operator connects the
output of one command with the input of a second command.
command1 > file1
command1 | command2
A lot of people will try the following when they are learning about pipelines, “just to see what happens.”
command1 > command2

"Answer: Sometimes something really bad."
Here is an actual example submitted by a reader who was administering a Linux- based server appliance. As the superuser, he did this:
# cd /usr/bin
# ls > less
The first command put him in the directory where most programs are stored and the second command told the shell to overwrite the file less with
the output of the ls command. Since the /usr/bin directory already contained a file named “less” (the less program), the second command overwrote the
less program file with the text from ls thus destroying the less program on his system.
The lesson here is that the redirection operator silently creates or overwrites files, so you need to treat it with a lot of respect.

Filters : it take input, change it somehow and then output it.
for eg
ls /bin /usr/bin | sort | less
```


```
uniq - Report Or Omit Repeated Lines
wc – Print Line, Word, And Byte Counts
The wc (word count) command is used to display the number of lines, words, and bytes
contained in files. For example:
❯ wc shell
  96  711 4312 shell

  96 	Word
  711 	lines
  4312	bytes

grep - grep is a powerful program used to find text patterns within files. 
It's used like this:

grep pattern [file...]

Let's say we wanted to find all the files in our list of programs that
had the word “zip” embedded in the name. Such a search might give us an
idea of some of the programs on our system that had something to do with 
file compression. We would do this:
$ ls /bin /usr/bin | sort | uniq | grep zip

head / tail – Print First / Last Part Of Files(10 LINE)
head -n 5 ls-output.txt (-n can manupalate)
ls /usr/bin | tail -n 5

tail -f /var/log/messages
-f let you see real time append in file

tee – Read From Stdin And Output To Stdout And Files
	-> echo "Another line" | tee -a output.txt
Here we repeat one of our earlier examples, this time including tee to
capture the entire directory listing to the file ls.txt
before grep filters the pipeline's contents:
ls /usr/bin | tee ls.txt | grep zip
```

# Seeing The World As The Shell Sees It
```
echo – Display a line of text
but see what  echo * does
have you seen * as output NO? why you ask cuz when you enter the command
shell automatically expand any qualifying character which if you have
read the wild card * is everything something like that read it
```
# Arithematic expression
```
echo $((2 + 2))
 see two bracket why you ask cuz its the syntax!!!!!! sorry i can't change it;
echo $(($((5**2)) * 3))
try this and know why but remember only interger
```
## Brace Expansion
```
Perhaps the strangest expansion is called brace expansion. With it, you can create multiple text strings from a pattern containing braces
#echo Front-{A,B,C}-Back
Front-A-Back Front-B-Back Front-C-Back

awesome command but weird WHAT DO YOU EXPECT IT WAS RELESED 1989

TRY
#echo Number_{1..5}
#echo a{A{1,2},B{3,4}}b
You can even make file using this
ACTUALLY IT WILL BE EASY IF YOU LEARN BASH SCRIPT
```

#echo $USER
user variable consist of your system user name

To see a list of used variables, try this:
#printenv | less

## Command Substitution
```
echo $(ls)
Desktop Documents ls-output.txt Music Pictures Public Templates

$(ls) makes ls as the command in echo
```

# Quoting
```
Now that we've seen how many ways the shell can perform expansions, it's time to learn how we can control it. Take for example:
[me@linuxbox ~]$ echo this is a		test
this is a test
or:
[me@linuxbox ~]$ echo The total is $100.00
The total is 00.00
In the first example, word-splitting by the shell removed extra whitespace from the echo
command's list of arguments. In the second example, parameter expansion
substituted an empty string for the value of “$1” because it was an
undefined variable. The shell provides a mechanism called quoting to 
selectively suppress unwanted expansions.
```
## Double Quotes
```
Using double quotes, we can cope with filenames containing embedded spaces. Say we were the unfortunate victim of a file called two words.txt. If we tried to use this on the command line, word-splitting would cause this to be treated as two separate arguments rather than the desired single argument:

[me@linuxbox ~]$ ls -l two words.txt
ls: cannot access two: No such file or directory
ls: cannot access words.txt: No such file or directory
so we use "two words.txt"

Remember, parameter expansion, arithmetic expansion, and command substitution still take place within double quotes:
[me@linuxbox ~]$ echo "$USER $((2+2)) $(cal)"
```
## Single Quotes
```
If we need to suppress all expansions, we use single quotes. Here is a comparison of unquoted, double quotes, and single quotes:

Escaping Characters
Sometimes we only want to quote a single character. To do this, we can precede a charac-
ter with a backslash, which in this context is called the escape character. Often this is
done inside double quotes to selectively prevent an expansion:
```
# Advanced Keyboard Tricks
```
Command Line Editing

Since the mouse is no use so keyboard is the key u see what i did with the word ahh

Ctrl-a	Move cursor to the beginning of the line.
Ctrl-e	Move cursor to the end of the line.
Ctrl-f	Move cursor forward one character; same as the right arrow key.
Ctrl-b	Move cursor backward one character; same as the left arrow key.
Alt-f	Move cursor forward one word.
Alt-b	Move cursor backward one word.
Ctrl-l 	Clear the screen and move the cursor to the top left corner. The
clear 	command does the same thing.
```

# Searching History
```
history | less
history | grep /usr/bin
!88 shows 88 command in history
ctrl+r in terminal for reverse search
!numberRepeat history list item number.
!stringRepeat last history list item starting with string.
!?stringRepeat last history list item containing string.
```
# Ownership
```
●id – Display user identity
●chmod – Change a file's mode
●umask – Set the default file permissions
●su – Run a shell as another user
●sudo – Execute a command as another user
●chown – Change a file's owner
●chgrp – Change a file's group ownership
●passwd – Change a user's password

Reading, Writing, And Executing
try ls -l
it might show somthing like this : drwxr-xr-x where
d - directory it might be - which means regular file
l - A symbolic link (ln)
c - A  character special file
b - A block special file
and rwx means read write and executable

Owner	Group	World
rwx	rwx	rwx
```

### chmod – Change File Mode
```
it is in octal number system rwx(421)
chmod 600 foo.txt
ls -l foo.txt
-rw------- 1 me

u	Short for “user” but means the file or directory owner.
g	Group owner.
o	Short for “others,” but means world.
a	Short for “all.” The combination of “u”, “g”, and “o”.

and you can do operation like u+x...
umask – Set Default Permissions
works on octal number system
for default it is 0 0 2 2  I'll say what does this means and why 4 instead of 3
originally if you create the file you will see it will have -rw-rw-r--
because if you write umask it will give you output of 002
cuz Original file mode  --- rw- rw- rw-
    Mask		000 000 000 010(2)
    Result		--- rw- rw- r--

Again, where a 1 appears in the binary value, the corresponding attribute is unset. Play
with some values (try some sevens) to get used to how this works. When you're done, re-
member to clean up:

When we set the mask to 0000 (effectively turning it off)
Original file mode--- rw- rw- rw-
Mask		  000 000 000 000
Result		  --- rw- rw- rw-

```
```
su – Run A Shell With Substitute User And Group IDs
also known as super user
```
```
chown can change the file owner and/or the file group owner depending on the first ar-
gument of the command. it is needed if you have  more than one user in the device

Let's say that we have two users; janet, who has access to superuser privileges and
tony, who does not. User janet wants to copy a file from her home directory to the
home directory of user tony. Since user janet wants tony to be able to edit the file,
janet changes the ownership of the copied file from janet to tony: sudo cp myfile.txt ~tony
```
```
Changing Your Password
passwd [user]
```

# How A Process Works(have you heard of init?)
```
When a system starts up, the kernel initiates a few of its own activities as processes and
launches a program called init. init, in turn, runs a series of shell scripts (located in
/etc) called init scripts, which start all the system services. Many of these services are
implemented as daemon programs, programs that just sit in the background and do their
thing without having any user interface. So even if we are not logged in, the system is at
least a little busy performing routine stuff.
The fact that a program can launch other programs is expressed in the process scheme as
a parent process producing a child process.
kernel organize each process and gives it a unique id ie pid.it also keep track of memory used
owner and so on.PIDs are assigned in ascending order, with init always getting PID 1.

Viewing Processes - ps
~ps
PID TTY 	TIME CMD
5198 pts/1	00:00:00 bash
10129 pts/1	00:00:00 ps


The result in this example lists two processes, process 5198 and process 10129, which are
bash and ps respectively. As we can see, by default, ps doesn't show us very much, just
the processes associated with the current terminal session. To see more, we need to add
some options, but before we do that, let's look at the other fields produced by ps. TTY is
short for “Teletype,” and refers to the controlling terminal for the process. Unix is show-
ing its age here. The TIME field is the amount of CPU time consumed by the process. As
we can see, neither process makes the computer work very hard.
If we add an option, we can get a bigger picture of what the system is doing:

Running. This means that the process is running or ready to run.
Sleeping. The process is not running; rather, it is waiting for an
event, such as a keystroke or network packet.
D	Uninterruptible Sleep. Process is waiting for I/O such as a diskdrive.
T	Stopped. Process has been instructed to stop. More on this later.
Z	A defunct or “zombie” process. This is a child process that has
	terminated, but has not been cleaned up by its parent.
<	A high priority process. It's possible to grant more importance to a
	process, giving it more time on the CPU. This property of a process
	is called niceness. A process with high priority is said to be less nice
	because it's taking more of the CPU's time, which leaves less for
	everybody else.
N	A low priority process. A process with low priority (a “nice”
	process) will only get processor time

Another popular set of options is “aux” (without a leading dash). This gives us even more
information:ps aux
```


#### Exiting from the running process , run in background, killing the task
```

xlogo program is a sample program supplied with the X Window System
``$ xlogo``
just shows xlogo
but see in terminal you cant type other command when xlogo is running
so we will learn about running,background programs,and many other thing

we can do control+c to exit any running program in terminal
we can even put the process in background

$ xlogo&
this & will let you write other command while xlogo is running in background
we can see the programs runned through this terminal by "jobs" command
we can return to the background programs by
do jobs then it will show the running background programs then it is given a certain number for
it's indication and then we can go to background programs by fg(foreground) command
fg %1
%1 indicate the first bg program then we can control+c to exit the program
example if you run spotify or discord in terminal it will be running program and you can
send it to background or exit it and so on.
bg - background how to use this command for example you are running spotify it will run until it is
stopped in terminal so to run it you can suspend by control+z
and do jobs and bg %[number] to run in background

Or we can use top command and kill the running programs through kill command
syntax is kill [pid]
try it you will know
kill has many signals like int,KILL,stop,cont...etc try reading it
you can kill multiple windows all at one by killall command it don't need pids
$killall firefox

pstree	Outputs a process list arranged in a tree-like pattern showing the
	parent/child relationships between processes.
vmstat	Outputs a snapshot of system resource usage including, memory,
	swap and disk I/O. To see a continuous display, follow the
	command with a time delay (in seconds) for updates.
xloadA  graphical program that draws a graph showing system load over
	time.
tload   Similar to the xload program, but draws the graph in the terminal.
	Terminate the output with Ctrl-c
```
# ENVIRONMENT
```
printenv – Print part or all of the environment
$printenv | less
What we see is a list of environment variables and their values. For example, we see a
variable called USER, which contains the value “me”. The printenv command can
also list the value of a specific variable
their is lot of variable which has already a value and cannot be changed and we can
see these variables by this commands and also be printed by printenv USER
or we can use echo command like echo $USER to see the value

The set command, when used without options or arguments, will display both the shell
and environment variables, as well as any defined shell functions. Unlike printenv, its output is courteously sorted in alphabetical order

Startup Files For Login Shell Sessions
FileContents
/etc/profile	A global configuration script that applies to all users.
~/.bash_profile	A user's personal startup file. Can be used to extend or
				override settings in the global configuration script.
~/.bash_login	If ~/.bash_profile is not found, bash attempts to
				read this script.
~/.profile		If neither ~/.bash_profile nor ~/.bash_login
				is found, bash attempts to read this file. This is the
				default in Debian-based distributions, such as Ubuntu.

Startup Files For Non-Login Shell Sessions
FileContents
/etc/bash.bashrc A global configuration script that applies to all users.
~/.bashrc		A user's personal startup file. Can be used to extend or
				override settings in the global configuration script.
				basically you will see some alias for eg la -> ls-A

```
# PACKAGE MANAGEMENT
```
Packaging System	Distributions (Partial Listing)

Debian Style (.deb)	Debian, Ubuntu, Xandros, Linspire
Red Hat Style (.rpm)	Fedora, CentOS, Red Hat Enterprise Linux, OpenSUSE,
			Mandriva, PCLinuxOS

Distributions	Low-Level Tools		High-Level Tools

Debian-Style	dpkg			apt-get, aptitude
Fedora, Red Hat	rpm			yum
Enterprise Linux, CentOS

Finding A Package In A Repository
Debian:	apt-get update
	apt-cache search search_string

Red Hat:yum search search_string

Installing A Package From A Repository
Debian	apt-get update;apt-get install package_name

Red Hat yum install package_name

what is the difference between apt and apt-get?
just understand apt-get is older software, apt is the newer way of doing things. use apt.
At the very least it is more informative about what it is doing.

Installing A Package From A Package File
Debian 	dpkg --install package_file ( dpkg -i discord-0.0.21.deb)
Red Hat	rpm -i package_file

Removing A Package
Debian	apt-get remove package_name
Red Hat	yum erase package_name

Updating Packages From A Repository
Debian 	apt-get update; apt-get upgrade
Red Hat	yum update

Upgrading A Package From A Package File
Debian	dpkg --install package_file
Red Hat	rpm -U package_file

Listing Installed Packages
Debian	dpkg --list
Red Hat	rpm -qa

Determining If A Package Is Installed
Debian	dpkg --status package_name
Red Hat	rpm -q package_name

Displaying Info About An Installed Package
Debian	apt-cache show package_name
Red Hat	yum info package_name

Finding Which Package Installed A File
To determine what package is responsible for the installation of a particular file, the fol-
lowing commands can be used:
Debian	dpkg --search file_name
Red Hat	rpm -qf file_name
```

# NETWORKING
```
ping
The most basic network command is ping. The ping command sends a special network
packet called an IMCP ECHO_REQUEST to a specified host. Most network devices re-
ceiving this packet will reply to it, allowing the network connection to be verified.
for eg: ping google.com

traceroute
The traceroute program (some systems use the similar tracepath program in-
stead) displays a listing of all the “hops” network traffic takes to get from the local sys-
tem to a specified host
traceroute google.com
it shows how many route is required to go to specified path
For routers that provided identifying information, we
see their hostnames, IP addresses, and performance data, which includes three samples of
round-trip time from the local system to the router. For routers that do not provide identi-
fying information (because of router configuration, network congestion, firewalls, etc.)

netstat
The netstat program is used to examine various network settings and statistics.
Through the use of its many options, we can look at a variety of features in our network
setup. Using the “-ie” option, we can examine the network interfaces in our system

TRANSPORTING FILES OVER A NETWORK:

ftp
One of the true “classic” programs, ftp gets it name from the protocol it uses, the File
Transfer Protocol. FTP is used widely on the Internet for file downloads. Most, if not all,
web browsers support it and you often see URIs starting with the protocol ftp://.
Before there were web browsers, there was the ftp program. ftp is used to communi-
cate with FTP servers, machines that contain files that can be uploaded and downloaded
over a network.
FTP (in its original form) is not secure, because it sends account names and passwords in
cleartext. This means that they are not encrypted and anyone sniffing the network can see
them. Because of this, almost all FTP done over the Internet is done by anonymous FTP
servers. An anonymous server allows anyone to login using the login name “anonymous”
and a meaningless password.

lftp – A Better ftp
(to know more about this it is vast networking method try learning through video)

wget
Another popular command-line program for file downloading is wget. It is useful for
downloading content from both web and FTP sites

ssh:
It solves the two basic problems of secure communication with a remote host. First, it au-
thenticates that the remote host is who it says it is (thus preventing so-called “man in the
middle” attacks), and second, it encrypts all of the communications between the local and
remote hosts.
https://www.youtube.com/watch?v=YS5Zh7KExvE&ab_channel=LearnLinuxTV
```

# SEARCHING FOR FILES:
```
locate – Find files by name
it will locate all the files in the system containing the subjects

find – Search for files in a directory hierarchy

difference between find and locate:
find searches in the real system. Is slower but always up-to-date and has more options (size, modification time,...)

locate uses a previously built database (command updatedb). Is much faster, but uses an 'older' database and searches only names or parts of them.

In any case, man find and man locate will help you further.

so we will learn more about find command
find ~ | wc -l
The beauty of find is that it can be used to identify files that
meet specific criteria

Let’s say that we want a list of directories from our search. To do this, we could add the
following test:
$ find ~ -type d | wc -l
Adding the test -type d limited the search to directories. Conversely, we could have
limited the search to regular files with this test:
$ find ~ -type f | wc -lv

there is other type like d f also which is less used

$find ~ -type f -name "*.JPG" -size +1M | wc -l

In this example, we add the -name test followed by the wildcard pattern. Notice how we
enclose it in quotes to prevent pathname expansion by the shell. Next, we add the -size
test followed by the string “+1M”. The leading plus sign indicates that we are looking for
files larger than the specified number. A leading minus sign would change the meaning of
the string to be smaller than the specified number. Using no sign means, “match the value
exactly.” The trailing letter “M” indicates that the unit of measurement is megabytes. The
following characters may be used to specify units:
b	512-byte blocks. This is the default if no unit is specified.
c	Bytes
w	2-byte words
k	Kilobytes (units of 1024 bytes)
M	Megabytes (units of 1048576 bytes)
G	Gigabytes (units of 1073741824 bytes)

find ~ \( -type f -not -perm 0 600 \) -or \( -type d -not -perm 0700 \)
Yikes! That sure looks weird. What is all this stuff? Actually, the operators are not that
complicated once you get to know them. Here is the list:
-and	Match if the tests on both sides of the operator are true.
	May be shortened to -a. Note that when no operator is
	present, -and is implied by default.
-or	Match if a test on either side of the operator is true. May be
	shortened to -o.
-not	Match if the test following the operator is false. May be
	abbreviated with an exclamation point (!).
( )	Groups tests and operators together to form larger
	expressions. This is used to control the precedence of the
	logical evaluations. By default, find evaluates from left to
	right. It is often necessary to override the default evaluation
	order to obtain the desired result
-delete	Delete the currently matching file.
-ls	Perform the equivalent of ls -dils on the matching file.
	Output is sent to standard output.
-print	Output the full pathname of the matching file to standard
	output. This is the default action if no other action is specified.
-quit	Quit once a match has been made.


We can use find to delete files that meet certain criteria. For example, to delete files that
have the file extension “.BAK” (which is often used to designate backup files), we could
use this command:
find ~ -type f -name '*.BAK' -delete
In this example, every file in the user’s home directory (and its subdirectories) is searched
for filenames ending in .BAK. When they are found, they are deleted.

Warning: It should go without saying that you should use extreme caution when
using the -delete action. Always test the command first by substituting the
-print action for -delete to confirm the search results.

xargs
The xargs command performs an interesting function. It accepts input from standard in-
put and converts it into an argument list for a specified command. With our example, we
would use it like this:
find ~ -type f -name 'foo*' -print | xargs ls -l
-rwxr-xr-x 1 me me 224 2007-10-29 18:44 /home/me/bin/foo
-rw-r--r-- 1 me me  0 2008-09-19 12:53 /home/me/foo.txt
```

# ARCHIVING AND BACKUP
```
gzip – Compress or expand files
The gzip program is used to compress one or more files. When executed, it replaces the
original file with a compressed version of the original. The corresponding gunzip pro-
gram is used to restore compressed files to their original, uncompressed form
gzip hello.txt ->this will make the hello.txt to hello.txt.gz with smaller size
and to unzip we use gunzip
gunzip hello.txt
compressed version is about one-fifth the size of the original.

gzip has some option like -d which will act as gunzip and so on
-v for verbose message

bzip2
The bzip2 program, by Julian Seward, is similar to gzip, but uses a different compres-
sion algorithm that achieves higher levels of compression at the cost of compression
speed. In most regards, it works in the same fashion as gzip. A file compressed with
bzip2 is denoted with the extension .bz2

ARCHIVING FILES

tar
Its name, short for tape archive, reveals its roots as a tool for making backup tapes
We often see filenames that end with the extension .tar or .tgz, which indicate a
“plain” tar archive and a gzipped archive, respectively. A tar archive can consist of a
group of separate files, one or more directory hierarchies, or a mixture of both. The com-
mand syntax works like this:
tar mode[options] pathname...
options
c	Create an archive from a list of files and/or directories.
x	Extract an archive.
r	Append specified pathnames to the end of an archive.
t	List the contents of an archive.

zip
The zip program is both a compression tool and an archiver. The file format used by the
program is familiar to Windows users, as it reads and writes .zip files. In Linux, how-
ever, gzip is the predominant compression program with bzip2 being a close second.
In its most basic usage, zip is invoked like this:
zip options zipfile file...

try zip -h
Files may be listed and extracted selectively from a zip archive by specifying them to
unzip
```

# SYNCHRONIZING FILES AND DIRECTORIES
```
In the Unix-like world, the preferred tool for this task is rsync. This program can syn-
chronize both local and remote directories by using the rsync remote-update protocol,
which allows rsync to quickly detect the differences between two directories and per-
form the minimum amount of copying required to bring them into sync. This makes
rsync very fast and economical to use, compared to other kinds of copy programs.

rsync -av original/* backup/

we can even run dry run
rsync -av --dry-run ...
just to see changes no action
```

# grep:
```
The name “grep” is actually derived from the phrase “global regular expression print,”In essence, grep
searches text files for the occurrence of a specified regular expression and outputs any
line containing a match to standard output.

So far, we have used grep with fixed strings, like so:
$ ls /usr/bin | grep zip
he grep program accepts options and arguments this way:
grep [options] regex [file...]
where regex is a regular expression.


-i	Ignore case. Do not distinguish between upper and lower case
	characters. May also be specified --ignore-case.
-v	Invert match. Normally, grep prints lines that contain a match.
	This option causes grep to print every line that does not contain a
	match. May also be specified --invert-match.
-c	Print the number of matches (or non-matches if the -v option is
	also specified) instead of the lines themselves. May also be
	specified --count.
-l	Print the name of each file that contains a match instead of the lines
	themselves. May also be specified --files-with-matches.
-L	Like the -l option, but print only the names of files that do not
	contain matches. May also be specified --files-without-
	match.
-n	Prefix each matching line with the number of the line within the
	file. May also be specified --line-number.
-h	For multi-file searches, suppress the output o	f filenames. May also
	be specified --no-filename

https://www.youtube.com/watch?v=VGgTmxXp7xQ&ab_channel=CoreySchafer

grep bzip dirlist*.txt
In this example, grep searches all of the listed files for the string bzip
this will print the list
-dirlist-bin.txt:bzip2
-dirlist-bin.txt:bzip2recover
see same file but but contains 2 bzip
if we want to list just file add -l and if we want file that do not contain
bzip do -L

METACHARACTERS AND LITERALS
^ $ . [ ] { } - ? * + ( ) | \

The first metacharacter we will look at is the dot or period character, which is used to match any character. If we include it in a regular expression, it will match any character in that character position.
for eg if we have file containing
pet pat pot pdt pond
to search these file starting with p and ending with t
grep p.t
this will give all except pond
```

# Anchors
```
The caret (^) and dollar sign ($) characters are treated as anchors in regular expressions.
This means that they cause the match to occur only if the regular expression is found at
the beginning of the line (^) or at the end of the line ($)
[me@linuxbox ~]$ grep -h '^zip' dirlist*.txt
zip
zipcloak
zipgrep
zipinfo
zipnote
zipsplit
[me@linuxbox ~]$ grep -h 'zip$' dirlist*.txt
gunzip
gzip
funzip
gpg-zip
preunzip
prezip
unzip
zip
[me@linuxbox ~]$ grep -h '^zip$' dirlist*.txt
zip

surely you did understand this with examples
```

### wow facts
```
A Crossword Puzzle Helper
Even with our limited knowledge of regular expressions at this point, we can do
something useful.
“What’s a five letter word whose third letter
is ‘j’ and last letter is ‘r’ that means...?” This kind of question got me thinking.
Did you know that your Linux system contains a dictionary? It does. Take a look
in the /usr/share/dict directory and you might find one, or several. The
dictionary files located there are just long lists of words, one per line, arranged inalphabetical order.
On my system, the words file contains just over 98,500
words. To find possible answers to the crossword puzzle question above, we
could do this:

[me@linuxbox ~]$ grep -i '^..j.r$' /usr/share/dict/words
Major
major

Using this regular expression, we can find all the words in our dictionary file that
are five letters long and have a “j” in the third position and an “r” in the last position.
```

# BRACKET EXPRESSIONS AND CHARACTER CLASSES
```
In addition to matching any character at a given position in our regular expression, we
can also match a single character from a specified set of characters by using bracket ex-
pressions. With bracket expressions, we can specify a set of characters (including charac-
ters that would otherwise be interpreted as metacharacters) to be matched. In this exam-
ple, using a two character set:
$grep -h '[bg]zip' dirlist*.txt
bzip2
bzip2recover
gzip

(^), which is used to indicate negation; the second is the dash (-), which is used to indi-
cate a character range.here is the explanations

Negation
grep -h '[^bg]zip' dirlist*.txt

If we wanted to construct a regular expression that would find every file in our lists be -
ginning with an uppercase letter, we could do this:
grep -h '^[ABCDEFGHIJKLMNOPQRSTUVWXZY]' dirlist*.txt
It’s just a matter of putting all 26uppercase letters in a bracket expression. But the idea of
all that typing is deeply troubling, so there is another way:
grep -h '^[A-Z]' dirlist*.txt

grep -h '[A-Z]' dirlist*.txt
This will match every filename containing an uppercase letter. While:
$ grep -h '[-AZ]' dirlist*.txt
will match every filename containing a dash, or a uppercase “A” or an uppercase “Z”.

Thier is also thing called POSIX
https://en.wikipedia.org/wiki/POSIX
```


# TEXT PROCESSING
```
CAT
Concatenate files and print on the standard output
Let’s create a test file using cat as a primitive word processor. To do this, we’ll just en-
ter the command cat (along with specifying a file for redirected output) and type our
text, followed by Enter to properly end the line, then Ctrl-d, to indicate to cat that
we have reached end-of-file.
cat > foo.txt
The quick brown fox jumped over the lazy dog.
ctrl+d to end
we will use cat with the -A option to display the text:
cat -A foo.txt
^IThe quick brown fox jumped over the lazy dog.		$
As we can see in the results, the tab character in our text is represented by ^I. This is a
common notation that means “Control-I” which, as it turns out, is the same as a tab char-
acter. We also see that a $ appears at the true end of the line, indicating that our text con-
tains trailing spaces.
After processing by cat with the -ns options,
the extra blank line is removed and the remaining lines are numbered. While this is not
much of a process to perform on text, it is a process.


sort
it sorts
$sort > foo.txt
c
b
a (ctrl+d)
$ cat foo.txt
a
b
c

Since sort can accept multiple files on the command line as arguments, it is possible to
merge multiple files into a single sorted whole. For example, if we had three text files and
wanted to combine them into a single sorted file, we could do something like this:
sort file1.txt file2.txt file3.txt > final_sorted_list.txt

their is lot of cool options like reverse sort and case insensitive try man page or sort --help



uniq
it works only in sorted list ,it removes any duplicate
lines and sends the results to standard output
cat > foo.txt
a
b
c
a
b
c
$uniq foo.txt
no change
$sort foo.txt | uniq
a
b
c

there is lot of option some of the intresting options are
-c  Output a list of duplicate lines preceded by the number of times the
line occurs.
-d  Only output repeated lines, rather than unique lines.

Slicing And Dicing
cut
The cut program is used to extract a section of text from a line and output the extracted
section to standard output. It can accept multiple file arguments or input from standard input.
```



# Comparing Text
```
It is often useful to compare versions of text files. For system administrators and software
developers, this is particularly important. A system administrator may, for example, need
to compare an existing configuration file to a previous version to diagnose a system prob-
lem. Likewise, a programmer frequently needs to see what changes have been made to
programs over time.

-comm
The comm program compares two text files and displays the lines that are unique to each
one and the lines they have in common

-diff
diff file1.txt file2.txt
show difference line by line

-sdiff
show Difference side by side

-vimdiff
graphical differences in vim
```




## **SUMMING UP**
Linux Is About Imagination
When I am asked to explain the difference between Windows and Linux, I often
use a toy analogy.
Windows is like a Game Boy. You go to the store and buy one all shiny new in the
box. You take it home, turn it on and play with it. Pretty graphics, cute sounds.
After a while though, you get tired of the game that came with it so you go back
to the store and buy another one. This cycle repeats over and over. Finally, you go
back to the store and say to the person behind the counter, “I want a game that
does this!” only to be told that no such game exists because there is no “market
demand” for it. Then you say, “But I only need to change this one thing!” The
person behind the counter says you can't change it. The games are all sealed up in
their cartridges. You discover that your toy is limited to the games that others
have decided that you need and no more.
Linux, on the other hand, is like the world's largest Erector Set. You open it up
and it's just a huge collection of parts. A lot of steel struts, screws, nuts, gears,
pulleys, motors, and a few suggestions on what to build. So you start to play with
it. You build one of the suggestions and then another. After a while you discover
that you have your own ideas of what to make. You don't ever have to go back to
the store, as you already have everything you need. The Erector Set takes on the
shape of your imagination. It does what you want.
Your choice of toys is, of course, a personal thing, so which toy would you find
more satisfying?
