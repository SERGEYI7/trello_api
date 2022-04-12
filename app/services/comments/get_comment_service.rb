# frozen_string_literal: true

module Comments
  class GetCommentService < ApplicationService
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def call
      comment = Comment.find_by(id:)

      return OpenStruct.new(success?: false, comment: nil, errors: ['Comment not found']) if comment.blank?

      OpenStruct.new(success?: true, comment:, errors: comment.errors.full_messages)
    end
  end
end
