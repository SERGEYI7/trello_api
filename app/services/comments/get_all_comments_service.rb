class Comments::GetAllCommentsService < ApplicationService
    def call
      comments = Comment.first(50)
      OpenStruct.new(comments: comments)
    end
  end