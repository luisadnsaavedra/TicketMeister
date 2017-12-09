class Seat < ActiveRecord::Base
  belongs_to :concert
  validates :row, :number, :concert, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :row, length: { maximum: 1, too_long: "Specify row A-Z"}, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters allowed A-Z/ a-z"}
  validates :number, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 30, message: "Specify a seat number between 1 and 30"}

  validates_uniqueness_of :number, :scope => [:concert, :row]
  has_many :tickets
end
