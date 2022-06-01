class PaymentsController < ApplicationController
  def index
    @category = current_category
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.new(payment_params)
    if @payment.save
      redirect_to root_path
      flash[:success] = 'Payment has been successfully added.'
    else
      render :new
      flash[:fail] = 'Unfortunately the Payment was not created'
    end
  end

  def current_category
    @categories = current_user.categories.includes(:payments).find(params[:category_id])
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
