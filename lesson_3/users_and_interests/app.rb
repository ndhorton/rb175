# frozen_string_literal: false

require 'tilt/erubi'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @users = YAML.load_file('users.yaml')
end

helpers do
  def count_interests(users)
    users.reduce(0) do |acc, (_, user)|
      acc + user[:interests].size
    end
  end
end

get '/' do
  redirect '/users'
end

get '/users' do
  @title = 'Users'

  erb :users
end

get '/users/:name' do
  @name = params[:name].to_sym
  @current_user = @users[@name]
  @title = @name.to_s

  erb :user_page
end
