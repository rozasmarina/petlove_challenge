class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.float :monthly_cost
      t.string :pet_type, null: false
      t.references :owner, null: false, foreign_key: true
      t.timestamps
    end
  end
end
