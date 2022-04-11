class CreateCommentServices
    belongs_to :user
    belongs_to :card
    attr_reader :user, :card
  
    def iniatialize(user, card)
      @user = user
      @card = card
    end
  
    def call
      Comment.create(user: @user, card: @card)
    end
  end