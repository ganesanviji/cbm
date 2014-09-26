class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :pur_no
      t.float  :cbm_exp
      t.float  :per1
      t.float  :conversion
      t.datetime :pur_date
      t.float :pur2
      t.datetime :arrivaldate
      t.references :cbm
      t.timestamps
    end
  end
end
