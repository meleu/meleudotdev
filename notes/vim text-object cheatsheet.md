---
dg-publish: true
---
# vim text-object cheatsheet

> [!note]
> Must be prefixed with `i` (**i**nner) or `a` (**a**round)

> [!important]
| char               | meaning                                      |
| ------------------ | -------------------------------------------- |
| w, W               | word/WORD                                    |
| s                  | sentence                                     |
| p                  | paragraph                                    |
| `[`, `(`, `{`, `<` | block                                        |
| `'`, `"`, \`        | quoted string                                |
| t                  | XML tag block                                |
| i                  | indentation (vim-textobj-indent)             |
| l                  | line without indentation (vim-text-obj-line) |


## text object motions

> [!note]
> Can be prefixed with a number to specify the amount of movements.

> [!important]
| char   | meaning                              |
| ------ | ------------------------------------ |
| w, W   | word/WORD                            |
| e, E   | end of word                          |
| b, B   | go **b**ack to the start of the word |
| ge, gE | end of the previous word             |
| )      | next sentence                        |
| (      | previous sentence                    |
| }      | next paragraph                       |
| {      | previous paragraph                   |
| ]]     | start of next section                |
| \[\[   | start of previous section            |
| ]\[    | end of next section                  |
| \[]    | end of previous section              |
| \[(    | back to unclosed `(`                 |
| \[{    | back to unclosed `{`                 |
| ])     | next unclosed `)`                    |
| ]}     | next unclosed `}`                    |
| \[m    | start of previous method (Java)      |
| \[M    | end of previous method (Java)        |
| ]m     | start of next method (Java)          |
| ]M     | end of next method (Java)            |
| \[#    | back to unclosed `#if` or `#else`    |
| ]#     | next unclosed `#else` or `#endif`    |
| \[*    | start of comment `/*`                |
| ]*     | end of comment `*/`                  |

