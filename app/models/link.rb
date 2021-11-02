class Link < ApplicationRecord
    belongs_to :workspace, class_name: 'Workspace'
end
