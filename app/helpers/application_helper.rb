module ApplicationHelper
  def full_title(page_title)
    base_title = "Mika Kalathil"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  def is_active?(page)
    'current' if params[:action] == page
  end
end
