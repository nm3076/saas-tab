class Workspace < ApplicationRecord
    has_many :links, :inverse_of => :workspace, foreign_key: :workspace_name
end
