require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Jeff', email: 'jeff@mail.com', password: 'railsrails') }
  let(:category) { Category.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', author_id: user.id) }
  let(:payment) { Payment.create(name: 'Suit', amount: 12, author_id: user.id) }
  let(:payment_category) { CategoryPayments.create(category_id: category.id, payment_id: payment.id) }

  describe 'Validations' do
    context 'when valid' do
      it { expect(payment).to be_valid }
    end

    it 'valid expense_category' do
      expect(payment_category).to be_valid
    end

    it 'should valid name ' do
      payment.name = nil
      expect(payment).to_not be_valid
    end
    it 'should valid amount ' do
      payment.amount = -10
      expect(payment).to_not be_valid
    end
    it 'should valid amount ' do
      payment.amount = 10
      expect(payment).to be_valid
    end
  end
end