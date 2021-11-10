class Link < ApplicationRecord
    belongs_to :workspace, optional: true
    # class_name: 'Workspace'
end
