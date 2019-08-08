require 'resolv'
module ApplicationHelper
  def flash_class(tipo)
    case tipo
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
    end
  end

  def url_image_path(img)
    case request.host
    when Resolv::IPv4::Regex
      url = "http://" + request.host.to_s + ":3000" + "/assets/images/" + img
    else
      url = "http://" + request.host.to_s  + "/assets/images/" + img
    end
  end
end
