json.medicine do
  json.name @medicine.name
  json.description @medicine.description
  json.dosage @medicine.dosage
end
json.slot_id @medicine.slot_id