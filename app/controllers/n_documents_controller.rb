# encoding: utf-8

class NDocumentsController < ApplicationController
  
  layout "application"
  
  def index
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def show
    respond_to do |format|
      format.doc      
    end
  end
  
end