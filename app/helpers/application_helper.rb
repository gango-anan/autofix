module ApplicationHelper
  def display_flash
    if flash[:notice]
      render partial: 'shared/notices'
    elsif flash[:alert]
      render partial: 'shared/alerts'
    end
  end
end
