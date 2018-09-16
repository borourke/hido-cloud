class CreateDispenseQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :dispense_quantities do |t|
      t.integer :medicine_id
      t.integer :quantity
    end
  end
end
