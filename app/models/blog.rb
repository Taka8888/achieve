class Blog < ActiveRecord::Base
    validates :title, :content, presence:true
    validates :content, length: { maximum: 140 }
    belongs_to :user
    # CommentモデルのAssociationを設定
    has_many :comments, dependent: :destroy

    def own?(user)
    self.user.id == user.id
    end
end
