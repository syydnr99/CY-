#!/bin/bash

# 定义目标目录
TARGET_DIR=~/cysic-verifier

# 确保目标目录存在
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "目标目录 $TARGET_DIR 不存在！请检查路径。"
    exit 1
fi

# 创建临时目录
TEMP_DIR=$(mktemp -d)
echo "临时目录创建成功：$TEMP_DIR"

echo "开始下载文件..."

# 下载文件并显示进度
wget --show-progress -O "$TEMP_DIR/libdarwin_verifier.so" https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libdarwin_verifier.so
wget --show-progress -O "$TEMP_DIR/verifier_linux" https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/verifier_linux

# 检查下载是否成功
if [[ ! -f "$TEMP_DIR/libdarwin_verifier.so" || ! -f "$TEMP_DIR/verifier_linux" ]]; then
    echo "文件下载失败，请检查网络或路径！"
    rm -rf "$TEMP_DIR"
    exit 1
fi
echo "文件下载成功。"

# 替换文件
echo "正在替换目标文件..."
mv "$TEMP_DIR/libdarwin_verifier.so" "$TARGET_DIR/libdarwin_verifier.so"
mv "$TEMP_DIR/verifier_linux" "$TARGET_DIR/verifier"

# 设置执行权限
chmod +x "$TARGET_DIR/verifier"

# 清理临时目录
rm -rf "$TEMP_DIR"

echo "文件替换完成！目标文件已更新并设置权限。"
