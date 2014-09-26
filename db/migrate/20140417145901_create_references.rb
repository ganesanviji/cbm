class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :ref_no
      t.text :note1
      t.text :note2
      t.text :note3
      t.references :user, index: true
      t.timestamps
    end
  end
end
