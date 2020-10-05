class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string, :name
      t.float, :monthly_cost
      t.string, :type
      t.references :owner_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
