class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require()



    #enable sessions
    enable :sessions

  #DB connection
  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'application_tracker'
  )

  #templates
  set :views, File.expand_path('../../views', __FILE__)

  #static assests
  set :public_dir, File.expand_path('../../public', __FILE__)


  #Home page
  get '/' do
    erb :home
  end

  #pry route for testing
  get '/test' do
    some_text = "test text variable"
    binding.pry
    "pry has finished -- here's some_text #{some_text}"

  end

  

end