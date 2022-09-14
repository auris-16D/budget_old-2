require 'rails_helper'
require 'byebug'

RSpec.describe GateKeeper, type: :module do
    context 'GateKeeper' do
        let(:user) { User.create!(email: 'user@gmailtester.com',password: 'newPassword',confirmed_at: Time.now) }
        
        context 'can_access' do
            { 'read'=> 1,'write'=>2,'update'=>3,'delete'=>4,'full'=>5 }.each do |action,id|
                let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: action)) }
                let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }

                it "expects to be granted #{action} access" do
                user
                    budget = BudgetSpace.new
                    user_resource_policy
                    expect(budget.can_access(user.id,action)).to eq true
                end
            end
        end

        context 'can_read' do
            let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: Action::READ)) }
            let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }

            it "expects to be granted read access" do
                budget = BudgetSpace.new
                user_resource_policy
                expect(budget.can_read(user.id)).to eq true
            end
        end
    end
end
