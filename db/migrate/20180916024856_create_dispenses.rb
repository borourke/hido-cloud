class CreateDispenses < ActiveRecord::Migration[5.2]
  def change
    create_table :dispenses do |t|
      t.integer :medicine_id
      t.integer :schedule_id
      t.datetime :dispense_at
      t.integer :dispense_quantities_id
    end
  end
end
