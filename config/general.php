<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */
define('BASEPATH', '/usr/cms/public');

return array(

  'omitScriptNameInUrls' => true,
  'allowAutoUpdates' => false,
  'addTrailingSlashesToUrls' => true,
  'maxUploadFileSize' => 16777216, // 16MB
  'defaultImageQuality' => 75,
  'imageDriver' => 'imagick',
  'generateTransformsBeforePageLoad' => true,

  'devMode' => $$_DEV_$$,

  'defaultCookieDomain' => '$$_VIRTUAL_HOST_$$',

  /**
   * The application ID, which is used for things like storing data caches and user sessions.
   * If it’s not set, Craft will automatically generate one based on the server path.
   * Setting it will help avoid the loss of data caches and user sessions when Craft is deployed
   * using a deployment script that will store Craft in an inconsistent location, such as Capistrano.
   */
  'appId' => '$$_APPID_$$',

  'siteUrl' => '$$_BASEURL_$$',

  'useCompressedJs' => !$$_DEV_$$,

  'environmentVariables' => array(
      'basePath' => BASEPATH,
      'baseUrl'  => '$$_BASEURL_$$'
  )

);
