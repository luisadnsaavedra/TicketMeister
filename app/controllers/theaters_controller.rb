class TheatersController < ApplicationController
  before_filter :verify_admin, only: [:new, :edit, :update, :destroy]
  before_action :set_theater, only: [:show, :edit, :update, :destroy]

  # GET /theaters
  # GET /theaters.json
  def index
    @theaters = Theater.all
  end

  # GET /theaters/1
  # GET /theaters/1.json
  def show
  end

  # GET /theaters/new
  def new
    @theater = Theater.new
  end

  # GET /theaters/1/edit
  def edit
  end

  # POST /theaters
  # POST /theaters.json
  def create
    @theater = Theater.new(theater_params)

    respond_to do |format|
      if @theater.save
        format.html { redirect_to @theater, notice: 'Theater was successfully created.' }
        format.json { render :show, status: :created, location: @theater }
      else
        format.html { render :new }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /theaters/1
  # PATCH/PUT /theaters/1.json
  def update
    respond_to do |format|
      if @theater.update(theater_params)
        format.html { redirect_to @theater, notice: 'Theater was successfully updated.' }
        format.json { render :show, status: :ok, location: @theater }
      else
        format.html { render :edit }
        format.json { render json: @theater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /theaters/1
  # DELETE /theaters/1.json
  def destroy
    @theater.destroy
    respond_to do |format|
      format.html { redirect_to theaters_url, notice: 'Theater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theater
      @theater = Theater.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theater_params
      params.require(:theater).permit(:title, :description)
    end

    #define a method to check whether the user is an admin before certain actions
    #source: https://stackoverflow.com/questions/5794695/devise-restricting-actions-to-administrators
    def verify_admin #TODO: change root_path to sign up/ login path
      if !current_user.present? || current_user.email != I18n.t('general.admin_email')
        redirect_to theaters_path
        flash[:notice] = I18n.t('general.log_as_admin')
      end
    end

end
