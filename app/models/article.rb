class Article < ApplicationRecord

  validates :title, presence: true, length: {maximum: 140}
  validates :text, presence: true, length: {maximum: 4000}
  has_many :comments, :dependent => :destroy
  belongs_to :user, :class_name => 'User', :foreign_key => 'username', optional: true

  def last_comment
    comments.last
  end

  def subject
    title
  end

end

