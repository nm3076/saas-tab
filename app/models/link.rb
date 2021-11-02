class Link < ApplicationRecord
    belongs_to :workspaces, optional: true
end
