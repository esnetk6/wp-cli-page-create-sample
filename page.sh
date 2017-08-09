#!/bin/bash


# 
# Wocker環境かどうか
# 
read -p "Is Wocker? [y/n]" ANSWER

case $ANSWER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )
		PREFIX="wocker";;
	*)
		PREFIX="";;
esac


# 
# Download sample text files
# 別にtxtファイルを用意した場合に上書きされるのを防ぐため、ダウンロードするか選択式に。
# 

read -p "Download Sample Text Files? [y/n]" DOWNLOAD_ANSWER

case $DOWNLOAD_ANSWER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )

		mkdir page-contents

		if [ $PREFIX = "wocker" ]; then
			DOWNLOAD_TXT_PREFIX="docker exec $(docker ps -q)"
		else
			DOWNLOAD_TXT_PREFIX=""
		fi

		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/company.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/company.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/company-message.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/company-message.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/company-history.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/company-history.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/access.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/access.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/facility.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/facility.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/business.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/business.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/recruit.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/recruit.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/faq.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/faq.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/contact.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/contact.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/sitemap.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/sitemap.html
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/privacy.html https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/privacy.html
		;;

esac


# 
# wp post create
# 

# 会社概要
$PREFIX wp post create page-contents/company.html --post_title="会社概要" --post_name="company" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# 会社概要 / ご挨拶
$PREFIX wp post create page-contents/company-message.html --post_title="ご挨拶" --post_name="message" --post_type="page" --post_status="publish" --page_template="default" --user="1" --post_parent=$($PREFIX wp post list --post_type="page" --field="ID" --name="company")

# 会社概要 / 沿革
$PREFIX wp post create page-contents/company-history.html --post_title="沿革" --post_name="history" --post_type="page" --post_status="publish" --page_template="default" --user="1" --post_parent=$($PREFIX wp post list --post_type="page" --field="ID" --name="company")

# アクセス
$PREFIX wp post create page-contents/access.html --post_title="アクセス" --post_name="access" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# 施設案内
$PREFIX wp post create page-contents/facility.html --post_title="施設案内" --post_name="facility" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# 業務内容
$PREFIX wp post create page-contents/business.html --post_title="業務内容" --post_name="business" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# 求人情報
$PREFIX wp post create page-contents/recruit.html --post_title="求人情報" --post_name="recruit" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# よくあるご質問
$PREFIX wp post create page-contents/faq.html --post_title="よくあるご質問" --post_name="faq" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# お問い合わせ
$PREFIX wp post create page-contents/contact.html --post_title="お問い合わせ" --post_name="contact" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# サイトマップ
$PREFIX wp post create page-contents/sitemap.html --post_title="サイトマップ" --post_name="sitemap" --post_type="page" --post_status="publish" --page_template="default" --user="1"

# プライバシーポリシー
$PREFIX wp post create page-contents/privacy.html --post_title="プライバシーポリシー" --post_name="privacy" --post_type="page" --post_status="publish" --page_template="default" --user="1"