
node 'gdash' {


  include my-repos
  class {'rsyslog':
    servers => '10.42.42.51';
  }
  class {'rsyslog::filelog':}
  include apache
  include my-gdash
}
