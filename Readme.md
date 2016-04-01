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
salt "*" state.sls webdeployer
```

The Apache server is configured with temp domain name "myweb.com". You need to add it to your /etc/hosts with the apache server IP to view the page in your browser.
