class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:edit, :update, :destroy]
    def index
        @blogs = Blog.all
    end
      

    def show
        @blog = Blog.find(params[:id])
    end
    
    def new
        @blog = current_user.blogs.build
    end

    def create
        @blog = current_user.blogs.build(blog_params)
        @blog.user = current_user
        @blog.avatar = params[:blog][:avatar] if params[:blog][:avatar]
        if params[:user] && params[:user][:gender]
            @blog = current_user
            @blog.user.gender = params[:user][:gender]
        end
        if @blog.save
            flash[:success] = 'Blog post was successfully created.'
            redirect_to blogs_path
        else
            flash.now[:error] = 'There was an error creating the blog post.'
            render :new
            # redirect_to blogs_path, alert: 'Failed to create task!'
        end
    end

    def edit
    end
  
    def update
        if @blog.update(blog_params)
          redirect_to blogs_path(@blog)
        else
          render :edit
        end
    end

    def destroy
        # @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path, notice: 'Blog was successfully deleted.'
    end



    private

    def blog_params
        params.require(:blog).permit(:title, :content, :image, :avatar, user_attributes: [:gender])
    end

    def set_blog
        @blog = current_user.blogs.find(params[:id])
    end

end
