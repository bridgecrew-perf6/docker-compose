FROM dockware/essentials:latest as build

COPY ./production/ .

RUN sudo chown -R www-data . && composer install --no-progress --no-interaction --no-suggest

COPY ./shopware/.env ./.env
COPY ./shopware/framework.yml ./config/packages/framework.yml
COPY ./shopware/install.lock ./install.lock
COPY ./shopware/shopware.yml ./config/packages/shopware.yml
COPY ./shopware/storefront.yml ./config/packages/storefront.yml

FROM ghcr.io/sw-in-containers/nginx:main as nginx

COPY --from=build --chown=shopware /var/www/html /var/www/html

FROM ghcr.io/sw-in-containers/php-fpm-advanced:main as php-fpm

COPY --from=build --chown=shopware /var/www/html /var/www/html
