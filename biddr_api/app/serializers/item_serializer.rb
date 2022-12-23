class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :reserve_price

  #====Custom attributes=====>
    #rename user to author to make it more understandable for the person requesting data from our api
    def author_full_name
      object.user&.full_name
    end

  #======Associations=========>
  has_many :bids

  belongs_to :user, key: :Auther 

  class BidSerializer < ActiveModel::Serializer
    attributes :id, :amount, :bidder_full_name

    # #customized method:
    # #rename user to author to make it more understandable for the person requesting data from our api
    def bidder_full_name
      object.user&.full_name
    end
  end

  class UserSerializer < ActiveModel::Serializer
    #We can rename the association with "key" in the serialized output
    attributes :id, :first_name, :last_name, :full_name
  end





end

