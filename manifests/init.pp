class { 'mcollective':
  stomp_host           => 'mq.example42.com',
  stomp_user           => 'mcollective',
  stomp_password       => 'private_server',
  stomp_admin          => 'admin',
  stomp_admin_password => 'private_client',
  psk                  => 'aSecretPreSharedKey',
  install_client       => false,
  install_stomp_server => true,
}
