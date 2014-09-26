class ReportsController < ApplicationController

	def index
		if !params[:ref_no_search].blank? || !params[:model_no_search].blank?
		@ref = Reference.find(params[:ref_no_search])
		@model = Model.where("reference_id = ? AND id = ? OR description = ?", params[:ref_no_search].to_i, params[:model_no_search].to_i, params[:desc_search])
	    
	    @cbm = Cbm.where("pur_date >= ? AND pur_date <= ? OR arr_date >= ? AND arr_date <= ?", params[:from_pur_date_search],params[:to_pur_date_search], params[:from_arr_date_search],params[:to_arr_date_search])
	    #redirect_to search_result_path
	   end
	end

	def advanced_search
		if !params[:ref_no_search].blank? || !params[:model_no_search].blank?
		@ref = Reference.find(params[:ref_no_search])
		@model = Model.where("reference_id = ? AND id = ? OR description = ?", params[:ref_no_search].to_i, params[:model_no_search].to_i, params[:desc_search])
	  
	    @cbm = Cbm.where("pur_date >= ? AND pur_date <= ? OR arr_date >= ? AND arr_date <= ?", params[:from_pur_date_search],params[:to_pur_date_search], params[:from_arr_date_search],params[:to_arr_date_search])
	    #render :search_result
	   end
	end


end
