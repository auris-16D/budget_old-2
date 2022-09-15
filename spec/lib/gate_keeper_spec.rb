require 'rails_helper'

RSpec.describe GateKeeper, type: :module do
    context 'Policy Access control' do
        let(:user) { User.create!(email: 'user@gmailtester.com',password: 'newPassword',confirmed_at: Time.now) }
        let(:budget) { BudgetSpace.create }
        let(:budget_user) { BudgetUser.create(user_id: user.id, budget_space_id: budget.id) }

        context 'User has a BudgetUser account' do
            context 'and user has policy for each action' do    
                context '#can_access' do
                    { 'read'=> 1,'write'=>2,'update'=>3,'delete'=>4,'full'=>5 }.each do |action,id|
                        let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: action)) }
                        let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }

                        it "expects to be granted #{action} access" do
                            user_resource_policy
                            budget_user
                            expect(budget.can_access?(user.id,action)).to eq true
                        end
                    end
                end

                context '#can_read' do
                    let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: Action::READ)) }
                    let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }

                    it "expects to be granted read access" do
                        user_resource_policy
                        budget_user
                        expect(budget.can_read?(user.id)).to eq true
                    end
                end

                context '#can_write' do
                    let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: Action::WRITE)) }
                    let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }

                    it "expects to be granted write access" do
                        user_resource_policy
                        budget_user
                        expect(budget.can_write?(user.id)).to eq true
                    end
                end

                context '#can_update' do
                    let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: Action::UPDATE)) }
                    let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }

                    it "expects to be granted update access" do
                        user_resource_policy
                        budget_user
                        expect(budget.can_update?(user.id)).to eq true
                    end
                end

                context '#can_delete' do
                    let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: Action::DELETE)) }
                    let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }

                    it "expects to be granted update access" do
                        user_resource_policy
                        budget_user
                        expect(budget.can_delete?(user.id)).to eq true
                    end
                end
            end
        context ' and User has 1 policy with full permissions' do
                let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: Action::FULL)) }
                let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }
        
                it "expects to be granted read access" do
                    user_resource_policy
                    budget_user
                    expect(budget.can_read?(user.id)).to eq true
                end

                it "expects to be granted write access" do
                    user_resource_policy
                    budget_user
                    expect(budget.can_write?(user.id)).to eq true
                end

                it "expects to be granted update access" do
                    user_resource_policy
                    budget_user
                    expect(budget.can_update?(user.id)).to eq true
                end

                it "expects to be granted delete access" do
                    user_resource_policy
                    budget_user
                    expect(budget.can_delete?(user.id)).to eq true
                end
            end
        
            context 'but user does not have permissions' do
                context 'can_access' do
                    { 'read'=> 1,'write'=>2,'update'=>3,'delete'=>4,'full'=>5 }.each do |action,id|
                        it "expects NOT to be granted #{action} access" do
                            budget_user
                            expect(budget.can_access?(user.id,action)).to eq false
                        end
                    end
                end
            end
        end
        context 'When user does not have a BudgetUser account' do
            context 'but user does have permissions' do
                context '#can_access' do
                    let(:resource_policy) { ResourcePolicy.create(resource_name: 'BudgetSpace', action: Action.find_by(name: Action::FULL)) }
                    let(:user_resource_policy) { UserResourcePolicy.create(user_id: user.id, resource_policy_id: resource_policy.id) }
    
                    { 'read'=> 1,'write'=>2,'update'=>3,'delete'=>4,'full'=>5 }.each do |action,id|
                        it "expects NOT to be granted #{action} access" do
                            expect(budget.can_access?(user.id,action)).to eq false
                        end
                    end
                end
            end
        end
    end
end
