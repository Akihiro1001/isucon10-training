#!/bin/bash

# alpログ解析結果を出力
# 素のalp出力
sudo cat /var/log/nginx/access.log | alp ltsv > /tmp/alp.txt
# 正規表現でグルーピングしたalp出力
# 合計降順
sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/chair/search/condition,/api/chair/search,/api/chair/low_priced,/api/chair/buy/.*,/api/estate/search/condition,/api/estate/search,/api/estate/low_priced,/api/estate/req_doc/.*,/api/estate/nazotte,/api/recommended_estate/.*,/api/chair/.*,/api/estate/.*,/images/chair/.*,/images/estate/.*,/_next/static/chunks/.*, /_next/static/.*' --sort sum -r > /tmp/alp-grouped-sum.txt
# 平均降順
sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/chair/search/condition,/api/chair/search,/api/chair/low_priced,/api/chair/buy/.*,/api/estate/search/condition,/api/estate/search,/api/estate/low_priced,/api/estate/req_doc/.*,/api/estate/nazotte,/api/recommended_estate/.*,/api/chair/.*,/api/estate/.*,/images/chair/.*,/images/estate/.*,/_next/static/chunks/.*, /_next/static/.*' --sort avg -r > /tmp/alp-grouped-avg.txt

# スロークエリ解析結果を出力
sudo pt-query-digest /var/log/mysql/mysql-slow.log > /tmp/pt-query-digest.txt
