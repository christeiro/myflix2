require 'spec_helper'

describe SessionsController do
  describe "GET #new" do
    it "renders the :new templte for unauthenticated user" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to home page for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end
  describe "POST #create" do
    let(:user) { Fabricate(:user) }
    context "with valid input" do
      before do
        post :create, email: user.email, password: user.password
      end
      it "sets @session for the user" do
        expect(session[:user_id]).to eq(user.id)
      end
      it "redirects to home path" do
        expect(response).to redirect_to home_path
      end
      it "shows the notice" do
        expect(flash[:notice]).not_to be_blank
      end
    end
    context "with invalid input" do
      let(:user) { Fabricate(:user) }
      before do
        post :create, email: user.email, password: user.password + 'fake'
      end
      it "redirects to sign in path" do
        expect(response).to redirect_to sign_in_path
      end 
      it "sets the error message" do
        expect(flash[:error]).to be_present
      end
    end
  end
  describe "GET #destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end
    it "clears the session for the user" do
      expect(session[:user_id]).to be_nil
    end
    it "redirects to root path" do
      expect(response).to redirect_to root_path
    end
    it "sets the notice" do
      expect(flash[:notice]).not_to be_blank
    end
  end
end