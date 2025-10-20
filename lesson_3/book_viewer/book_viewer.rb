require 'tilt/erubi'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = 'The Adventures of Sherlock Holmes'
  @table_of_contents = File.readlines('data/toc.txt')

  erb :home
end
