class DonationsController < ApplicationController
  before_filter :authenticate_user!      
  # GET /donations
  # GET /donations.json
  def index
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
    if params[:type]
      @donation = params[:type].constantize.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @donation }
      end
    end  
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.json
  def create
    if params[:type] == 'Experience' && params[:donation][:coordinates]
      params[:donation][:coordinates] = params[:donation][:coordinates].map{|x| x = x.to_f}
    end
    
    @donation = params[:type].constantize.new(params[:donation])
    @donation.user = current_user

    respond_to do |format|
      if @donation.save
        format.html { redirect_to user_url(current_user), notice: 'Donation was successfully created.' }
        format.json { render json: @donation, status: :created, location: @donation }
      else
        format.html { render action: "new" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to user_url(current_user), notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to donations_url }
      format.json { head :no_content }
    end
  end
end
