class Blog < ActiveRecord::Base
  validates :title, :content, presence:true
  validates :content, length: { maximum: 140 }
  belongs_to :user
end