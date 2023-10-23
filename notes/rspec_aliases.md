---
dg-publish: true
---
# RSpec aliases

> [!note]
> This is a copy of [this gist from Junichi Ito](https://gist.github.com/JunichiIto/f603d3fbfcf99b914f86).

This list is based on [aliases_spec.rb](https://raw.githubusercontent.com/rspec/rspec-expectations/6f975b08c996b1014654334229d5d4b020055690/spec/rspec/matchers/aliases_spec.rb).

You can see also [Module: RSpec::Matchers API](http://rubydoc.info/github/rspec/rspec-expectations/RSpec/Matchers).

| matcher                                 | aliased to                  | description                              |
|:--------------------------------------- |:--------------------------- |:---------------------------------------- |
| a_truthy_value                          | be_truthy                   | a truthy value                           |
| a_falsey_value                          | be_falsey                   | a falsey value                           |
| be_falsy                                | be_falsey                   | be falsy                                 |
| a_falsy_value                           | be_falsey                   | a falsy value                            |
| a_nil_value                             | be_nil                      | a nil value                              |
| a_value > 3                             | be > 3                      | a value > 3                              |
| a_value < 3                             | be < 3                      | a value < 3                              |
| a_value <= 3                            | be <= 3                     | a value <= 3                             |
| a_value == 3                            | be == 3                     | a value == 3                             |
| a_value === 3                           | be === 3                    | a value === 3                            |
| an_instance_of(Integer)                 | be_an_instance_of(Integer)  | an instance of Integer                   |
| a_kind_of(Integer)                      | be_a_kind_of(Integer)       | a kind of Integer                        |
| a_value_between(1, 10)                  | be_between(1, 10)           | a value between 1 and 10 (inclusive)     |
| a_value_within(0.1).of(3)               | be_within(0.1).of(3)        | a value within 0.1 of 3                  |
| within(0.1).of(3)                       | be_within(0.1).of(3)        | within 0.1 of 3                          |
| a_block_changing                        | change                      | a block changing result                  |
| changing                                | change                      | changing result                          |
| a_collection_containing_exactly(1, 2)   | contain_exactly(1, 2)       | a collection containing exactly 1 and 2  |
| containing_exactly(1, 2)                | contain_exactly(1, 2)       | containing exactly 1 and 2               |
| a_range_covering(1, 2)                  | cover(1, 2)                 | a range covering 1 and 2                 |
| covering(1, 2)                          | cover(1, 2)                 | covering 1 and 2                         |
| ending_with(23)                         | end_with(23)                | ending with 23                           |
| a_collection_ending_with(23)            | end_with(23)                | a collection ending with 23              |
| a_string_ending_with("z")               | end_with("z")               | a string ending with 'z'                 |
| an_object_eq_to(3)                      | eq 3                        | an object eq to 3                        |
| eq_to(3)                                | eq 3                        | eq to 3                                  |
| an_object_eql_to(3)                     | eql 3                       | an object eql to 3                       |
| eql_to(3)                               | eql 3                       | eql to 3                                 |
| an_object_equal_to(3)                   | equal 3                     | an object equal to 3                     |
| equal_to(3)                             | equal 3                     | equal to 3                               |
| an_object_existing                      | exist                       | an object existing                       |
| existing                                | exist                       | existing                                 |
| an_object_having_attributes(:age => 32) | have_attributes(:age => 32) | an object having attributes {:age => 32} |
| a_string_including("a")                 | include("a")                | a string including 'a'                   |
| a_collection_including("a")             | include("a")                | a collection including 'a'               |
| a_hash_including(:a => 5)               | include(:a => 5)            | a hash including {:a => 5}               |
| including(3)                            | include(3)                  | including 3                              |
| a_string_matching(/foo/)                | match(/foo/)                | a string matching /foo/                  |
| an_object_matching(/foo/)               | match(/foo/)                | an object matching /foo/                 |
| match_regex(/foo/)                      | match(/foo/)                | match regex /foo/                        |
| matching(/foo/)                         | match(/foo/)                | matching /foo/                           |
| a_block_outputting('foo').to_stdout     | output('foo').to_stdout     | a block outputting 'foo' to stdout       |
| a_block_outputting('foo').to_stderr     | output('foo').to_stderr     | a block outputting 'foo' to stderr       |
| a_block_raising(ArgumentError)          | raise_error(ArgumentError)  | a block raising ArgumentError            |
| raising(ArgumentError)                  | raise_error(ArgumentError)  | raising ArgumentError                    |
| an_object_responding_to(:foo)           | respond_to(:foo)            | an object responding to #foo             |
| responding_to(:foo)                     | respond_to(:foo)            | responding to #foo                       |
| an_object_satisfying { }                | satisfy { }                 | an object satisfying block               |
| satisfying { }                          | satisfy { }                 | satisfying block                         |
| a_collection_starting_with(23)          | start_with(23)              | a collection starting with 23            |
| a_string_starting_with("z")             | start_with("z")             | a string starting with 'z'               |
| starting_with("d")                      | start_with("d")             | starting with 'd'                        |
| a_block_throwing(:foo)                  | throw_symbol(:foo)          | a block throwing :foo                    |
| throwing(:foo)                          | throw_symbol(:foo)          | throwing :foo                            |
| a_block_yielding_control                | yield_control               | a block yielding control                 |
| yielding_control                        | yield_control               | yielding control                         |
| a_block_yielding_with_no_args           | yield_with_no_args          | a block yielding with no args            |
| yielding_with_no_args                   | yield_with_no_args          | yielding with no args                    |
| a_block_yielding_with_args              | yield_with_args             | a block yielding with args               |
| yielding_with_args                      | yield_with_args             | yielding with args                       |
| a_block_yielding_successive_args        | yield_successive_args       | a block yielding successive args()       |
| yielding_successive_args                | yield_successive_args       | yielding successive args()               |