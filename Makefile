.PHONY: sync diff to-home from-home help

## 同步本地 ~/.gitconfig 到仓库（默认）
sync:
	./sync-gitconfig.sh from-home

## 对比仓库 gitconfig 与 ~/.gitconfig
diff:
	./sync-gitconfig.sh diff

## 将仓库 gitconfig 应用到 ~/.gitconfig
to-home:
	./sync-gitconfig.sh to-home

## 将 ~/.gitconfig 同步到仓库
from-home:
	./sync-gitconfig.sh from-home

help:
	@echo "可用命令:"
	@echo "  make sync       同步本地 ~/.gitconfig 到仓库"
	@echo "  make diff       对比仓库与本地配置"
	@echo "  make to-home    将仓库配置应用到 ~/.gitconfig"
	@echo "  make from-home  将 ~/.gitconfig 同步到仓库"
