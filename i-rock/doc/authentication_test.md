## Devise addon
```sh
 rails g devise:install

```
## Requirement
**Guest User**: index, show
**User**: index, show, new, create
**Owner**: index, show, new, create, edit, update, destroy

## Test specific method:

```sh
rspec -fd spec/controllers/achievements_controller_spec.rb -e "redirect to login page"
```

## Change table to add User reference to table

```ruby
rails g migration AddUserToAchievements user:references
```
