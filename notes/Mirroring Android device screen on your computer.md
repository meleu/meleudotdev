# Mirroring Android device screen on your computer

> [!note]
> Tested on Mac but probably also works on Linux.


## Configurations & Tools

### Android device configuration

#### Enable Developer options

> [official docs](https://developer.android.com/studio/debug/dev-options)

The way to enable **Developer options** varies between different devices, but it's usually something like this:

Settings > About phone > Software information > Build number

In Brazilian phones it's something like this:

Configurações > Sobre o telefone > Informações do software > Número da versão > Número da compilação

Once you find the **Build Number**, tap on it seven times or until you see the message `You are now a developer!`.

#### USB debugging

The way to enable **USB debugging** varies between different devices, but it should be something like this:

Settings > System > Developer Options > USB debugging


### Mac configuration

Install the following tools in your Mac

- [scrcpy](https://github.com/Genymobile/scrcpy) - to display and control your Android device in your Mac
- [android-platform-tools](https://developer.android.com/tools/releases/platform-tools) - to get the `adb` app (Android Debug Bridge) - **not needed, but useful for debugging**

Both can be installed via Homebrew:

```
brew install scrcpy
brew install android-platform-tools
```



## Mirror Android phone on Mac

Once you have everything configured/installed, you just need to run `strcpy`. Authorize USB debugging on your device, if asked.