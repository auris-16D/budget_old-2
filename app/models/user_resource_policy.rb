class UserResourcePolicy < ApplicationRecord
  belongs_to :user
  belongs_to :resource_policy
end
