class Link < ApplicationRecord
    belongs_to :workspace, :inverse_of => :links, optional: true, class_name: 'Workspace'
end
