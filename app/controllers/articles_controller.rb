# "best" practice is to define CRUD actions in the following order:
# -index
# -show
# -new
# -edit
# -create
# -update
# -destroy
# private actions are always last (unless there's a "public" syntax??)
class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    # remember to instantiate '@article' so the form can access the actual article model
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    private
        def article_params
            # you can control which parameters in a model are updated by passing it in the 'permit' method
            params.require(:article).permit(:title, :text)
        end
end
