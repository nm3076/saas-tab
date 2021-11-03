require 'rails_helper'

RSpec.describe WorkspacesController, type: :controller do

    # test get index
    describe "GET #index" do
      it "returns a successful response" do
        get :index
        expect(response).to be_successful
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

    end


    #test get new view
    describe "GET #new" do
      it "returns a successful response" do
        get :new
        expect(response).to be_successful
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
      end
    end


    # test create workspace
    describe "create workspace" do
      it "creates workspace successfully and redirects to workspaces_path" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        expect(response).to redirect_to workspaces_path
        Workspace.find_by(:workspace_name => "PLT").destroy
      end
    end

    describe "create workspace" do
      it "creates workspace successfully and redirects to workspaces_path" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @all_workspaces = Workspace.all
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")

        expect(@all_workspaces).to include(@made_workspace)

        Workspace.find_by(:workspace_name => "PLT").destroy
      end
    end

    # test show specific workspace path: #show
    describe "GET #show" do
      it "returns a successful response" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @all_workspaces = Workspace.all
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")
        workspace_id = @made_workspace.id

        get :show, params: {:id => workspace_id}
        expect(response).to be_successful

        Workspace.find_by(:workspace_name => "PLT").destroy
      end

      it "renders the index template" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @all_workspaces = Workspace.all
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")
        workspace_id = @made_workspace.id

        get :show, params: {:id => workspace_id}
        expect(response).to render_template("show")
        Workspace.find_by(:workspace_name => "PLT").destroy
      end

    end


    # testing destroy workspace
    describe "delete workspace" do
      it "creates workspace and deletes same workspace successfully" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @all_workspaces = Workspace.all
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")
        expect(@all_workspaces).to include(@made_workspace)

        Workspace.find_by(:workspace_name => "PLT").destroy
        expect(@all_workspaces).not_to include(@made_workspace)
      end
    end

    # add link to workspace test
    describe "add link to workspace" do
      it "successfully add links to a workspace" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @all_workspaces = Workspace.all
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")
        workspace_id = @made_workspace.id

        post :add_link_to_workspace, params: { :id => workspace_id, :_json =>"https://www.awesomeinventions.com" }
        @all_links = Link.all
        @created_link = Link.find_by(:link => "https://www.awesomeinventions.com")

        expect(@all_links).to include( @created_link )
      
        Link.find_by(:link => "https://www.awesomeinventions.com").destroy
        Workspace.find_by(:workspace_name => "PLT").destroy

      end
    end



    

end