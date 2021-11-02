class Workspace < ApplicationRecord::Base
    has_many :links, inverse_of => :workspace
end
