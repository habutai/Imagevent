class CreateBinaryObservers < ActiveRecord::Migration
  def change
    create_table :binary_observers do |t|

      t.timestamps
    end
  end
end
