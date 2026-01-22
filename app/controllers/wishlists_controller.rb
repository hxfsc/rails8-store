class WishlistsController < ApplicationController
  allow_unauthenticated_access only: %i[ show ]
  before_action :set_wishlist, only: %i[ edit update destroy ]


  def index
    @wishlists = Current.user.wishlists
  end

  
  def show 
    @wishlist = Wishlist.find(params[:id])
  end

  def new
    @wishlist = Wishlist.new
  end

  def edit
  end


  def create
    @wishlist = Current.user.wishlists.new wishlist_params
    if @wishlist.save
      redirect_to @wishlist, notice:"心愿单创建成功"
    else
      render :new
    end
  end

  def update
    if @wishlist.update wishlist_params
      redirect_to @wishlist, notice:"心愿单更新成功"
    else
      render :edit
    end
  end


  def destroy
    @wishlist.destroy
    redirect_to wishlists_path
  end


  private

    def set_wishlist
      @wishlist = Current.user.wishlists.find(params[:id])
    end


    def wishlist_params
      params.expect(wishlist: %w[ name ])
    end
end
