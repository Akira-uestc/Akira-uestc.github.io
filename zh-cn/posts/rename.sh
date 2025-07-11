#!/bin/bash

# 遍历所有子文件夹
find . -type d | while read dir; do
  # 找到英文文件
  en_file=$(find "$dir" -maxdepth 1 -type f -name "*.en.md" ! -name "index.en.md" | head -n 1)
  if [ -n "$en_file" ]; then
    mv "$en_file" "$dir/index.en.md"
    echo "Renamed $en_file -> $dir/index.en.md"
  fi

  # 找到中文文件
  zh_file=$(find "$dir" -maxdepth 1 -type f -name "*.zh-cn.md" ! -name "index.zh-cn.md" | head -n 1)
  if [ -n "$zh_file" ]; then
    mv "$zh_file" "$dir/index.zh-cn.md"
    echo "Renamed $zh_file -> $dir/index.zh-cn.md"
  fi
done

