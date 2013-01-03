# change the heckle timeout to be 5 seconds
if defined?(::Heckle)
  class ::Heckle
    @@timeout = 5
  end
end
