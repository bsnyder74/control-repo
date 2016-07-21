class profile::pdb {
  class { 'puppetdb::server': }
  class { 'puppetdb::database::postgresql':
    listen_addresses => '*'
  }

  firewalld_rich_rule {'5432 postgresql':
    ensure   => present,
    zone     => 'public',
    port     => {
      'port'     => 5432,
      'protocol' => 'tcp',
    }
    action   => 'accept',
  }

  firewalld_rich_rule {'8081 puppetdb':
    ensure   => present,
    zone     => 'public',
    port     => 8081,
    protocol => 'tcp',
    action   => 'accept',
  }
}
