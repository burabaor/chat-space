module GroupsHelper
  def user_is_member?(group_id, user_id)
    GroupMember.find_by(group_id: group_id, user_id: user_id).present? ? true : false
  end
end
