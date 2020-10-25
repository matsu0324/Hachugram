class PostCommentsController < ApplicationController
  def create
    @reptile = Reptile.find(params[:reptile_id])
    reptile = Reptile.find(params[:reptile_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.reptile_id = reptile.id
    comment.save
  end

  def destroy
    @reptile = Reptile.find(params[:reptile_id])
    PostComment.find_by(id: params[:id], reptile_id: params[:reptile_id]).destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
