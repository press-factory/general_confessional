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
