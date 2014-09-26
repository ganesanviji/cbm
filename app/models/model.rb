class Model < ActiveRecord::Base
  belongs_to :reference

  has_many :cost_details, :dependent => :delete_all

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :model_no, :pur_price, :cbm, :weight, :selling_price, :presence => true

  validates :pur_price, :cbm, :weight, :selling_price, :numericality => true, :numericality => { :greater_than_or_equal_to => 0 }


end
