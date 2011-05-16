class ServerController < ApplicationController
  def hello
   # render :status => 200, :json => 'hello world.'.to_json
    render :status => 200, :text => 'hello world.'
  end
end
