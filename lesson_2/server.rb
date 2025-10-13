#!/usr/bin/env ruby
# frozen_string_literal: false

#  'GET /?rolls=2&sides=6 HTTP/1.1'
#
#  http_method == 'GET'
#  path == '/'
#  params == { 'rolls' => '2', 'sides' => '6' }

require 'socket'

def parse_request(request_line)
  http_method, path_and_params, = request_line.split(' ')

  path, param_string = path_and_params.split('?')

  params = param_string.split('&').each_with_object({}) do |param_pair, hash|
    key, value = param_pair.split('=')
    hash[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  puts request_line
  http_method, path, params = parse_request(request_line)
  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  client.puts 'HTTP/1.1 200 OK'
  client.puts "Content-Type: text/plain\r\n\r\n"

  client.puts request_line
  client.puts http_method, path, params
  1.upto(rolls) do |roll|
    client.puts "Die #{roll}: #{rand(sides) + 1}"
  end

  client.close
end
