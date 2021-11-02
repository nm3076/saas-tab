class Link < ApplicationRecord
    establish_connection(:Workspace)
    belongs_to :workspace, inverse_of: :links
    # class_name: 'Workspace'
end
