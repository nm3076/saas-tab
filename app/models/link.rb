class Link < ApplicationRecord::Base
    belongs_to :workspace, inverse_of => :links, optional: true
end
