class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    object.to_s.insert(-3, '.')
  end
end
