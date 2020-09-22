require 'sinatra/base'


#Controllers
require './controllers/ApplicationController'
require './controllers/JobController'

#Models
require './models/JobModel'

#routing
map('/'){
  run ApplicationController
}
map('/jobs'){
  run JobController
}