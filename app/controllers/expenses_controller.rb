class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @categories =  Category.joins(:expenses).distinct
    @payment_methods = PaymentMethod.joins(:expenses).distinct
    
    
    @expenses = Expense.includes(:categories, :payment_methods).order(date: :desc)

    if params[:from].present?
      @expenses = @expenses.where("date >= ?", params[:from])
    end
  
    if params[:to].present?
      @expenses = @expenses.where("date <= ?", params[:to])
    end
  
    if params[:category_id].present?
      @expenses = @expenses.joins(:categories).where(categories: { id: params[:category_id] })
    end
  
    if params[:payment_method_id].present?
      @expenses = @expenses.joins(:payment_methods).where(payment_methods: { id: params[:payment_method_id] })
    end
  
    if params[:min_amount].present?
      @expenses = @expenses.where("amount >= ?", params[:min_amount])
    end
  
    if params[:max_amount].present?
      @expenses = @expenses.where("amount <= ?", params[:max_amount])
    end
    
    @total_amount = @expenses.sum(:amount)
    @average_amount = @expenses.average(:amount)
    @max_expense = @expenses.maximum(:amount)
    @min_expense = @expenses.minimum(:amount)
  

  end
  
  def show; end

  def new
    @expense = Expense.new
    @categories = Category.all
    @payment_methods = PaymentMethod.all
  end
  
  def edit
    @categories = Category.all
    @payment_methods = PaymentMethod.all
  end
  
  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Витрату створено успішно."
      redirect_to @expense
    else
      render :new
    end
  end
  


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
