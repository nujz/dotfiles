# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status is-interactive
#   ...
# end

function proxy_open
  set aaa 'http://192.168.66.1:1088'
  set bbb 'localhost,127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16'
  set -gx all_proxy $aaa
  set -gx http_proxy $aaa
  set -gx https_proxy $aaa
  set -gx ftp_proxy $aaa
  set -gx no_proxy $bbb
end

function proxy_close
  set -ge all_proxy
  set -ge http_proxy
  set -ge https_proxy
  set -ge ftp_proxy
  set -ge no_proxy
end

