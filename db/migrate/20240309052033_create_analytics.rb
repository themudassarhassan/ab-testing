# frozen_string_literal: true

class CreateAnalytics < ActiveRecord::Migration[7.1]
  def change
    create_table :analytics do |t|
      t.string :user_uuid, null: false
      t.string :event_type, null: false
      t.references :version, null: false, foreign_key: true
      t.timestamps
    end
  end
end
