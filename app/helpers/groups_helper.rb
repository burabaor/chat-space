module GroupsHelper
  def user_is_member?(group_id, user_id)
    member = GroupMember.find_by(group_id: group_id, user_id: user_id)
    if member.present?
      return true
    else
      return false
    end
  end
end
