class KindsController < ApplicationController

  def index
    @kinds = Kind.all()
  end


  def show
    @kind = Kind.find(params[:id])
  end

  def new
    @kind = Kind.new()
  end


  def create
    @kind = Kind.new(params[:kind])
    if @kind.save
      redirect_to kinds_path
    else
      redirect_to root_path
    end
  end

  def update
    @kind = Kind.find(params[:id])
    if @kind.update_attributes(params[:kind])
      redirect_to @kind
    else
      root_path
    end
  end

  def search
    @songs = Kind.find(params[:kind_id]).songs.search_by_title(params[:title])
  end

end