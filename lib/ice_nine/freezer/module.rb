# encoding: utf-8

module IceNine
  class Freezer

    # Skip freezing Module objects
    class Module < NoFreeze; end

  end # class Freezer
end # module IceNine
