class CommentsController
    skip_before_action :verify_authenticity_token

    def index
      @comments = Comment.all
  
      render json: @comments, status: 200
    end
  
    def show 
      @comment = Comment.find(params[:id])
  
      render json: @comment, status: 200
    end
  
    def create
      @comment = Comment.new(permit_params)
  
      if @comment.save
          render json: [message: "Пользователь создан"], status: 200
      else
          render json: [erroe: "Ошибка"], status: 400
      end
    end
  
    def update
        @comment = Comment.find(params[:id])
        p @comment
        p params
        p params[:email]
        if @comment.update(permit_params)
            render json: [message: "Пользователь изменен"], status: 200
        else
            render json: [error: "Ошибка"], status: 400
        end
    end
  
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
  
        render json: [message: "Comment удалён"], status: 200
    end
  
    private
  
    def permit_params
        # params.require(:users).permit(:email, :password, :token_auth)
        params.require(:comment).permit(:card_id, :user_id, :content)
    end
end