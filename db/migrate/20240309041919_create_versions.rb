# frozen_string_literal: true

class CreateVersions < ActiveRecord::Migration[7.1]
  def change
    create_table :versions do |t|
      t.string :content, null: false

      t.timestamps
    end
  end
end
