module UsersHelper
  def profile_link(text)
    link_to text, user_path(text).html_safe
  end

  def follow_button(user)
    if current_user.following?(user)
      button_to "Unfollow", unfollow_user_path, method: :delete
    else
      button_to "follow", follow_user_path
    end
  end
end