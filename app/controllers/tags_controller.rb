class TagsController < ApplicationController
  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to new_tag_path
    else
      render :new
    end
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to new_tag_path
    else
      render :edit
    end
  end

  private
  def tag_params
    params.require(:tag).permit!
  end
end