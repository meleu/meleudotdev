---
dg-publish: true
---
# kindle tips

## Send to Kindle

simply go to <https://www.amazon.com/sendtokindle>.


## Fix encoding with Calibre

### Problem

Some characters - like quotes, backticks, etc. - are being shown like `â€™`

Reason: the encoding is not explicitly configured as UTF-8.

I learned about [this in this article](https://blog.the-ebook-reader.com/2022/05/06/how-to-fix-formatting-issues-on-epubs-sent-to-kindles/).

### Solution

#### Install "Modify ePub" plugin

Open Calibre and then go to: Preferences -> Get plugins to enhance calibre

In the popup, search for `Modify ePub` and install it.

Once installed, run it for the book you're having problems with, and enable `Encode HTML in UTF-8`.

![[kindle - Modify ePub.png]]