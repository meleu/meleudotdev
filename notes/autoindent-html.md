---
dg-publish: true
---
# autoindent html in VSCode

Open your `settings.json` file following these steps:
- `Ctrl+Shift+P` - to open the "Command Palette"
- type this: `settings json` and choose the `Preferences: Open User Settings (JSON)`
- go to the end of the JSON file and add this:
```json
{
  // a bunch of other configs...
  "editor.formatOnPaste": true,
  "editor.formatOnSave": true,
  "[html]": {
    "editor.defaultFormatter": "vscode.html-language-features"
  }
}
```

## references

- <https://www.origamid.com/curso/html-e-css-para-iniciantes/0204-editor-plugins>

