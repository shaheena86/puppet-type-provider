class common::etc::sysctl {

        file { "/etc/sysctl.conf":

        ensure  => present,

        owner   => 'root',

        group   => 'root',

        mode    => '0644',

    }

    exec { "sysctl -p":

                alias           => "sysctl",

        refreshonly => true,

        subscribe   => File["/etc/sysctl.conf"],

    }

}

 

define common::etc::sysctl::params($options) {

    include common::etc::sysctl

        augeas { "/etc/sysctl.conf/$name":

                context => "/files/etc/sysctl.conf",

                onlyif  => "get $name != '$options'",

                changes => "set $name '$options'",

                notify  => Exec['sysctl'],

        }

}
