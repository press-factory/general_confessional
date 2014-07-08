class ConfessionalsController < ApplicationController
  before_action :set_confessional, only: [:show, :edit, :update, :destroy]

  # GET /confessionals
  # GET /confessionals.json
  def index
    @confessionals = Confessional.all
  end

  # GET /confessionals/1
  # GET /confessionals/1.json
  def show
  end

  # GET /confessionals/new
  def new
    @confessional = Confessional.new
  end

  # GET /confessionals/1/edit
  def edit
  end

  # POST /confessionals
  # POST /confessionals.json
  def create
    @confessional = Confessional.new(confessional_params)

    respond_to do |format|
      if @confessional.save
        format.html { redirect_to @confessional, notice: 'Confessional was successfully created.' }
        format.json { render :show, status: :created, location: @confessional }
      else
        format.html { render :new }
        format.json { render json: @confessional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /confessionals/1
  # PATCH/PUT /confessionals/1.json
  def update
    respond_to do |format|
      if @confessional.update(confessional_params)
        format.html { redirect_to @confessional, notice: 'Confessional was successfully updated.' }
        format.json { render :show, status: :ok, location: @confessional }
      else
        format.html { render :edit }
        format.json { render json: @confessional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confessionals/1
  # DELETE /confessionals/1.json
  def destroy
    @confessional.destroy
    respond_to do |format|
      format.html { redirect_to confessionals_url, notice: 'Confessional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @confessional.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confessional
      @confessional = Confessional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confessional_params
      params.require(:confessional).permit(:confessor, :confession)
    end
end
