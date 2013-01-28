class ProjectsController < ApplicationController
  
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

  def index
  	@projects = Project.all
  end

  def edit
  end 
  
  def update
  	if @project.update_attributes(params[:project])
    	flash[:notice] = "Project has been updated."
    	redirect_to @project
  	else
    	flash[:alert] = "Project has not been updated."
    	render :action => "edit"
  	end
  end

  def destroy
	@project.destroy #<co id="ch04_233_1"/>
	flash[:notice] = "Project has been deleted."
	redirect_to projects_path
  end

  def new
  	@project = Project.new
  end

  def create
	  @project = Project.new(params[:project])
	  if @project.save
	    flash[:notice] = "Project has been created."
	    redirect_to @project
	  else
	    flash[:alert] = "Project has not been created."
	    #<co id="ch03_926_1"/>
	    render :action => "new"
	   end 
	end

  def show
  end

  private
  	def find_project
    	@project = Project.find(params[:id])
    	rescue ActiveRecord::RecordNotFound
    	flash[:alert] = "The project you were looking for could not be found."
    	redirect_to projects_path
  end

end