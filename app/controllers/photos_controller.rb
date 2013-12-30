# encoding: utf-8

class PhotosController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate, :except => [:index, :show]
  
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all

    @albums = Album.all
    @albums_map = {}
    @albums.each do |album|      
      @albums_map[album.TITLE] = album.ID
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    @albums = Album.all
    @albums_map = {}
    @albums.each do |album|      
      @albums_map[album.TITLE] = album.ID
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new
    
    if params[:id] != nil
      @album = Album.find(params[:id])
      if @album != nil
        @photo.ALBUM_ID = @album.ID
      end
    end

    @albums = Album.all
    @albums_map = {}
    @albums.each do |album|      
      @albums_map[album.TITLE] = album.ID
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end      

  # GET /photos/1/edit
  def edit
    
    @albums = Album.all
    @albums_map = {}
    @albums.each do |album|      
      @albums_map[album.TITLE] = album.ID
    end
    
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])    

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Fotka úspěšně vytvořena.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Fotka byla úspěšně upravena.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
end
