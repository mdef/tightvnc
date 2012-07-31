
if kernel['machine'] =~ /x86_64/
  default['tightvnc']['url']          = "http://www.tightvnc.com/download/2.5.2/tightvnc-2.5.2-setup-64bit.msi"
#  default['tightvnc']['checksum']     = "62df458bc521001cd9a947643a84810ecbaa5a16b5c8e87d80df8e34c4a16fe2"
  default['tightvnc']['package_name'] = "TightVNC"
else
  default['tightvnc']['url']          = "http://www.tightvnc.com/download/2.5.2/tightvnc-2.5.2-setup-32bit.msi"
#  default['tightvnc']['checksum']     = "fe4807b4698ec89f82de7d85d32deaa4c772fc871537e31fb0fccf4473455cb8"
  default['tightvnc']['package_name'] = "TightVNC"
end

default['tightvnc']['home']    = "#{ENV['ProgramFiles']}\\TightVNC"
