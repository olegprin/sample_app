class CommentsController < ApplicationController


	def new
       @micropost = Micropost.new
       @comment = @micropost.comments.build(comment_params)

	end	

  def create
   @micropost = Micropost.find(params[:micropost_id])
    #@comment = @micropost.comments.create(comment_params)
    #redirect_to microposts_path(@microposts)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end



