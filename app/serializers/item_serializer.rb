class ItemSerializer < ActiveModel::Serializer

  attributes :title, :description, :category, :price, :seller_name, :seller_latitude, :seller_longitude, :status, :published_date

#  def attributes(*args)
#    if object.banned?
#      super.except(:seller_name, :published_date)
#    else
#      super
#    end
#  end

end
