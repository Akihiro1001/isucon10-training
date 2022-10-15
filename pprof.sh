#!/bin/bash

# 分析データのリセット
rm -rf /home/pprof/

# 公開サーバーのプロセス停止
kill -9 $(lsof -t -i :8080)

# 公開サーバー起動、分析データの収集
nohup go tool pprof -http=0.0.0.0:8080 /home/isucon/isuumo/webapp/go/isuumo http://localhost:6060/debug/pprof/profile &
