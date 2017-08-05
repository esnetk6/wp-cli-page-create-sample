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

		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/company.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/company.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/company-message.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/company-message.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/company-history.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/company-history.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/access.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/access.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/facility.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/facility.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/business.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/business.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/recruit.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/recruit.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/faq.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/faq.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/contact.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/contact.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/sitemap.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/sitemap.txt
		$DOWNLOAD_TXT_PREFIX curl -L -o page-contents/privacy.txt https://raw.githubusercontent.com/esnetk6/wp-cli-page-create-sample/master/page-contents/privacy.txt
		;;

esac


# 
# wp post create
# 

# 会社概要
$PREFIX wp post create page-contents/company.txt --post_title="会社概要" --post_name="company" --post_type="page" --post_status="publish" --page_template="default"

# 会社概要 / ご挨拶
$PREFIX wp post create page-contents/company-message.txt --post_title="ご挨拶" --post_name="message" --post_type="page" --post_status="publish" --page_template="default" --post_parent=$($PREFIX wp post list --post_type="page" --field="ID" --name="company")

# 会社概要 / 沿革
$PREFIX wp post create page-contents/company-history.txt --post_title="沿革" --post_name="history" --post_type="page" --post_status="publish" --page_template="default" --post_parent=$($PREFIX wp post list --post_type="page" --field="ID" --name="company")

# アクセス
$PREFIX wp post create page-contents/access.txt --post_title="アクセス" --post_name="access" --post_type="page" --post_status="publish" --page_template="default"

# 施設案内
$PREFIX wp post create page-contents/facility.txt --post_title="施設案内" --post_name="facility" --post_type="page" --post_status="publish" --page_template="default"

# 業務内容
$PREFIX wp post create page-contents/business.txt --post_title="業務内容" --post_name="business" --post_type="page" --post_status="publish" --page_template="default"

# 求人情報
$PREFIX wp post create page-contents/recruit.txt --post_title="求人情報" --post_name="recruit" --post_type="page" --post_status="publish" --page_template="default"

# よくあるご質問
$PREFIX wp post create page-contents/faq.txt --post_title="よくあるご質問" --post_name="faq" --post_type="page" --post_status="publish" --page_template="default"

# お問い合わせ
$PREFIX wp post create page-contents/contact.txt --post_title="お問い合わせ" --post_name="contact" --post_type="page" --post_status="publish" --page_template="default"

# サイトマップ
$PREFIX wp post create page-contents/sitemap.txt --post_title="サイトマップ" --post_name="sitemap" --post_type="page" --post_status="publish" --page_template="default"

# プライバシーポリシー
$PREFIX wp post create page-contents/privacy.txt --post_title="プライバシーポリシー" --post_name="privacy" --post_type="page" --post_status="publish" --page_template="default"