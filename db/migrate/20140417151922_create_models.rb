class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :model_no
      t.text :description
      t.float :pur_price
      t.float :cbm
      t.float :weight
      t.float :selling_price
      t.references :reference, index: true

      t.timestamps
    end
  end
end
