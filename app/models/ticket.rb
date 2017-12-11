class Ticket < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :seat #, dependent: :destroy -Caused error 'Stack level too deep'
  #The user would instead receive an email and choose whether to change tickets for another concert or ask for refund
  validates :user, :seat, presence: true
end
