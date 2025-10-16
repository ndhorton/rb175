# frozen_string_literal: false

require 'rack'

# my app
class MyApp
  def call(env)
    if env['PATH_INFO'] == '/favicon.ico'
      return ['200', { 'Content-Type' => 'image/x-icon' },
              [File.read('favicon.ico')]]
    end

    ['200', { 'Content-Type' => 'text/html' }, [env.to_s]]
  end
end

Rack::Handler::WEBrick.run MyApp.new
