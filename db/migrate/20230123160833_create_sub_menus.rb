class CreateSubMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_menus do |t|
      t.references :menu, foreign_key: true
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
