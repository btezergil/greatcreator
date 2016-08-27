class ScriptExecuteController < ApplicationController

  def instantiate
    site_name = @site_name.name

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
    redirect_to root_url
  end
end
