module ApplicationHelper
  def jqmobile_theme(segment)
    case segment
      when "data" then "c"
      when "data-count" then "e"
      when "data-divider" then "d"
    end
  end
  
end
