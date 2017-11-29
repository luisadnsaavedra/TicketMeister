class Theater < ActiveRecord::Base

  has_many :concerts, dependent: :destroy #destroy the concerts if the theatre is destroyed
  #i.e. cancel the concerts if the theater is closed, under repairs, or demolished
  validates :title, presence: true
  validates :title, uniqueness: true

end
