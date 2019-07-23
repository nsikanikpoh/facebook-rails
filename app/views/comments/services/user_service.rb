class UserService
  self.create_from_provider(provider_info)
    User.where(provider: provider_info.provider, uid: provider_info.uid).first_or_create do | user |
      user.email = provider_info.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = provider_info.info.name.split(" ")[0]
      user.last_name = provider_info.info.name.split(" ")[1]
      user.image = provider_info.info.image.gsub('http://','https://')
    end
  end
end
