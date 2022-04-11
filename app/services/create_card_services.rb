class CreateCardServices
    attr_reader :user, :columns, :comments
  
    def iniatialize(user, columns, comments)
      @user = user
      @columns = columns
      @comments = comments
    end

    def call
      Card.new(user: @user, columns: @columns, comments: comments)
      @card.save
    end
  end