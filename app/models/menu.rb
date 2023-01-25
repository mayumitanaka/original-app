class Menu < ApplicationRecord
  belongs_to :user
  has_many   :main_menus, dependent: :destroy
  has_many   :sub_menus, dependent: :destroy
  has_many   :soup_menus, dependent: :destroy
	accepts_nested_attributes_for :main_menus, allow_destroy: true
	accepts_nested_attributes_for :sub_menus, allow_destroy: true
  accepts_nested_attributes_for :soup_menus, allow_destroy: true
end
