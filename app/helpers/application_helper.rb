module ApplicationHelper
  def display_flash
    if flash[:notice]
      render partial: 'shared/notices'
    elsif flash[:alert]
      render partial: 'shared/alerts'
    end
  end

  def logged_in_or_visitor
    if Current.user
      render partial: 'shared/logged_in'
    else
      render partial: 'shared/logged_out'
    end
  end

  def display_icon(group)
    if group.nil?
      'default.png'
    else
    'transmission.jpeg'
    end
  end
end
