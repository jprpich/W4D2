class CatRentalRequestsController < ApplicationController
  def create
    request = CatRentalRequest.new(rental_params)
    if request.save
      if request.does_not_overlap_approved_request?
        request.status = "APPROVED"
        request.save
      end
      redirect_to cats_url
    else
      render json: request.errors.full_messages
    end
  end

  private
  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :cat_id)
  end
end