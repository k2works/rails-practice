Rails再入門
===
# 目的
パーフェクトRuby on Rails再入門

# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| rvm       　　　|1.26.3        |             |
| ruby      　　　|2.1.5         |             |
| rails          |4.2.0         |             |

# 構成
+ [Railsアプリケーション開発](#1)
+ [Railsアプリケーションのテスト](#2)
+ [Railsのインフラと運用](#3)

# 詳細
## <a name="1">Railsアプリケーション開発</a>
### ER図
![ER図](./awesome_events/E-Rdiagram.png)

### イベント告知アプリケーションを作る
#### アプリケーションの作成と下準備
##### rails newでアプリケーションの作成

```bash
$ gem install rails --no-ri --no-rdoc
$ rails new awesome_events -T
```
+ _awesome_events/Gemfile_
+ _awesome_events/Procfile_
+ _awesome_events/config/environments/development.rb_

```bash
$ cd awesome_events
$ bundle
$ guard init shell
$ guard init livereload
$ guard init foreman
$ guard init yard
```

##### 独自のトップページを表示してみる
```bash
$ ./bin/rails g controller welcome index
```
+ _awesome_events/config/routes.rb_

##### Bootstrapを導入
```bash
$ rails g bootswatch:install
```
+ _awesome_events/app/views/layouts/application.html.erb_

#### OAuthを利用して「Twitterでログイン」機能を作る

+ Twitterアプリケーションの登録
  https://apps.twitter.com/app

+ Twitterアカウントでログインする機能の作成
+ omniauthのインストールと設定
  + _awesome_events/Gemfile_
  + _awesome_events/config/secrets.yml_
  + _awesome_events/config/initializers/omniauth.rb_
+ ユーザーのモデルを作成する  
+ _awesome_events/app/models/user.rb_
  + _awesome_events/db/migrate/20141229073105_create_users.rb_
+ ログイン処理を作成する  
+ _awesome_events/app/views/layouts/application.html.erb_
+ _awesome_events/app/controllers/sessions_controller.rb_
  + _awesome_events/app/models/user.rb_
  + _awesome_events/config/routes.rb_
+ ログアウト処理を作成する  
  + _awesome_events/app/controllers/sessions_controller.rb_
  + _awesome_events/app/controllers/application_controller.rb_
  + _awesome_events/app/views/layouts/application.html.erb_
  + _awesome_events/config/routes.rb_

#### イベントの登録機能を作る
+ タイムゾーンを設定する
  + _awesome_events/config/application.rb_

+ イベント用のモデルを作成する
  ```bash
  $ rails g resource event owner_id:integer name:string place:string start_time:datetime end_time:datetime content:text
  ```
  + _awesome_events/db/migrate/20141230042853_create_events.rb_
  + _awesome_events/app/models/event.rb_
  + _awesome_events/app/views/layouts/application.html.erb_

+ ログイン状態を管理する処理を作る
  + _awesome_events/app/controllers/application_controller.rb_
  + _awesome_events/app/views/layouts/application.html.erb_
  + _awesome_events/app/controllers/events_controller.rb_
  + _awesome_events/app/models/user.rb_

+ イベント用登録フォームを作る
  + _awesome_events/app/views/events/new.html.erb_

+ i18nの設定をする
  + _awesome_events/Gemfile_  
  + _awesome_events/config/application.rb_
  + _awesome_events/config/locales/ar_ja.yml_

#### イベントの閲覧機能を作る  
+ イベント詳細ページの作成
  + awesome_events/app/controllers/events_controller.rb
  + awesome_events/app/views/events/show.html.erb
  + awesome_events/app/models/event.rb

+ イベント一覧ページの作成
  + awesome_events/app/views/welcome/index.html.erb
  + awesome_events/app/controllers/welcome_controller.rb

#### イベントの編集・削除機能を作る
+ イベント編集機能を作る
  + _awesome_events/app/views/events/show.html.erb_
  + _awesome_events/app/models/event.rb_
  + _awesome_events/app/controllers/events_controller.rb_
  + _awesome_events/app/views/events/edit.html.erb_
+ イベント削除機能を作る
  + _awesome_events/app/views/events/show.html.erb_
  + _awesome_events/app/controllers/events_controller.rb_

#### 登録されたイベントへの参加機能、参加キャンセル機能を作る
+ イベント参加機能の追加
  + _awesome_events/app/controllers/tickets_controller.rb_
  + _awesome_events/db/migrate/20141230082456_create_tickets.rb_
  + _awesome_events/app/models/ticket.rb_
  + _awesome_events/app/models/user.rb_
  + _awesome_events/app/models/event.rb_
  + _awesome_events/app/views/events/show.html.erb_
  + _awesome_events/app/controllers/tickets_controller.rb_
  + _awesome_events/app/assets/javascripts/tickets.js.coffee_
  + _awesome_events/config/locales/ar_ja.yml_
  + _awesome_events/app/helpers/application_helper.rb_
  + _awesome_events/app/controllers/events_controller.rb_
+ イベント参加をキャンセルする機能の作成
  + _awesome_events/app/views/events/show.html.erb_
  + _awesome_events/app/controllers/events_controller.rb_
  + _awesome_events/app/controllers/tickets_controller.rb_
  + _awesome_events/app/models/ticket.rb_

#### 退会機能を作る
+ 退会用コントーローラ、ビュー、ルーティングの作成
    ```bash
    $ rails g controller users
    ```
    + _awesome_events/app/views/layouts/application.html.erb_
    + _awesome_events/app/views/users/retire.html.erb_
    + _awesome_events/config/routes.rb_
+ 退会処理の作成
    + _awesome_events/app/controllers/users_controller.rb_
    + _awesome_events/app/models/user.rb_
    + _awesome_events/app/views/events/show.html.erb_  

#### 落穂ひろい
+ エラーハンドリング
    + awesome_events/app/controllers/application_controller.rb
    + awesome_events/app/views/application/error404.html.erb
    + awesome_events/app/views/application/error500.html.erb
    + awesome_events/config/routes.rb

#### gemで機能拡張をする
+ Kaminariでページネーション機能を作る
  + _awesome_events/Gemfile_
  + _awesome_events/app/controllers/welcome_controller.rb_
  + _awesome_events/app/views/welcome/index.html.erb_
  + _awesome_events/config/locales/kaminari_ja.yml_
+ ransackでイベント検索機能を作る
  + _awesome_events/app/views/welcome/index.html.erb_
  + _awesome_events/app/controllers/welcome_controller.rb_
  + _awesome_events/app/models/event.rb_
+ carrierwaveで画像を添付する
  ```bash
  $ rails g migration add_event_image_to_event event_image
  $ rake db:migrate
  $ rails g uploader event_image
  $ brew install imagemagick
  ```
  + _awesome_events/app/models/event.rb_
  + _awesome_events/app/views/events/new.html.erb_
  + _awesome_events/app/views/events/edit.html.erb_
  + _awesome_events/app/controllers/events_controller.rb_
  + _awesome_events/app/views/events/show.html.erb_
+ アップロードにおけるその他の注意点
  + _awesome_events/app/uploaders/event_image_uploader.rb_
  + _awesome_events/config/locales/ar_ja.yml_
  + _awesome_events/config/locales/kaminari_ja.yml_



## <a name="2">Railsアプリケーションのテスト</a>
## <a name="3">Railsのインフラと運用</a>

# 参照
+ [パーフェクトRuby on Rails](http://gihyo.jp/book/2014/978-4-7741-6516-5)
+ [Guard::LiveReload](https://github.com/guard/guard-livereload)
+ [Guard::Shell](https://github.com/guard/guard-shell)
+ [Guard::Foreman](https://github.com/J3RN/guard-foreman)
+ [Foreman](https://github.com/ddollar/foreman)
+ [TWBS Bootstrap 3.2.0 Rails gem](https://github.com/scottvrosenthal/twitter-bootswatch-rails)
+ [Rails Locale Data Repository](https://github.com/svenfuchs/rails-i18n)
