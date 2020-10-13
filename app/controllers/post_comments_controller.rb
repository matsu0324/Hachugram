class PostCommentsController < ApplicationController
  def create
    reptile = Reptile.find(params[:reptile_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.reptile_id = reptile.id
    comment.save
    redirect_to reptile_path(reptile)
  end
  def destrosy
    PostComment.find_by(id: params[:id], reptile_id: prams[:reptile_id]).destroy
    redirect_to reptile_path(params[:reptile_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
