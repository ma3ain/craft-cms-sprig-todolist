<?php

use craft\config\GeneralConfig;
use craft\helpers\App;

$isDev = App::env('CRAFT_ENVIRONMENT') === 'dev';
$isProd = App::env('CRAFT_ENVIRONMENT') === 'production';

$config = GeneralConfig::create()
  ->devMode(App::env('DEV_MODE') ?: 0)
  ->allowUpdates($isDev)
  ->allowAdminChanges($isDev)
  ->enableTemplateCaching(App::env('TEMPLATE_CACHE') ?: 0)
  ->enableGraphqlCaching(!$isDev)
  ->defaultWeekStartDay(1)
  ->isSystemLive(App::env('IS_SYSTEM_LIVE') ?: 0)
  ->backupOnUpdate(1)
  ->runQueueAutomatically(1)
  ->cacheDuration(0)
  ->maxRevisions(10)
  ->defaultTokenDuration(86400)
  ->enableCsrfProtection(1)
  ->limitAutoSlugsToAscii(1)
  ->convertFilenamesToAscii(true)
  ->generateTransformsBeforePageLoad(true)
  ->maxCachedCloudImageSize(3000)
  ->maxUploadFileSize('100M')
  ->omitScriptNameInUrls(true)
  ->useEmailAsUsername(false)
  ->usePathInfo(true)
  ->autoLoginAfterAccountActivation(true)
  ->loginPath('/login')
  ->setPasswordPath('/set-password')
  ->setPasswordSuccessPath('/login')
  ->setPasswordRequestPath('/reset-password')
  ->postLogoutRedirect('/')
  ->postLoginRedirect('/')
  ->errorTemplatePrefix('_errors/')
  ->defaultSearchTermOptions([
    'subLeft' => true,
    'subRight' => true,
  ])
  ->testToEmailAddress(App::env('TEST_MAIL') ?: null)
  ->resourceBasePath(dirname(__DIR__) . '/web/cpresources')

  ->aliases([
    '@web' => App::env('SITE_URL'),
    '@webroot' => dirname(__DIR__) . '/web',
  ])
  ->allowedFileExtensions([
    'jpg',
    'png',
    'jpeg',
    'gif',
    'svg',
    'mp4',
    'wov',
    'mp3',
    'wav',
    'pdf',
    'zip',
    'csv',
    'rar',
    'json',
  ])
  ->omitScriptNameInUrls();

if ($isProd) {
  $config->disabledPlugins(['elements-panel']);
}

if (!$isProd) {
  $config->disallowRobots();
}

return $config;
