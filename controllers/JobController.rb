class JobController < ApplicationController
  before do
    if !session[:logged_in]
      session[:message] = {
        success: false,
        status: "neutral",
        message: "You must bee logged in"

      }
      redirect '/users/register'
    end
  end

  #index
  get '/' do
    user = User.find_by({ :username => session[:username]})
    
    @jobs = user.jobs
   
    erb :jobs_index
  end

  #new
  get '/new' do
    erb :new_job
  end

  #create
  post '/' do
    new_job = Job.new
    logged_in_user = User.find_by({ :username => session[:username]})
    new_job.company = params[:company]
    new_job.title = params[:title]
    new_job.description = params[:description]
    new_job.date = params[:date]
    new_job.user_id = logged_in_user.id
    new_job.save

    session[:message] = {
      success: true,
      status: "good",
      message: "Successfully add job ##{new_job.id}"
    }
    redirect '/jobs'

  end

  #show
  get '/:id' do
    @job = Job.find params[:id]
    erb :job_show
  end

  #Edit
  get '/:id/edit' do
    @job = Job.find params[:id]

    erb :job_edit
  end

  #update
  put '/:id' do
    job = Job.find params[:id]
    job.company = params[:company]
    job.title = params[:title]
    job.description = params[:description]
    job.date = params[:date]
    job.save

    session[:message] ={
      success: true,
      status: "good",
      message: "Succesfully updated job ##{job.id}"
    }

    redirect '/jobs'
  end

  #delete
  delete "/:id" do
    job = Job.find params[:id]
    job.destroy

    session[:message] ={
      success: true,
      status: "good",
      message: "Succesfully deleted job ##{job.id}"
    }

    redirect '/jobs'
  end
 
   

  
end