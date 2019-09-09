class AddDetailsToStreetAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :street_addresses, :address_family_name, :string
    change_column :street_addresses, :address_family_name, :string, null: false
    add_column :street_addresses, :address_first_name, :string
    change_column :street_addresses, :address_first_name, :string, null: false
    add_column :street_addresses, :address_family_name_kana, :string
    change_column :street_addresses, :address_family_name_kana, :string, null: false
    add_column :street_addresses, :address_first_name_kana, :string
    change_column :street_addresses, :address_first_name_kana, :string, null: false
    add_column :street_addresses, :address_tell, :string
  end
end
