class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    serialize_array(:features, :development, :tests, :deploy)
    @project = Project.new(project_params)

    if @project.save
      redirect_to new_project_path
    else
      render :new
    end 
  end

  def edit
    @project = Project.find(params[:id]) 
  end

  def update
    serialize_array(:features, :development, :tests, :deploy)
    # binding.pry
    @project = Project.find(params[:id])

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
end