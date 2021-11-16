class User < ApplicationRecord
    has_many :workspaces

    has_secure_password
end
