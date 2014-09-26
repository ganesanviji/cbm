class CostDetail < ActiveRecord::Base
	belongs_to :model
	belongs_to :cost

	validates :refno_model_desc, :last_pur_price,:pur_price,:qty, :p_com, :inr, :cbm, :cbm_ex, :p_cbm, :per1, :pur2, :sell_price, :last_sell_cbm, :last_sell_price, :last_pur_no ,:presence => true

	validates :last_pur_price, :pur_price, :p_com, :inr, :cbm, :cbm_ex, :p_cbm, :per1, :pur2, :sell_price, :last_sell_cbm, :last_sell_price,  :numericality => true

	validates :qty, :numericality => { :only_integer => true }
end
