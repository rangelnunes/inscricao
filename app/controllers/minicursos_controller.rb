class MinicursosController < ApplicationController

	before_filter :authenticate_user!,:except => [:index, :show] 
  # GET /minicursos
  # GET /minicursos.json
  def index
    @minicursos = Minicurso.all
		#@minicursos = Minicurso.scoped
		#@users = Minicurso.inscritos(params[:id]) if params[:id].present?

    respond_to do |format|
			  format.html # index.html.erb
			  format.json { render json: @minicursos }
    end
  end

  # GET /minicursos/1
  # GET /minicursos/1.json
  def show
    @minicurso = Minicurso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @minicurso }
    end
  end

  # GET /minicursos/new
  # GET /minicursos/new.json
  def new
    @minicurso = Minicurso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @minicurso }
    end
  end

  # GET /minicursos/1/edit
  def edit
    @minicurso = Minicurso.find(params[:id])
  end

  # POST /minicursos
  # POST /minicursos.json
  def create
    @minicurso = Minicurso.new(params[:minicurso])

    respond_to do |format|
      if @minicurso.save
        format.html { redirect_to @minicurso, notice: 'Minicurso was successfully created.' }
        format.json { render json: @minicurso, status: :created, location: @minicurso }
      else
        format.html { render action: "new" }
        format.json { render json: @minicurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /minicursos/1
  # PUT /minicursos/1.json
  def update
    @minicurso = Minicurso.find(params[:id])

    respond_to do |format|
      if @minicurso.update_attributes(params[:minicurso])
        format.html { redirect_to @minicurso, notice: 'Minicurso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @minicurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minicursos/1
  # DELETE /minicursos/1.json
  def destroy
    @minicurso = Minicurso.find(params[:id])
    @minicurso.destroy

    respond_to do |format|
      format.html { redirect_to minicursos_url }
      format.json { head :no_content }
    end
  end
end
