require 'vlad'

##
# See the following documents for recipes:
#
# * http://clarkware.com/cgi/blosxom/2007/01/05/CustomMaintenancePages
# * http://blog.nodeta.fi/2009/03/11/stopping-your-rails-application-with-phusion-passenger/
#

namespace :vlad do
  namespace :maintenance do
    remote_task :on, :roles => [:web] do
      run "cp -f #{shared_path}/config/maintenance.html #{shared_path}/system/"
    end

    remote_task :off, :roles => [:web] do
      run "rm -f #{shared_path}/system/maintenance.html"
    end
  end
end
