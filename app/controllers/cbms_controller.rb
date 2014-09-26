class CbmsController < ApplicationController

	def new
		@cbm = Cbm.new
	end

	def create
		@cbm = Cbm.new(cbm_params)
		@cbm.exp1a = @cbm.exp1*@cbm.conversion
		@cbm.cbm1 = @cbm.per_cbm*@cbm.no_of_ct
		@cbm.arr_cbm = @cbm.exp1 + @cbm.exp2 + @cbm.exp3 + @cbm.exp4 + @cbm.exp5 + @cbm.exp6 + @cbm.exp7 + @cbm.exp8 + @cbm.exp9 + @cbm.exp10 + @cbm.exp1a + @cbm.conversion
		@cbm.per_cbm_ex = @cbm.cbm/@cbm.cbm1
		if @cbm.save
			flash[:notice] = "Cbm created successfully"
			redirect_to cbm_path(:id => @cbm.id)
		else
			render :action => :new
		end
    end

    def index
		@cbms = Cbm.all
    end

    def show
		@cbm = Cbm.find(params[:id])
    end

    def edit
		@cbm = Cbm.find(params[:id])
    end

    def update
		@cbm = Cbm.find(params[:id])
		if @cbm.update_attributes(cbm_params)
			flash[:notice] = "CBM updated successfully"
			redirect_to cbm_path(:id => @cbm.id)
		else
			render :action => :edit
		end
    end

    def destroy
		@cbm = Cbm.find(params[:id])
		@cbm.destroy
        redirect_to home_index_path
    end

    def cbm_search
    	@cbm_search = Cbm.where("pur_no like ?", "%#{params[:cbm_search]}%")
    end


	private
  	def cbm_params
    	params.require(:cbm).permit(:pur_no, :pur_date, :arr_date, :exp1, :conversion, :exp1a, :exp2, :exp3, :exp4, :exp5, :exp6, :exp7, :exp8, :exp9, :exp10, :no_of_ct, :per_cbm, :cbm1, :arr_cbm, :cbm, :per_cbm_ex)
  	end
end
