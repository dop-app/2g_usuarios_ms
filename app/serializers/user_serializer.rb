class UserSerializer < ActiveModel::Serializer
   attributes :id ,:name, :provider, :uid, :age, :gender, :email, :picture
end
