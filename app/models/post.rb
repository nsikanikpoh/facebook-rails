class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  validates :content, presence: true
  default_scope -> { order(created_at: :asc) }
  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]
  scope :friends_posts, -> (current_user) { where('user_id IN (?) OR user_id = ?',
                                            current_user.friend_ids, current_user.id)
                                            .order(:created_at) }
end
