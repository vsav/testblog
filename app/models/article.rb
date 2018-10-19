class Article < ApplicationRecord
=begin
  validates :title, presence: true
=end
  validates :text, presence: true
  has_many :comments
  belongs_to :user, optional: true
end
