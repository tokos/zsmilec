# encoding: utf-8

class LogsController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate, :except => [:index, :show]
  
  def index
    
    @logs = Log.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logs }
    end
    
  end
  
  def parse
    parser = LogParser.new
    
    Log.delete_all
    parser.parse_production_log
    
    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @logs }
    end
  end
  
end