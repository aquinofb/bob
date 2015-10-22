Dir[File.dirname(__FILE__) + '/bob/*.rb'].each {|file| require file }

include Bob::Delegator

get "/" do
  "Hey there!"
end

Rack::Handler::WEBrick.run(Bob::Application, Port: 9292)
