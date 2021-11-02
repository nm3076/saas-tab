class Link < ApplicationRecord
    belongs_to :workspace, inverse_of: :links
    # class_name: 'Workspace'
end
