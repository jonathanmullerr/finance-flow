class EntrySerializer < ActiveModel::Serializer
  attributes :id, :date, :amount, :description
end
