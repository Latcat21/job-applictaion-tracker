require 'sinatra/base'

#Controllers
require './controllers/ApplicationController'
require './controllers/JobController'
require './controllers/UserController'
require './controllers/SearchController'

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
map('/users'){
  run UserController
}

map('/search'){
  run SearchController
}