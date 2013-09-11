# Jancode

[![Gem Version](https://badge.fury.io/rb/jancode.png)](http://badge.fury.io/rb/jancode)
[![Build Status](https://travis-ci.org/i2bskn/jancode.png?branch=master)](https://travis-ci.org/i2bskn/jancode)
[![Coverage Status](https://coveralls.io/repos/i2bskn/jancode/badge.png?branch=master)](https://coveralls.io/r/i2bskn/jancode?branch=master)
[![Code Climate](https://codeclimate.com/github/i2bskn/jancode.png)](https://codeclimate.com/github/i2bskn/jancode)

Japanese Article Number

## Installation

Add this line to your application's Gemfile:

    gem 'jancode'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jancode

## Usage

### GTIN13

```ruby
require "jancode"

# Jancode::GTIN13.new("GS1 Company Prefix", "Item Code")
jancode = Jancode::GTIN13.new("456995111", "617")
jancode.check_digit # => 9
jancode.create # => "4569951116179"

# jancode.company_prefix = "456995111"
jancode.item_code = "618"
jancode.create # => "4569951116186"

(1..10).each do |item_code|
  jancode.item_code = "%03d" % item_code
  puts jancode.create
end
# 4569951110016
# 4569951110023
# 4569951110030
# 4569951110047
# 4569951110054
# 4569951110061
# 4569951110078
# 4569951110085
# 4569951110092
# 4569951110108
```

### GTIN8

```ruby
require "jancode"

# Jancode::GTIN8.new("GS1 Company Prefix", "Item Code")
jancode = Jancode::GTIN8.new("491234", "5")
jancode.check_digit # => 6
jancode.create # => "49123456"

# jancode.company_prefix = "491234"
jancode.item_code = "6"
jancode.create # => "49123463"

(1..9).each do |item_code|
  jancode.item_code = item_code.to_s
  puts jancode.create
end
# 49123418
# 49123425
# 49123432
# 49123449
# 49123456
# 49123463
# 49123470
# 49123487
# 49123494
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
