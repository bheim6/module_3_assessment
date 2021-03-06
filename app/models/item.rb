class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  self.record_timestamps = false
end
