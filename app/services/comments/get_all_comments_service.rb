# frozen_string_literal: true

module Comments
  class GetAllCommentsService < ApplicationService
    def call
      comments = Comment.first(50)
      OpenStruct.new(comments:)
    end
  end
end
