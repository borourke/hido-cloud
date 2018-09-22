class ScheduleController < ApplicationController
  def update
    @schedule = Schedule.find(schedule_params[:schedule_id])
    @schedule.update_attributes(time: schedule_params[:time])
    render :index
  end

  def add_medicine
    @quantity = DispenseQuantity.find_by(medicine_id: schedule_params[:medicine_id], schedule_id: schedule_params[:schedule_id])
    if @quantity
      @quantity.update_attributes(quantity: schedule_params[:quantity])
    else
      @quantity = DispenseQuantity.create(medicine_id: schedule_params[:medicine_id], schedule_id: schedule_params[:schedule_id], quantity: schedule_params[:quantity])
    end
    render :index
  end

  def remove_medicine
    @quantity = DispenseQuantity.find_by(medicine_id: schedule_params[:medicine_id], schedule_id: schedule_params[:schedule_id]).try(:destroy)
    render :index
  end

  def index
    render :index
  end

  def dispense
    @device_response = Schedule.find(schedule_params[:schedule_id]).dispense.status
    render :dispense
  end

  private

  def schedule_params
    params.permit(:schedule_id, :time, :medicine_id, :quantity)
  end
end
