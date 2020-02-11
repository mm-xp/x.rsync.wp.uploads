# x.rsync.wp.uploads

Script designed to be ran as CRONJOB to synchronize wp's uploads folder between instances
    
    $ .sh [options]
      -d DOMAIN name of folder
      -i IP Address to pull files from

### Install 
    $ git clone https://github.com/mm-xp/x.rsync.wp.uploads.git ~/bin
    $ sudo crontab -e
    
    # SYNC WP UPLOADS
    * * * * *  /home/ubuntu/bin/x.rsync.wp.uploads/.sh -d example.com -i 172.31.6.58  >> /home/ubuntu/x.cron.log 2>&1
    # CLEAN CRON LOG
    0 0 */2 * * rm /home/ubuntu/x.cron.log; touch /home/ubnutu/x.cron.log;
