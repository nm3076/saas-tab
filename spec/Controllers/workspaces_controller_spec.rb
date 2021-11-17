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

      it "renders the show template" do
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

        #add link to workspace to test if it works to delete
        post :add_link_to_workspace, params: { :id => @made_workspace.id , :_json =>"https://www.awesomeinventions.com" }
        
        #actual delete http request
        delete :destroy, params: { :id => @made_workspace.id }
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


    # remove link from workspace test
    describe "destroy link in workspace" do
      it "removes link from a workspace" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @all_workspaces = Workspace.all
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")
        workspace_id = @made_workspace.id

        post :add_link_to_workspace, params: { :id => workspace_id, :_json =>"https://www.awesomeinventions.com" }
        @all_links = Link.all
        @created_link = Link.find_by(:link => "https://www.awesomeinventions.com")
        
        delete :delete_link_from_workspace, params: {:id => @created_link.id }


        #puts flash[:notice]
        #expect(flash[:notice]).to match(/Link deleted from PLT deleted./)

        expect(@all_links).to_not include( @created_link )
      
        Workspace.find_by(:workspace_name => "PLT").destroy

      end
    end

    # open links from workspaces
    describe "open all links in workspace" do
      it "open all link from a workspace" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")
        workspace_id = @made_workspace.id

        post :add_link_to_workspace, params: { :id => workspace_id, :_json =>"https://www.awesomeinventions.com" }

        post :open_links, params: { :id => workspace_id }

        expect(response).to be_successful


        Link.find_by(:link => "https://www.awesomeinventions.com").destroy
        Workspace.find_by(:workspace_name => "PLT").destroy

      end
    end

    # test application job
    describe "testing instance of appliation job class" do
      it "is class created for application job" do
        job = ApplicationJob.new 
        expect(job).to be_instance_of(ApplicationJob)
      end
    end

    # test application mailer 
    describe "testing instance of appliation mailer class" do
      it "is class created for application mailer" do
        mailer = ApplicationMailer.new 
        expect(mailer).to be_instance_of(ApplicationMailer)
      end
    end

    # Test if link controller is working properly
    describe "testing instance of appliation job class" do
      it "is class created for application job" do
        link_controller = LinksController.new 
        expect(link_controller).to be_instance_of(LinksController)
      end
    end

end