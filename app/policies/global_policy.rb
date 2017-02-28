class GlobalPolicy < BasePolicy
  def rules
    return unless @user

    can! :create_group if @user.can_create_group
    can! :read_users_list

    unless @user.blocked? || @user.internal?
      can! :log_in
      can! :access_api
      can! :access_git
    end
  end
end
