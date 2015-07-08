# ParallelFormatter

Works with RSpec 3.3.0 and up

An RSpec custom formatter that works nicely with 
[parallel_tests] (https://github.com/grosser/parallel_tests).

- Patterned after DocumentFormatter
- Eliminates indentations
- Prints example description and location
- failures will instantly display info - just like 
[rspec-instafail](https://github.com/grosser/rspec-instafail)

### Example logs:    
    GROUP STARTED: when session is authenticated
    TEST STARTED: ./spec/features/home_spec.rb:15: launches successfully
    TEST PASSED: ./spec/features/home_spec.rb:15:  launches successfully
    GROUP STARTED: when using pre-filter thumbnails
    TEST STARTED: ./spec/features/home_spec.rb:20: uses all pre-filters
    TEST PASSED: ./spec/features/tutorial_spec.rb:23:  I can visit the share tutorial
    TEST STARTED: ./spec/features/tutorial_spec.rb:19: I can visit the import tutorial
    TEST PASSED: ./spec/features/tutorial_spec.rb:19:  I can visit the import tutorial
    TEST STARTED: ./spec/features/tutorial_spec.rb:15: I can visit the find tutorial
    TEST PASSED: ./spec/features/tutorial_spec.rb:15:  I can visit the find tutorial


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parallel_formatter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parallel_formatter

## Usage
add to your `.rspec` file

    --require parallel_formatter
    --format RSpec::ParallelFormatter

## Contributing

1. Fork it ( https://github.com/[my-github-username]/parallel_formatter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
