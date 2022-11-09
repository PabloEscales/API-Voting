class Ballot < ApplicationRecord
  self.inheritance_column = :_type_disabled
  belongs_to :election
  has_many :votes
end
