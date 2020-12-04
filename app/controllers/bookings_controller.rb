class BookingsController < ApplicationController
  before_action :find_booking, only: [:accepted, :rejected]

  def create
    @booking = Booking.new(extract_dates)
    @mansion = Mansion.find(params['mansion_id'])
    @booking.mansion = @mansion
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
      flash[:notice] = "Booking was succesful"
    else
      render "mansions/show"
      flash[:alert] = "Booking was unsuccesful"
    end
  end

  def extract_dates
    dates = params[:booking][:date].split(" to ")
    { start_date: dates[0], end_date: dates[1] }
  end

  def accepted
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def rejected
    @booking.status = "rejected"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
