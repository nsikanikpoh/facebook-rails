class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "175x175#", thumb: "100x100#", tac: "20x20#" },
                             default_url: 'http://www.gravatar.com/avatar/?d=identicon'
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png"]

  validate  :birth_date_valid
  validates :gender, length: { maximum: 100 }
  validates :location, length: { maximum: 255 }
  validates :bio, length: { maximum: 2000 }
  has_attached_file :cover, styles: { large: "851x358#" }
  validates_attachment_content_type :cover, content_type: ["image/jpg", "image/jpeg", "image/png"]

  def birth_date_valid
    errors.add(:birthday, "can not be in the future") if
    !birthday.blank? and birthday > Date.today
  end

  def profile_photo(size)
    if !self.avatar.exists? && self.user.image
      self.user.image
    else
      case size
      when 'tac'    then self.avatar.url(:tac)
      when 'thumb'  then self.avatar.url(:thumb)
      when 'medium' then self.avatar.url(:medium)
      else self.avatar.url(:original)
      end
    end
  end
end
