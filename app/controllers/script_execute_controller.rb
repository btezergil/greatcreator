class ScriptExecuteController < ApplicationController

  def instantiate
    @site_name = SiteName.new
    site_name = 'denememeneme65489'
    @hostname = '162.243.39.228'
    @username = 'btezergil'
    @password = 'Tezergil_101'
    @cmd = "yes #{site_name} | ./denemescr.sh"
    begin
      ssh = Net::SSH.start(@hostname, @username, :password => @password)
      res = ssh.exec!(@cmd)
      ssh.close
      puts res
    end
    redirect_to action: 'home'
  end
end
