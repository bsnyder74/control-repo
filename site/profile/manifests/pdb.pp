class profile::pdb {
  class { 'puppetdb::server': }
  class { 'puppetdb::database::postgresql':
    listen_addresses => '*'
  }
  #
  # Running into this bug with the firewalld module
  # https://github.com/crayfishx/puppet-firewalld/pull/46

  # firewalld_rich_rule {'5432 postgresql':
  #   ensure   => present,
  #   zone     => 'public',
  #   port     => {
  #     'port'     => 5432,
  #     'protocol' => 'tcp',
  #   },
  #   action   => 'accept',
  # }
  #
  # firewalld_rich_rule {'8081 puppetdb':
  #   ensure   => present,
  #   zone     => 'public',
  #   port     => {
  #     'port'     => 80801,
  #     'protocol' => 'tcp',
  #   },
  #   action   => 'accept',
  # }
}
