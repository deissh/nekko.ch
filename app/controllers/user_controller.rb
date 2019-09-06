# frozen_string_literal: true

class UserController < ApplicationController
  before_action :load_user

  def profile
    @title = @user.name
  end

  def library; end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
