require File.dirname(__FILE__) + '/../test_helper'
#require 'server_controller'

# Re-raise errors caught by the controller.
class ServerController; def rescue_action(e) raise e end; end

class ServerControllerTest < Test::Unit::TestCase
  def setup
    @controller = ServerController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def teardown
  end

  def test_hello_world
    get :hello
    assert_response 200
    assert @response.body.include?('hello world')
  end
end
