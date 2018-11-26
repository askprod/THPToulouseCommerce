class Item < ApplicationRecord
    belongs_to :order, optional: true
    has_and_belongs_to_many :orders
end
