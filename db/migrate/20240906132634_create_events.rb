class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|

      t.string :title,              null: false, default: ""
      t.text :description,          null: false
      t.integer :prefecture_id,     null: false
      t.date :date,                 null: false
      t.time :start_time,           null: false
      t.integer :duration_id,       null: false
      t.references :user,           null: false , foreign_key: true
      #以下任意設定
      t.integer :generation_id
      t.integer :gender_id
      t.integer :status_id

      t.timestamps
    end
  end
end
