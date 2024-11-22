#!/bin/bash

# ����Ŀ��Ŀ¼
TARGET_DIR=~/cysic-verifier

# ȷ��Ŀ��Ŀ¼����
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Ŀ��Ŀ¼ $TARGET_DIR �����ڣ�����·����"
    exit 1
fi

# �����ļ�����ʱĿ¼
TEMP_DIR=$(mktemp -d)
echo "��ʱĿ¼�����ɹ���$TEMP_DIR"

echo "���������ļ�..."
wget -q -O "$TEMP_DIR/libdarwin_verifier.so" https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libdarwin_verifier.so
wget -q -O "$TEMP_DIR/verifier_linux" https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/verifier_linux

# ��������Ƿ�ɹ�
if [[ ! -f "$TEMP_DIR/libdarwin_verifier.so" || ! -f "$TEMP_DIR/verifier_linux" ]]; then
    echo "�ļ�����ʧ�ܣ����������·����"
    rm -rf "$TEMP_DIR"
    exit 1
fi
echo "�ļ����سɹ���"

# �滻�ļ�
echo "�����滻Ŀ���ļ�..."
mv "$TEMP_DIR/libdarwin_verifier.so" "$TARGET_DIR/libdarwin_verifier.so"
mv "$TEMP_DIR/verifier_linux" "$TARGET_DIR/verifier"

# Ϊ���ļ�����ִ��Ȩ��
chmod +x "$TARGET_DIR/verifier"

# ������ʱĿ¼
rm -rf "$TEMP_DIR"

echo "�ļ��滻��ɣ�Ŀ���ļ��Ѹ��²�����Ȩ�ޡ�"
