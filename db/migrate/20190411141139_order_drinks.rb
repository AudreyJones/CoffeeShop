class OrderDrinks < ActiveRecord::Migration
  def change
    create_table :order_drinks do |t|
      t.string :order_id
      t.string :drink_id
    end
  end
end
