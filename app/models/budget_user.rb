class BudgetUser < ApplicationRecord
  belongs_to :budget_space
  belongs_to :user
end
