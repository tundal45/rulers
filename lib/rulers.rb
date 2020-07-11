require "rulers/version"
require "rulers/array"

module Rulers
  class Application
    def call(env)
      [200, {"Content-Type" => "text/html"}, ["Hello from Ruby on Rulers! #{[1, 2, 37, 9].sum}"]]
    end
  end
end
