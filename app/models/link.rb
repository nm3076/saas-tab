class Link < ApplicationRecord
    belongs_to :workspace, inverse of: :workspace, optional: true
end
