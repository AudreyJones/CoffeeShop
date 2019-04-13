class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :drink_type
      t.string :ingredients
    end
  end
end
