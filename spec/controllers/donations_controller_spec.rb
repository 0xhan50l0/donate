require 'spec_helper'

describe DonationsController do

  before (:each) do
    @user = User.create!({
                           :email => 'user@test.com',
                           :password => 'changeme',
                           :password_confirmation => 'changeme' 
                         })

    sign_in @user
  end  

  # This should return the minimal set of attributes required to create a valid
  # Donation. As you add validations to Donation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DonationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
  end

  describe "GET show" do
  end

  describe "GET new" do
    it "assigns a new donation as @donation" do
      Donation.subclasses.each do |i|
        get :new, {:type => i.to_s}
        assigns(:donation).should be_a_new(i)
      end  
    end
  end

  describe "GET edit" do
    it "assigns the requested donation as @donation" do
      donation = Donation.create! valid_attributes
      get :edit, {:id => donation.to_param}
      assigns(:donation).should eq(donation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Donation" do
        Donation.subclasses.each do |i|
          expect {
            post :create, {:donation => valid_attributes, :type => i.to_s}
          }.to change(Donation, :count).by(1)
        end  
      end

      it "assigns a newly created donation as @donation" do
        Donation.subclasses.each do |i|        
          post :create, {:donation => valid_attributes, :type => i.to_s}
          assigns(:donation).should be_a(i)
          assigns(:donation).should be_persisted
        end  
      end

      it "belongs to this user" do
        Donation.subclasses.each do |i|        
          post :create, {:donation => valid_attributes, :type => i.to_s}
          assigns(:donation).user.should == @user
        end  
      end

      it "redirects to the created donation" do
        Donation.subclasses.each do |i|                
          post :create, {:donation => valid_attributes, :type => i.to_s}
          response.should redirect_to(user_path(@user))
        end  
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved donation as @donation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.subclasses.each do |i|                
          i.any_instance.stub(:save).and_return(false)
          post :create, {:donation => {}, :type => i}
          assigns(:donation).should be_a_new(i)
        end  
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.subclasses.each do |i|                        
          i.any_instance.stub(:save).and_return(false)
          post :create, {:donation => {}, :type => i}
          response.should render_template("new")
        end  
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested donation" do
        donation = Donation.create! valid_attributes
        # Assuming there are no other donations in the database, this
        # specifies that the Donation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Donation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => donation.to_param, :donation => {'these' => 'params'}}
      end

      it "assigns the requested donation as @donation" do
        donation = Donation.create! valid_attributes
        put :update, {:id => donation.to_param, :donation => valid_attributes}
        assigns(:donation).should eq(donation)
      end

      it "redirects to the donation" do
        Donation.subclasses.each do |i|                                
          donation = i.create! valid_attributes
          put :update, {:id => donation.to_param, :donation => valid_attributes}
          response.should redirect_to(user_path(@user))
        end  
      end
    end

    describe "with invalid params" do
      it "assigns the donation as @donation" do
        donation = Donation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.any_instance.stub(:save).and_return(false)
        put :update, {:id => donation.to_param, :donation => {}}
        assigns(:donation).should eq(donation)
      end

      it "re-renders the 'edit' template" do
        donation = Donation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Donation.any_instance.stub(:save).and_return(false)
        put :update, {:id => donation.to_param, :donation => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested donation" do
      donation = Donation.create! valid_attributes
      expect {
        delete :destroy, {:id => donation.to_param}
      }.to change(Donation, :count).by(-1)
    end

    it "redirects to the donations list" do
      donation = Donation.create! valid_attributes
      delete :destroy, {:id => donation.to_param}
      response.should redirect_to(donations_url)
    end
  end

end
