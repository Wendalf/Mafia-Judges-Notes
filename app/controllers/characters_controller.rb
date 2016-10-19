class CharactersController < ApplicationController
  before_action :authenticate_user!

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find_by(id: params[:id])
  end
end
