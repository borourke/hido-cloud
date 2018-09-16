Rails.application.routes.draw do
  get 'health', to: 'health#ping'

  post 'medicine/dispense', to: 'medicine#dispense'
  post 'medicine', to: 'medicine#add_medicine'
  post 'device/:slot_id/medicine', to: 'medicine#activate_barcode'
end
