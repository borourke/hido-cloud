class CreateMedicine < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.text :name
      t.text :description
      t.integer :slot_id
      t.text :dosage
      t.text :state
    end
  end
end
