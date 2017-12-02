module ApplicationHelper
  def set_button(list, item_id)
    if list.items.find_by(id: item_id).blank?
      "btn btn-secondary btn-lg"
    else
      "btn btn-primary btn-lg"
    end
  end
end

