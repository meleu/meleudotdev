# How To Sync ALL Your Stuff With Syncthing (Linux + Android Guide)

**Stuff. You’ve Got It.**

It’s 2021 and you’ve just realized you have a crap-ton of files and folders all over the place because, let’s face it, what else has there been to do this past year other than sit around and hoard memes? But now, you’ve become sentimentally attached to those wonderful bits of deadpan humour, so you need to get them to a safe place. Such a task requires only the best of tools, that scales any way you need it, and can even work over the local network in the event the apocalypse doesn’t get canceled. _Introducing Syncthing_.

![](https://miro.medium.com/max/700/1*ppXPIJbJ6CS9luTCtuVukw.jpeg)

## Key Components

First off, let’s look at what you’ll need. Syncthing itself is a daemon/service, not an “app” in the traditional sense. It’s something that can run in the background on your Linux, Windows, or macOS machines, as well as your Android phones and tablets. There are however, frontends for Syncthing that make the configuration and management of it much nicer than a config file! I am only covering Linux and Android in this miniguide, but there are apps for many different operating systems!

Syncthing also has something called a Web UI, which is essentially a webpage that connects to the running Syncthing daemon on your system and lets you monitor its status or configure it. This will be what I cover here.

Whichever method you use, you’ll need at least two devices running Syncthing for this to be of any use, of course. And if you’re like me, you’ll be thrilled to know you can add any wildly excessive number of devices to the chain should your ambitious heart so desire!

## Installing Syncthing On Linux

On your Linux desktop or laptop, you should start by checking to see if Syncthing is available in your distro’s repositories. Unless you’re running something arcane or ancient, it’s probably there and it’s probably just called “syncthing.”

For reference, you can crack open a terminal and `sudo apt install syncthing` on Ubuntu or most Ubuntu-based distributions, and `sudo dnf install syncthing` on Fedora. If all else fails, you can download the source code or prebuilt binaries from [Syncthing’s download page](https://syncthing.net/downloads/), which includes everything from Linux to various BSDs.

Assuming you’ve successfully installed the Syncthing package, you can run Syncthing from the terminal with the `syncthing` command. Syncthing is now running, and from there you should find your default web browser open to the Web UI for configuration! (**Reminder not to close the terminal window you started Syncthing from. You will kill the Syncthing service if you do.** If you’d like, you can instead start Syncthing with `(syncthing & ) &`, and then close the terminal.)

![](https://miro.medium.com/max/700/1*0QM2MZyxeT6AlSuCscdV0g.png)

Once the Web UI pops up, you might get a prompt asking you if you’d like to supply anonymous telemetry data to Syncthing to help improve the platform. _This is your choice to make, though I typically do encourage it as it really is helpful for development!_ After that, you should see a screen somewhat similar to the one shown here. This is essentially your admin panel for Syncthing on this device. The very first thing you should do is create a username and password for this GUI by clicking on the “Settings” box to the right of the “GUI Authentication” prompt at the top of the Web UI.

![](https://miro.medium.com/max/700/1*oaYfUmofbHFRneG1AsWo8g.png)

The settings menu should now present to you a tabbed pop-up. From here, click on the “GUI” tab, and enter a username under “GUI Authentication User” and a password of your choice under “GUI Authentication Password”. While you don’t explicitly *have* to do this, it is good practice to follow.

After that, click save, and let’s get ready to connect to your phone. Using the “Actions” menu at the top right of the Syncthing Web UI, select the “Show ID” option. This will provide you with a unique device ID and QR code that you will enter in the Syncthing app on your phone, or any other device you’d like to add to the chain. Keep this handy as we’re about to turn both keys!

## Installing And Running Syncthing On Android

On your Android phone, simply open the Google Play Store and search for “Syncthing”. You can also [use this link to get to it directly](https://play.google.com/store/apps/details?id=com.nutomic.syncthingandroid)! (FYI, you can also install the app to your phone from another device on the Play Store website, too!) Once it’s installed, open the app and proceed through the initial prompt and grant the necessary permissions to the app. The app will also ask you if you’d like to disable battery optimization for it. This essentially means that the app will be able to run in the background without getting shut down by Android after some time. It’s important that this is allowed unless you want to re-open the app frequently. By default, Syncthing creates a “Camera” folder, which points to your camera roll. Feel free to remove this if you so please.

![](https://miro.medium.com/max/700/1*6gIuykBIjGD27YBxzwnwkg.png)

## Plug it in, plug it in!

And now, let’s connect our two deliciously synctastic devices.

You should note that there is a “Devices” tab next to the “Folders” tab you start in. Click on that, then click on the big plus icon on the top right. The very first field is for the device ID of the machine you want to connect. Remember that code from earlier? That’s the one. You can manually enter that code into your phone, or send it to yourself and copy-paste. Alternatively, you can click the barcode on the right, but this will require you to install a barcode scanner app, which you may or may not care for. You can then close the Device ID prompt on the desktop, but leave the Web UI open. Thankfully, you only need to do this once per machine.

Once that’s entered on your phone, you can name the device whatever you’d like. I recommend picking something you’ll recognize. As for the rest of the settings here, their functionality isn’t within the scope of this guide as they introduce more complexity, and they aren’t necessary for most setups. Finally, click that awesomesauce checkmark at the top right, and then check the Web UI on your desktop for the incoming request. Click “Add Device” when prompted.

![](https://miro.medium.com/max/700/1*MoOMLL7oPjzdnetJNmMiGg.png)

Now you should see a prompt with details about the device you’re connecting (your phone). You can choose to name this device by modifying the “Device Name”, or you can leave it as is. Then click “Save” and you’ve now linked your two devices together! Voila!

## Let’s Give Em Something To Sync About!

You’ve got two devices on a first date that’s going incredibly well, and now it’s time to share something of substance! No more small talk here, let’s share a folder full of embarrassing childhood memories.

By default, Syncthing will create a folder called “Sync” in your home folder on Linux and add it to your Syncthing folders list. Let’s add a new folder for tutorial’s sake, and share it with your phone. Under the “Folders” header in your Web UI, you should see a button that says “Add Folder”. Now, I’m no rocket scientist, but that sounds like exactly what we want! Click it.

![](https://miro.medium.com/max/700/1*fM9dXfzHSLnrZQe7Uu5F7g.png)

This folder can be labeled anything you’d like, but of course it makes sense to choose something you’ll recognize! As for the Folder ID, which is unnecessary to change but must be the same for this folder on *every* device you connect. Lastly, set the Folder Path to the folder on your system you’d like to share. (`/home/user/folder`)

In the same pop-up, you should find a “Sharing” tab. In it, you’ll find your phone listed. Make sure to select the device before saving. After a few moments, you should get a notification on your phone about a folder requesting to be added to Syncthing. Now, let’s finalize the share.

![](https://miro.medium.com/max/700/1*Q1rawZkfiFqH1S3tCHqdLQ.jpeg)

You should now see something like this on your phone. The name will automatically match what you called it on your desktop.

The “Directory” field is where on your phone this folder should sync to. Click on it to browse the file manager and create or select an existing folder to share. If you’d like files to only go one way, you can change the “Folder Type”.

“Send & Receive” means that changes on either device will sync between the two.

“Send Only” will only send files from one to the other and accept none.

“Receive Only” will only allow incoming files. Everything else should be fine to leave defaulted. Click that big ole checkmark up top!

## Stunning Syncing Sensation!

If you’ve made it this far, you should be pretty pleased with yourself! You’ve now established a connection between two devices, created shares between them, and have automated the syncing of any files and folders within that share!

You basically just built your own little peer-to-peer network. What a baller. Go ahead and toss a file or two into the folder you’ve created, and you should see it manifest itself on the other device! Don’t be afraid to fiddle with it. There are many uses for this!

![](https://miro.medium.com/max/700/1*ywSZ3a4MI3_F8g7NZo0LBw.png)

## Automatic Startup?

Lastly, but certainly not leastly, let’s quickly cover getting Syncthing to run automatically on your desktop. As I mentioned earlier, if Syncthing isn’t running, it’s not working! There are a few ways to go about this. You can manually run Syncthing if you prefer this, or you can add Syncthing as a startup application. In many distributions, there should be a place for Startup Applications either in the System Settings, or via a dedicated GUI app.

The command for this would generally be `/usr/bin/syncthing -no-browser -no-restart -logflags=0`. This should start the daemon without the Web UI, so it doesn’t bother you when you don’t need it. Alternatively, you can set up a systemd service for this. Ideally, you would choose a *user* service for this, not a system service. [Here’s a handy link to how to do that!](https://docs.syncthing.net/users/autostart.html#linux)