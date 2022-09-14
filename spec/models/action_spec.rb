require 'rails_helper'

RSpec.describe Action, type: :model do
  context 'Get' do
    {'read'=> 1,'write'=>2,'update'=>3,'delete'=>4,'full'=>5}.each do |action,id|
      it "expects #{id} for action: #{action}" do
        expect(described_class.id_from_action(action)).to eq id
      end
    end
  end
end
