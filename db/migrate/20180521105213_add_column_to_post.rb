class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user, index: true
    # add_column :posts, :user_id, :integer, index: true 앞에 거랑 같음
  end
end
