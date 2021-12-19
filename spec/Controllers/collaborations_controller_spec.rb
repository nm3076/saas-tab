require 'rails_helper'

RSpec.describe CollaborationsController, type: :controller do

    include SessionsHelper
     # make sure user is logged in before working with workspaces
     before(:each) do
        @current_user_logged_in = User.create!(:username => "rl3020", :email => "rl3020@columbia.edu", :first_name => "Richard", :last_name => "Lopez", password: "foobar", password_confirmation: "foobar" )
        
        log_in @current_user_logged_in
      end
  
      # delete the user and the login session after each 
      after(:each) do
        @current_user_logged_in.workspaces.each do |work|
            work.destroy
        end 

        @current_user_logged_in.destroy
        log_out
      end

    # test get new collaboration
    describe "GET new collaboration" do
      it "returns a new collaboration" do
       # user = User.create!(:username => "jp1234", :email => "jp@columbia.edu", :first_name => "jessica", :last_name => "peng", password: "hello", password_confirmation: "hello")
      #  workspace = Workspace.create!(:workspace_name => "Bartending")
      #  @created_user_id = User.find_by(:username => "jp1234").id
      #  @created_workspace_id =  Workspace.find_by(:workspace_name => "PLT")
      #  post :create, params: {:collaboration => {:user_id => @created_user_id, :workspace_id => @created_workspace_id}}
        get :new
        Kernel.puts current_user.first_name
        Kernel.puts response.body
        expect(response.body).to include "http://test.host/"
       # expect(response).to render_template("new")
      end 
    end

    describe "create new collaboration" do

        it "create collaboration of new workspace" do
            @workspace = Workspace.create(:workspace_name=> "SaaSS", :user => "rl3020@columbia.edu", :tags => "Classes", :notes => "Engineering Software as a Service", :user_id => @current_user_logged_in.id)
            post :create, params: {:collaboration => {:user_id => @current_user_logged_in.id, :workspace_id => @workspace.id}}
            expect(response).to be_successful
            @workspace.destroy

      
          end 
   
        it "create collaboration of saved workspace" do
            @workspace = Workspace.create(:workspace_name=> "SaaSS", :user => "rl3020@columbia.edu", :tags => "Classes", :notes => "Engineering Software as a Service", :user_id => @current_user_logged_in.id)
            post :create, params: {:collaboration => {:user_id => @current_user_logged_in.id, :workspace_id => @workspace.id}}
            @other_user = user = User.create!(:username => "jp1234", :email => "jp@columbia.edu", :first_name => "jessica", :last_name => "peng", password: "hello", password_confirmation: "hello")
            post :create, params: {:collaboration => {:user_id => @other_user.id, :workspace_id => @workspace.id, :role => "View Only"}}
            Kernel.puts response.body
            expect(response).to redirect_to workspace_path(:id => @workspace.id)
            @workspace.destroy
            @other_user.destroy
            

          end 
      end

    #   describe "destroys a collaboration" do
    #     it "destroys a collaboration" do
    #         # how to pass the workspace I am trying to delete? 
    #         @workspace = Workspace.create(:workspace_name=> "SaaSS", :user => "rl3020@columbia.edu", :tags => "Classes", :notes => "Engineering Software as a Service", :user_id => @current_user_logged_in.id)
    #         post :create, params: {:collaboration => {:user_id => @current_user_logged_in.id, :workspace_id => @workspace.id}}
    #         @other_user = user = User.create!(:username => "jp1234", :email => "jp@columbia.edu", :first_name => "jessica", :last_name => "peng", password: "hello", password_confirmation: "hello")
    #         post :create, params: {:collaboration => {:user_id => @other_user.id, :workspace_id => @workspace.id, :role => "View Only"}}
            
    #         delete :destroy
    #         @other_user.destroy
    #         @workspace.destroy
            
    #         expect(response).to redirect_to workspace_path
    #     end 
    # end

    # describe "updates a collaboration" do
    #     it "updates a collaboration" do
    #         @workspace = Workspace.create(:workspace_name=> "SaaSS", :user => "rl3020@columbia.edu", :tags => "Classes", :notes => "Engineering Software as a Service", :user_id => @current_user_logged_in.id)
    #         post :create, params: {:collaboration => {:user_id => @current_user_logged_in.id, :workspace_id => @workspace.id}}
    #         @other_user = user = User.create!(:username => "jp1234", :email => "jp@columbia.edu", :first_name => "jessica", :last_name => "peng", password: "hello", password_confirmation: "hello")
    #         @collaboration = Collaboration.create(:user_id => @other_user.id, :workspace_id => @workspace.id, :role => "View Only")
    #         patch :update, params: {:id => @collaboration.id, :collaboration_params => {:user_id => @other_user.id, :workspace_id => @workspace.id, :role => "View Only"}}
    #         #expect(response).to render_template("edit")
           
    #     end 
    # end

    describe "tests the primary_owner method of collaboration model" do
        it "returns the primary_owner" do
            @workspace = Workspace.create(:workspace_name=> "SaaSS", :user => "rl3020@columbia.edu", :tags => "Classes", :notes => "Engineering Software as a Service", :user_id => @current_user_logged_in.id)
            post :create, params: {:collaboration => {:user_id => @current_user_logged_in.id, :workspace_id => @workspace.id, :role => "Project Owner"}}
            @other_user = user = User.create!(:username => "jp1234", :email => "jp@columbia.edu", :first_name => "jessica", :last_name => "peng", password: "hello", password_confirmation: "hello")
            @collab = Collaboration.create!(:user_id => @other_user.id, :workspace_id => @workspace.id, :role => "View Only")
            @primary_owner = @current_user_logged_in.workspaces.primary_owner
            @owner = @current_user_logged_in.workspaces.owner
            @primary_or_owner_or_update= @current_user_logged_in.workspaces.primary_or_owner_or_update
            @collaborator_of_any_kind = @current_user_logged_in.workspaces.collaborator_of_any_kind
            @update_and_view = @current_user_logged_in.workspaces.update_and_view
            @view_only = @current_user_logged_in.workspaces.view_only
            @primary_or_owner= @current_user_logged_in.workspaces.primary_or_owner

            @workspace.destroy
            @other_user.destroy

        end 
    end



end
