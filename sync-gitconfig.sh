#!/usr/bin/env bash
# 对比 / 同步 ~/.gitconfig 与仓库中的 gitconfig
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_FILE="$REPO_DIR/gitconfig"
HOME_FILE="$HOME/.gitconfig"

usage() {
  cat <<'EOF'
用法:
  ./sync-gitconfig.sh diff       对比两个文件（仓库 vs ~/.gitconfig）
  ./sync-gitconfig.sh to-home    将仓库中的 gitconfig 同步到 ~/.gitconfig
  ./sync-gitconfig.sh from-home  将 ~/.gitconfig 同步到仓库

不带参数默认执行 diff。
EOF
}

cmd="${1:-diff}"

case "$cmd" in
  diff)
    echo "== 对比: 仓库 gitconfig  vs  ~/.gitconfig =="
    if diff -u "$REPO_FILE" "$HOME_FILE"; then
      echo "两个文件一致"
    fi
    ;;
  to-home)
    echo "== 同步: 仓库 -> ~/.gitconfig =="
    if diff -q "$REPO_FILE" "$HOME_FILE" >/dev/null; then
      echo "已一致，无需同步"
    else
      cp "$REPO_FILE" "$HOME_FILE"
      echo "已写入 ~/.gitconfig"
    fi
    ;;
  from-home)
    echo "== 同步: ~/.gitconfig -> 仓库 =="
    if diff -q "$REPO_FILE" "$HOME_FILE" >/dev/null; then
      echo "已一致，无需同步"
    else
      cp "$HOME_FILE" "$REPO_FILE"
      echo "已写入仓库 gitconfig"
    fi
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    echo "未知参数: $cmd" >&2
    usage
    exit 1
    ;;
esac
