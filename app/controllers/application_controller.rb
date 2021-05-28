class ApplicationController < ActionController::API
  def limit_per_page
    return 20 unless params[:per_page].present?

    params[:per_page].to_i
  end

  def limit_pages
    return 0 if !params[:page].present? || params[:page].to_i < 1

    (params[:page].to_i - 1) * limit_per_page
  end

end
