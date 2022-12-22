class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :tool_id, numericality: { other_than: 1, message: 'を入力してください' }

  has_many :recipes, dependent: :destroy
  has_many :menus,   dependent: :destroy
  has_many :foods,   dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tool
end
