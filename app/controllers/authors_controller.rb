class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new(author_params)
    # if validations pass => redirect to author show page, else render new form again with errors
    @author.save ? (redirect_to author_path(@author)) : (render :new)
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
