module Api::V1::ItemsHelper
  def literal_condition(condition)
    condition == Item.conditions.key(Item.conditions[:lost]) ? 'Hilang' : 'Ditemukan'
  end

  def anchor_from(model)
    return 1 if model.first_page?

    ((model.current_page - 1) * model.limit_value) + 1
  end

  def anchor_to(model)
    (((model.current_page - 1) * model.limit_value) + model.size)
  end
end
