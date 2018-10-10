class Medicine < ApplicationRecord
  def self.format_for_device
    (1..9).to_a.map do |i|
      if med = find_by(slot_id: i, state: 'active')
        med
      else
        { slot_id: i }
      end
    end
  end

  def self.dispense_single(slot_id:)
    med = Medicine.find_by(slot_id: slot_id, state: 'active')
    dispense = Dispense.create(medicine_id: med.id, dispense_at: Time.now)
    conn = Faraday.new(url: 'http://requestbin.fullcontact.com/12x8oo11')
    conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { dispense_request: dispense, medicine: med }.to_json
    end
  end
end