class Article < ApplicationRecord
=begin
  validates :title, presence: true
=end
  validates :text, presence: true
  has_many :comments, :dependent => :destroy
  belongs_to :user, optional: true
end
