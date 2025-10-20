require 'sinatra'

get '/' do
  stream do |out|
    out << '<p>This is the water</p>'
    sleep 1.5
    out << '<p>and this is the well</p>'
    sleep 2
    out << '<p>Drink full and descend</p>'
    sleep 3
    out << '<p>The horse is the white of the eyes</p>'
    sleep 2.5
    out << '<p>and dark within</p>'
  end
end
