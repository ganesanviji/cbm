class CreateCostDetails < ActiveRecord::Migration
  def change
    create_table :cost_details do |t|
      t.string :refno_model_desc
      t.float :last_pur_price
      t.float :pur_price
      t.integer :qty
      t.float :p_com
      t.float :inr
      t.float :cbm
      t.float :cbm_ex
      t.float :p_cbm
      t.float :per1
      t.float :pur2
      t.float :sell_price
      t.float :last_sell_cbm
      t.float :last_sell_price
      t.string :last_pur_no
      t.references :cost
      t.references :model
      t.timestamps
    end
  end
end
