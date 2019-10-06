# frozen_string_literal: true

class Admin < ApplicationRecord
  devise :database_authenticatable, :trackable, :timeoutable, :lockable, :rememberable
end
