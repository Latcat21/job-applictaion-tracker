class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require()

  get '/' do
    return 'hello'
  end

end