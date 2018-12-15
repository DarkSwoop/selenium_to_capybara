# SeleniumToCapybara

selenium2capybara translates a Selenium `.side` file into executable capybara tests. It is by no way meant to write the final system tests for you but take it as a good starting point.

If you do this:

`selenium2capybara path/to/saved/*.side`

you may get that:

```ruby
test 'checkout' do
  visit('/')

  # css: .tile:nth-child(4)
  # xpath: //a[contains(@href, '/products/P23A-S_FW1819')]
  # xpath: //a[4]
  find('.tile:nth-child(4)').click

  # linkText: Buy now
  # css: .buy
  # xpath: //a[contains(text(),'Buy now')]
  # xpath: //form[@id='new_product_item']/div/a
  # xpath: //a[contains(@href, '#')]
  # xpath: //form/div/a
  click_on('Buy now')

  # css: tr:nth-child(11) > td:nth-child(3)
  # xpath: //form[@id='new_order']/div/div[3]/div/table/tbody/tr[11]/td[3]
  # xpath: //tr[11]/td[3]
  assert_selector('tr:nth-child(11) > td:nth-child(3)', text: '123.45 €')
end
```

## Installation

### ... as executable

To run `selenium2capybara` install:

    $ gem install selenium_to_capybara


### ... as a library

Add this line to your Gemfile:

```ruby
gem 'selenium_to_capybara'
```

And then execute:

    $ bundle


### Required Additional Installation

In order to create the needed .side files the Selenium IDE plugin must be installed in your webbrowser.

- [Chrome](https://chrome.google.com/webstore/detail/selenium-ide/mooikfkahbdckldjjndioackbalphokd)
- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/)

## Usage

1. Create a test with the Selenium IDE plugin
2. Save the test to the disk
3. run `selenium2capybara path/to/saved/*.side`

## Translation contribution

The translations for minitest are currently placed in `lib/selenium_to_capybara/minitest.rb`. Feel free to add more or update the existing translations. To add a new translation open the `.side` file in your favourite text editor. It's a JSON file. Search for the command you want to add and define a new method with the name of the command in `minitest.rb`. For a more detailed description of how to add a new command translation please look at the `minitest.rb` file.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DarkSwoop/selenium_to_capybara. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SeleniumToCapybara project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/DarkSwoop/selenium_to_capybara/blob/master/CODE_OF_CONDUCT.md).
