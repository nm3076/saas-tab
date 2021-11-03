class WorkspacesController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @workspaces = Workspace.all
    end

    def new
        # default: render 'new' template
    end

    def create
        @workspace = Workspace.create!(workspace_params)
        redirect_to workspaces_path
    end

    def workspace_params
        params.require(:workspace).permit(:workspace_name)
        # @links = Link.all
    end

    def show
        id = params[:id]
        @workspace = Workspace.find(id)
        @links = Link.where(workspace_id: @workspace.id)
    end

    def destroy
        @workspace = Workspace.find(params[:id])
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
        puts "after rendering..........."
    end
     
end
