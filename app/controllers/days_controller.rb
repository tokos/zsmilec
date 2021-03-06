# encoding: utf-8

class DaysController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate, :except => [:index, :show]
  
  # POST /days/select_timetable  
  def select_timetable
    if params[:timetable] == nil or params[:timetable] == ""
      redirect_to :action => "index"
    else    
      t = Timetable.find(params[:timetable])
      redirect_to :action => 'index', :t => t.ID
    end    
  end
  
  # GET /days
  # GET /days.json
  def index

    if params[:t] != nil
      @days = Day.order("POSITION").where(:TIMETABLE_ID => params[:t].to_i)
      @timetable = Timetable.find(params[:t])
      @timetables_map = {}
      @timetables_map[@timetable.ID] = @timetable.NAME
    else
      @days = Day.order("POSITION")
      @timetables = Timetable.all
      @timetables_map = {}
      @timetables.each do |timetable|
        @timetables_map[timetable.ID] = timetable.NAME
      end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @days }
    end
  end

  # GET /days/1
  # GET /days/1.json
  def show
    @day = Day.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @day }
    end
  end

  # GET /days/new
  # GET /days/new.json
  def new
    @day = Day.new    

    @timetables = Timetable.all
    @timetables_map = {}
    @timetables.each do |timetable|
      @timetables_map[timetable.NAME] = timetable.ID
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @day }
    end
  end

  # GET /days/1/edit
  def edit
    @day = Day.find(params[:id])
    
    @timetables = Timetable.all
    @timetables_map = {}
    @timetables.each do |timetable|
      @timetables_map[timetable.NAME] = timetable.ID
    end
    
  end

  # POST /days
  # POST /days.json
  def create
    @day = Day.new(params[:day])

    respond_to do |format|
      if @day.save
        format.html { redirect_to @day, notice: 'Den byl úspěšně vytvořen.' }
        format.json { render json: @day, status: :created, location: @day }
      else
        format.html { render action: "new" }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /days/1
  # PUT /days/1.json
  def update
    @day = Day.find(params[:id])

    respond_to do |format|
      if @day.update_attributes(params[:day])
        format.html { redirect_to @day, notice: 'Den byl úspěšně upraven.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day = Day.find(params[:id])
    @day.destroy

    respond_to do |format|
      format.html { redirect_to days_url }
      format.json { head :no_content }
    end
  end
end
