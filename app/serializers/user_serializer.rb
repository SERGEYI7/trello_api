class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :auth_token

  has_many :cards
  has_many :columns
  has_many :comments
end
