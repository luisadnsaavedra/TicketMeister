class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :seat, dependent: :destroy
end
