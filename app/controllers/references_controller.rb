class ReferencesController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_reference, only: [:show, :edit, :update, :destroy]

  # GET /references
  # GET /references.json
  def index
     @references = Reference.where(:user_id => current_user.id)
  end

  # GET /references/1
  # GET /references/1.json
  def show
    
  end

  # GET /references/new
  def new
    @reference = Reference.new
  end

  # GET /references/1/edit
  def edit
  end

  # POST /references
  # POST /references.json
  def create
    @reference = Reference.new(reference_params)
    @reference.user_id = current_user.id
    respond_to do |format|
      if @reference.save
        format.html { redirect_to @reference, notice: 'Reference was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reference }
      else
        format.html { render action: 'new' }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /references/1
  # PATCH/PUT /references/1.json
  def update
    respond_to do |format|
      if @reference.update(reference_params)
        format.html { redirect_to @reference, notice: 'Reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to references_url }
      format.json { head :no_content }
    end
  end

  def ref_search
    @ref_search = Reference.where("ref_no like ?", "%#{params[:ref_search]}%")
  end

  def mod_search
    @mod_search = Model.find_by_sql("select *from models where model_no like '%#{params[:mod_search]}%';")
  end

  def mod_des_search
    @mod_des_search = Model.find_by_sql("select *from models where description like '%#{params[:mod_des_search]}%';")
  end

  def model_search

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_params
      params.require(:reference).permit(:ref_no, :note1, :note2, :note3)
    end
end
