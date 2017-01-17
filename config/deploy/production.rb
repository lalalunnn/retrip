# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '52.197.29.76', user: 'nozawa', roles: %w{app db web}

#デプロイするサーバにsshログインする鍵の情報を記述
# set :ssh_options, keys: '~/.ssh/retrip_key_rsa'
