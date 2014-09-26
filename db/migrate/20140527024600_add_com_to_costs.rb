class AddComToCosts < ActiveRecord::Migration
  def change
    add_column :costs, :com, :float
  end
end
