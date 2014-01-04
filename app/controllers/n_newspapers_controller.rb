# encoding: utf-8

class NNewspapersController < ApplicationController
  
  layout "application"
  
  def index        
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def show
    
    @picture = params[:picture]
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
    
  end
end