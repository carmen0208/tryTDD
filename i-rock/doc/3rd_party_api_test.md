## Three Approaches:
1. Full integration(not stable and cost a lot)
2. Mock everything(we can't be sure the integration works)
3. Integration with caching

## VCR

gemfile

```ruby
  gem 'vcr'
  gem 'webmock'
```

rspec_helper

```ruby
#....
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
#....
```

in spcific spec that test 3rd party API

```ruby
  scenario 'create new achievement with valid data', :vcr do
```

it would generate a file in `spec/cassettes` after runs spec for the first time

#### Example
```sh
rspec spec/features/create_achievement_spec.rb
```
