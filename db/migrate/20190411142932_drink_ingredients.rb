class DrinkIngredients < ActiveRecord::Migration
  def change
    create_table :drink_ingredients do |t|
      t.string :drink_id
      t.string :ingredient_id
    end
  end
end
