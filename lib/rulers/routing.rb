module Rulers
  class Application
    def get_controller_and_action(env)
      if env["PATH_INFO"] == "/"
        cont = "home"
        action = "index"
      else
        _, cont, action, after = env["PATH_INFO"].split("/", 4)
      end

      cont = "#{cont.capitalize}Controller"

      [Object.const_get(cont), action]
    end
  end
end