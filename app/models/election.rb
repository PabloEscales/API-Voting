class Election < ApplicationRecord
  has_many :registrations
  has_many :ballots
end
