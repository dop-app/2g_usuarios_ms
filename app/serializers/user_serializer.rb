class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :age, :gender, :picture
end
