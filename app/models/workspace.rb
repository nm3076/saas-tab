class Workspace < ApplicationRecord
    belongs_to :users, optional: true
    has_many :links
    #foreign_key: :workspace_name
end
