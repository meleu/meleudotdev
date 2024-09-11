---
dg-publish: true
---
# 03-static-analysis-testing

- eslint
- prettier
- eslint-config-prettier
- husky
- lint-staged

## VSCode

Install the VSCode extensions:

- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

`.vscode/settings.json`:
```json
{
    "editor.formatOnSave": true,
    "[json]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[javascript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode",
    },
}
```

## eslint / prettier

Instal these npm packages:
```shell
npm install --save-dev eslint prettier eslint-config-prettier
```

> [!note]
> In <https://github.com/prettier/eslint-config-prettier> it's recommended to use `"extends": [ "prettier" ]` (instead of `eslint-config-prettier`) in the `.eslintrc` below.

`.eslintrc`
```json
{
  "parserOptions": {
    "ecmaVersion": 2019,
    "sourceType": "module"
  },
  "extends": [
    "eslint:recommended",
    "eslint-config-prettier"
  ],
  "rules": {
    "strict": [
      "error",
      "never"
    ]
  },
  "env": {
    "browser": true,
    "node": true,
    "es6": true
  }
}
```

> [!note]
> use this website to create your `.prettierrc`: <https://prettier.io/playground>

`package.json`
```json
{
  scripts: {
    "lint": "eslint --ignore-path .gitignore .",
    "prettier": "prettier --ignore-path .gitignore \"**/.{js,json}\"",
    "format": "npm run prettier -- --write",
    "check-format": "npm run prettier -- --list-different",
    "validate": "npm run check-format && npm run lint && npm run build"
  }
}
```


## husky

```shell
npm install --save-dev husky
```

`.huskyrc`
```json
{
  "hooks": {
    "pre-commit": "npm run validate"
  }
}
```


## lint-staged

link: <https://www.npmjs.com/package/lint-staged>

```shell
npm install --save-dev lint-staged
```

`.lintstagedrc`
```json
{
  "*.{js}": ["eslint"],
  "**/*.{js,json}": [
    "prettier --write",
    "git add"
  ]
}
```

Add `lint-staged` command to your `.huskyrc`.

Example:

`.huskyrc`
```json
{
  "hooks": {
    "pre-commit": "lint-staged"
  }
}
```

## npm-run-all

link: <https://www.npmjs.com/package/npm-run-all>

Running jobs in parallel.

```shell
npm install --save-dev npm-run-all
```

`package.json`
```shell
{
  "scripts": {
    // ...
    "validate": "npm-run-all --parallel check-format lint build"
  }
}
```
