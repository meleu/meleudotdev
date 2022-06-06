# mermaid

- live editor: <https://mermaid-js.github.io/mermaid-live-editor>
- video showing mermaid feature on Obsidian: <https://youtu.be/rxJZ7oG0UOQ>

## simple graph

```mermaid
graph LR
  cue --> routine --> reward --> cue
```

In `graph` line, `TB` means "top to bottom", `LR` means "left to right". Similarly you can use `BT` and `RL`.

### links with text

```mermaid
graph LR
  a -->|yes| b
  a -->|no| c
```

### shorter syntax for multiple connections

```mermaid
graph LR
  a & b --> c & d
```

## subgraphs

```mermaid
graph LR
  subgraph group1
    a & b
  end
  subgraph group2
    c & d
  end
  a -->|yes| d
  c -->|no| b
```


## node shapes

Just the basic ones

```mermaid
graph LR
  id1[squared]
  id2(rounded-corners)
  id3([rounded])
  id4[(cylinder)]
  id5((circle))
```


## elaborated example

```mermaid
graph TD
  A[start] --> B{is it?}
  B -->|yes| C[ok]
  C --> D[rethink]
  D --> B
  B ---->|no| E[end]
  
  subgraph core logic
    B -->|maybe| M[think]
  end
```


## my goals

```mermaid
graph LR
  devops --> gitlab-ci
  devops --> kubernetes
  
  webdev --> javascript --> typescript
  javascript --> concurrency
  javascript --> node
  webdev --> sql
  webdev --> regex

```


## ExpressJS backend - RocketSeat style

```mermaid
graph 
  client
  -->|request| server
  --> router
  --> controller
  --> service
  --> repositories
  --> entities
  --> DB
```


