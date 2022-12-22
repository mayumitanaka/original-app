class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :recipe_title,     null: false 
      t.text       :recipe_procedure, null: false
      t.integer    :recipe_volume,    null: false
      t.string     :recipe_material,  null: false
      t.string     :recipe_quantity,  null: false
      t.integer    :cooking_time,     null: false
      t.integer    :tool_id,          null: false
      t.integer    :category_id,      null: false
      t.references :user,             null: false,  foreign_key: true
      t.timestamps
    end
  end
end
