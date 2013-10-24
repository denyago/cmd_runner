# CmdRunner

Simple wrapper for Open3 to execute command.
The command treated as an object and is able to be executed.
You can specify `logger` to point runtime messages to and
`work_dir` to change into it before each run.

## Installation

Add this line to your application's Gemfile:

    gem 'cmd_runner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cmd_runner

## Usage

```ruby
  cmd = CmdRunner::Command.new('ls')
  cmd.work_dir = '/tmp'
  cmd.logger   = Logger.new('./ls.log')
  cmd.execute!
  #=> [0, "launch-qO1j87\ntextmate-501.sock\n", '']
```

## Contributing

As always:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
