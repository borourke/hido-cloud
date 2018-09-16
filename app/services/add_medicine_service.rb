class AddMedicineService
  attr_reader :slot_id, :barcode

  def initialize(slot_id:, barcode:)
    @slot_id = slot_id
    @barcode = barcode
  end

  def add
    # product_code = '21695-995' for dev only
    result = $soda_client.get("jc2n-g5w8", {"$where" => "product_code = '#{barcode}'"}).first
    rx_name = result["medicine_name"]
    rx_info = result["rxstring"]
    dosage = '10 mg'
    # Delete anything in the current slot
    Medicine.where(slot_id: slot_id).delete_all
    Medicine.create(name: rx_name, slot_id: slot_id, description: rx_info, dosage: dosage)
  end
end