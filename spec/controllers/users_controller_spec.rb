require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = User.create!({
                           :email => 'user@test.com',
                           :password => 'changeme',
                           :password_confirmation => 'changeme' 
                         })

    sign_in @user
  end  
  

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
