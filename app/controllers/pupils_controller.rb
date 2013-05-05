class PupilsController < ApplicationController
  # GET /pupils
  # GET /pupils.json
  def index
    @pupils = Pupil.all

    @parent_map = {}
    Parent.all.each do |parent|      
      @parent_map[parent.FIRST_NAME+" "+parent.LAST_NAME] = parent.ID
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pupils }
    end
  end

  # GET /pupils/1
  # GET /pupils/1.json
  def show
    @pupil = Pupil.find(params[:id])

    @parent_map = {}
    Parent.all.each do |parent|      
      @parent_map[parent.FIRST_NAME+" "+parent.LAST_NAME] = parent.ID
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pupil }
    end
  end

  # GET /pupils/new
  # GET /pupils/new.json
  def new
    @pupil = Pupil.new

    @parent_map = {}
    Parent.all.each do |parent|      
      @parent_map[parent.FIRST_NAME+" "+parent.LAST_NAME] = parent.ID
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pupil }
    end
  end

  # GET /pupils/1/edit
  def edit
    @pupil = Pupil.find(params[:id])
    
    @parent_map = {}
    Parent.all.each do |parent|      
      @parent_map[parent.FIRST_NAME+" "+parent.LAST_NAME] = parent.ID
    end
  end

  # POST /pupils
  # POST /pupils.json
  def create
    @pupil = Pupil.new(params[:pupil])

    respond_to do |format|
      if @pupil.save
        format.html { redirect_to @pupil, notice: 'Pupil was successfully created.' }
        format.json { render json: @pupil, status: :created, location: @pupil }
      else
        format.html { render action: "new" }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pupils/1
  # PUT /pupils/1.json
  def update
    @pupil = Pupil.find(params[:id])

    respond_to do |format|
      if @pupil.update_attributes(params[:pupil])
        format.html { redirect_to @pupil, notice: 'Pupil was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pupils/1
  # DELETE /pupils/1.json
  def destroy
    @pupil = Pupil.find(params[:id])
    @pupil.destroy

    respond_to do |format|
      format.html { redirect_to pupils_url }
      format.json { head :no_content }
    end
  end
end
