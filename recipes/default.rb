#
# Cookbook Name:: far_manager
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

tightvnc = data_bag_item(node.chef_environment, 'tightvnc')


windows_package node['tightvnc']['package_name'] do
    source node['tightvnc']['url']
#    checksum node['tightvnc']['checksum']
    options "/quiet INSTALLDIR=\"#{node['tightvnc']['home']}\""
    notifies :create_if_missing, "cookbook_file[#{Chef::Config[:cookbook_path]}/tightvnc/#{tightvnc['settings_file']}]"
    notifies :run, "windows_batch[import_settings]"
#    notifies :modify, "windows_registry[HKEY_LOCAL_MACHINE\\SOFTWARE\\TightVNC\\Server]"
    notifies :restart, "service[tvnserver]"
Chef::Log.info("Installing ******77777777777"+tightvnc['settings_file'])
    action :install
end

cookbook_file "#{Chef::Config[:cookbook_path]}/tightvnc/"+tightvnc['settings_file'] do
    source tightvnc['settings_file']
    mode "0644"
    action :nothing
#    action :create_if_missing
end
            
windows_batch "import_settings" do
      code <<-EOH
      echo eg import #{Chef::Config[:cookbook_path]}/tightvnc/#{tightvnc['settings_file']}
      reg import #{Chef::Config[:cookbook_path]}/tightvnc/#{tightvnc['settings_file']}
      EOH
action :nothing
#      action :run
end

#windows_registry 'HKEY_LOCAL_MACHINE\SOFTWARE\TightVNC\Server' do
#    values 'Password' => "af2864a310c05517".chr
    #tightvnc['password']
#    type :binary
#    action :modify
#end


#
#windows_registry 'HKEY_LOCAL_MACHINE\SOFTWARE\TightVNC' do
#    values 'Password' => tightvnc['password']
#    action :modify
#end


service "tvnserver" do
    supports :restart => true
    action :nothing
end
