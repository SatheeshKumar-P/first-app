class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :moible_nimber
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps null: false
    end
  end
end
