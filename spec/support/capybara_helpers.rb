module CapybaraHelpers
  def login(user)
    ApplicationController.any_instance.stub(:current_user) { user }
  end
end
