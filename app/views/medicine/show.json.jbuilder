json.name medicine.name if medicine.try(:name)
json.description medicine.description if medicine.try(:description)
json.dosage medicine.dosage if medicine.try(:dosage)
json.slot_id medicine.try(:slot_id) || medicine[:slot_id]