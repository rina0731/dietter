class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..10

  validates :name, presence: true
  validates :height, presence: true, numericality: true
  validates :latest_weight, presence: true, numericality: true
  validates :ideal_weight, numericality: true
  has_many :contacts

  has_many :weights, dependent: :destroy

  acts_as_paranoid

end
