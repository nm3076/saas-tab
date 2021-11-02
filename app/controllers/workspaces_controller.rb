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

    def delete_link_from_workspace
        id = params[:id]
        link_to_delete = Link.find(id)
        belongs_to_workspace = link_to_delete.workspace_id
        belongs_to_workspace = Workspace.find(belongs_to_workspace)
        
        link_to_delete.destroy
        flash[:notice] = "Link deleted from '#{belongs_to_workspace.workspace_name}' deleted."
        redirect_to workspace_path(belongs_to_workspace)
    end


    # private 
    # def link_params
    #     params.require(:link).permit(:id, :rating, :description, :release_date, :director)
    # end

end
