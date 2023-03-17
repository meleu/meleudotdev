---
dg-publish: true
---
## text object cheatsheet - `:help Q_to`

**Note**: must be prefixed with `i` (**i**nner) or `a` (**a**round)

| char               | meaning                                      |
| ------------------ | -------------------------------------------- |
| `w`, `W`           | word/WORD                                    |
| `s`                | sentence                                     |
| `p`                | paragraph                                    |
| `[`, `(`, `{`, `<` | block                                        |
| `'`, `"`, \`       | quoted string                                |
| `t`                | XML tag block                                |
| `i`                | indentation (vim-textobj-indent)             |
| `l`                | line without indentation (vim-text-obj-line) |


## text object motions - `:help Q_tm`

**Note**: can be prefixed with a number.

| char       | meaning                               |
| ---------- | ------------------------------------- |
| `w`, `W`   | word/WORD                             |
| `e`, `E`   | end of word                           |
| `b`, `B`   | go **b**ack to the start of the word  |
| `ge`, `gE` | end of the previous word              |
| `)`, `(`   | next/previous sentence                |
| `}`, `{`   | next/previous paragraph               |
| `]]`, `[[` | start of next/previous section        |
| `][`, `[]` | end of next/previous section          |
| `[(`, `])` | go to next/previous unclosed `(`, `)` |
| `[{`, `]}` | go to next/previous unclosed `{`, `}` |
| `[m`, `[M` | start/end of previous method (Java)   |
| `]m`, `]M` | start/end of next method (Java)       |
| `[#`       | back to unclosed `#if` or `#else`     |
| `]#`       | next unclosed `#else` or `#endif`     |
| `[*`       | start of comment `/*`                 |
| `]*`       | end of comment `*/`                   |
