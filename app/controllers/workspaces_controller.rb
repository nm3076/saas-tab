class WorkspacesController < ApplicationController
    protect_from_forgery with: :null_session
    #before_action :set_workspace, only: [:show, :edit, :update, :destroy]
    def index
        @curr_user = current_user
        #@workspaces = @curr_user.workspaces
        @workspaces = current_user.workspaces
    end

    def new
        # @workspace = Workspace.new
        # @workspace.links.build
    end

    def update
        # puts "got paramaters for update workspace"
        # puts params
        
        workspace_to_update = params[:id]
        curr_workspace = Workspace.find_by(id: workspace_to_update)
        curr_workspace.update(notes: params["workspace-overview"])

        all_links = Link.where(workspace_id: workspace_to_update) 

        all_links.each do |li|
            li.destroy
        end

        updated_link_inputs = Hash.new
        
        params.each do |key, val| 

            if key.include? "name"
                index = key.index('-')+ 1
                new_key = key[index..].to_i

                if updated_link_inputs.has_key?(new_key) 
                    updated_link_inputs[new_key]["name"] = val
                else
                    updated_link_inputs[new_key] = Hash.new
                    updated_link_inputs[new_key]["name"]= val 
                end 

            elsif key.include? "link"
                index = key.index('-')+ 1
                new_key = key[index..].to_i

                if updated_link_inputs.has_key?(new_key) 
                    updated_link_inputs[new_key]["link"] = val
                else
                    updated_link_inputs[new_key] = Hash.new
                    updated_link_inputs[new_key]["link"]= val 
                end 

            elsif key.include? "date"
                index = key.index('-')+ 1
                new_key = key[index..].to_i

                if updated_link_inputs.has_key?(new_key) 
                    updated_link_inputs[new_key]["date"] = val
                else
                    updated_link_inputs[new_key] = Hash.new
                    updated_link_inputs[new_key]["date"]= val 
                end 

            elsif key.include? "notes"
                index = key.index('-') + 1
                new_key = key[index..].to_i

                if updated_link_inputs.has_key?(new_key) 
                    updated_link_inputs[new_key]["notes"] = val
                else
                    updated_link_inputs[new_key] = Hash.new
                    updated_link_inputs[new_key]["notes"]= val 
                end 
            end
        end

        # puts "hashmap of values to add to links table"
        # puts updated_link_inputs

        updated_link_inputs.each do |k, link_groups|
            # k is group number, link_groups is hashmap with values "notes", "name", etc.

            if !link_groups["link"].to_s.strip.empty?
                Link.create!(nickname: link_groups["name"], 
                            link: link_groups["link"], 
                            created_at: link_groups["date"], 
                            notes: link_groups["notes"], 
                            workspace_id: params["id"])
            end
            
        end 

        # puts "link after database insert"
        new_link = Link.find_by(workspace_id: params["id"])    
        # puts new_link.notes    
        

        redirect_to workspace_path
    end


    def create
        #@workspace = current_user.workspaces.build(workspace_params)
        @workspace = Workspace.new(workspace_params)
        @workspace.collaborations.build(:user_id => current_user.id, :role => "Primary Project Owner")
        if @workspace.save
          flash[:success] = "Workspace created!"
          redirect_to workspaces_path
        else
          redirect_to root_url
          #render :new
        end
      end


    def show
        @workspace = current_user.workspaces.find_by(id: params[:id])

        if @workspace.present?
            @links = Link.where(workspace_id: @workspace.id)
        else
            flash[:alert] = 'You do not have access to that workspace!'
            redirect_to root_path # or wherever you want them to go if order doesn't exist
        end    
        block_access_if_not_collaborator    
    end

    def edit
        block_access_if_not_primary_owner
    end

    def destroy
        @workspace = Workspace.find(params[:id])
        @all_links = Link.where(workspace_id: @workspace.id)
        
        @all_links.each do | l |
            Link.find_by(id: l.id).destroy
        end 

        @workspace.destroy
        flash[:notice] = "Workspace '#{@workspace.workspace_name}' deleted."
        redirect_to workspaces_path
    end


    def delete_link_from_workspace
        id = params[:id]
        link_to_delete = Link.find(id)
        belongs_to_workspace = link_to_delete.workspace_id
        belongs_to_workspace = Workspace.find(belongs_to_workspace)
        
        link_to_delete.destroy
        redirect_to workspace_path(belongs_to_workspace)
    end

    def open_links
        id = params[:id]
        @workspace = Workspace.find(id)
        @links = Link.where(workspace_id: @workspace.id)

        render status: 200, json: @links
        return 
    end

    private 
    def workspace_params
        params.require(:workspace).permit(:workspace_name)
    end

    def set_workspace
        @workspace = Workspace.find(params[:id])
    end

    def block_access_if_not_primary_owner
        if !current_user.workspaces.primary_owner.include?(@workspace)
            redirect_to root_path, alert: "You may only edit or delete a project if you are the Primary Project Owner."
            return
        end
    end

    def block_access_if_not_collaborator
        if !current_user.workspaces.collaborator_of_any_kind.include?(@workspace)
            redirect_to root_path, alert: "You may only view this page if you are a Project Collaborator."
            return
        end
    end

     
end