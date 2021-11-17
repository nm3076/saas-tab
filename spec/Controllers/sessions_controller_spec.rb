require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    # test get new session
    describe "GET new session" do
      it "returns a successful response" do
        get :new
        expect(response).to be_successful
      end
      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
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