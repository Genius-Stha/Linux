# Linux
Linux is a free and open-source operating system based on Unix. It is widely used in servers, desktops, cloud systems, and embedded devices due to its stability, security, and flexibility. Linux offers powerful command-line tools and is highly customizable, making it a favorite among developers and system administrators. Various distributions like Ubuntu, Debian, Fedora, and Arch Linux provide different environments and tools to suit a wide range of use cases.

![Tux, the Linux mascot](/assets/images/tux.png)
# File system in Linux
![filesystem](/img/filesystem.png)

#### `/`

The root directory is the top-level directory in the Linux file system. All other files and directories are contained under it, directly or indirectly.

#### `/home`

This directory contains personal folders for all regular users. Each user gets their own subdirectory (e.g., `/home/alex`) where they can store files, documents, downloads, and settings.

#### `/root`

This is the home directory of the **root** user (the system administrator). It is separate from `/home` and is used for administrative tasks and secure operations.

#### `/etc`

Contains all the system-wide configuration files. It includes settings for the system, network, services, and installed applications.

#### `/bin`

Holds essential binary (executable) files needed for basic system functions like `ls`, `cp`, and `mkdir`. These are required for both single-user mode and normal operations.

#### `/sbin`

Contains system binaries, typically used by the root user for system maintenance tasks such as `shutdown` or `mount`.

#### `/usr`

This directory holds user-related programs and data. It includes subdirectories like `/usr/bin` for binaries, `/usr/lib` for libraries, and `/usr/share` for shared data.

#### `/var`

Stands for "variable". It contains files that change frequently like log files, mail spools, caches, and printer spool files.

#### `/tmp`

Used for temporary files created by the system or users. Files here are usually deleted automatically on system reboot.

#### `/dev`

Houses device files. In Linux, hardware devices (like USBs, hard drives, etc.) are treated as files and are accessed through this directory.

#### `/proc`

A virtual filesystem that provides information about running processes and the kernel. Files in this directory represent system and process information in real-time.

#### `/lib`

Contains shared library files used by the binaries in `/bin` and `/sbin`.

#### `/boot`

Stores the bootloader files and kernel needed to boot the Linux system. Without this, the system cannot start.

#### `/media` and `/mnt`

Used as mount points for external devices and temporary filesystems like USB drives, CDs, or network shares.


