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
    if group.nil? || group.icon.nil? && !group.picture.attached?
      'default.png'
    elsif group.picture.attached?
      group.picture
    else
      group.icon
    end
  end

  def display_form_errors(referenced_object)
    render partial: 'shared/form_errors', locals: { obj: referenced_object } if referenced_object.errors.any?
  end
end
