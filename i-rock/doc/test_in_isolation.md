### Mocks and Stubs

* Dependency Injection(only talk to friend)

```ruby
class Character
  def initialize
    @strength = 5
  end
  def climb
    die = Die.new
    die.roll + @strength
  end
end
```

better:

```ruby
class Character
  def initialize(die)
    @strength = 5
    @die = die
  end
  def climb
    die.roll + @strength
  end
end
```

in that way

```ruby
class FakeDie
  def roll
    5
  end
end
character = Character.new(FakeDie.new)
expect(character.roll).to eq(10)

```

* Query: return something back(We Stub)

```ruby
# FakeDie:
allow(die).to receive(:roll)(5)
````
* Command(We Mock): doesn't care about the returns,just tell other object to do something

just want to be sure the command is send

```
#FakeLogger
expect(logger).to receive(:log)
```
