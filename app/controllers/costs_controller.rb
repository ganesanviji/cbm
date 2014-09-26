class CostsController < ApplicationController

	def index
		@costs = Cost.all
		
	end

	def new
		
		@cost = Cost.new
	end

	def create
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.new(cost_params)
		@cost.cbm_id = @cbm.id
		@cost.cbm_exp = @cbm.per_cbm_ex
		@cost.pur_date = @cbm.pur_date
		if @cost.save
			flash[:notice] = "Cost created successfully"
			redirect_to cbms_path
		else
			@cbm = Cbm.find(params[:cbm_id])
			render :action => :new
		end
	end

	def show
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:id])
	end

	def edit
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:id])
	end

	def update
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:id])
		if @cost.update_attributes(cost_params)
			@cost.cbm_id = @cbm.id
			@cost.cbm_exp = @cbm.per_cbm_ex
			@cost.pur_date = @cbm.pur_date
			@cost.save
			flash[:notice] = "Cost updated successfully"
			redirect_to cbms_path
		else
			@cbm = Cbm.find(params[:cbm_id])
			render :action => :edit
		end
	end

	def destroy
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:id])
		@cost.destroy
		redirect_to cbms_path
	end

	private
  	def cost_params
    	params.require(:cost).permit(:pur_no, :cbm_exp, :per1, :conversion, :pur_date, :pur2, :arrivaldate)
  	end
end
