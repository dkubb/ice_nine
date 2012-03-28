# encoding: utf-8

module IceNine
  class Freezer

    # Skip freezing Symbol objects
    class Symbol < NoFreeze; end

  end # class Freezer
end # module IceNine
