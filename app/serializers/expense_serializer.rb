class ExpenseSerializer < ActiveModel::Serializer
    attributes :id, :date, :amount, :description
end
  