class User < ApplicationRecord
    has_many :workspaces, dependent: :destroy
    # to add more validation, make validation restrictions here for user
    before_save { self.email = email.downcase }
    validates :username, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    has_secure_password



end
