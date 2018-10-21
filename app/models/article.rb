class Article < ApplicationRecord

  validates :title, presence: true
  validates :text, presence: true
  has_many :comments, :dependent => :destroy
  belongs_to :user, :class_name => 'User', :foreign_key => 'username', optional: true

  def last_comment
    comments.last
  end

  def subject
    title
  end

end

