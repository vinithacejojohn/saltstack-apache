# saltstack-apache
This state will install apache httpd and run the service. The sample configurations are provided using Salt module for Apache. There is a sample web page that will be exported to the DocumentRoot.

This project can be used to deploy on a cluster of back-end webservers for a command domain name. Its targeted on CentOS6.

## Usage
Download this repo and copy "init.sls" and "files" to  "/srv/salt/webdeployer" which is the default location for salt states. Then run the state on your minions.

```

git clone https://github.com/vinithacejojohn/saltstack-apache.git
mkdir -p /srv/salt/webdeployer
cd saltstack-apache
cp -rv init.sls files/ /srv/salt/webdeployer/
cp -rv pillar /srv/
salt "*" state.sls webdeployer
```

The Apache server is configured with temp domain name "myweb.com". You need to add it to your /etc/hosts with the apache server IP to view the page in your browser.


## Pillars
In this version, going to use pilars. So adding a directory named "pillar" which contains the file "webvars.sls" where you can update the domain name that is requried. I am using "myweb.com".

## Grains
Adding a functionality to use grains. A pillar is created with the hostname of the web server using grains. This pillar will be used as the ServerName for the VirtualHost and the domainname "myweb.com" will be the ServerAlias. So you will be able to access the web page using both the hostname of server and "myweb.com" .
