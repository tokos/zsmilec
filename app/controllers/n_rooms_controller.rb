# encoding: utf-8

class NRoomsController < ApplicationController
  
  def index
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def ict
    respond_to do |format|
      format.js {render :layout => false}      
    end
  end  
  
  def classroom
    respond_to do |format|
      format.js {render :layout => false}      
    end
  end
  
end