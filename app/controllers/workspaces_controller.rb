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
end
