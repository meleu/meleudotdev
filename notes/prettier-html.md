---
dg-publish: true
dg-show-toc: false
---
# Automatically indent HTML in your VSCode

Life is too short to waste time indenting HTML code! Let's put the machine to do it for us!

> [!update]
> The method here uses the Prettier extension. It's also possible to format HTML in VSCode with no extensions. Check in [[autoindent-html]].

## Step 1: Install Prettier extension

Open VSCode, go to the extensions screen, search for `prettier`.

Install this one:

![[prettier-vscode-extension.png]]


## Step 2: Configure Prettier to format HTML code

Open your `settings.json` file following these steps:
- `Ctrl+Shift+P` - to open the "Command Palette"
- type this: `settings json` and choose the `Preferences: Open User Settings (JSON)`
![[vscode-command-palette-settings-json.png]]
- go to the end of the JSON file and add this:

```json
{
  // a bunch of other configs...
  "editor.formatOnPaste": true, // autoformat when pasting code
  "editor.formatOnSave": true,  // format on file save
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

## Done!

Now your html code will be formatted as soon as you save the file!
