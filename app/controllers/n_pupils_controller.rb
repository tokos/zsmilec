# encoding: utf-8

class NPupilsController < ApplicationController
  
  layout "application"
  
  def index
    respond_to do |format|
      format.html # index.html.erb      
    end  
  end
  
  def training
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
end