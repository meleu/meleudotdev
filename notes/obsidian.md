---
dg-publish: true
---
# Obsidian

#tools 

## TODO

- [x] tab == 2 spaces
- [x] install Anki
- [x] install Obsidian_to_Anki
- [ ] periodically sync with git

## shortcuts

- `ctrl-o`: open/alternate files
- `ctrl-shift-i`: open the DevTools
- `ctrl-,`: open configs


## Things to do after installing

^a7ce0d

- vim keybinding
- tab not actual tabs
- tab == 2 spaces
- calendar
- templates
- mindmap
- Obsidian_to_anki



## Synchronizing with git

- <https://youtu.be/H6ipjzaN2WY>

```sh
gstatus="$(git status --porcelain)"
if [ ${#gstatus} -ne 0 ]; then
  git add --all
  git commit -m "Automated sync: ${gstatus}"
  git pull --rebase
  git push
fi
```


## Synchronizing with anki

1. install [[anki]]
2. **in Anki**: Install the AnkiConnect plugin
    - Tools -> Add-ons -> Get Add-ons -> Browse for it -> AnkiConnect
3. **in Obsidian**: Install Obsidian_to_Anki (by Pseudonium) Community Plugin
4. Copy the json in the Obsidian_to_Anki README
5. **in Anki**:
    - go to Tools -> Add-ons -> AnkiConnect -> Config and paste the json
    - restart Anki
6. <https://www.youtube.com/watch?v=PXyv6pnVGhA>


## video: 5 steps to study with Obsidian and how I use it for exam revision using NeuraCache and Anki 

- <https://www.youtube.com/watch?v=Bf3d7qyz17c>

00:25 - overview
02:00 - mindmap
02:55 - study plan
03:50 - revision notes
05:40 - question set notes
06:25 - question bank
09:30 - summary

1. **Mindmaps**: help you to have an overview of the subject, and help you break it down to manage and plan.
2. **Study plan** (with pomodor): helps you keep the focus on the revision notes.
3. **Revision notes**: help you bring in different sources and ideas about the topic.
4. Creating **question set notes** helps you prepare for your exam and actively thinking about the subject.
5. Using a **question bank** like Anki helps you use spaced repetition and active recall.

## My top plugins in the Obsidian app

- <https://www.youtube.com/watch?v=X61wRmfZU8Y>

Remember: use ctrl-p to quickly access the plugin commands.

- Mind Map
- Sliding Pane
    - theme: Cybertron
- Hotkeys++
- better word count (useful for tweets)
- smart random note
- advanced tables
- paste url into selection
- calendar
    - check weekly notes
- review - set a review day
- ~~note refactor~~ already available in Core Plugins

## external tools

- https://github.com/zoni/obsidian-export - CLI to export an Obsidian vault to regular Markdown