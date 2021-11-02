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
    end
end
