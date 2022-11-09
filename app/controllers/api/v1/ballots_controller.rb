class Api::V1::BallotsController < ApplicationController
  def index
    @election = Election.find(params[:election_id])
    @ballots = @election.ballots

    render json: @ballots, only: %i[name type options]
  end

  def show
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.find(params[:id])

    render json: @ballot, only: %i[name type options]
  end

  def create
    @ballot = Ballot.new(ballot_params)

    if @ballot.save
      render json: @ballot, status: :created, location: @ballot
    else
      render json: @ballot.errors, status: :unprocessable_entity
    end
  end

  private

  def ballot_params
    params.require(:ballot).permit(:name, :type, :options, :election_id)
  end
end
