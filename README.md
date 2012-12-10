# Ice Nine

Deep Freeze Ruby Objects

[![Build Status](https://secure.travis-ci.org/dkubb/ice_nine.png)](http://travis-ci.org/dkubb/ice_nine)

## Usage

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

If you want avoid deep_freeze some object in Namespace, you can use
`IceNine.no_freeze` class method.

By example if you want avoid not freeze the namespace RSpec and Mocha,
you can do

```ruby
IceNine.no_freeze([RSpec, Mocha])
```

## Installation

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

## Note on Patches/Pull Requests

* If you want your code merged into the mainline, please discuss the proposed changes with me before doing any work on it. This library is still in early development, and it may not always be clear the direction it is going. Some features may not be appropriate yet, may need to be deferred until later when the foundation for them is laid, or may be more applicable in a plugin.
* Fork the project.
* Make your feature addition or bug fix.
  * Follow this [style guide](https://github.com/dkubb/styleguide).
* Add specs for it. This is important so I don't break it in a future version unintentionally. Tests must cover all branches within the code, and code must be fully covered.
* Commit, do not mess with Rakefile, version, or history.  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Run "rake ci". This must pass and not show any regressions in the
  metrics for the code to be merged.
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright &copy; 2012 Dan Kubb. See LICENSE for details.
