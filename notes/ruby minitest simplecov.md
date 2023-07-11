---
dg-publish: true
---
# ruby minitest simplecov

Setup to have code coverage with minitest.

Consider also installing [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters) if you're working with VSCode.

```sh
bundle add rake minitest simplecov simplecov-lcov
```

`.gitignore`:
```
test/coverage/
/coverage/
**/coverage/
```

`Rakefile`:
```ruby
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.pattern = "test/**/*_test.rb" # tests inside test subfolder
end                               # and end with '_test.rb'
                                  # Run all test with `rake test`

task default: :test # run tests with just `rake`
```

`test_helper.rb`:
```ruby
# IMPORTANT: simplecov setup must go first!
require 'simplecov'
SimpleCov.start

# the config below is to work with VSCode + Coverage Gutters
# require 'simplecov-lcov' # used for code-coverage highlight
# SimpleCov::Formatter::LcovFormatter.config do |conf|
#   conf.report_with_single_file = true
#   conf.output_directory = 'coverage'
#   conf.lcov_file_name = 'lcov.info'
# end
# SimpleCov.start do
#   enable_coverage :branch
#   formatter SimpleCov::Formatter::MultiFormatter.new(
#     [
#       SimpleCov::Formatter::LcovFormatter,
#       SimpleCov::Formatter::HTMLFormatter
#     ]
#   )
# end

require 'minitest/autorun' # Sets up minitest
```

`test/your_test.rb`:
```ruby
require_relative 'test_helper' # require test_helper first
require_relative 'your_class'

class YourClassTest < Minitest::Test
  def test_it_does_stuff
    assert_equal 100, 100
  end
end
```


## source

<https://gist.github.com/jcasimir/3c687bd5db16a73b4cf3>
