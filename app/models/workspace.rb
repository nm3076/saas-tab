class Workspace < ApplicationRecord
    has_many :links, inverse_of => :workspace
end
