class CommentsController < ApplicationController

    before_action :post_id

    def create 
        comment = @post.comments.create! params.require(:comment).permit(:content)
        CommentsMailer.submitted(comment).deliver_later
        redirect_to @post
    end

    private
        def post_id
            @post = Post.find(params[:post_id])
        end

end
