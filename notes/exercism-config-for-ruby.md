---
dg-publish: true
---
# Exercism Configuration to practice Ruby

This is an attempt to provide instructions for those who want to keep practicing Ruby right after finishing the Le Wagon's Full-Stack Web Development bootcamp.

Website: <https://exercism.org>

## Create an account

You probably already have a github account, so, the most practical thing is to "Sign Up with GitHub"

## Choose the Ruby track

In the frontpage, hover over "Learn" and then click on "Language Tracks".

![[exercism-config-for-ruby - learn.png]]

Search for Ruby and click on it:

![[exercism-config-for-ruby - search ruby track.png]]

In the Ruby track page, click on the `Join the Ruby Track` button.


## Install the tools

While in the [ruby track page](https://exercism.org/tracks/ruby), scroll down a little bit and look for the `View Ruby Documentation` button on the right side. Like this:

![[exercism-config-for-ruby - ruby docs link.png]]

Although it says "Ruby Documentation", it's not the "official ruby-docs". In that link there are instructions about the things you need to do in order to be able to work on the Ruby challenges.

I'm going to try to summarize such steps below...

### Ruby

If you finished the bootcamp, you already have Ruby installed (remember the very first day of the course?).

If you don't have Ruby installed, I recommend following the official documentation: <https://www.ruby-lang.org/en/documentation/installation/>


### minitest

Nothing fancy, just run this command:
```sh
gem install minitest
```

That's enough to install minitest globally.

**NOTE**: During the bootcamp we used `rake` which calls `rspec` to run the tests. Here in exercism we use `minitest`, which is pretty similar to RSpec, but simpler.


### exercism CLI

The exercism CLI is a tool we use to download the challenges to our machine and to submit our solutions to the website.

To install it, follow the instructions in the [official walkthrough](https://exercism.org/cli-walkthrough)

After installing the exercism CLI, don't forget to configure your API token:

1. go to <https://exercism.org/settings/api_cli>
2. copy your token
3. run this command:

```sh
exercism configure --token='PutYourTokenHere'
```



## Your first challenge

Once you have the `exercism` command available, you can download your very first challenge, which is the famous "Hello World": <https://exercism.org/tracks/ruby/exercises/hello-world>.

The screenshot below is not from the "Hello World" challenge, but the idea is the same:

![[exercism-config-for-ruby - copy command to download.png]]

Once you copy that command, paste it on your terminal and run it.

This will proabably create an `exercism/` directory inside your home directory. And inside `exercism/` you'll have a `ruby/` directory with subdirectories for each challenges.

If you followed the instructions correctly, this command will (probably) open your VSCode with the ruby challenges (for now it will have only `hello-world`):
```sh
code ~/exercism/ruby
```



## Run all tests (disable skip)

Create an alias


## Submit your solution

### Learn from others



