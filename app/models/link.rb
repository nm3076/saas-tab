class Link < ApplicationRecord
    belongs_to :workspace, inverse_of => :workspace, optional: true
end
