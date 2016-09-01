class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.token = auth.credentials.token
      user.avatar = auth.info.image
      user.email = auth.info.email
    end
  end

  def self.service
    @service ||= GithubService.new()
  end

  # def self.find_user(params)
  #   service.
  # end
end
