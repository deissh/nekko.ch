# frozen_string_literal: true

class AnimeController < ApplicationController
  before_action :anime_load, only: %i[show edit update destroy]

  # GET /anime
  # GET /anime.json
  def index
    @animes = Anime.order(rating: :desc).search_by_title(params[:query])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @animes }
    end
  end

  # GET /anime/1
  # GET /anime/1.json
  def show
    @title = @anime.title
    @desc = @anime.description

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @anime }
    end
  end

  private

  def anime_load
    @anime = Anime.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def anime_params
    params.require(:anime).permit(:genres, :status, :year, :rating, :query)
  end
end
