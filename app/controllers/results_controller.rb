# encoding: utf-8

class ResultsController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate, :except => [:index, :show]
  
  # GET /results
  # GET /results.json
  def index
    @results = Result.all

    @subject_map = {}
    Subject.all.each do |subject|
      @subject_map[subject.NAME] = subject.ID
    end
    
    @pupil_map = {}
    Pupil.all.each do |pupil|
      @pupil_map[pupil.FIRST_NAME + " " + pupil.LAST_NAME] = pupil.ID
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/new
  # GET /results/new.json
  def new
    @result = Result.new

    @subject_map = {}
    Subject.all.each do |subject|
      @subject_map[subject.NAME] = subject.ID
    end
    
    @pupil_map = {}
    Pupil.all.each do |pupil|
      @pupil_map[pupil.FIRST_NAME + " " + pupil.LAST_NAME] = pupil.ID
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/1/edit
  def edit
    @result = Result.find(params[:id])
    
    @subject_map = {}
    Subject.all.each do |subject|
      @subject_map[subject.NAME] = subject.ID
    end
    
    @pupil_map = {}
    Pupil.all.each do |pupil|
      @pupil_map[pupil.FIRST_NAME + " " + pupil.LAST_NAME] = pupil.ID
    end
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(params[:result])

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Výsledek byl úspěšně vytvořen.' }
        format.json { render json: @result, status: :created, location: @result }
      else
        format.html { render action: "new" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /results/1
  # PUT /results/1.json
  def update
    @result = Result.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to @result, notice: 'Výsledek byl úspěšně upraven.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end
end
