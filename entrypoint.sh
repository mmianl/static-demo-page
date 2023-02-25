#!/bin/bash

set -eux

echo $IMAGE

if [[ $IMAGE == "ales-krivec" ]]; then
  SOURCE='Photo by <a href="https:\/\/unsplash.com\/@aleskrivec?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Ales Krivec<\/a> on <a href="https:\/\/unsplash.com\/photos\/4miBe6zg5r0?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash<\/a>'
elif [[ $IMAGE == "yf-wu" ]]; then
  SOURCE='Photo by <a href="https:\/\/unsplash.com\/@nnonno?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">YF Wu<\/a> on <a href="https:\/\/unsplash.com\/photos\/2B1JBJ6EXRA?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash<\/a>'
elif [[ $IMAGE == "lerone-pieters" ]]; then
  SOURCE='Photo by <a href="https:\/\/unsplash.com\/@thevantagepoint718?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Lerone Pieters<\/a> on <a href="https:\/\/unsplash.com\/photos\/5PwPSgfXJQc?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash<\/a>'
elif [[ $IMAGE == "maeva-vigier" ]]; then
  SOURCE='Photo by <a href="https:\/\/unsplash.com\/@maeva_vgr?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Maëva Vigier<\/a> on <a href="https:\/\/unsplash.com\/photos\/VZb78z4f7gE?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash<\/a>'
elif [[ $IMAGE == "irfan-simsar" ]]; then
  SOURCE='Photo by <a href="https:\/\/unsplash.com\/es\/@irfansimsar?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">İrfan Simsar<\/a> on <a href="https:\/\/unsplash.com\/photos\/Hcge9Ao6O5g?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash<\/a>'
else
  exit 1
fi

sed 's/{{HEADER}}/'"$HEADER"'/' -i /usr/share/nginx/html/index.html
sed 's/{{TEXT}}/'"$TEXT"'/' -i /usr/share/nginx/html/index.html
sed 's/{{IMAGE}}/'"$IMAGE"'/' -i /usr/share/nginx/html/index.html
sed 's/{{SOURCE}}/'"$SOURCE"'/' -i /usr/share/nginx/html/index.html
