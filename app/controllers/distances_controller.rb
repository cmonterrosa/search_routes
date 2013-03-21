class DistancesController < ApplicationController
  # GET /distances
  # GET /distances.xml
  def index
    @distances = Distance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @distances }
    end
  end

  # GET /distances/1
  # GET /distances/1.xml
  def show
    @distance = Distance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @distance }
    end
  end

  # GET /distances/new
  # GET /distances/new.xml
  def new
    @distance = Distance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @distance }
    end
  end

  # GET /distances/1/edit
  def edit
    @distance = Distance.find(params[:id])
  end

  # POST /distances
  # POST /distances.xml
  def create
    @distance = Distance.new(params[:distance])

    respond_to do |format|
      if @distance.save
        format.html { redirect_to(@distance, :notice => 'Distance was successfully created.') }
        format.xml  { render :xml => @distance, :status => :created, :location => @distance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @distance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /distances/1
  # PUT /distances/1.xml
  def update
    @distance = Distance.find(params[:id])

    respond_to do |format|
      if @distance.update_attributes(params[:distance])
        format.html { redirect_to(@distance, :notice => 'Distance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @distance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /distances/1
  # DELETE /distances/1.xml
  def destroy
    @distance = Distance.find(params[:id])
    @distance.destroy

    respond_to do |format|
      format.html { redirect_to(distances_url) }
      format.xml  { head :ok }
    end
  end
end
