require 'sinatra/base'



#Controllers
require './controllers/ApplicationController'
require './controllers/JobController'
require './controllers/UserController'

#Models
require './models/JobModel'
require './models/UserModel'

#routing
map('/'){
  run ApplicationController
}
map('/jobs'){
  run JobController
}
map('/auth'){
  run UserController
}