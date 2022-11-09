class Api::V1::ElectionsController < ApplicationController
  before_action :set_election, only: %i[show update destroy]

  # GET api/v1/elections
  def index
    @elections = Election.all

    render json: @elections
  end

  # GET api/v1/elections/1
  def show
    render json: @election, only: [:name]
  end

  # POST api/v1/elections
  def create
    @election = Election.new(election_params)

    if @election.save
      render json: @election, status: :created, location: @election
    else
      render json: @election.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_election
    @election = Election.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def election_params
    params.require(:election).permit(:name)
  end
end
