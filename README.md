# MultiplayerElo

This is a gem for multiplayer elo calculations.  It supports ties and 2 or more players.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multiplayer_elo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multiplayer_elo

## Usage


```ruby
    players = [ {id: 1, elo: 1500, place: 1}, {id: 2, elo: 1500, place: 2}, 
                {id: 3, elo: 1500, place: 3}, {id: 4, elo: 1500, place: 4} ]

    results = @elo_manager.evaulate_results(players)
```

## Contributing

1. Fork it ( https://github.com/stunningene/multiplayer_elo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
