module CommentsHelper
  def user_is_authorized_for_comment?(comment)
    current_user && (current_user == comment.user || current_user.admin?)
  end

  def user_has_comments
    puts

    if current_user.comments.count == 0
      return false
    else
      return true
    end
  end
end
