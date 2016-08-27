class SiteNameController < ApplicationController
  def new
    @site_name = SiteName.new
  end

  def instantiate
    @site_name = SiteName.new(site_name_params)
    @hostname = '162.243.39.228'
    @username = 'btezergil'
    @password = 'Tezergil_101'
    @cmd = "yes #{@site_name.name} | ./denemescr.sh"
    begin
      ssh = Net::SSH.start(@hostname, @username, :password => @password)
      res = ssh.exec!(@cmd)
      ssh.close
      puts res
    end
    redirect_to root_url
  end

  private
  def site_name_params
    params.require(:site_name).permit(:name)
  end
end
