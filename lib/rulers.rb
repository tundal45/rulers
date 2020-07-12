require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, {"Content-Type" => "text/html"}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
      rescue => e
        return [500, {"Content-Type" => "text/html"}, ["Oops! There was an exception! We are looking into it!\n<pre>#{e}\n</pre>"]]
      end

      [200, {"Content-Type" => "text/html"}, [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
