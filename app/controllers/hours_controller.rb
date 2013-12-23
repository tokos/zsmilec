# encoding: utf-8

class HoursController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate, :except => [:index, :show]
  
  #POST /hours/select_timetable
  def select_timetable
    redirect_to :action => "index", :t => params[:timetable], :d => params[:day]
  end  
  
  # GET /hours
  # GET /hours.json
  def index
    
    if params[:t] != nil && params[:t] != ""
      if params[:d] != nil && params[:d] != ""
        @hours = Hour.joins(:day).where("days.TIMETABLE_ID" => params[:t].to_i, :DAY_ID => params[:d].to_i)
      else
        @hours = Hour.joins(:day).where("days.TIMETABLE_ID" => params[:t].to_i)  
      end
    else
      if params[:d] != nil && params[:d] != ""
        @hours = Hour.joins(:day).where(:DAY_ID => params[:d].to_i)
      else
        @hours = Hour.order("POSITION")
      end
    end
    
    @days = Day.all
    @days_map = {}
    @days.each do |day|
      timetable = Timetable.find(day.TIMETABLE_ID)
      @days_map[day.NAME+" "+timetable.NAME] = day.ID
    end
    
    @subjects_map = {}    
    Subject.all.each do |subject|
      @subjects_map[subject.NAME] = subject.ID
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hours }
    end
  end

  # GET /hours/1
  # GET /hours/1.json
  def show
    @hour = Hour.find(params[:id])
    
    @days = Day.all
    @days_map = {}
    @days.each do |day|
      timetable = Timetable.find(day.TIMETABLE_ID)
      @days_map[day.NAME+" "+timetable.NAME] = day.ID
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hour }
    end
  end

  # GET /hours/new
  # GET /hours/new.json
  def new
    @hour = Hour.new
    
    @days = Day.all
    @days_map = {}
    @days.each do |day|
      timetable = Timetable.find(day.TIMETABLE_ID)
      @days_map[day.NAME+" "+timetable.NAME] = day.ID
    end

    @subjects_map = {}
    Subject.all.each do |subject|
      @subjects_map[subject.NAME] = subject.ID
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hour }
    end
  end

  # GET /hours/1/edit
  def edit
    @hour = Hour.find(params[:id])
    
    @days = Day.all
    @days_map = {}
    @days.each do |day|
      timetable = Timetable.find(day.TIMETABLE_ID)
      @days_map[day.NAME+" "+timetable.NAME] = day.ID
    end
    
    @subjects_map = {}
    Subject.all.each do |subject|
      @subjects_map[subject.NAME] = subject.ID
    end
    
  end

  # POST /hours
  # POST /hours.json
  def create
    @hour = Hour.new(params[:hour])

    respond_to do |format|
      if @hour.save
        format.html { redirect_to @hour, notice: 'Vyučovací hodina byla úspěšně vytvořena.' }
        format.json { render json: @hour, status: :created, location: @hour }
      else
        format.html { render action: "new" }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hours/1
  # PUT /hours/1.json
  def update
    @hour = Hour.find(params[:id])

    respond_to do |format|
      if @hour.update_attributes(params[:hour])
        format.html { redirect_to @hour, notice: 'Vyučovací hodina byla úspěšně upravena.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hours/1
  # DELETE /hours/1.json
  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy

    respond_to do |format|
      format.html { redirect_to hours_url }
      format.json { head :no_content }
    end
  end
end
