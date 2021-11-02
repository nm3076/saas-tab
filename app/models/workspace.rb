class Workspace < ApplicationRecord
    has_many :links, inverse_of: :links
end
