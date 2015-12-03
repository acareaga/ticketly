  class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :status
      t.string :name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
