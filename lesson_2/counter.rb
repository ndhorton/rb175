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

  params = (param_string || '').split('&').each_with_object({}) do |param_pair, hash|
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

  number = params['number'].to_i

  client.puts 'HTTP/1.0 200 OK'
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts '<html>'
  client.puts '<body>'
  client.puts '<pre>'
  client.puts request_line
  client.puts http_method, path, params
  client.puts '</pre>'

  client.puts '<h1>Counter</h1>'
  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract one</a>"

  client.puts '</body>'
  client.puts '</html>'
  client.close
end
