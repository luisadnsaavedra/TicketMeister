class Concert < ActiveRecord::Base
  belongs_to :theater
  has_many :seats #dependent: :destroy TODO
  validates :title, :theater, presence: true
end
