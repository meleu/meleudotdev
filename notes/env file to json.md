---
dg-publish: true
---
# env file to json

Sometimes we need the contents of a `.env` file (with `key=value` entries) in a JSON format.

Here's how I do it:

First, install `jo`.

Repository: <https://github.com/jpmens/jo>

I installed with Homebrew

```shell
brew install jo
```

Now we just need to pipe the contents of our `.env` file **without the empty lines** to `jo`:

```shell
# I found that removing empty lines is more consistent
grep -v '^$' .env | jo -p

# this should work if your .env doesn't have empty lines
jo < .env

# if you want a pretty JSON, use '-p'
jo -p < .env
```

