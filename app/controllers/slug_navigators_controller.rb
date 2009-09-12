class SlugNavigatorsController < ApplicationController
  # GET /slug_navigators
  # GET /slug_navigators.xml
  def index
    @slug_navigators = SlugNavigator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slug_navigators }
    end
  end

  # GET /slug_navigators/1
  # GET /slug_navigators/1.xml
  def show
    @slug_navigator = SlugNavigator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slug_navigator }
    end
  end

  # GET /slug_navigators/new
  # GET /slug_navigators/new.xml
  def new
    @slug_navigator = SlugNavigator.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slug_navigator }
    end
  end

  # GET /slug_navigators/1/edit
  def edit
    @slug_navigator = SlugNavigator.find(params[:id])
  end

  # POST /slug_navigators
  # POST /slug_navigators.xml
  def create
    @slug_navigator = SlugNavigator.new(params[:slug_navigator])

    respond_to do |format|
      if @slug_navigator.save
        flash[:notice] = 'SlugNavigator was successfully created.'
        format.html { redirect_to(@slug_navigator) }
        format.xml  { render :xml => @slug_navigator, :status => :created, :location => @slug_navigator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slug_navigator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slug_navigators/1
  # PUT /slug_navigators/1.xml
  def update
    @slug_navigator = SlugNavigator.find(params[:id])

    respond_to do |format|
      if @slug_navigator.update_attributes(params[:slug_navigator])
        flash[:notice] = 'SlugNavigator was successfully updated.'
        format.html { redirect_to(@slug_navigator) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slug_navigator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slug_navigators/1
  # DELETE /slug_navigators/1.xml
  def destroy
    @slug_navigator = SlugNavigator.find(params[:id])
    @slug_navigator.destroy

    respond_to do |format|
      format.html { redirect_to(slug_navigators_url) }
      format.xml  { head :ok }
    end
  end
end
