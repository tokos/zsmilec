# encoding: utf-8

class NActionsController < ApplicationController
  
  layout "application"
  
  def index    
    
    @events = Event.all 
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
end