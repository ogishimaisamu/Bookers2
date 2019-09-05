class CreateAlls < ActiveRecord::Migration[5.2]
  def change
    create_table :alls do |t|
      t.string :top

      t.timestamps
    end
  end
end
