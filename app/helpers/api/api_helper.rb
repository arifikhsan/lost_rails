module Api::ApiHelper
  def anchor_from(model)
    return 0 if model.size.zero?
    return 1 if model.first_page?

    ((model.current_page - 1) * model.limit_value) + 1
  end

  def anchor_to(model)
    (((model.current_page - 1) * model.limit_value) + model.size)
  end
end
