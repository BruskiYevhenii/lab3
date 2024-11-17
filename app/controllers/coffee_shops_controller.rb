class CoffeeShopsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_coffee_shop, only: [ :show, :edit, :update, :destroy ]

  def index
    @coffee_shops = CoffeeShop.all
  end

  def show
  end

  def new
    @coffee_shop = CoffeeShop.new
  end

  def create
    @coffee_shop = current_user.coffee_shops.build(coffee_shop_params)
    if @coffee_shop.save
      redirect_to @coffee_shop, notice: "\u041F\u0430\u043C\u2019\u044F\u0442\u043A\u0430 \u0443\u0441\u043F\u0456\u0448\u043D\u043E \u0441\u0442\u0432\u043E\u0440\u0435\u043D\u0430."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @coffee_shop.update(coffee_shop_params)
      redirect_to @coffee_shop, notice: "\u041F\u0430\u043C\u2019\u044F\u0442\u043A\u0430 \u0443\u0441\u043F\u0456\u0448\u043D\u043E \u043E\u043D\u043E\u0432\u043B\u0435\u043D\u0430."
    else
      render :edit
    end
  end

  def destroy
    @coffee_shop.destroy
    redirect_to coffee_shops_url, notice: "\u041F\u0430\u043C\u2019\u044F\u0442\u043A\u0430 \u0443\u0441\u043F\u0456\u0448\u043D\u043E \u0432\u0438\u0434\u0430\u043B\u0435\u043D\u0430."
  end

  private

  def set_coffee_shop
    @coffee_shop = CoffeeShop.find(params[:id])
  end

  def coffee_shop_params
    params.require(:coffee_shop).permit(:name, :description, :photo)
  end
end
