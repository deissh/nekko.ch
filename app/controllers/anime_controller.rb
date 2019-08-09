# frozen_string_literal: true

class AnimeController < ApplicationController
  before_action :anime_load, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[edit update destroy]

  # GET /anime
  # GET /anime.json
  def index
    @animes = Anime.all.limit(params[:limit] || 50)
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
  end

  # GET /anime/new
  def new
    @anime = Anime.new
  end

  # GET /anime/1/edit
  def edit
  end

  # POST /anime
  # POST /anime.json
  def create
    respond_to do |format|
      if @anime.save
        format.html { redirect_to @anime, notice: 'Anime was successfully created.' }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anime/1
  # PATCH/PUT /anime/1.json
  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to @anime, notice: 'Anime was successfully updated.' }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anime/1
  # DELETE /anime/1.json
  def destroy
    @anime.destroy
    respond_to do |format|
      format.html { redirect_to animes_url, notice: 'Anime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def anime_load
    @anime = Anime.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def anime_params
    params.fetch(:anime, {})
  end
end
