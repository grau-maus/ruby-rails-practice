# "best" practice is to define CRUD actions in the following order:
# -index
# -show
# -new
# -edit
# -create
# -update
# -destroy
# private actions are always last (unless there's a "public" syntax??)
class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destory
        redirect_to article_path(@article)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
