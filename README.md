# DBProject
Final databases project: Meme generator web app

## Welcome

Thanks for visiting this page. Above you can see the source code used to create this project.

## Commands required to setup the server

```
source /home/pi/websites/DBProject/DBProject_env/bin/activate
sudo /usr/local/bin/noip2
curl ipinfo.io/ip
cd websites/DBProject/src
uwsgi --socket :8001 --module DBProject.wsgi
```
