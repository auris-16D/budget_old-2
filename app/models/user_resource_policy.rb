class UserResourcePolicy < ApplicationRecord
  belongs_to :user
  belongs_to :ResourcePolicy
end
