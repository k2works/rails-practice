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

## <a name="2">Railsアプリケーションのテスト</a>
## <a name="3">Railsのインフラと運用</a>

# 参照
+ [パーフェクトRuby on Rails](http://gihyo.jp/book/2014/978-4-7741-6516-5)
+ [Guard::LiveReload](https://github.com/guard/guard-livereload)
+ [Guard::Shell](https://github.com/guard/guard-shell)
+ [Guard::Foreman](https://github.com/J3RN/guard-foreman)
+ [Foreman](https://github.com/ddollar/foreman)
+ [TWBS Bootstrap 3.2.0 Rails gem](https://github.com/scottvrosenthal/twitter-bootswatch-rails)
