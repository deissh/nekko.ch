# frozen_string_literal: true

class UserController < ApplicationController
  before_action :load_user

  def show
    @title = @user.name
    @statuses = {
        inprogress: @user.anime_statuses(:inprogress),
        planed: @user.anime_statuses(:planed),
        completed: @user.anime_statuses(:completed),
        favorite: @user.anime_statuses(:favorite),
        throw: @user.anime_statuses(:throw)
    }

    respond_to do |format|
      format.html { render :show, layout: 'clear' }
      format.json { render json: @user }
    end
  end

  def library; end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
