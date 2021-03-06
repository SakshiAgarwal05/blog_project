# frozen_string_literal: true

# app/models/user.rb
class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  belongs_to :user
  validates :user_id, presence: true
end
