class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all

    render_success_response(@articles)
  end

  # GET /articles/1
  def show
    render_success_response(@article)
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render_exception_response(@article, status: :created)
    else
      render_exception_response(@article)
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render_success_response(@article)
    else
      render_exception_response(@article)
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    render_success_response(@article)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article ||= Article.find(params[:id])
      render_record_not_found_response() unless @article
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :description, :pub_date, :feed_id, :link, :image)
    end
end
