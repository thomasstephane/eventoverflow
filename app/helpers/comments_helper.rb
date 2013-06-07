module CommentsHelper

  def children(list, parent)
    children = []
    list.each do |com_child|
      children << com_child if com_child.commentable_type == parent.class.to_s && com_child.commentable_id == parent.id
    end
    children
  end

end

