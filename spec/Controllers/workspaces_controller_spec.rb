require 'rails_helper'

RSpec.describe WorkspacesController, type: :controller do
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

    describe "GET #new" do
      it "returns a successful response" do
        get :index
        expect(response).to be_successful
      end

      it "renders the new template" do
        get :index
        expect(response).to render_template("new")
      end

    end

end