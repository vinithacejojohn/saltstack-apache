Apache Installation:
 pkg.installed:
   - name: httpd
   - refresh:
 service.running:
   - name: httpd
   - enable: True
   - watch:
         - file: /etc/httpd/conf.d/myweb.com.conf

/etc/httpd/conf.d/myweb.com.conf:
   apache.configfile:
    - config:
        - VirtualHost:
            this: '*:80'
            ServerName:
              - myweb.com
            DocumentRoot: /var/www/html/myweb/

Creating the DocumentRoot:
  file.directory:
    - name: /var/www/html/myweb/
    - user: apache
    - group: apache
    - mode: 755
    - makedirs: True

Deploying the Website:
 file.managed:
  - name: /var/www/html/myweb/index.html
  - source: salt://webdeployer/files/myweb/index.html
  - user: apache
  - group: apache
  - create: True

Adding the daily cron file to check apache updates:
 file.managed:
  - name: /etc/cron.daily/apache.cron
  - source: salt://webdeployer/files/apache.cron
  - user: root
  - group: root
  - create: True
  - mode: 755
