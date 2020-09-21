class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require()

  #Directing to views folder
  set :views, File.expand_path('../../views', __FILE__)

  get '/' do
    return 'hello'
  end

  #pry route for testing
  get '/test' do
    some_text = "test text variable"

    binding.pry

    "pry has finished -- here's some_text #{some_text}"

  end

  get '/hello' do
    erb :hello
  end

end