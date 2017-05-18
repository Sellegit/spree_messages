class CreateSpreeMessage < ActiveRecord::Migration
  def change
    create_table :spree_messages do |t|
      t.string :title
      t.text :content
      t.string :message_type
      t.string :type
      t.integer :user_id
      t.integer :message_image_id
      t.string :route

      t.timestamps
    end
  end
end
