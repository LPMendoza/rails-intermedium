class Shout < ApplicationRecord
  belongs_to :user
  validates :user, presence: true

  delegate :username, to: :user
  belongs_to :content, polymorphic: true
  
end
