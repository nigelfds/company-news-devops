import "base.pp"

class app inherits base {
}
 
include app

file { "/var/db/prevaylor":
   owner => root,
   group => root,
   mode => 644,
   ensure => directory
 }
 
package { "tomcat6" :
  ensure => installed
}

file {  '/etc/tomcat6/tomcat6.conf':
  ensure => present,
  source => "file://${files_dir}/tomcat6.conf",
  require => Package['tomcat6']
}

service { 'tomcat6':
    ensure => running,
    require => Package['tomcat6']
}
