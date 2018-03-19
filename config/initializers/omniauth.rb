OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '318522255219663','73aa6e69452c96cd6307f6c0222091d5',
  scope: 'public_profile', info_fields: 'gender,age_range,email,name'
  provider :twitter, 'IMgN8UrvILhtI53AE0ZtQFcN5', 'aCjNsAVPDkS7SA16tOyzvXtkfT9a70xjrNRuZ6xjNPkhflWflU'
end


