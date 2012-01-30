module PostsHelper

  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end
  
  def links_for_admin(post)
    if admin_signed_in?
      edit = link_to 'Edit', edit_post_path(post)
      destroy = link_to 'Destroy', post, confirm: 'Are you sure?', method: :delete
      content_tag(:td, edit) + content_tag(:td, destroy)
    end
  end
end