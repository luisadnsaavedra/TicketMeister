class Concert < ActiveRecord::Base
  belongs_to :theater
  has_many :seats #dependent: :destroy TODO
  validates :title, :theater, presence: true
  #make concert impressionable and store the counter in DB
  is_impressionable :counter_cache => true
end
