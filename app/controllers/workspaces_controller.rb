class WorkspacesController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        @curr_user = current_user
        @workspaces = @curr_user.workspaces
    end

    def new
    end

    def update
        puts "got paramaters for update workspace"
        puts params
        
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

        puts "hashmap of values to add to links table"
        puts updated_link_inputs

        updated_link_inputs.each do |k, link_groups|
            # k is group number, link_groups is hashmap with values "notes", "name", etc.
            Link.create!(nickname: link_groups["name"], 
                         link: link_groups["link"], 
                         created_at: link_groups["date"], 
                         notes: link_groups["notes"], 
                         workspace_id: params["id"])
        end 

        puts "link after database insert"
        new_link = Link.find_by(workspace_id: params["id"])    
        puts new_link.notes    
        

        redirect_to workspace_path
    end

    # def create
    #     curr_user = current_user
    #     # @workspace = Workspace.create!(:workspace_name=> workspace_params['workspace_name'], 
    #     #                                :user => curr_user.email, 
    #     #                                :tags => "", 
    #     #                                :notes => "", 
    #     #                                :user_id => curr_user.id)
    #     curr_user.workspaces.create!(:workspace_name=> workspace_params['workspace_name'], 
    #                                    :tags => "", 
    #                                    :notes => "")
    #     redirect_to workspaces_path
    # end


    def create
        @workspace = current_user.workspaces.build(workspace_params)
        if @workspace.save
          flash[:success] = "Workspace created!"
          redirect_to workspace_path(@workspace.id)
        else
          redirect to root_url
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
        

        # unless @workspace.present?
        #     flash[:alert] = 'Workspace not found'
        #     redirect_to root_path # or wherever you want them to go if order doesn't exist
        # end
        #@links = Link.where(workspace_id: @workspace.id)
        
    end

    # def destroy
    #     @workspace = Workspace.find(params[:id])
    #     @all_links = Link.where(workspace_id: @workspace.id)

    #     puts "all links"
    #     puts @all_links
        
    #     @all_links.each do | l |
    #         Link.find_by(id: l.id).destroy
    #     end 

    #     @workspace.destroy
    #     flash[:notice] = "Workspace '#{@workspace.workspace_name}' deleted."
    #     redirect_to workspaces_path
    # end

    def destroy
        @workspace.destroy
        flash[:success] = "Workspace deleted"
        redirect_to request.referrer || root_url
      end

    def add_link_to_workspace
        puts "server got: "
        puts request.body.read
        workspace = current_user.workspaces.find_by(id: params[:id])
        @new_link = Link.create!(:workspace_name => workspace.workspace_name, :link => params[:_json], :workspace_id => workspace.id)

        redirect_to workspace_path(workspace.id)
        return 
    end

    def delete_link_from_workspace
        id = params[:id]
        link_to_delete = Link.find(id)
        belongs_to_workspace = link_to_delete.workspace_id
        belongs_to_workspace = current_user.workspaces.find_by(id: belongs_to_workspace)
        
        link_to_delete.destroy
        redirect_to workspace_path(belongs_to_workspace)
    end

    def open_links
        puts "RECEIVED REQUEST: "
        puts request.body
        
        id = params[:id]
        @workspace = current_user.workspaces.find_by(id: params[:id])
        @links = Link.where(workspace_id: @workspace.id) 
        puts "SENDING JSON DATA to browser"
        render status: 200, json: @links
        return 
    end


    private 
    def workspace_params
        params.require(:workspace).permit(:workspace_name)
    end

    def correct_user
        @workspace = current_user.workspaces.find_by(id: params[:id])
        redirect_to root_url if @workspace.nil?
    end
     
end