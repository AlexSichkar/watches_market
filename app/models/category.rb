class Category < ApplicationRecord
  has_many :watches, dependent: :destroy
end