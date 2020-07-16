class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  has_many :portfolios

  after_create :create_default_porfolio

  private

  def create_default_porfolio
    Portfolio.create!(name: 'default', user: self)
  end
end
