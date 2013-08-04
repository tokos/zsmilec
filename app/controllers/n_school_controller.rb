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
  
  def contact
    
    @school = School.first
    @headmaster = Employee.where(:TEACHER_FLAG => 1).first
    
    respond_to do |format|
      format.html # contact.html.erb      
    end
  end
  
  def history
    respond_to do |format|
      format.html # history.html.erb      
    end
  end
    
end
