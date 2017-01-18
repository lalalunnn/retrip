# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '52.199.125.13', user: 'ec2-user', roles: %w{app db web}

#デプロイするサーバにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/retrip_key_rsa'
