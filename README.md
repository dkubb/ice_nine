ice_nine
========

Deep freeze ruby objects

[![Gem Version](https://badge.fury.io/rb/ice_nine.svg)][gem]
[![Build Status](https://secure.travis-ci.org/dkubb/ice_nine.svg?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/dkubb/ice_nine.svg)][gemnasium]
[![Code Climate](https://codeclimate.com/github/dkubb/ice_nine.png)][codeclimate]
[![Inline docs](http://inch-ci.org/github/dkubb/ice_nine.svg?branch=master)][inch]

[gem]: https://rubygems.org/gems/ice_nine
[travis]: https://travis-ci.org/dkubb/ice_nine
[gemnasium]: https://gemnasium.com/dkubb/ice_nine
[codeclimate]: https://codeclimate.com/github/dkubb/ice_nine
[inch]: http://inch-ci.org/github/dkubb/ice_nine

Examples
--------

```ruby
require 'ice_nine'

# Deep freezes most kinds of objects
hash   = IceNine.deep_freeze('a' => '1')
array  = IceNine.deep_freeze([ 'a', 'b', 'c' ])
range  = IceNine.deep_freeze('a'..'z')
struct = IceNine.deep_freeze(Struct.new(:a, :b).new('a', 'b'))
object = IceNine.deep_freeze(Object.new)
user   = IceNine.deep_freeze(User.new(name: 'dkubb'))

# Faster deep freeze that skips deep-freezing frozen objects
object = IceNine.deep_freeze!(Object.new)

# Add core extension for Object#deep_freeze (not required by default)
require 'ice_nine'
require 'ice_nine/core_ext/object'

object = Object.new
object.deep_freeze
```

Contributing
------------

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

Copyright
---------

Copyright &copy; 2012-2014 Dan Kubb. See LICENSE for details.
