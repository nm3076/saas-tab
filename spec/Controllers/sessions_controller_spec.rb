require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    # test get new session
    describe "GET new session" do
      it "returns login page" do
        post :create, params: { :session => { :email => "l3020@columbia.edu", :password => "foobar" }}
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
        expect(response).to redirect_to workspaces_path
        user.destroy
      end

      it "destroy session i.e logout" do
        delete :destroy
        expect(response).to redirect_to root_path
      end 
      
    end
end