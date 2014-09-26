class Cbm < ActiveRecord::Base

	has_many :costs, :dependent => :delete_all

	validates :pur_no, :pur_date, :arr_date, :exp1, :conversion, :exp1a, :exp2, :exp3, :exp4, :exp5, :exp6, :exp7, :exp8, :exp9, :exp10, :no_of_ct, :per_cbm, :cbm1, :arr_cbm, :cbm, :per_cbm_ex, :presence =>  true
	
	validates :exp1, :conversion, :exp1a, :exp2, :exp3, :exp4, :exp5, :exp6, :exp7, :exp8, :exp9, :exp10, :no_of_ct, :per_cbm, :cbm1, :arr_cbm, :cbm, :per_cbm_ex, :numericality => true
end
