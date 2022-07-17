---
dg-publish: true
---
# Google Drive on Linux

## PopOS! / GNOME

> [!warning]
> This solution doesn't allow me to access the google drive from the terminal. Therefore, it's useless for me.
> 
> See [[#google-drive-ocamlfuse]].

First try was using the "Online Accounts" configs of GNOME in PopOS. The file manager shows my google drive (note: it didn't work on the first try). But it's only visible in the Gnome's File Manager (not accessible in the terminal).

## google-drive-ocamlfuse

Looks promising! 🙂

- <https://github.com/astrada/google-drive-ocamlfuse>

### Installation

```bash
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
```

### Automount

Following the instructions to [mount using systemd](https://github.com/astrada/google-drive-ocamlfuse/wiki/Automounting#mount-using-systemd)

1. Create the file `~/.config/systemd/user/gdrive.service` (replace `${label}` and `${mountPoint}` with proper values):
```ini
[Unit]
Description=FUSE filesystem over Google Drive
After=network.target

[Service]
ExecStart=google-drive-ocamlfuse -label ${label} ${mountPoint}
ExecStop=fusermount -u ${mountPoint}
Restart=always
Type=forking

[Install]
WantedBy=multi-user.target
```

```bash
# mount the drive
systemctl start --user gdrive.service

# umount the drive
systemctl stop --user gdrive.service

# automount on boot
systemctl enable --user gdrive.service
```


### Synchronizing

^f67779

#### Install `unison`

Download an awesome tool named `unison`:

https://github.com/bcpierce00/unison

> [!important]
> Do not install from your package manager, as it won't come with the file system monitor.
>
> Download from the [releases page](https://github.com/bcpierce00/unison/releases/) instead.

I've download this file here: <https://github.com/bcpierce00/unison/releases/download/v2.52.1/unison-v2.52.1+ocaml-4.14.0+x86_64.linux.tar.gz>

And then:
```bash
# the file was downloaded in the ~/Downloads dir
cd ~/Downloads

# create a tmp dir for unison
mkdir unison-dir

# uncompress the files into the right dir
tar xvzf unison-v2.52.1+ocaml-4.14.0+x86_64.linux.tar.gz \
  -C unison-dir

cd unison-dir

# move the binaries to /usr/local/bin
sudo mv bin/* /usr/local/bin/
rmdir bin

# move the docs to a proper dir
mkdir -p /usr/local/share/unison
mv * /usr/local/share/unison

# DONE! The unison is now "installed"
```

#### Testing `unison`

Let's test unison:

```bash
# create two empty directories
mkdir -p ~/tmp/{source,target}
cd ~/tmp

# now run this command to keep directories 'source' and
# 'target' synchronized.
# (took from: https://jpcercal.com/en/how-to-create-a-bidirectional-file-sync-using-unison/
unison \
  -repeat watch \
  -copyonconflict \
  -prefer newer \
  source/ \
  target/

# NOTE: if the command above breaks due to a
# "Filesystem watcher error", it's probably because
# you didn't followed the steps above to install unison
```

Once you confirm it works as expected, let's create a preferences file for unison:

```
# this should be in ~/.unison/gdrive.prf
# Unison preferences to sync my Obsidian files on google drive
label = gdrive Obsidian
logfile = /home/${user}/.unison/gdrive.log
root = /home/${user}/source
root = /home/${user}/gdrive/target
ignore = Path .git
batch = true
repeat = watch
copyonconflict = true
prefer = newer
contactquietly = true
silent = true
```

**This is incomplete...**
