# frozen_string_literal: false

require 'tilt/erubi'
require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader'

get '/' do
  erb :home
end
