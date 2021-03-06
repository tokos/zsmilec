# encoding: utf-8

class TimetablesController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate, :except => [:index, :show]
  
  def import
    t = TimetableImport.new
    begin    
      @timetable = t.import(params[:import_file])
    rescue Exception => e
      puts e.message
    end
    
    if @timetable != nil
    
      respond_to do |format|
        format.html # import.html.erb
        format.json { render json: @timetable }
      end
      
    end
    
  end
  
  # GET /timetables
  # GET /timetables.json
  def index
    @timetables = Timetable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timetables }
    end
  end

  # GET /timetables/1
  # GET /timetables/1.json
  def show
    @timetable = Timetable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timetable }
    end
  end

  # GET /timetables/new
  # GET /timetables/new.json
  def new
    @timetable = Timetable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timetable }
    end
  end

  # GET /timetables/1/edit
  def edit
    @timetable = Timetable.find(params[:id])
  end

  # POST /timetables
  # POST /timetables.json
  def create
    @timetable = Timetable.new(params[:timetable])

    respond_to do |format|
      if @timetable.save
        format.html { redirect_to @timetable, notice: 'Rozvrh byl úspěšně vytvořen.' }
        format.json { render json: @timetable, status: :created, location: @timetable }
      else
        format.html { render action: "new" }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /timetables/1
  # PUT /timetables/1.json
  def update
    @timetable = Timetable.find(params[:id])

    respond_to do |format|
      if @timetable.update_attributes(params[:timetable])
        format.html { redirect_to @timetable, notice: 'Rozrvh byl úspěšně upraven.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetables/1
  # DELETE /timetables/1.json
  def destroy
    @timetable = Timetable.find(params[:id])
    
    if @timetable != nil
    
      res_day = Day.where(:TIMETABLE_ID => @timetable.ID)
      res_day.each do |day|
        res_hour = Hour.where(:DAY_ID => day.ID)
        res_hour.each do |hour|
          hour.destroy
        end
        day.destroy
      end
    
      @timetable.destroy
        
    end
    
    respond_to do |format|
      format.html { redirect_to timetables_url }
      format.json { head :no_content }
    end
  end
end
