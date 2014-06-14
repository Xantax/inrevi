class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true
  end
end


