# frozen_string_literal: false

require 'erb'

# Template View Renderer
class Renderer
  def initialize(template)
    @template = ERB.new(template)
    @value = 'Book Viewer'
  end

  def render
    @template.result binding
  end
end

r = Renderer.new('<h1><%= @value %></h1>')
p r.render
