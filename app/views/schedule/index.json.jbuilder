json.array! Schedule.all.each do |schedule|
  json.schedule schedule
  json.medicine DispenseQuantity.where(schedule_id: schedule.id).each do |dispense_quantity|
    json.dispense_quantity dispense_quantity if dispense_quantity
    json.medicine_details Medicine.where(id: dispense_quantity.medicine_id) if dispense_quantity
  end
end