module PostsHelper

  def user_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end

  def user_has_posts
    if current_user.posts.count == 0
      return false
    else
      return true
    end
  end
end
