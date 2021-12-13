class Workspace < ApplicationRecord
    belongs_to :users, optional: true
    has_many :links, dependent: :destroy
    validates :user_id, presence: true
    #foreign_key: :workspace_name

    def self.with_tags(curr_user, tags_list)
        if tags_list.nil? == true
          return curr_user.workspaces.all 
        else
          return where(tags: tags_list, user: curr_user.email)
        end
    end

end
