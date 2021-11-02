class Workspace < ApplicationRecord
    has_many :links, foreign_key: :workspace_name
end
