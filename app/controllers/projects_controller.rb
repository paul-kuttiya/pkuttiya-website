class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update]
  
  def new
    @project = Project.new
  end

  def create
    serialize_array(:features, :developments, :tests, :deploys)
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def update
    serialize_array(:features, :developments, :tests, :deploys)

    if @project.update(project_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit!
  end

  def serialize_array(*arg)
    hash = params[:project]
    arg.each do |col|
      lists_text = hash[col][0]
      hash[col] = split_new_line(lists_text)
    end
  end

  def split_new_line(input)
    input.split(/\r\n/)
  end

  def get_project
    @project = Project.where("title ILIKE ?", "%#{params[:id]}%").first
  end
end