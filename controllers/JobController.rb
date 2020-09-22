class JobController < ApplicationController


  #index
  get '/' do
    @jobs = Job.all
    erb :jobs_index
  end

  #new
  get '/new' do
    erb :new_job
  end

  

  #create
  post '/' do
    new_job = Job.new
    new_job.company = params[:company]
    new_job.title = params[:title]
    new_job.description = params[:description]
    new_job.date = params[:date]
    new_job.save

    redirect '/jobs'

  end

  #Edit
  get ':id/edit' do
    @job = Job.find by params[:id]

    erb :job_edit
  end

  #update

  #delete

end