---
dg-publish: true
---
# Google Drive on Linux

## PopOS! / GNOME

> [!warning]
> This solution doesn't allow me to access the google drive from the terminal. Therefore, it's useless for me.

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


### Syncrhonizing

to read...

https://en.jveweb.net/archives/2010/11/synchronizing-folders-with-rsync.html

https://www.baeldung.com/linux/synchronize-linux-directories#using-unison-program

https://github.com/bcpierce00/unison