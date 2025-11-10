---
dg-publish: true
---
[Useful StackOverflow answer](https://stackoverflow.com/a/356154)

My PoC script:

```bash
#!/usr/bin/env bash

BG_PIDS=()

run_bg() {
  $@ &
  BG_PIDS+=($!)
}

wait_bg() {
  local pid
  local has_failure

  for pid in "${BG_PIDS[@]}"; do
    wait $pid || a_failure=true
  done

  [[ -z "$has_failure" ]]
}

run_bg sleep 3
run_bg xumbrega de comando que não faz nada
run_bg sleep 2
run_bg echo something

wait_bg

```