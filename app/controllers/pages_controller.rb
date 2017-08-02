class PagesController < ApplicationController
  def landing
    @highlights = Project.where(highlight: true)
  end
end