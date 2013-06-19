# encoding: utf-8
class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])
    @regions = Region.all()
    @kinds = Kind.all()
    @link = Link.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new
    @song.verses.build
    @song.regions.build

    @kinds = Kind.all()
    @regions = Region.all()
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    @regions = Region.all
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.search_by_title(params[:song][:title])

    if @song.first == nil
      @song = Song.new(params[:song])
    else
      redirect_to song_path(@song.first.id)
      return
    end

    respond_to do |format|
      if @song.save
        @occur = Occurence.new(:region_id => params[:region_id], :song_id => @song.id )
        @occur.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  # PUT
  def add_kind

    @song = Song.find(params[:song_id])

    @kind = Kind.find(params[:kind])

    if @kind == nil
      redirect_to kinds_new_url
    end

    @song.update_attribute('kind_id', @kind.id )

    redirect_to @song
  end

  def add_region

    @occur = Occurence.new(:region_id => params[:region], :song_id => params[:song_id] )
    @occur.save

    redirect_to song_url(params[:song_id])
  end


  def report
    @song = Song.find(params[:id])
  end


end
