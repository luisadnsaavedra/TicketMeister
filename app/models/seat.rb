class Seat < ActiveRecord::Base
  belongs_to :concert
  validates :row, :number, :concert, presence: true
end
