Rails.application.routes.draw do
  get 'health', to: 'health#ping'

  post '/medicine/dispense', to: 'medicine#dispense'
  post '/medicine', to: 'medicine#add_medicine'
  get '/medicine', to: 'medicine#index'
  post '/device/:slot_id/medicine', to: 'medicine#activate_barcode'

  put '/schedule', to: 'schedule#update'
  post '/schedule/medicine', to: 'schedule#add_medicine'
  delete '/schedule/medicine', to: 'schedule#remove_medicine'
  get '/schedule', to: 'schedule#index'
  post '/schedule/dispense', to: 'schedule#dispense'
end
