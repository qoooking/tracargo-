class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.references :item, foreign_key: true
      t.string :truck
      t.datetime :reserved_on

      t.timestamps
    end
  end
end
