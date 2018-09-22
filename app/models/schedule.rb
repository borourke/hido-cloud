class Schedule < ApplicationRecord
  def dispense
    medicine = []
    DispenseQuantity.where(schedule_id: self.id).each_with_index do |quantity, index|
      medicine << {
        dispense: Dispense.create(schedule_id: self.id, dispense_at: Time.now, medicine_id: quantity.medicine_id),
        medicine: Medicine.find(quantity.medicine_id),
        dispense_quantity: quantity
      }
    end
    conn = Faraday.new(url: 'http://requestbin.fullcontact.com/wzd0f5wz')
    conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { schedule: self, medicine: medicine }.to_json
    end
  end
end