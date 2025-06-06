# Text Editors

```
To edit (i.e., modify) the shell's startup files, as well as most of the other configuration
files on the system, we use a program called a text editor. A text editor is a program that
is, in some ways, like a word processor in that it allows you to edit the words on the
screen with a moving cursor. It differs from a word processor by only supporting pure
text, and often contains features designed for writing programs. Text editors are the cen-
tral tool used by software developers to write code, and by system administrators to man-
age the configuration files that control the system.
	Text editors fall into two basic categories: graphical and text based. GNOME and KDE
both include some popular graphical editors. GNOME ships with an editor called gedit,
which is usually called “Text Editor” in the GNOME menu. KDE usually ships with three
which are (in order of increasing complexity) kedit, kwrite, and kate.

	There are many text-based editors. The popular ones you will encounter are nano, vi,
and emacs. The nano editor is a simple, easy-to-use editor designed as a replacement
for the pico editor supplied with the PINE email suite. The vi editor (on most Linux
systems replaced by a program named vim, which is short for “Vi IMproved”) is the tra-
ditional editor for Unix-like systems. It will be the subject of our next chapter. The
emacs editor was originally written by Richard Stallman. It is a gigantic, all-purpose,
does-everything programming environment. While readily available, it is seldom installed
on most Linux systems by default.``
```

**But before we do that, let's practice some “safe computing.”**

```
Whenever we edit an important configuration file, it is always a good idea to create a
backup copy of the file first. This protects us in case we mess the file up while editing.
```

To create a backup of the .bashrc file, do this:

``$ cp .bashrc .bashrc.bak``

- It doesn't matter what you call the backup file, just pick an understandable name. The extensions “.bak”, “.sav”, “.old”, and “.orig” are all popular ways of indicating a backup file. Oh, and remember that cp will overwrite existing files silently.

Now that we have a backup file, we'll start the editor:

``$ nano .bashrc``

```
The first command you should learn in any text editor is how to exit the program. In the case of nano, you type Ctrl-x to exit.
This is indicated in the menu at the bottom of the screen. The notation “^X” means Ctrl-x.
This is a common notation for control characters used by many programs.
The second command we need to know is how to save our work.
With nano it's Ctrl-o. With this knowledge under our belts, we're ready to do some editing.

write comments to understand(#comments)
then save it with name ending with .bashrc you may be thinking why .bashrc cuz this
The .bashrc file is a script file that's executed when a user logs in
it is just to understand you can do it or you may not
to run these commands we do is exit and open the program for eg source.bashrc
```

## Why We Should Learn vi

```
In this modern age of graphical editors and easy-to-use text-based editors such as nano,
why should we learn vi? There are three good reasons:

●vi is always available. This can be a lifesaver if we have a system with no graph-
ical interface, such as a remote server or a local system with a broken X configu-
ration. nano, while increasingly popular is still not universal. POSIX, a standard
for program compatibility on Unix systems, requires that vi be present.

●vi is lightweight and fast. For many tasks, it's easier to bring up vi than it is to
find the graphical text editor in the menus and wait for its multiple megabytes to
load. In addition, vi is designed for typing speed. As we shall see, a skilled vi
user never has to lift his or her fingers from the keyboard while editing

MOST IMPORTANTLY
●We don't want other Linux and Unix users to think we are sissies.

Okay, maybe two good reasons.

Okey lets start vim

see these links too
https://vim.rtorr.com/
https://terminalroot.com/100-tips-for-the-vim-editor/
```

``$vim`` to initialize

After you open you cannot go back if you dont know to exit you must exit the terminal

so to exit terminal ``:q``

The shell prompt should return.
If, for some reason, vi will not quit (usually because we made a change to a file that has not yet been saved),
we can tell vi that we really mean it
by adding an exclamation point to the command:`` :q!``

```Tip: If you get “lost” in vi, try pressing the Esc key twice to find your way again.```

The leading tilde characters (”~”) indicate that no text exists on that line. This shows that
we have an empty file. Do not type anything yet!

```
The second most important thing to learn about vi (after learning how to exit) is that vi
is a modal editor. When vi starts up, it begins in command mode. In this mode, almost
every key is a command, so if we were to start typing, vi would basically go crazy and
make a big mess.

```

- If you have tried to open vim you must have known you cannot write anything
  to write you must Entering Insert ModeIn order to add some text to our file,
  we must first enter insert mode.
  To do this, we press the “i” key
- ``-- INSERT --``
  Now we can enter some text
  To exit insert mode and return to command mode, press the Esc key.
- Saving Our Work
  press esc then you can type commands
  ``:w`` is to write in the file

```
https://vim.rtorr.com/
https://terminalroot.com/100-tips-for-the-vim-editor/
```


# let's start the vim

---
VIM actually have 3 modes ie insert command and visual
---
- Insert mode is really easy to enter so after creating vim interminal just type ``i`` to
  enter the visual modes so it is just as simple as using any text editor

- Command mode is little different
  :set number -> shows the line in the vim editor
  :set relativenumber -> shows the relative line where you are in try it
  :set tabstop = 4 -> tab makes 4 space
  :set auto indent -> it is what it says
  :set mouse=a -> shows mouse you can use mouse now (a is for all)
  :set colorscheme ->it is what it says

this commands wil disapper to next vim
to save the command open .vimrc
and write the commands.

there is lot more commands too these are some useful commands(you can fork and add more)

- visual mode is entered by typing v it will say
  --visual--
  especially used for editing
  d -  delete
  u -  undo
  y -  yank (copy)
  yy-  still yank but whole line
  p -  paste
  dd - delete whole line(cut) u can use p to paste the deleted line
  . - repeat previous command

you can use command line ``5dd`` to delete 5 lines
5d to delete the fifth line

as vim is used to stay in keyboard without using mouse or
letting you hand go away from the keyboard initial position
```
h left
j down
k up
l right
```

``shift +g`` to go to end of line
``ctrl +r`` to redo

```
w to jump to next word
b to jump to back word
e to jump to end of the word
A to append at end of the line
a to append at end of the word

2w to jump two word

yiw to yank the word

cc to change the change the whole line
ciw to change the word

gg -> go to begining of the word
G -> go to end of line
yt{ ->copy to {
f-> find for eg  fg will find g in the line

shift+v to go to visual line mode
it will go to line mode
ctrl+v to visual block mode let us just say colum mode

== to auto indent

/ to find from whole file n to next occurance N to previous occurance

* to find next occurance of the word

# to previous occurance of the word

:%s/character/symbol/g

% is for all file
s is substitute
character to symbol
idk what /g is for
```

- you can even open two file at once in vim
  syntax is vim file1.txt file2.txt

- you use :n or :N for go to next and previous file

``o`` to insert after
if one file is already opened then :e file3.txt
now you should use :buffer command to change to the different file

just a little flex this file was edited and created using VIM.

## There is lot more than this if you find some more useful things you can fork and send i will merge it
