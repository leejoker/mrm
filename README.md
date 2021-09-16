# MRM - Maven Respository Manager

[![build](https://img.shields.io/github/workflow/status/leejoker/mrm/Ruby/main?color=brightgreen)](https://github.com/leejoker/mrm/actions)
[![issues](https://img.shields.io/github/issues/leejoker/mrm)](https://github.com/leejoker/mrm/issues)
[![forks](https://img.shields.io/github/forks/leejoker/mrm)](https://github.com/leejoker/mrm/network/members)
[![stars](https://img.shields.io/github/stars/leejoker/mrm)](https://github.com/leejoker/mrm/stargazers)
[![license](https://img.shields.io/github/license/leejoker/mrm)](https://github.com/leejoker/mrm/blob/main/LICENSE)

Just like nrm on npm, mrm is a repo switcher on maven.

## Installation

```shell
$ bundle install
$ gem build mrm.gemspec
$ gem install mrm-0.1.0.gem
```

## Usage

```text
Usage: mrm [arguments]
    help      help messages
    ls        list all available mirrors
    use       use a mirror as default
    show      show current mirrors
    restore   restore your config file
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/leejoker/mrm. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct](https://github.com/[USERNAME]/mrm/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mrm project's codebases, issue trackers, chat rooms and mailing lists is expected to follow
the [code of conduct](https://github.com/leejoker/mrm/blob/master/CODE_OF_CONDUCT.md).
