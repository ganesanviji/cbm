class Cost < ActiveRecord::Base

	belongs_to :cbm

	has_many :cost_details, :dependent => :delete_all

	validates :pur_no, :cbm_exp, :per1, :conversion, :pur_date, :pur2, :arrivaldate, :cbm, :presence => true

	validates :cbm_exp, :per1, :pur2, :numericality => true

end
