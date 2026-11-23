# dotfile

我的常用配置文件仓库。

## 文件

- `gitconfig` — 全局 Git 配置（对应 `~/.gitconfig`）
- `sync-gitconfig.sh` — 对比 / 同步脚本
- `Makefile` — 常用命令入口

## 使用

### make 命令

```bash
make diff       # 对比仓库 gitconfig 与 ~/.gitconfig
make sync       # 同步本地 ~/.gitconfig 到仓库（默认，备份用）
make to-home    # 将仓库 gitconfig 应用到 ~/.gitconfig
make from-home  # 将 ~/.gitconfig 同步到仓库
```

### 直接运行脚本

```bash
./sync-gitconfig.sh diff        # 对比两个文件
./sync-gitconfig.sh to-home     # 仓库 -> ~/.gitconfig
./sync-gitconfig.sh from-home   # ~/.gitconfig -> 仓库
```

不带参数默认执行 `diff`。

## 工作流

1. 本机修改 Git 配置后，执行 `make sync` 将改动备份到仓库。
2. 换新机器时，执行 `make to-home` 应用仓库中的配置。
