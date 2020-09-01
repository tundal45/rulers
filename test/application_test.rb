require_relative "test_helper"

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class TestController < Rulers::Controller
  def index
    "Hello!"
  end
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/example/route"

    assert last_response.ok?
    body = last_response.body

    assert_equal 200, last_response.status
    assert_empty last_response.errors
    assert_equal "text/html", last_response.headers.fetch("Content-Type")
    assert body["Hello"]
  end
end
