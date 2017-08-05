# wp-cli-page-create-sample

WP-CLIを使用して、企業サイトによくある形の固定ページを自動生成します。


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