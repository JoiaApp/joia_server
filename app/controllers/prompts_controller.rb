class PromptsController < ApplicationController
  # GET /prompts
  # GET /prompts.json
  def index
    @prompts = Prompt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prompts }
    end
  end

  # GET /prompts/1
  # GET /prompts/1.json
  def show
    @prompt = Prompt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prompt }
    end
  end

  # GET /prompts/new
  # GET /prompts/new.json
  def new
    @prompt = Prompt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prompt }
    end
  end

  # GET /prompts/1/edit
  def edit
    @prompt = Prompt.find(params[:id])
  end

  # POST /prompts
  # POST /prompts.json
  def create
    @prompt = Prompt.new(params[:prompt])

    respond_to do |format|
      if @prompt.save
        format.html { redirect_to @prompt, notice: 'Prompt was successfully created.' }
        format.json { render json: @prompt, status: :created, location: @prompt }
      else
        format.html { render action: "new" }
        format.json { render json: @prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prompts/1
  # PUT /prompts/1.json
  def update
    @prompt = Prompt.find(params[:id])

    respond_to do |format|
      if @prompt.update_attributes(params[:prompt])
        format.html { redirect_to @prompt, notice: 'Prompt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prompts/1
  # DELETE /prompts/1.json
  def destroy
    @prompt = Prompt.find(params[:id])
    @prompt.destroy

    respond_to do |format|
      format.html { redirect_to prompts_url }
      format.json { head :no_content }
    end
  end
end
