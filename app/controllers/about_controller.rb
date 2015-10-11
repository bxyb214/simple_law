class AboutController < ApplicationController


  def index
    # Set default tab
    unless %w(us team contract).include? params[:tab]
      params[:tab] = 'us'
    end

    case params[:tab]
      when 'us'       then render 'about/us'
      when 'team'     then render 'about/team'
      when 'contract' then render 'about/contract'
    end

  end

end
