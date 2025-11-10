---
dg-publish: true
---


## caveats

- shellcheck:
  - arguments are accessed via `args`, and in partial snippets shellcheck complains about `used but not assigned`
    - solution: in `bashly-settings.yml` use `var_aliases.args: ARGS`
- partial snippets in `src/` are going to be wrapped in a function:
  - creating functions results in a "function inside a function" situation in the final script
  - if you use `local VARNAME`, shellcheck complains about `'local' is only valid in functions`
    - solution: ALWAYS use the `src/*.sh` files to just call a function that is going to be coded in a `src/lib/*.sh` file.
- validations are purely based on output (something in output means failure)
    - https://github.com/DannyBen/bashly/blob/9e2617f6c064a5847d9275942422569dc61a91fd/lib/bashly/views/flag/validations.gtx#L4


## bashly tutorial

Planning a bashly tutorial with the topics to be addressed:

- very minimal `bashly.yml` needed
    - `rndm` doing `echo "$RANDOM"`
    - highlight that the contents of `root_command.sh` are going to be wrapped in a `root_command()` function.
- passing long options
    - `rndm --max NUM` prints a random number between 0 and `NUM`
    - options are provided in the `$args` variable
    - `rndm --min NUM` prints a random number between NUM and 32767
- passing short options
	- `--min` or `-m`
	- `--max` or `-M`
- validate the argument:
    - custom validations
        - if the function prints a string to stdout, it's considered an error.
    - bashly wants your code to be clean, with all inputs already validated
    - numbers must be:
	    - integers
	    - between 0 and 32767
	    - min < max
- flags
    - `rndm --web` get's the random number from https://random.org/
    - `-w` as a short option
- dependencies
    - `rndm --web` depends on `curl` being available
- subcommands:
	- convert `rndm` to `rndm number`
- create `rndm password`
	- the default behavior is to use alphanumeric characters for the password
	- `--size NUM`: tamanho da senha (default is 8)
	- `--alpha`: only alphabet chars
	- `--num`: only numbers
		- conflicts with `--alpha`

[[zz]]

