# encoding: utf-8

module IceNine
  class Freezer

    # Skip freezing true objects
    class TrueClass < NoFreeze; end

  end # class Freezer
end # module IceNine
