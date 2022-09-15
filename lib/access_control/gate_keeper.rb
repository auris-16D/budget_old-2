module GateKeeper

    def can_access?(user_id, action)
        return false unless self.is_owner? user_id

        policy = ResourcePolicy.find_by(
            resource_name: self.class.name,
            action: [Action.id_from_action(action),Action.id_from_action(Action::FULL)])

        return false if policy.nil?

        user_policy = UserResourcePolicy.find_by(
            user_id: user_id,
            resource_policy_id: policy.id
        )

        return user_policy.present?
    end

    def can_read?(user_id)
        self.can_access?(user_id, Action::READ)
    end

    def can_write?(user_id)
        self.can_access?(user_id, Action::WRITE)
    end

    def can_update?(user_id)
        self.can_access?(user_id, Action::UPDATE)
    end

    def can_delete?(user_id)
        self.can_access?(user_id, Action::DELETE)
    end

    def is_owner?(user_id)
        BudgetUser.find_by(user_id: user_id, budget_space_id: self.budget_space_id).present?
    end
end
