class SiteName < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  validates :name, presence: true, length: {maximum: 50},
            uniqueness: true
  def create_site(name)
    @hostname = '162.243.39.228'
    @username = 'btezergil'
    @password = 'Tezergil_101'
    @cmd = "yes #{name} | ./denemescr.sh"
    begin
      ssh = Net::SSH.start(@hostname, @username, :password => @password)
      res = ssh.exec!(@cmd)
      ssh.close
      puts res
    end
  end
end
