class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
    redirect_to admin_genres_path
  end

  def create
  end

  def edit
  end

  def update
  end
  
  
end
