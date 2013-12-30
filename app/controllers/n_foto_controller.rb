# encoding: utf-8

class NFotoController < ApplicationController
  
  layout "application"
  
  def index        
    
    @albums = Album.all
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def show        
    
    @album = Album.find(params[:id])
    @photos = []
    
    if @album != nil
      @photos = Photo.where(:ALBUM_ID => @album.ID)
    end
    
    respond_to do |format|
      format.html # show.html.erb      
    end
  end    
  
  def show_big        
    
    @photo = Photo.find(params[:id])
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
    
  end
  
end