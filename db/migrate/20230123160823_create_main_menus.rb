class CreateMainMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :main_menus do |t|
      t.references :menu, foreign_key: true
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
