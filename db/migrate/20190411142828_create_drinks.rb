class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :drink_type
      t.string :ingredients
      t.string :modifications
    end
  end
end
