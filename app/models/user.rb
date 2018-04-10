class User < ApplicationRecord
#mount_uploader :avatar, AvatarUploader
def self.sign_in_from_omniauth(auth)
 find_by(provider: auth['provider'],uid: auth['uid']) || create_user_from_omniauth(auth)
end

def self.create_user_from_omniauth(auth)
 User.create(
  	provider: auth['provider'],
        uid: auth['uid'],
        name: auth['info']['name'],
        oauth_token: auth['credentials']['token'],
        age: auth['extra']['raw_info']['age_range'],
        email: auth['info']['email'],
        gender: auth['extra']['raw_info']['gender'],
        picture: auth['info']['image'],
        #avatar: auth['info']['image']
  )
end

end
