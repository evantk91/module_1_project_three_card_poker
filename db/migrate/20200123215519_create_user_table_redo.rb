class CreateUserTableRedo < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :purse
    end
  end
end
