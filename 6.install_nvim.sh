#!/bin/bash

# 设置你的GitLab项目名称
PROJECT_NAME="neovim"
NAMESPACE="neovim"

# 获取项目ID
PROJECT_INFO=$(curl -s "https://gitlab.b-data.ch/api/v4/projects?search=$PROJECT_NAME")
PROJECT_ID=$(echo $PROJECT_INFO | jq -r --arg NAMESPACE "$NAMESPACE" --arg PROJECT_NAME "$PROJECT_NAME" '.[] | select(.path_with_namespace == ($NAMESPACE + "/" + $PROJECT_NAME)) | .id')
# echo "Project ID: $PROJECT_ID"  # 调试信息

# 检查是否成功获取项目ID
if [ -z "$PROJECT_ID" ]; then
  echo "Error: Could not find project ID for $NAMESPACE/$PROJECT_NAME"
  exit 1
fi

# 获取最新的release信息
RELEASE_INFO=$(curl -s "https://gitlab.b-data.ch/api/v4/projects/$PROJECT_ID/releases")
# echo "Release Info: $RELEASE_INFO"  # 调试信息

# 提取最新非nightly release的下载URL
DOWNLOAD_URLS=$(echo $RELEASE_INFO | jq -r '[.[] | select(.tag_name != "nightly") | .assets.links[] | select(.name | test("nvim-linux-arm64.tar.gz|nvim-linux-amd64.tar.gz")) | .url] | .[]')
# echo "Download URLs: $DOWNLOAD_URLS"  # 调试信息

# 检查是否成功获取下载URL
if [ -z "$DOWNLOAD_URLS" ]; then
  echo "Error: Could not find download URLs for the latest non-nightly release"
  exit 1
fi

# 下载最新的release文件，排除.sha256文件
for url in $(echo "$DOWNLOAD_URLS" | grep -E 'nvim-linux-arm64.tar.gz$|nvim-linux-amd64.tar.gz$' | head -n 2); do
  filename=$(basename "$url")
  echo "Downloading $filename from $url"
  curl -L -o "$filename" "$url"
done

echo "安装nvim中"
# 判断CPU架构
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-amd64.tar.gz
    export PATH="$PATH:/opt/nvim-linux-amd64/bin"
    if ! grep -q 'export PATH="$PATH:/opt/nvim-linux-amd64/bin"' ~/.bashrc; then
        echo 'export PATH="$PATH:/opt/nvim-linux-amd64/bin"' >> ~/.bashrc
    fi
    if ! grep -q 'export PATH="$PATH:/opt/nvim-linux-amd64/bin"' ~/.zshrc; then
        echo 'export PATH="$PATH:/opt/nvim-linux-amd64/bin"' >> ~/.zshrc
    fi
elif [[ "$ARCH" == "aarch64" ]]; then
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-arm64.tar.gz
    export PATH="$PATH:/opt/nvim-linux-arm64/bin"
    if ! grep -q 'export PATH="$PATH:/opt/nvim-linux-arm64/bin"' ~/.bashrc; then
        echo 'export PATH="$PATH:/opt/nvim-linux-arm64/bin"' >> ~/.bashrc
    fi
    if ! grep -q 'export PATH="$PATH:/opt/nvim-linux-arm64/bin"' ~/.zshrc; then
        echo 'export PATH="$PATH:/opt/nvim-linux-arm64/bin"' >> ~/.zshrc
    fi
fi