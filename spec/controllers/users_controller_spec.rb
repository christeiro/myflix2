require 'spec_helper'

# unauthenticated
# GET NEW - sets @user variable
# POST Create - creates the user with valid input
# POST Create - redirects to the sign in path
# POST Create - does not create the user with invalid input
# POST Create - renders new template with invalid input

# authenticated user
# redirects to the home path

describe UsersController do
  describe "GET new" do
    it "sets @user for unauthenticated user" do
      get :new
      expect(assigns(:user)).to be_new_record
    end
    it "redirects to home page for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    context "valid input" do
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end
      it "creates the user" do
        expect(User.count).to eq(1)
      end
      it "redirects to the sign in path" do
        expect(response).to redirect_to sign_in_path
      end
    end
    context "invalid input" do
      before do
        post :create, user: { full_name: Faker::Name.name, password: 'password' }
      end
      it "does not create the user" do
        expect(User.count).to eq(0)
      end
      it "renders the template new" do
        expect(response).to render_template :new
      end
      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end