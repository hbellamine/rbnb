class Addcolumnbooking < ActiveRecord::Migration[5.2]
  def change
     add_column :bookings, :bookrequest, :boolean
  end
end
