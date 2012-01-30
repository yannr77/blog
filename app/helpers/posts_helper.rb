module PostsHelper

  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end
  
  def admin_connected?(post)
    if admin_signed_in?
      edit = link_to 'Edit', edit_post_path(post)
      destroy = link_to 'Destroy', post, confirm: 'Are you sure?', method: :delete
      return edit + " " + destroy
    end
  end
end