#!/bin/bash
# 查看 pages 目录下的翻译情况
project_path=$(cd `dirname $0`;pwd)
page_dir=$project_path/pages/*

set zh=""
set no_zh=""
for file_url in $page_dir;do
	if [ -f "$file_url" ];then
		file_name=$(basename $file_url)
		file_name_end_fix=${file_name#*.}
		end_fix_two_ch=${file_name_end_fix:0:2}
		if [[ $end_fix_two_ch != "zh" ]];then
			zh_file=${file_url/.md/.zh.md}
			if [ ! -f "$zh_file" ];then  
				no_zh="- "$file_name'\n'$no_zh
			else
				zh="- "$file_name'\n'$zh
			fi  
		fi
	fi
done

echo "#### 未翻译"
echo -e $no_zh

echo "#### 已翻译或正在翻译"
echo -e $zh
