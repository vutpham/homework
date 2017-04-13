class House < ActiveRecord::Base
  has_many :residents,
    class_name: :Person,
    primary_key: :id,
    foreign_key: :house_id
end
