class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
