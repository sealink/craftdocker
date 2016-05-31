<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */
define('BASEPATH', '/app/public');

return array(

  'omitScriptNameInUrls' => true,
  'allowAutoUpdates' => false,
  'addTrailingSlashesToUrls' => true,
  'maxUploadFileSize' => 16777216, // 16MB
  'defaultImageQuality' => 75,
  'imageDriver' => 'imagick',
  'generateTransformsBeforePageLoad' => true,

  'devMode' => $_ENV['DEV'],

  'defaultCookieDomain' => $_ENV['VIRTUAL_HOST'],

  /**
   * The application ID, which is used for things like storing data caches and user sessions.
   * If it’s not set, Craft will automatically generate one based on the server path.
   * Setting it will help avoid the loss of data caches and user sessions when Craft is deployed
   * using a deployment script that will store Craft in an inconsistent location, such as Capistrano.
   */
  'appId' => $_ENV['APPID'],

  'siteUrl' => $_ENV['BASEURL'],

  'useCompressedJs' => !$_ENV['DEV'],

  'environmentVariables' => array(
      'basePath' => BASEPATH,
      'baseUrl'  => $_ENV['BASEURL']
  )

);
