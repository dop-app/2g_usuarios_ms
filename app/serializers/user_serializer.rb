class UserSerializer < ActiveModel::Serializer
   attributes :name, :provider, :uid, :age, :gender, :email, :picture
end
