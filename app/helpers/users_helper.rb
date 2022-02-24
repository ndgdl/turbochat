module UsersHelper
  def gravatar_for(user, options = { size: 80, class: "gravatar" })
    size         = options[:size]
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "#{ options[:class] }")
  end
end
