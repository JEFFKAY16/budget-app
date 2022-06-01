class PaymentsController < ApplicationController
  def index
    @payments = Payment.order('id ASC')
  end
end
