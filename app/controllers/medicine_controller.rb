class MedicineController < ApplicationController
  def dispense
    render :ping
  end

  def activate_barcode
    # Logic here to connect to device and active barcode scanner
    render json: {status: "Successfully activated barcode scanner"}
  end

  def add_medicine
    @medicine = AddMedicineService.new(slot_id: add_medicine_params[:slot_id], barcode: add_medicine_params[:barcode]).add
    render :add_medicine
  end

  private

  def add_medicine_params
    params.permit(:slot_id, :barcode)
  end
end
