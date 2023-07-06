---
dg-publish: true
---
# semantic commit messages

Format:
```
<type>: <subject>
```

Example:
```
feat: add hat wobble
```

Types:

- `feat`: new feature for the user (not new feature for build script)
- `fix`: bug fix for the user (not fix to a build script)
- `docs`: changes to the documentation
- `style`: formatting, missing semi-colons, etc. (no production code change)
- `refactor`: refactoring production code. e.g.: renaming a variable
- `test`: adding missing tests, refactoring tests. (no production code change)
- `chore`: updating tasks (no production code change)
- `build`: changes in the build/dependency files (Gemfile, `package.json`, etc)
- `ci`: changes in the CI (github actions, `.gitlab-ci.yml`, etc.)

## references

<https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716>
