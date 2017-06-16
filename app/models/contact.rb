class Contact < ActiveRecord::Base
      validates :name, :email, :content, presence:true
      validates :name, :email, length: { maximum: 50 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, format: { with: VALID_EMAIL_REGEX }
end
