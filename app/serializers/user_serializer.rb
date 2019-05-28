class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :games_won
end
