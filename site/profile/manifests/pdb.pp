class profile::pdb {
  class { 'puppetdb::server': }
  class { 'puppetdb::database::postgresql':
    listen_addresses => '*'
  }

  firewalld_port {'5432 postgresql':
    ensure   => present,
    zone     => 'public',
    port     => 5432,
    protocol => 'tcp',
  }

  firewalld_port {'8081 puppetdb':
    ensure   => present,
    zone     => 'public',
    port     => 8081,
    protocol => 'tcp',
  }
}
