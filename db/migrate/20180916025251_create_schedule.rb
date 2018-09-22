class CreateSchedule < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.text :label
      t.text :time
    end
  end
end
