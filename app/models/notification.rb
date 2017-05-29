class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  #validates
  #validates :content, presence:true
end
