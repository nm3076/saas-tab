require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    # test get new session
    describe "GET new session" do
      it "returns login page" do
        post :create, params: { :session => { :email => "l3020@columbia.edu", :password => "foobar" }}
        get :new
        expect(flash[:danger]).to match(/Invalid email or password combination/)
        expect(response).to render_template("new")
      end 
      
      it "returns a successful response" do
        user = User.create!(:username => "rl3020", :email => "rl3020@columbia.edu", :first_name => "Richard", :last_name => "Lopez", password: "foobar", password_confirmation: "foobar")
        post :create, params: { :session => { :email => "rl3020@columbia.edu", :password => "foobar" }}
        get :new
        expect(response).to redirect_to workspaces_path

        user.destroy

      end

      it "login user to create new session" do
        user = User.create!(:username => "rl3020", :email => "rl3020@columbia.edu", :first_name => "Richard", :last_name => "Lopez", password: "foobar", password_confirmation: "foobar")
        get :new
        post :create, params: { :session => { :email => "rl3020@columbia.edu", :password => "foobar" }}
        puts "response from create path"
        puts response.code
        expect(response).to be_successful

        user.destroy

      end
      
    end


=begin
    # test create new user
    describe "create new user" do
        it "succesfully creates a new user" do
            post :create, params: {:user => {:username => "mikepeng", :email => "michaelpeng@gmail.com", :first_name => "Michael",
            :last_name => "Peng", :password => "ucla", :password_confirmation => "ucla"}}
            @created_user = User.find_by(:username => "mikepeng")
            user_id = @created_user.id
            expect(response).to be_successful
          
        end 

    end

    # test show specific user
    describe "GET #show" do
      it "returns a successful response" do
        post :create, params: {:user => {:username => "mikepeng", :email => "michaelpeng@gmail.com", :first_name => "Michael",
        :last_name => "Peng", :password => "ucla", :password_confirmation => "ucla"}}
        user_id = User.find_by(:username => "mikepeng").id
        get :show, params: {:id => user_id}
        expect(response).to be_successful
        expect(flash[:success]).to match(/Welcome to the tab!/)
        expect(response).to redirect_to user_path(user_id)
        User.find_by(:username  => "mikepeng").destroy
      end
    
    it "renders the show template" do
        post :create, params: {:user => {:username => "mikepeng", :email => "michaelpeng@gmail.com", :first_name => "Michael",
        :last_name => "Peng", :password => "ucla", :password_confirmation => "ucla"}}
        user_id = User.find_by(:username => "mikepeng").id
        get :show, params: {:id => user_id}
        expect(response).to render_template("show")
        User.find_by(:username  => "mikepeng").destroy
      end
    end

    
    

    # edit a user
    describe "edit a user" do
        it "successfuly edits a user" do
            post :create, params: {:user => {:username => "mikepeng", :email => "michaelpeng@gmail.com", :first_name => "Michael",
            :last_name => "Peng", :password => "ucla", :password_confirmation => "ucla"}}
            user_id = User.find_by(:username => "mikepeng").id
            get :edit, params: {:id => user_id}
            expect(response).to be_successful
        end
    end
=end

end