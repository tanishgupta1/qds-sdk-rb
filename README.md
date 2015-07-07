# Qubole

Qubole REST API client

[![Build Status](https://travis-ci.org/Demandbase/qubole-ruby.svg?branch=master)](https://travis-ci.org/Demandbase/qubole-ruby)
[![Code Climate](https://codeclimate.com/github/Demandbase/qubole/badges/gpa.svg)](https://codeclimate.com/github/Demandbase/qubole)
[![Test Coverage](https://codeclimate.com/github/Demandbase/qubole/badges/coverage.svg)](https://codeclimate.com/github/Demandbase/qubole/coverage)
[![Gem Version](https://badge.fury.io/rb/qubole.svg)](http://badge.fury.io/rb/qubole)

## Documentation

[API Documentation](http://www.rubydoc.info/github/Demandbase/qubole/master/Qubole)

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
		command.submit(query: "SHOW TABLES", label: "custom cluster")
		command.status # => "waiting"
		command.refresh!
		command.status # => "done"
		command.results # => {"results"=>"default_qubole_airline_origin_destination\r\ndefault_qubole_memetracker\r\n", "inline"=>true}
		id = command.id
		command = Qubole::Command.find(id)
		command.logs # => "OK\n  Time taken: 3.017 seconds, Fetched: 2 row(s)"

## Implemented

[Qubole REST API](http://docs.qubole.com/en/latest/rest-api/index.html) version v1.2

- [x] Authentication
- [x] Command API
	- [x] Submit a Command
	- [x] View Command Status
	- [x] View Command Results
	- [x] View Command Logs
	- [x] View Hadoop Jobs Spawned By a Command
	- [x] Cancel a Command
	- [x] View Command History
	- [x] Composite Command
	- [x] DB Export Command
	- [x] DB Import Command
	- [x] DB Tap Query Command
	- [x] Hadoop Jar Command
	- [x] Hive Command
	- [x] Pig Command
	- [x] Presto Command
	- [x] Shell Command
	- [x] Spark Command
- [ ] Hive Metadata API
	- [ ] List Tables
	- [ ] Get Table Definition
	- [ ] Get Table Properties
	- [ ] Store Table Properties
	- [ ] Delete Table Properties
- [ ] DbTap API
	- [ ] List DbTaps
	- [ ] View a DbTap
	- [ ] List Tables in a DbTap
	- [ ] Create a DbTap
	- [ ] Edit a DbTap
	- [ ] Delete a DbTap
- [ ] Scheduler API
	- [ ] List Schedules
	- [ ] View a Schedule
	- [ ] Create a Schedule
	- [ ] Suspend,Resume or Kill a Schedule
	- [ ] List Schedule Actions
	- [ ] View a Schedule’s Action
	- [ ] Kill a Schedule Action
	- [ ] Rerun a Scheduled Action
	- [ ] List All Actions
	- [ ] View an Action
- [ ] Reports API
	- [ ] All Commands Report
	- [ ] Canonical Hive Commands Report
	- [ ] Cluster nodes Report
- [ ] Cluster API
	- [ ] List All Clusters
	- [ ] Create a New Cluster
	- [ ] View Cluster Configuration
	- [ ] Edit Cluster Configuration
	- [ ] Clone a Cluster
	- [ ] Start or Terminate a Cluster
	- [ ] Check Cluster Status
	- [ ] Delete a Cluster
	- [ ] Reassign Cluster Label
	- [ ] Run Adhoc Scripts on a Cluster
	- [ ] Cluster Metrics
	- [ ] Add a Node to a Cluster
	- [ ] Replace a Node in a Cluster
	- [ ] Remove a Node from a Cluster
	- [ ] Take an HBase Snapshot
	- [ ] View an HBase Snapshot Schedule
	- [ ] Restore HBase Tables
	- [ ] Update an HBase Snapshot Schedule


## Contributing

1. Fork it ( https://github.com/[my-github-username]/qubole/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
