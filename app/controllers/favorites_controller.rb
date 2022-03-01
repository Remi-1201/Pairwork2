class FavoritesController < ApplicationController  
  before_action :correct_user

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
  end

  private
  def correct_user
    @blog = Blog.find(params[:blog_id])
    if @blog.user_id == current_user.id
      redirect_back fallback_location: root_path
    end
  end
end



