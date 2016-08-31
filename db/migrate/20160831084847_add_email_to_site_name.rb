class AddEmailToSiteName < ActiveRecord::Migration[5.0]
  def change
    add_column :site_names, :email, :string
  end
end
