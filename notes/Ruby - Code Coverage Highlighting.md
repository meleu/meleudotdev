## Code Coverage highlighting

> [!note]
> This is an excerpt from copied from <https://jmatuszewski.com/Automatically-run-Rails-tests-in-VS-Code-and-highlight-test-coverage/>.

> [!todo]
> Make it work with minitest!

1. Install the [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters) extension and click the **Watch** icon added to the footer
2. Add `Simplecov` and `Simplecov-lcov` to Gemfile:
    
```ruby
group :test do
  gem 'simplecov'
  gem 'simplecov-lcov'
end
```
    
3. Add the `lcov` formatter to SimpleCov initialization:
    
```ruby
# spec/test_helper.rb
SimpleCov::Formatter::LcovFormatter.config do |c|
  c.report_with_single_file = true
  c.output_directory = 'coverage'
  c.lcov_file_name = 'lcov.info'
end
SimpleCov.start do
  enable_coverage :branch
  formatter SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::LcovFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ]
  )
end
```
    

Voila! Now when hitting `CTRL + S` on any file from `/app` folder I do get coverage higlights in gutter:

![VS Code coverage gutters for Rails application](https://jmatuszewski.com/images/VS-Code-coverage-gutters-for-rails-application.png)

### Extension Configuration

Every project is different so it might be that you have to change some configuration options as it’s set up to support RSpec by default:

- `railsAutomaticTestRunner.framework`: Specifies which framework is used to execute test commands: `rspec` or `minitest`.
- `railsAutomaticTestRunner.testsDirectory`: Specifies the folder where your test files are located, the default directory is `spec`.
- `railsAutomaticTestRunner.bundleExec`: Append `bundle exec` before test command?
- `railsAutomaticTestRunner.envVariables`: Pass any environment variables as a string there, eg: `CRUCIAL_API_KEY=test`
- `railsAutomaticTestRunner.args`: Pass any arguments like `--fail-fast` as a string there
- `railsAutomaticTestRunner.automaticOutputDisplay`: Automatically switch to the output tab, when enabled might interrupt terminal work.
