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

end