class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true
  end

  validates :nickname, presence: true

  has_many :recipes, dependent: :destroy
  has_many :menus,   dependent: :destroy
  has_many :foods,   dependent: :destroy
end
