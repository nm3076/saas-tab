class WorkspacesController < ApplicationController
    def index
        @workspaces = Workspace.all
        @links = Link.all
    end

    def show
        id = params[:id]
        @workspace = Workspace.find(id)
    end
end
