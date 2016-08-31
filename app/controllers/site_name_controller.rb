class SiteNameController < ApplicationController
  def new
    @site_name = SiteName.new
  end

  def instantiate
    @site_name = SiteName.new(site_name_params)
    if @site_name.save
      flash[:success] = "Your site is being deployed."
      name_and_id = @site_name.name + "*" + @site_name.id.to_s
      @site_name.send_later(:create_site, name_and_id)
      redirect_to wait_path
    else
      flash[:danger] = @site_name.errors.full_messages.to_sentence
      render "new"
    end
  end

  def wait
    @site_name = SiteName.last
  end

  private
  def site_name_params
    params.require(:site_name).permit(:name, :email)
  end
end
