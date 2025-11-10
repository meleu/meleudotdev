---
dg-publish: true
---
```bash
#!/bin/bash

set -Eeo pipefail

stacktrace() {
  local i=0
  local caller_output line func file
  
  while caller_output="$(caller $i)"; do
    read -r line func file <<< "$caller_output"
    echo "[$i] ${file}:${line} $function"
    i=$((i + 1))
  done
}

# Trap errors and call the print_stack function
trap 'stacktrace' ERR

# Example functions
function_a() {
  function_b
}

function_b() {
  function_c
}

function_c() {
  # Simulate an error
  invalid_command
}

# Call the initial function
function_a
```
