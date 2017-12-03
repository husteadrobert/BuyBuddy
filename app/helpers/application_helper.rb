module ApplicationHelper
  def set_button(list, item_slug)
    if list.items.find_by(slug: item_slug).blank?
      "btn btn-secondary btn-lg"
    else
      "btn btn-primary btn-lg"
    end
  end
end

