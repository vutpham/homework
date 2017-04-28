module ApplicationHelper

  def auth_token
    auth = "<input "
    auth +=  "type='hidden' "
    auth +=  "name='authenticity_token' "
    auth +=  "value=#{form_authenticity_token}>"
    puts auth
    auth.html_safe
  end


end
