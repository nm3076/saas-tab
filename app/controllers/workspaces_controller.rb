class WorkspacesController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @curr_user = current_user
        @workspaces = Workspace.where(user_id: @curr_user.id)
    end

    def new
    end

    def create
        curr_user = current_user
        @workspace = Workspace.create!(:workspace_name=> workspace_params['workspace_name'], 
                                       :user => curr_user.email, 
                                       :tags => "", 
                                       :notes => "", 
                                       :user_id => curr_user.id)
        redirect_to workspaces_path
    end

    def show
        id = params[:id]
        @workspace = Workspace.find(id)
        @links = Link.where(workspace_id: @workspace.id)
    end

    def destroy
        @workspace = Workspace.find(params[:id])
        @all_links = Link.where(workspace_id: @workspace.id)

        puts "all links"
        puts @all_links
        
        @all_links.each do | l |
            Link.find_by(id: l.id).destroy
        end 

        @workspace.destroy
        flash[:notice] = "Workspace '#{@workspace.workspace_name}' deleted."
        redirect_to workspaces_path
    end

    def add_link_to_workspace
        puts "server got: "
        puts request.body.read
        workspace_id = params[:id]
        workspace = Workspace.find(workspace_id)
        @new_link = Link.create!(:workspace_name => workspace.workspace_name, :link => params[:_json], :workspace_id => workspace.id)

        redirect_to workspace_path(workspace_id)
        return 
    end

    def delete_link_from_workspace
        id = params[:id]
        link_to_delete = Link.find(id)
        belongs_to_workspace = link_to_delete.workspace_id
        belongs_to_workspace = Workspace.find(belongs_to_workspace)
        
        link_to_delete.destroy
        flash[:notice] = "Link deleted from '#{belongs_to_workspace.workspace_name}' deleted."
        redirect_to workspace_path(belongs_to_workspace)
    end

    def open_links
        puts "RECEIVED REQUEST: "
        puts request.body
        
        id = params[:id]
        @workspace = Workspace.find(id)
        @links = Link.where(workspace_id: @workspace.id) 
        puts "SENDING JSON DATA to browser"
        render status: 200, json: @links
        return 
    end


    private 
    def workspace_params
        params.require(:workspace).permit(:workspace_name)
    end
     
end