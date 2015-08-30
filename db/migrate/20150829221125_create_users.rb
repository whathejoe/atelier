class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :pasword_digest
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
