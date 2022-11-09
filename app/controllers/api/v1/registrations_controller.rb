class RegistrationsController < ApplicationController
  def create
    @user = User.find(params[:user_id])

    @registration = Registration.new(registration_params)

    if registration.save
      render json: registration
    else
      render json: { errors: registration.errors.full_messages }
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:user_id, :election_id)
  end
end
