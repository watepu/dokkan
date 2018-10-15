class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :headline, presence: true
  validates :content, presence: true
end
