class Addcolumnlocation < ActiveRecord::Migration[5.2]
  def change
    add_column :puppies, :location, :string
  end
end
