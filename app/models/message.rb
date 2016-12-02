class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true, unless: ->(message){message.image.present?}
  validates :image, presence: true, unless: ->(message){message.body.present?}

  mount_uploader :image, ImageUploader

  def params_for_json
    {user_name: self.user.name, created_at: self.created_at, body: self.body, image: self.image}
  end

end
