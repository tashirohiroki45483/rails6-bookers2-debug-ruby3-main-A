class Message < ApplicationRecord
  validates :message, presence: true
  validates :message,length: { maximum: 140 }

  belongs_to :user
  belongs_to :room

end
