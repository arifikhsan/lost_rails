module Api::V1::ItemsHelper
  def literal_condition(condition)
    condition == Item.conditions.key(Item.conditions[:lost]) ? 'Hilang' : 'Ditemukan'
  end
end
