class FeedsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_feed, only: [:show, :update, :destroy]

  # GET /feeds
  def index
    @feeds = Feed.all

    render_success_response(@feeds)
  end

  # GET /feeds/1
  def show
    render_success_response(@feed)
  end

  # POST /feeds
  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      render_success_response(@feed, :created)
    else
      render_exception_response(@feed)
    end
  end

  # PATCH/PUT /feeds/1
  def update
    if @feed.update(feed_params)
      render_success_response(@feed)
    else
      render_exception_response(@feed)
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy
    render_success_response(@feed)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def current_feed
      @feed ||= Feed.find(params[:id])
      render_record_not_found_response() unless @feed
    end

    # Only allow a trusted parameter "white list" through.
    def feed_params
      params.fetch(:feed, {}).permit(:name, :url)
    end
end
