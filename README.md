ice_nine
========

Deep freeze ruby objects

[![Build Status](https://secure.travis-ci.org/dkubb/ice_nine.png)](https://travis-ci.org/dkubb/ice_nine)
[![Dependency Status](https://gemnasium.com/dkubb/ice_nine.png)](https://gemnasium.com/dkubb/ice_nine)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/dkubb/ice_nine)

Examples
--------

```ruby
# Freezes most objects
hash   = IceNine.deep_freeze('a' => '1')
array  = IceNine.deep_freeze([ 'a', 'b', 'c' ])
range  = IceNine.deep_freeze('a'..'z')
struct = IceNine.deep_freeze(Struct.new(:a, :b).new('a', 'b'))
object = IceNine.deep_freeze(Object.new)
user   = IceNine.deep_freeze(Application::User.new('dkubb'))

# Add core extension for Object#deep_freeze (not required by default)
require 'ice_nine/core_ext/object'

object = Object.new
object.deep_freeze
```

Installation
------------

With Rubygems:

```bash
$ gem install ice_nine
$ irb -rubygems
>> require 'ice_nine'
=> true
```

With git and local working copy:

```bash
$ git clone git://github.com/dkubb/ice_nine.git
$ cd ice_nine
$ rake install
$ irb -rubygems
>> require 'ice_nine'
=> true
```

Contributing
------------

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

Copyright
---------

Copyright &copy; 2012 Dan Kubb. See LICENSE for details.
