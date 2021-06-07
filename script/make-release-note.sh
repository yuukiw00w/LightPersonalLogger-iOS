branch=$(git branch -r | grep $1.* | head -n 1)
echo "以下は過去10件のコミットログ"
git log -10 --oneline
echo "以下は指定ブランチからのissueやjiraチケット番号"
git log --no-merges --pretty=oneline $branch.. \
  | awk '{ print $2 }' \
  | cut -f 2 -d "/" \
  | uniq | sort 
#  | tr '\n' ',' \
#  | tr -d '[]' \
#  | sed -e "s/,\$//" \
#  | printf "https://~~jira, github, etc~~/issues/?jql=issue%%20in%%20(%s)\n\n" $(cat)
