require 'sinatra/base'

#controller
require './controllers/ApplicationController'

#routing
map('/'){
  run ApplicationController
}