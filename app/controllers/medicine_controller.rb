class MedicineController < ApplicationController
  def dispense
    @device_response = Medicine.dispense_single(slot_id: dispense_medicine_params[:slot_id]).status
    render :dispense
  end

  def activate_barcode
    # Logic here to connect to device and active barcode scanner
    render json: {status: "Successfully activated barcode scanner"}
  end

  def add_medicine
    @medicine = AddMedicineService.new(slot_id: add_medicine_params[:slot_id], barcode: add_medicine_params[:barcode]).add
    render :add_medicine
  end

  def index
    # Shows all medicine for each slot
    @medicines = Medicine.format_for_device
    render :index
  end

  def show
    @medicine = Medicine.find_by(slot_id: params[:slot_id], active: 'true')
    render :show
  end

  private

  def add_medicine_params
    params.permit(:slot_id, :barcode)
  end

  def dispense_medicine_params
    params.permit(:slot_id)
  end
end
