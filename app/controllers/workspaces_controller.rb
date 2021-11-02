class WorkspacesController < ApplicationController
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
        id = params[:id]
        @workspace = Workspace.find(id)
        

    end




end
