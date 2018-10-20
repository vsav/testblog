class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, :class_name => 'User', :foreign_key => 'username'
  has_many :comments, :class_name => 'User', :foreign_key => 'username'
end
