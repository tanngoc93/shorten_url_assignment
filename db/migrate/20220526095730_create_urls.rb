class CreateUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :token

      t.references :user, index: true
      t.timestamps
    end
  end
end
