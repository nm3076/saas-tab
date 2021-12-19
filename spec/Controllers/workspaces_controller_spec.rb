require 'rails_helper'

RSpec.describe WorkspacesController, type: :controller do
    include SessionsHelper

    # make sure user is logged in before working with workspaces
    before(:each) do
      @current_user_logged_in = User.create!(:username => "rl3020", :email => "rl3020@columbia.edu", :first_name => "Richard", :last_name => "Lopez", password: "foobar", password_confirmation: "foobar" )
      log_in @current_user_logged_in
    end

    # delete the user and the login session after each 
    after(:each) do
      @current_user_logged_in.destroy
      log_out
    end
  
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

      # TEST LOADING TAGS 
      it "loads all tags belonging to workspace" do 
        post :create, params: { :workspace => {:user => @current_user_logged_in.email , :workspace_name => "Genes", :tags => "school-stuff"}}

        get :index 
        expect(response).to render_template("index")
        correct = true 
        @current_user_logged_in.workspaces.each do |work|
          if !work.workspace_name.include? "Genes"
            correct = false 
          end 
        end 

        expect(correct).to be true 

        Workspace.find_by(:workspace_name => "Genes").destroy
      end 

      it "render tags based on params" do
        get :index, params: { :tags => {"school": 1} }
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

      it "Prevents showing workspace not owned by user" do
        get :show, params: {:id => 1}
        expect(response).to redirect_to root_path
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
        patch :update, params: { :id => @made_workspace.id , "link-1" => "www.google.com" }
        
        #actual delete http request
        delete :destroy, params: { :id => @made_workspace.id }
        expect(@all_workspaces).not_to include(@made_workspace)
      end
    end

    # ADD multiple links to workspace test
    describe "add link to workspace" do
      it "successfully add links to a workspace" do
        post :create, params: {:workspace => {:workspace_name => "PLT" }}
        @all_workspaces = Workspace.all
        @made_workspace = Workspace.find_by(:workspace_name => "PLT")
        workspace_id = @made_workspace.id
        Link.create!(:workspace_name => "PLT", :link => "https://www.awesomeinventions.com", :workspace_id => @made_workspace.id)
  
        patch :update, params: { :id => @made_workspace.id , 
                                "link-1" => "https://www.awesomeinventions.com", 
                                "name-1" =>  "Test", 
                                "date-1" =>  "11-17-21",
                                "notes-1" => "Hello world", 

                                "link-2" => "https://www.pinterest.com/", 
                                "name-2" =>  "Other Test", 
                                "date-2" =>  "11-17-21",
                                "notes-2" => "Hello world 2",

                                "link-2" => "https://www.pinterest.com/", 
                                "name-2" =>  "Otest", 
                                "date-2" =>  "11-21",
                                "notes-2" => "Hello world 3", 
                                
                                "link-3" => "https://www.bumble.com/", 
                                "name-3" =>  "Other other Test", 
                                "date-3" =>  "11-21",
                                "notes-3" => "Hello world 4"
                              }

        @all_links = Link.all
        @created_link = Link.find_by(:link => "https://www.awesomeinventions.com")
        @other_link = Link.find_by(:link => "https://www.pinterest.com/")
        @other_link_1 = Link.find_by(:link => "https://www.bumble.com/")

        expect(@all_links).to include( @created_link )
        expect(@all_links).to include( @other_link )
        expect(@all_links).to include( @other_link_1 )
      
        Link.find_by(:link => "https://www.awesomeinventions.com").destroy
        Link.find_by(:link => "https://www.pinterest.com/").destroy
        Link.find_by(:link => "https://www.bumble.com/").destroy

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

        patch :update, params: { :id => @made_workspace.id , "link-1" => "https://www.awesomeinventions.com" }
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

        patch :update, params: { :id => @made_workspace.id , "link-1" => "https://www.awesomeinventions.com" }

        post :open_links, params: { :id => workspace_id }

        expect(response).to be_successful


        Link.find_by(:link => "https://www.awesomeinventions.com").destroy
        Workspace.find_by(:workspace_name => "PLT").destroy

      end
    end

#    # test application job
#    describe "testing instance of appliation job class" do
#      it "is class created for application job" do
#        job = ApplicationJob.new 
#        expect(job).to be_instance_of(ApplicationJob)
#      end
#    end

#    # test application mailer 
#    describe "testing instance of appliation mailer class" do
#      it "is class created for application mailer" do
#        mailer = ApplicationMailer.new 
#        expect(mailer).to be_instance_of(ApplicationMailer)
#      end
#    end

    # Test if link controller is working properly
#    describe "testing instance of appliation job class" do
#      it "is class created for application job" do
#        link_controller = LinksController.new 
#        expect(link_controller).to be_instance_of(LinksController)
#      end
#    end

    # Test if collaborator is working properly
    # describe "testing instance of appliation job class" do
    #   it "is class created for application job" do
    #     collab = Collaborator.new 
    #     expect(collab).to be_instance_of(Collaborator)
    #   end
    # end



end