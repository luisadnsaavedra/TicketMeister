class Concert < ActiveRecord::Base
  belongs_to :theater
  validates :title, :theater, presence: true
end
