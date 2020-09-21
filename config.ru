require 'sinatra/base'

#Controllers
require './controllers/ApplicationController'

#Models
require './models/JobModel'
#routing
map('/'){
  run ApplicationController
}