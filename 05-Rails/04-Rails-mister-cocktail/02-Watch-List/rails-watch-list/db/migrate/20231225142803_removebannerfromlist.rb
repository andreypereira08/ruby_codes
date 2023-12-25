class Removebannerfromlist < ActiveRecord::Migration[7.1]
  def change
    remove_column :lists, :banner
  end
end
