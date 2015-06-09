class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :comments, :pin_id, :event_id
  end
end
