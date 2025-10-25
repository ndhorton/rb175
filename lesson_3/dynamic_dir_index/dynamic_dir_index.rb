# frozen_string_literal: false

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubi'

get '/' do
  @dir_list = Dir.glob('public/*').map { |file| File.basename(file) }.sort
  @dir_list.reverse! if params[:sort] == 'desc'
  erb :dynamic_dir_index
end
