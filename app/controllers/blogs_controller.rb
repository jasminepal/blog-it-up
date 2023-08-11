class BlogsController < ApplicationController

    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blogs.find(params[:id])
    end
    
    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)
        if @blog.save
            redirect_to @blog
        else
            render 'new'
        end
    end

    def update
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to root_path, notice: 'Blog was successfully deleted.'
    end

    private

    def blog_params
        params_required(:blog).permit(:title, :content)
    end


end
