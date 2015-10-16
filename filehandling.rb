#   shell "mkdir -p -m 700 '#{ssh_dir}'", :sudo => sudo?                                                                        
#    shell "cat >> #{ssh_dir / 'authorized_keys'}", :input => key, :sudo => sudo?
#    sudo "chown -R #{username}:#{group} '#{ssh_dir}'" unless ssh_dir.owner == username
#    sudo "chown -R #{username}:#{group} '#{ssh_dir / 'authorized_keys'}'" unless (ssh_dir / 'authorized_keys').owner == username
#    shell "chmod 600 #{(ssh_dir / 'authorized_keys')}", :sudo => sudo?
