class ChangeOrderPostageDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default :orders, :postage, 800
  end

  def down
    change_column_default :orders, :postage, nil
  end
end
