# encoding: utf-8

class NEmployeesController < ApplicationController
  
  layout "application"
  
  def index
    
    @employees = Employee.all
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def show
    
    @employee = Employee.find(params[:id])
    @employees = Employee.all
    
    respond_to do |format|
      format.html # show.html.erb      
    end
  end
  
  def show_employee
    @employee = Employee.find(params[:id])
    @employees = Employee.all
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
end