class SeatsController < ApplicationController
  before_filter :verify_admin, only: [:show, :edit, :update, :destroy]
  before_action :set_seat, only: [:show, :edit, :update, :destroy]
  before_action :set_concert, only: [:new, :create]
  before_action :authenticate_user!

  # GET /seats
  # GET /seats.json
  def index
    @seats = Seat.all
  end

  # GET /seats/1
  # GET /seats/1.json
  def show
  end

  # GET /seats/new
  def new
    @seat = @concert.seats.new
  end

  # GET /seats/1/edit
  def edit
  end

  # POST /seats
  # POST /seats.json
  def create
    @seat = @concert.seats.new(seat_params)

    respond_to do |format|
      if @seat.save
        #save a new Ticket as a result
        @ticket = Ticket.new
        @ticket.user = current_user
        @ticket.seat = @seat
        if @ticket.save
          #Redirect the user to their @ticket
          format.html { redirect_to @ticket, notice: t('.successful') }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { render :new }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seats/1
  # PATCH/PUT /seats/1.json
  def update
    respond_to do |format|
      if @seat.update(seat_params)
        format.html { redirect_to @seat, notice: 'Seat was successfully updated.' }
        format.json { render :show, status: :ok, location: @seat }
      else
        format.html { render :edit }
        format.json { render json: @seat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seats/1
  # DELETE /seats/1.json
  def destroy
    @seat.destroy
    respond_to do |format|
      format.html { redirect_to seats_url, notice: 'Seat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seat
      @seat = Seat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seat_params
      params.require(:seat).permit(:concert_id, :row, :number, :price)
    end

    #set the concert by its id
    def set_concert
      @concert = Concert.find_by(id: params[:concert_id]) || Concert.find(seat_params[:concert_id])
    end

    #define a method to check whether the user is an admin before certain actions
    #source: https://stackoverflow.com/questions/5794695/devise-restricting-actions-to-administrators
    def verify_admin #TODO: change root_path to sign up/ login path
      if !current_user.present? || current_user.email != I18n.t('general.admin_email')
        redirect_to tickets_path
        #TODO: localise flash notice string
        flash[:notice] = I18n.t('general.log_as_admin')
      end
    end

end
