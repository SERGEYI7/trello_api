class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :column_id, :user_id, :description

  # belongs_to :user
  # belongs_to :columns
  # has_many :comments 
end
