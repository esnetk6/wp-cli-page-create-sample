# wp-cli-page-create-sample

WP-CLIを使用して、企業サイトによくある形の固定ページを自動生成します。


## サーバー上で実行

※WP-CLIのインストールが完了している前提です。

### 1. SSH Login

SSHログインして、WordPressのルートに移動する。  

### 2. Download

```sh
$ curl -OL https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page.sh
```

### 3. Edit

WordPressのルートにファイルがダウンロードされるので適宜編集する。

### 4. Run

```sh
$ bash page.sh
```


## Wocker

### 1. Download

```sh
wocker ~ $ docker exec $(docker ps -q) curl -OL https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page.sh
```

### 2. Edit

Wockerのコンテナのルート（ `data/***/` ）にファイルがダウンロードされるので適宜編集する。

### 3. Run

```sh
wocker ~ $ cd $(docker inspect --format='{{(index .Mounts 0).Source}}' $(docker ps -q)) && bash page.sh
```