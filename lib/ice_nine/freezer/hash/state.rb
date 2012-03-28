# encoding: utf-8

module IceNine
  class Freezer
    class Hash

      # Skip freezing Hash::State objects on Rubinius
      class State < NoFreeze; end

    end # class Hash
  end # class Freezer
end # module IceNine
