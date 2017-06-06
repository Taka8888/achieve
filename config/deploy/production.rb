server '52.198.41.125', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/takataka/.ssh/id_rsa'
