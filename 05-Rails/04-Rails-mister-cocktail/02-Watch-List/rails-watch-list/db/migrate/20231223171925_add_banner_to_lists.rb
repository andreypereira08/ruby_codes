class AddBannerToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :banner, :string
  end
end
