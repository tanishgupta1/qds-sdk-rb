# Qubole

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qubole'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qubole

## Usage

		require 'qubole'

		# Configure Qubole with api_token and optional API version
		Qubole.configure(api_token: 'ksbdvcwdkjn123423', version: 'v1.2')

		# Submit Command
		command = Qubole::Commands::Hive.new
		command.submit(query: "SHOW TABLES")
		command.status # => "waiting"
		command.refresh!
		command.status # => "done"
		command.results # => {"results"=>"default_qubole_airline_origin_destination\r\ndefault_qubole_memetracker\r\n", "inline"=>true}
		id = command.id
		command = Qubole::Command.find(id)
		command.logs # => "OK\n  Time taken: 3.017 seconds, Fetched: 2 row(s)"

## Contributing

1. Fork it ( https://github.com/[my-github-username]/qubole/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
