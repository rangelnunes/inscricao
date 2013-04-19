class UsersController < ApplicationController

	#before_filter :authenticate_user!
	
	def search
		@users = User.search(params[:query])

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
	end
  
  def index
    authorize! :read, @user
    #@users = User.all(:order => "name")
		#@users = User.scoped
		#@users = User.search(params[:query]) if params[:query].present?
		#@users = User.find(:all, :conditions => ['status = ?', true]) if params[:option].present?
		@users = User.scoped(:order => "name ASC", :conditions => ['tipo <> ?', 'Administrador'])
		if params[:query].present?
			@users = User.search(params[:query]) 
			@consultado = true
		end
		if params[:option].present?
			@users = User.find(:all, :order => "name ASC", 
												 :conditions => ['status = ? and tipo <> ?', true, 'Administrador']) 
			@confirmados = true
		end
		
    respond_to do |format|
      format.html # index.html.erb
			format.pdf do		    
		    pdf = Prawn::Document.new(:page_size => "A4")
		    pdf.text "Inscritos", :style => :bold, :size => 14,:spacing => 1.5, :align => :center
 		    pdf.text "Total de inscritos: #{@users.count}", :size => 10,:spacing => 1.5, :align => :right
				#da espaco entre o titulo e a tabela
				pdf.move_down(20)
				headers = ["Nome","e-mail", "Assinatura"]
				users = @users.map do |i|
					[
						i.name.titleize,
						i.email,
						" "
					]
				end

				pdf.table ([headers] + users), :row_colors => ["FFFFFF", "DDDDDD"],
				:header => true, :column_widths => {0 => 200, 1 => 180, 2 => 120} do
					style row(0), :borders => [:bottom], :background_color => "DDDDDD", :font_style => :bold
				end
				
		    send_data pdf.render, type: "application/pdf", disposition: "inline"
		    # send_data renders the pdf on the client side rather than saving it on the server filesystem.
		    # Inline disposition renders it in the browser rather than making it a file download.
	    end
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    authorize! :edit, @user
    @user = User.find(params[:id])
  end

  def confirm
    @user = User.find(params[:id])
    @user.confirm
		@user.save
    respond_to do |format|
      format.html {redirect_to users_path, notice: 'Inscricao confirmada.' }
      format.json { render json: @user }
    end
  end
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.html { redirect_to root_path, notice: 'User was successfully created.' }
				format.html { redirect_to users_url, notice: 'User was successfully created.' }                
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
