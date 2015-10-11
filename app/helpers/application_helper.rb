module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-dismissable alert-info"
      when 'success' then "alert alert-dismissable alert-success"
      when 'error' then "alert alert-dismissable alert-danger"
      when 'alert' then "alert alert-dismissable alert-danger"
    end
  end

  def product_categories
    Category.where(parent_id: [0], type:[2])
  end

  def knowledge_categories
    Category.where(parent_id: [0], type:[1])
  end

  def child_categories(parent_id)
    Category.where(parent_id: [parent_id])
  end
end
