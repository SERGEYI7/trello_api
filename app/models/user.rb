# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable # , :confirmable
  include DeviseTokenAuth::Concerns::User
  validates :password, length: { in: 5..30 }, presennce: true
  validates :email, format: { with: /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/ }, presennce: true
  has_many :cards, dependent: :delete_all
  has_many :columns, dependent: :delete_all
  has_many :comments, dependent: :delete_all
end
