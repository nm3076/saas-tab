RSpec.describe UsersController, type: :controller do
    describe "GET index" do
      it “returns a successful response to the index page” do
        get :index
        expect(response).to be_successful
      end

      it "assigns @workspaces" do
        user = User.create(name: “Test user”)
        get :index
        expect(assigns(:users)).to eq([user])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end

    end
end