class Action < ApplicationRecord
    READ="read".freeze
    WRITE="write".freeze
    UPDATE="update".freeze
    DELETE="delete".freeze
    FULL="full".freeze

    def self.id_from_action(action)
        @actions||={}
        id = @actions[action] 
        if id.nil?
            action = Action.find_by(name: action)
            if action.present?
                id=action.id
                @actions[action]=id
            end
        end
        id
    end
end
