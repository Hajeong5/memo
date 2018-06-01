class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    validates :image, presence: true
    # validates :image, presence: { message: "이미지를 제출해 주세요." }
    validates :content, presence: true
    validates :user_id, presence: true

    
    belongs_to :user
    
    has_many :likes
    has_many :like_users, through: :likes, source: :user
    
    # @posts.toggle_like(current_user)
    def toggle_like(user)
      if self.like_users.include?(user)
        self.like_users.delete(user)
      else
        self.like_users.push(user)
        # self.like_users <<user
      end
    end
    
    # @posts.activate!
    # def activate!
        # self.active = false
        # self.save
    # end
end
