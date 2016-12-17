== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

## INSTALLATION

```sh
rails g rspec:install
bundle exec spring binstub --all
rails generate simple_form:install --bootstrap
```

## FactoryGilr -> fixture data (see spec/factories) folder

## Cucumber --> every body, not just developer can create this test

```ruby
Feature: Create new achievement
  In order ....
  As ...
  I want to
```

```ruby
Feature: Create new achievement
  In order to keep and share my achievements
  As an user
  I want to create them

  Scenario: User creates new achievement
    Given I am a logged in User
    When I create new public achievement
    Then anybody can see this achievement online
```

```sh
# generate cucumber
rails g cucumber:install
```


```sh
#run cucumber
bin/cucumber
```

## Using spring
```ruby
bundle exec spring binstub --all
#* bin/rake: spring already present
#* bin/cucumber: generated with spring
#* bin/rspec: spring already present
#* bin/rails: spring already present
```
