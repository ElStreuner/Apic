require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    # @user = User.create!(first_name: "Pete", last_name: "Johnson", email: "peter@example.com", password: "password")
    @user = FactoryGirl.create(:user)
    # @user2 = User.create!(first_name: "Frank", last_name: "James", email: "frank2@example.com", password: "password")
    @user2 = FactoryGirl.create(:user2)
  end

  describe "GET #show" do
     context "User is logged in" do
       before do
         sign_in @user
       end

       it "loads the correct user details" do
         get :show, id: @user.id
         expect(response.status).to eq 200
         expect(assigns(:user)).to eq @user
       end

       it "doesn't load the second user" do
         get :show, id: @user2.id
         expect(response.status).to eq 302
         expect(response).to redirect_to(root_path)
       end
     end

     context "No user is logged in" do
       it "redirects to login" do
         get :show, id: @user.id
         expect(response).to redirect_to(root_path)
       end
     end
  end

end
