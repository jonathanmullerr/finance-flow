class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :date, :amount, :description
end
