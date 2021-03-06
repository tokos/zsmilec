# encoding: utf-8

class TasksController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate, :except => [:index, :show]
  
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    @council_map = {}
    Council.all.each do |council|
      @council_map[council.NAME] = council.ID
    end
    
    @subject_map = {}
    Subject.all.each do |subject|
      @subject_map[subject.NAME] = subject.ID
    end
    
    @state_map = {}
    Task_state.values.each do |state|
      @state_map[state.label] = state.id
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    @council_map = {}
    Council.all.each do |council|
      @council_map[council.NAME] = council.ID
    end
    
    @subject_map = {}
    Subject.all.each do |subject|
      @subject_map[subject.NAME] = subject.ID
    end
    
    @state_map = {}
    Task_state.values.each do |state|
      @state_map[state.label] = state.id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    
    @council_map = {}
    Council.all.each do |council|
      @council_map[council.NAME] = council.ID
    end
    
    @subject_map = {}
    Subject.all.each do |subject|
      @subject_map[subject.NAME] = subject.ID
    end
    
    @state_map = {}
    Task_state.values.each do |state|
      @state_map[state.label] = state.id
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])    

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Úkol byl úspěšně vyvtvořen.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Úkol byl úspěšně upraven.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
