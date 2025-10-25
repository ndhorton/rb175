require 'tilt/erubi'
require 'sinatra'
require 'sinatra/reloader'

get '/:some_name' do
  "#{params[:some_name]}"
end
