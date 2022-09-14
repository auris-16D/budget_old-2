module GateKeeper

    def can_access(user_id, action)
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

      def can_read(user_id)
        self.can_access(user_id, Action::READ)
      end
end