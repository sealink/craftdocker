# craftdocker

A Craft base running on sealink/phpdocker

*   uses php7-fpm & nginx
*   uses imageMagick and php-redis
*   uses pansophy to setup configuration files during deployment

## Setup

run `docker-compose build`
then `docker-compose up`
then navigate to craft.dev/admin to see craft's installation page.

and <http://craft.dev/craftversion.txt> to see the correct version
