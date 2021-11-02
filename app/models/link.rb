class Link < ApplicationRecord
    belongs_to :workspace, optional: true
end
