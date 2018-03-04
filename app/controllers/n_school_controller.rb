# encoding: utf-8

class NSchoolController < ApplicationController
  
  layout "application"
  
  def index
    
    @school = School.first
    @headmaster = Employee.where(:TEACHER_FLAG => 1).first
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def registration
    respond_to do | format |  
        format.js {render :layout => false}  
    end  
  end    
  
  def contact
    
    @school = School.first
    @headmaster = Employee.where(:TEACHER_FLAG => 1).first
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def history
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def map
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def teaching
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
    
end
