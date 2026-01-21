class Store::ProductsController < Store::BaseController
  before_action :set_product, only: %i[show edit update destroy]



  def index
    @products = Product.all
  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_parmas
    if @product.save
      redirect_to store_product_path @product
    else
      render :new
    end
  end


  def show
 
  end
 
  def edit

  end

  def update
    if @product.update product_parmas
      redirect_to store_product_path @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to store_products_path
  end

 

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_parmas
      params.expect(product: %w[name description featured_image inventory_count])
    end

end
