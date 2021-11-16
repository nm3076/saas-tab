class User < ApplicationRecord
    has_many :workspaces
    # to add more validation, make validation restrictions here for user
    has_secure_password
end
