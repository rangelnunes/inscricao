class PalestrasController < ApplicationController

	before_filter :authenticate_user!,:except => [:index, :show] 
  # GET /palestras
  # GET /palestras.json
  def index
		#@palestrante = Palestrante.new
    @palestras = Palestra.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @palestras }
    end
  end

  # GET /palestras/1
  # GET /palestras/1.json
  def show
    @palestra = Palestra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @palestra }
    end
  end

  # GET /palestras/new
  # GET /palestras/new.json
  def new
    authorize! :new, @palestra
    @palestra = Palestra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @palestra }
    end
  end

  # GET /palestras/1/edit
  def edit
    authorize! :edit, @palestra
    @palestra = Palestra.find(params[:id])
  end

  # POST /palestras
  # POST /palestras.json
  def create
    authorize! :create, @palestra
    @palestra = Palestra.new(params[:palestra])

    respond_to do |format|
      if @palestra.save
        format.html { redirect_to @palestra, notice: 'Palestra cadastrada com sucesso.' }
        format.json { render json: @palestra, status: :created, location: @palestra }
      else
        format.html { render action: "new" }
        format.json { render json: @palestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /palestras/1
  # PUT /palestras/1.json
  def update
		authorize! :update, @palestra
    @palestra = Palestra.find(params[:id])

    respond_to do |format|
      if @palestra.update_attributes(params[:palestra])
        format.html { redirect_to @palestra, notice: 'Palestra modificada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @palestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palestras/1
  # DELETE /palestras/1.json
  def destroy
		authorize! :destroy, @palestra
    @palestra = Palestra.find(params[:id])
    @palestra.destroy

    respond_to do |format|
      format.html { redirect_to palestras_url }
      format.json { head :no_content }
    end
  end
end
