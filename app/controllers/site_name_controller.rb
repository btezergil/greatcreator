class SiteNameController < ApplicationController
  def new
    @site_name = SiteName.new
  end

  def instantiate
    @site_name = SiteName.new(site_name_params)
    @site_name.save!
    @site_name.send_later(:create_site, @site_name.name)
    redirect_to root_url
  end

  private
  def site_name_params
    params.require(:site_name).permit(:name)
  end
end
