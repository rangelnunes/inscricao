class MesasredondasController < ApplicationController
	before_filter :authenticate_user!,:except => [:index, :show] 
  # GET /mesasredondas
  # GET /mesasredondas.json
  def index
    @mesasredondas = Mesasredonda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mesasredondas }
    end
  end

  # GET /mesasredondas/1
  # GET /mesasredondas/1.json
  def show
    @mesasredonda = Mesasredonda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mesasredonda }
    end
  end

  # GET /mesasredondas/new
  # GET /mesasredondas/new.json
  def new
    @mesasredonda = Mesasredonda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mesasredonda }
    end
  end

  # GET /mesasredondas/1/edit
  def edit
    @mesasredonda = Mesasredonda.find(params[:id])
  end

  # POST /mesasredondas
  # POST /mesasredondas.json
  def create
    @mesasredonda = Mesasredonda.new(params[:mesasredonda])

    respond_to do |format|
      if @mesasredonda.save
        format.html { redirect_to @mesasredonda, notice: 'Mesa redonda cadastrada com sucesso.' }
        format.json { render json: @mesasredonda, status: :created, location: @mesasredonda }
      else
        format.html { render action: "new" }
        format.json { render json: @mesasredonda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mesasredondas/1
  # PUT /mesasredondas/1.json
  def update
    @mesasredonda = Mesasredonda.find(params[:id])

    respond_to do |format|
      if @mesasredonda.update_attributes(params[:mesasredonda])
        format.html { redirect_to @mesasredonda, notice: 'Mesa redonda modificada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mesasredonda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesasredondas/1
  # DELETE /mesasredondas/1.json
  def destroy
    @mesasredonda = Mesasredonda.find(params[:id])
    @mesasredonda.destroy

    respond_to do |format|
      format.html { redirect_to mesasredondas_url }
      format.json { head :no_content }
    end
  end
end
