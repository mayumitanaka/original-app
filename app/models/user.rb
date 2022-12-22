class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :recipes, dependent: :destroy
  has_many :menus,   dependent: :destroy
  has_many :foods,   dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tool
end
