class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string, :name
      t.string, :document
      t.string :birthday

      t.timestamps
    end
  end
end
