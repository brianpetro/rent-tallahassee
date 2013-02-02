class SitesController < ApplicationController
	load_and_authorize_resource
  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  	if params[:id] != nil
    	@site = Site.find(params[:id])
    else
    	@site = Site.find_by_id(1)
    end
    @classifieds = Classified.all
    @subscriber = Subscriber.new
    @meta_title = "#{@meta_title} - Apartments, Condos, and Houses"
    @web_results = FeedEntry.all(:limit => 10, :order => "published_at desc")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
    @classifieds = Classified.all
    @subscriber = Subscriber.new
    @meta_title = "#{@meta_title} - Apartments, Condos, and Houses"
    @web_results = FeedEntry.all(:limit => 10, :order => "published_at desc")
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { respond_with_bip(@site) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@site) }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end
end
