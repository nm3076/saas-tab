class User < ApplicationRecord
    has_many :workspaces, dependent: :destroy
    # to add more validation, make validation restrictions here for user
    before_save { self.email = email.downcase }
    validates :username, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    validates :username, presence: true, uniqueness: true
    #validates :password, length: { :minimum => 6}
    #validates_confirmation_of :password
    has_secure_password
    
    has_many :collaborations
    has_many :workspaces, through: :collaborations
    #has_many :links, through: :workspaces

    # Method used to filter current user from list of all users in dropdown menu for creating/editing collaborations.
    def self.all_except(user)
        where.not(id: user)
    end

end
