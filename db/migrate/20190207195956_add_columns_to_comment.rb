class AddColumnsToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :content, :text
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :gossip, foreign_key: true
  end
end
