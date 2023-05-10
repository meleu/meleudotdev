---
dg-publish: true
---
# autoindent html in VSCode

Put this in the `settings.json`:
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

