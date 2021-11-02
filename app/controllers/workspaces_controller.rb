class WorkspacesController < ApplicationController
    def index
        @workspaces = Workspace.all
    end

    def show
        id = params[:id]
        @workspace = Workspace.find(id)
    end
end
