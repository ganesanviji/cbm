class ModelsController < ApplicationController
	before_action :authenticate_user!, :only => [:index, :new, :create, :show, :edit, :update, :destroy]
	
	def new
		@model = Model.new
	end

	def create
    	@model = Model.new(model_params)
    	if @model.save
    		flash[:notice] = 'Model was successfully created.'
    		redirect_to model_path(@model)
    	else
    		render :action => :new
    	end
	end

	def show
		@model = Model.find(params[:id])
	end

    def index
    	@models = Model.all
    end

	def edit
		@model = Model.find(params[:id])
	end

	def update
		@model = Model.find(params[:id])
		if @model.update_attributes(model_params)
			flash[:notice] = 'Model was successfully updated.'
			redirect_to model_path(@model)
		else
			render :action => :edit
		end
	end

	def destroy
		@model = Model.find(params[:id])
		@model.destroy
		redirect_to models_path
	end

	private
  	def model_params
    	params.require(:model).permit(:model_no, :description, :pur_price, :cbm, :weight, :selling_price, :avatar, :reference_id)
  	end
end
