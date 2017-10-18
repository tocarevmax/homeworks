# create_table "houses", force: :cascade do |t|
#   t.string "address", null: false
# end


class House < ApplicationRecord
  validates :address, presence: true
  has_many :person, 
        primary_key: :id,
        foreign_key: :house_id,
        class_name: 'Person'
end
