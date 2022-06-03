require 'rails_helper'

RSpec.describe 'Category', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Mre Mis', email: 'example@mail.com', password: 'password') }
  let(:category) { user.categories.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png') }
  let(:payment) { user.payments.create(name: 'clothes', amount: 20) }
  let(:category_payments) { CategoryPayments.create(category_id: category.id, payment_id: payment.id) }

  describe 'GET /index' do
    before do
      sign_in user
      get new_category_payment_path(category)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
