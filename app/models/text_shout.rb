class TextShout < ApplicationRecord
  validates :body, presence: true, length: {minimum:1, maximum:144}

  searchable do
    text :body
  end
end
