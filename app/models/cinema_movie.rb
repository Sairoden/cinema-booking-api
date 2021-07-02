class CinemaMovie < ApplicationRecord
  belongs_to :cinema
  belongs_to :movie
end
