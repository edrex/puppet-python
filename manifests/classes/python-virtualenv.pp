/*
== Class: python::virtualenv

Install virtualenv, to help people create python-"chroots" with packages not
necessarily available in the distribution.

Usage:
  include python::virtualenv

*/
class python::virtualenv {

    include python::dev
    package { "python-virtualenv":
    ensure => present,
  }
}

class python::egg_virtualenv {
    exec { 
    "easy_install pip":
        creates => "/usr/local/bin/pip";
    
    "pip install virtualenv":
        creates => "/usr/local/bin/virtualenv",
        require => Exec["easy_install pip"]
    }
} 
