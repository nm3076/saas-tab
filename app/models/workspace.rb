class Workspace < ApplicationRecord
    has_many :collaborations
    has_many :users, through: :collaborations
    #has_many :links, dependent: :destroy
    #validates :user_id, presence: true
    #foreign_key: :workspace_name

    #accepts_nested_attributes_for :goals, reject_if: proc { |attributes| attributes['title'].blank? || attributes['description'].blank? || attributes['budget'].blank? || attributes['status'].blank? }
    #accepts_nested_attributes_for :collaborations

    # returns the array of projects in which user is any role except view_only
    def self.primary_or_owner_or_update
        joins(:collaborations).where.not('collaborations.role = ?', "View Only").uniq
    end

    # returns array of projects in which the (current) user is a Collaborator in any role
    def self.collaborator_of_any_kind
        joins(:collaborations).uniq
    end

    # returns array of projects in which the (current) user is a Primary Project Owner
    def self.primary_owner 
        joins(:collaborations).where('collaborations.role = ?', "Primary Project Owner").uniq
    end

    # returns array of projects in which the (current) user is Project Owner
    def self.owner 
        joins(:collaborations).where('collaborations.role = ?', "Project Owner").uniq
    end

    # returns array of projects in which the (current) user is Update and View
    def self.update_and_view 
        joins(:collaborations).where('collaborations.role = ?', "Update and View").uniq
    end

    # returns array of projects in which the (current) user is View Only
    def self.view_only 
        joins(:collaborations).where('collaborations.role = ?', "View Only").uniq
    end

    # returns array of projects in which the (current) user is Primary OR Project Owner
    def self.primary_or_owner 
        primary_owner + owner
    end
end
