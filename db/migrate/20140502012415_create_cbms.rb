class CreateCbms < ActiveRecord::Migration
  def change
    create_table :cbms do |t|
      t.string :pur_no
      t.date :pur_date
      t.date :arr_date
      t.float :exp1
      t.float :conversion
      t.float :exp1a
      t.float :exp2
      t.float :exp3
      t.float :exp4
      t.float :exp5
      t.float :exp6
      t.float :exp7
      t.float :exp8
      t.float :exp9
      t.float :exp10
      t.float :no_of_ct
      t.float :per_cbm
      t.float :cbm1
      t.float :arr_cbm
      t.float :cbm
      t.float :per_cbm_ex

      t.timestamps
    end
  end
end
