module ApplicationHelper

  def current_user_and_owner?
    current_user && current_user.owner?
  end

  def current_user_and_patron?
    current_user && current_user.patron?
  end
end
