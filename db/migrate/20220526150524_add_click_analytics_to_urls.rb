class AddClickAnalyticsToUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :click_analytics, :integer, default: 0
  end
end
