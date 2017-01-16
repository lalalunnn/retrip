class Location < ApplicationRecord
  # 'awesome_nested_set'gem使用宣言
  acts_as_nested_set

  has_many :articles
end
