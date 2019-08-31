class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # raise params.inspect -> shows params hash in an error message in browser
    # raise params.inspect

    #Query the database for Article record that matches the :id passed to the route.
     #Store query in instance variable
    @article = Article.find(params[:id])
   
    #Update the values passed from the form. The update method takes a hash of the attributes for the model as its argument.
    # Save changes to the database
    @article.update(title: params[:article][:title], description: params[:article][:description])
   
    #redirect user to the show page so they can see updated record.
    redirect_to article_path(@article)
  end
end
