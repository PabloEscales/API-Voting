class Vote < ApplicationRecord
  belongs_to :registration
  belongs_to :ballot
end
