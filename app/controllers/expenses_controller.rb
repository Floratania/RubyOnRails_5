# app/controllers/expenses_controller.rb
class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @expenses = Expense.all
  end

  def show; end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Витрату успішно створено."
      redirect_to @expense
    else
      render :new
    end
  end

  def edit; end

  def update
    if @expense.update(expense_params)
      flash[:notice] = "Витрату успішно оновлено."
      redirect_to @expense
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    flash[:notice] = "Витрату успішно видалено."
    redirect_to expenses_path
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:amount, :description, :date, category_ids: [], payment_method_ids: [])
  end
end
