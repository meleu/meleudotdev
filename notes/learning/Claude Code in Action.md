---
dg-publish: true
---
https://anthropic.skilljar.com/claude-code-in-action

Assuming you already installed and is authenticated...

Go to your project and run `claude`.

## create a `CLAUDE.md` file

First command to be used: `/init`. It creates the `CLAUDE.md` file. Review it and make adjustments you deem necessary.

You can use `# <instruction>` to make claude update the `CLAUDE.md` file with more instructions

You can use `@path/to/file` to reference a file from inside `CLAUDE.md`.

You can paste images directly in the text input field.

Once you're happy with the changes, ask claude to commit the changes.

## context management

### go back to a previous point of conversation

Press `Esc Esc` (yes, press it twice) to jump to a previous point of the conversation and fork from it. This is useful when parts of your conversation are just noise and you want to remove them from the context history.

### compact the context

Another way to decrease the amount of tokens used to keep the context, is by using the `/compact` command. This is ideal when:

- Claude has gained valuable knowledge about your project
- You want to continue with related tasks
- The conversation has become long but contains important context

Use compact when Claude has learned a lot about the current task and you want to maintain that knowledge as it moves to the next related task

### clear the context and start a new one

If you want to start a brand new task, use `/clear` to remove all the context and start a new one.

## custom commands

Create a file inside `.claude/commands/<command_name>.md` and add instructions inside the file.

Restart claude and you'll see the  `/<command_name>` is now available.

Your custom command can also receive arguments. Just create a custom command referencing `$ARGUMENTS`, like in this example:

```md
Write comprehensive tests for: $ARGUMENTS

> more instructions here...
```

## MCP integration

TBD...

