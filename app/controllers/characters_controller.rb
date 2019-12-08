class CharactersController < ApplicationController
  def index
  end
  def new
  end
  def create
    @character = Character.new(params[:character])
 
    @character.save
    redirect_to @character
  end
end
