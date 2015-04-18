class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.integer :age
      t.integer :weight

      t.timestamps
    end
    User.create_translation_table! :name => :string, :description => :string
  end

  def down
    User.drop_translation_table!
    drop_table :users
  end
end
