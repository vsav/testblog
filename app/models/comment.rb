class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, :class_name => 'User', :foreign_key => 'username', optional: true
end
