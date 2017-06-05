class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  scope :collect_unread, ->(user_id){ where(user_id: user_id).where(read: false) }
  scope :with_comment, -> { joins(:comment)}
  scope :check_user, ->(user_id) {where("comments.user_id != #{user_id}")}
  #validates
  #vcalidates :content, presence:true
end
