require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    attr_accessor :root

    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404, {"Content-Type" => "text/html"}, []]
      elsif env["PATH_INFO"] == "/"
        default_page = File.read("#{root}/public/index.html")
        return [200, {"Content-Type" => "text/html"}, [default_page]]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
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
