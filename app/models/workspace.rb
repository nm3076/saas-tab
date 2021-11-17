class Workspace < ApplicationRecord
    belongs_to :users, optional: true
    has_many :links, dependent: :destroy
    validates :user_id, presence: true
    #foreign_key: :workspace_name
end
