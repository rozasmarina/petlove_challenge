class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string, :name, null:false
      t.string, :document, null:false
      t.string :birthday, null:false
      t.timestamps
    end
  end
end
