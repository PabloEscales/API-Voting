class Api::V1::VotesController < ApplicationController
  before_action :set_vote, only: %i[show update]

  def index
    # @votes = Vote.all
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.find(params[:ballot_id])
    @votes = @ballot.votes

    render json: @votes, only: %i[value]
  end

  def show
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.find(params[:ballot_id])
    @vote = @ballot.votes.find(params[:id])
    render json: @vote, only: %i[value]
  end

  def create
    @election = Election.find(params[:election_id])
    @ballot = @election.ballots.find(params[:ballot_id])
    @registration = current_user.registrations.find_by!(election: election)

    @vote = Vote.new(vote_params)

    if vote.save
      render json: vote
    else
      render json: { errors: vote.errors.full_messages }
    end
  end

  def update
    if @vote.update(vote_params)
      render json: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:value, :registration_id, :ballot_id)
  end
end
