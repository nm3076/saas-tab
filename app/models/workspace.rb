class Workspace < ApplicationRecord
    has_many :links, inverse of: :links
end
