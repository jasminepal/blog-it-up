class BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:edit, :update, :destroy]
    def index
        @blogs = current_user.blogs.all
    end

    def show
        @blog = Blogs.find(params[:id])
    end
    
    def new
        @blog = current_user.blogs.build
    end

    def create
        @blog = current_user.blogs.build(blog_params)
        if @blog.save
            flash[:success] = 'Blog post was successfully created.'
            redirect_to blogs_path
        else
            flash.now[:error] = 'There was an error creating the blog post.'
            render :new
        end
    end

    def edit
    end
  
    def update
        if @blog.update(blog_params)
          redirect_to @blog, notice: 'Blog post was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to root_path, notice: 'Blog was successfully deleted.'
    end

    # def set_blog
    #     @blog = Blog.find(params[:id])
    # end

    private

    def blog_params
        params.require(:blog).permit(:title, :content, :image)
    end


end
