class HomeController < ApplicationController

  include ArticlesHelper

  def downloads
    @assets=Asset.active
  end

  def get_file
    asset=Asset.find_by_alias_name(params[:alias_name])
    if asset.present?
      if asset.access_code <= params[:access_code].to_i
        send_file "#{Rails.root}/#{asset.location}"
      else
        redirect_to get_access_code_url, :alias_name=>params[:alias_name]
      end
    else
      redirect_to root_url
    end
  end

  def index
    @services=Article.published_services.by_sequence
    @gallery=Gallery.all
  end

  def services
    @articles=Article.published_services.by_sequence
  end

  def show_case
    @gallery=Gallery.all
  end

  def add_to_newsletter
    sleep(3)
    render json: {status: false, message: "Email-id can't be empty"} and return if params[:email].blank?
    subscriber=Subscriber.find_by_email(params[:email]) || Subscriber.create(email: params[:email], status: "Newslettered")
    newsletter=Newsletter.find(params[:newsletter_id])

    render json: {status: true, message: "Already in the list"} and return if subscriber.newsletter_ids.include?(newsletter.id)

    subscriber.newsletter_ids=newsletter.id
    render json: {status: true, message: "Added to the Queue"}
  end

  def submit_quote

  end

end


