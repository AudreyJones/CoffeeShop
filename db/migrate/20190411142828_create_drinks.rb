class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :type
      t.string :modifications
    end
  end
end
