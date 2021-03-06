# encoding: utf-8

class NTimetableController < ApplicationController
  
  layout "application"
  
  def index
    
    @timetables = Timetable.all
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  # GET /timetables/1
  # GET /timetables/1.json
  def show
    
    @timetable = Timetable.find(params[:id])
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def show_timetable
    
    @timetable = Timetable.find(params[:id])
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
end