# frozen_string_literal: false

# require 'rack'

# my app
class MyApp
  def call(env)
    if env['PATH_INFO'] == '/favicon.ico'
      return ['200', { 'Content-Type' => 'image/x-icon' },
              [File.read('favicon.ico')]]
    end

    ['200', { 'Content-Type' => 'text/plain' }, ['hello world']]
  end
end

# middleware application
class FriendlyGreeting
  def initialize(app)
    @app = app
  end

  def call(env)
    body = @app.call(env).last

    [
      '200',
      { 'Content-Type' => 'text/plain' },
      body.prepend("A warm welcome to you!\n")
    ]
  end
end

# another middleware
class Wave
  def initialize(app)
    @app = app
  end

  def call(env)
    body = @app.call(env).last

    [
      '200',
      { 'Content-Type' => 'text/plain' },
      body.prepend("Wave from afar!\n")
    ]
  end
end
