class PubblicationsController < ApplicationController
  def index
    @pubblications = Pubblication.all
  end

  def show
    @pubblication = Pubblication.find(params[:id])
  end

  def new
    @pubblication = Pubblication.new
    @advertisements = Advertisement.all_for_select
    @photos = Photo.all_for_select
  end

  def edit
    @pubblication = Pubblication.find(params[:id])
    @advertisements = Advertisement.all_for_select
    @photos = Photo.all_for_select
  end

  def create
    @pubblication = Pubblication.new(params[:pubblication])
      if @pubblication.save
        flash[:notice] = 'Pubblication was successfully created.'
        redirect_to(pubblications_path)
      else
        render :action => "new"
      end
  end

  def update
    @pubblication = Pubblication.find(params[:id])
      if @pubblication.update_attributes(params[:pubblication])
        flash[:notice] = 'Pubblication was successfully updated.'
        redirect_to(pubblications_path)
      else
        render :action => "edit"
      end
  end

  def destroy
    @pubblication = Pubblication.find(params[:id])
    @pubblication.destroy

    redirect_to(pubblications_url)
  end
end

