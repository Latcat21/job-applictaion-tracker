class UserController < ApplicationController
   
  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by username: params[:username]
    pw = params[:password]
    
    if user && user.authenticate(pw)
      
      session[:logged_in] = true
      session[:username] = user.username
      session[:message] = {
        success: true,
        status: "good",
        message: "Succesfully logged in user #{user.username}"
      }
      redirect '/jobs'

    else
      session[:message] = {
        success: false,
        status: "bad",
        message: "Invalid username or password."
      }
      redirect '/users/register'
    end
    
  end


  get '/register' do
    erb :register
  end

  post '/register' do
    #check if user exists
    user = User.find_by username: params[:username]
                        #user.find_by({:username => params[:username]})

    #if the user doesn't exists
    if !user
      user = User.new
      user.username = params[:username]
      user.password = params[:password]
      user.save

      session[:logged_in] = true
      session[:username] = user.username

      session[:message] = {
        success: true,
        status: 'good',
        message: "Welcome to the site, you are now logged in as #{user.username}"
      }
    
     redirect '/jobs'

    else

    session[:message] ={
      success: false,
      status: 'bad',
      message: "Sorry, username #{params[:username]} is already taken"
    }
    #redirect to register so they can try again
    redirect '/users/register'
    end

  end

  get '/logout' do
    user = session[:username]
    session.destroy

    session[:message] ={
      success: true,
      status: 'good',
      message: "username #{user} successfully logged out "
    }
    redirect '/users/login'
    end
end