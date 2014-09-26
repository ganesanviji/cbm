class CostDetailsController < ApplicationController

	def index
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:cost_id])
		@cost_details = CostDetail.where(:cost_id => @cost.id)
	end

	def new
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:cost_id])
		@cost_details = CostDetail.new
	end

	def create
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:cost_id])
		@cost_details = CostDetail.new(cost_details_params)
		@cost_details.cost_id = @cost.id
		@model = Model.find(@cost_details.model_id)
		@ref = Reference.find(@model.reference_id)
		@cost_details.refno_model_desc = @ref.ref_no.to_s + "-" + @model.model_no.to_s + "-" + @model.description.to_s
		@cost_details.last_pur_price = @model.pur_price
		@cost_details.last_sell_price = @model.selling_price
		@cost_details.last_pur_no = @cbm.pur_no
		@cost_details.cbm = @cbm.per_cbm_ex
		@cost_details.p_com = @cost_details.pur_price + (@cost_details.pur_price * @cost.com.to_i)/100
		@cost_details.inr = @cost_details.p_com * @cost.conversion
		@cost_details.cbm = @cbm.per_cbm_ex
		@cost_details.cbm_ex = @cost_details.cbm * @cost.cbm_exp
		@cost_details.p_cbm = @cost_details.cbm_ex + @cost_details.inr
		@cost_details.per1 = @cost_details.p_cbm + (@cost_details.p_cbm * @cost.per1)/100
		@cost_details.pur2 = @cost_details.per1 + (@cost_details.per1 * @cost.pur2)/100
		@cost_details.last_sell_cbm = @cbm.arr_cbm
		if @cost_details.save
			flash[:notice] = "Cost details created successfully"
			redirect_to cbm_cost_cost_details_path(@cbm.id, @cost.id)
		else
			@cbm = Cbm.find(params[:cbm_id])
		    @cost = Cost.find(params[:cost_id])
			render :action => :new
		end
	end

	def edit
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:cost_id])
		@cost_details = CostDetail.find(params[:id])
	end

	def update
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:cost_id])
		@cost_details = CostDetail.find(params[:id])
		#if @cost_details.save
		if @cost_details.update_attributes(cost_details_params)
			@model = Model.find(@cost_details.model_id)
			@ref = Reference.find(@model.reference_id)
			@cost_details.refno_model_desc = @ref.ref_no.to_s + "-" + @model.model_no.to_s + "-" + @model.description.to_s
			@cost_details.last_pur_price = @model.pur_price
			@cost_details.last_sell_price = @model.selling_price
			@cost_details.last_pur_no = @cbm.pur_no
			@cost_details.cbm = @cbm.per_cbm_ex
			@cost_details.p_com = @cost_details.pur_price + (@cost_details.pur_price * @cost.com.to_i)/100
			@cost_details.inr = @cost_details.p_com * @cost.conversion
			@cost_details.cbm = @cbm.per_cbm_ex
			@cost_details.cbm_ex = @cost_details.cbm * @cost.cbm_exp
			@cost_details.p_cbm = @cost_details.cbm_ex + @cost_details.inr
			@cost_details.per1 = @cost_details.p_cbm + (@cost_details.p_cbm * @cost.per1)/100
			@cost_details.pur2 = @cost_details.per1 + (@cost_details.per1 * @cost.pur2)/100
			@cost_details.last_sell_cbm = @cbm.arr_cbm
			@cost_details.save
			flash[:notice] = "Cost details updated successfully"
			redirect_to cbm_cost_cost_details_path(@cbm.id, @cost.id)
		else
			@cbm = Cbm.find(params[:cbm_id])
		    @cost = Cost.find(params[:cost_id])
			render :action => :edit
		end
	end

    def show
    	@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:cost_id])
		@cost_detail = CostDetail.find(params[:id])
    end

	def destroy
		@cbm = Cbm.find(params[:cbm_id])
		@cost = Cost.find(params[:cost_id])
		@cost_details = CostDetail.find(params[:id])
		@cost_details.destroy
		flash[:notice] = "Cost details deleted successfully"
		redirect_to cbm_cost_cost_details_path(@cbm.id, @cost.id)
	end

	private
  	def cost_details_params
    	params.require(:cost_detail).permit(:model_id, :refno_model_desc, :last_pur_price, :pur_price, :qty, :p_com, :inr, :cbm, :cbm_ex, :p_cbm, :per1, :pur2, :sell_price, :last_sell_cbm, :last_sell_price, :last_pur_no)
  	end

end
