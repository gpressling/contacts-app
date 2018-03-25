class V1::UsersController < ApplicationController
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
