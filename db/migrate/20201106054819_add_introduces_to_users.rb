class AddIntroducesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduces, :text
  end
end
