# Sonaric AI Node 自动化安装脚本

此项目包含一个自动化脚本，旨在帮助用户在 Linux 服务器上快速安装和配置 **Sonaric AI Node**。该脚本将引导您完成从检查系统要求到防火墙配置的整个过程，简化了 Sonaric AI Node 的部署。

## 系统要求

确保您的系统符合以下要求：

### 最低要求：
- **内存**：4 GB RAM
- **CPU 核心数**：2 核以上
- **磁盘空间**：20 GB 可用空间
- **架构**：amd64

### 推荐要求：
- **内存**：8 GB RAM 或更多
- **CPU 核心数**：4 核以上
- **磁盘空间**：100 GB 可用 SSD 存储
- **架构**：amd64

### 支持的操作系统
- Ubuntu 22.04 及以上
- Debian 12 及以上
- Fedora 40 及以上
- CentOS 8 及以上
- Rocky Linux 8 及以上

## 脚本功能


该脚本可以自动化以下任务：
1. **检查系统要求**：检查您的系统是否符合 Sonaric AI Node 的最低硬件要求。
2. **安装 Sonaric AI Node**：自动从官方源安装 Sonaric AI Node。
3. **节点注册**：通过命令行注册您的 Sonaric AI Node。
4. **防火墙配置**：自动设置防火墙规则，确保您的节点安全。
5. **最终设置**：提供安装完成后的总结信息，并建议如何保护服务器。




## 使用方法

1. **克隆此仓库**：
   ```bash
   git clone https://github.com/qiyan758/Sonaric-AI-Node.git
   cd Sonaric-AI-Node
   ```

2. **给脚本添加执行权限**：
   ```bash
   chmod +x Sonaric.sh
   ```

3. **运行脚本**：
   ```bash
   ./Sonaric.sh
   ```

4. **菜单交互**：脚本将启动一个交互式菜单，您可以选择以下选项：
   - 检查系统要求
   - 安装 Sonaric AI Node
   - 注册 Sonaric AI Node
   - 配置防火墙
   - 完成安装

   根据提示完成操作，脚本会引导您逐步完成安装和配置。

## 注意事项

- **注册节点**：在注册 Sonaric AI Node 时，您需要访问 Sonaric 的 Discord 服务器获取注册代码。脚本将提示您输入此代码以完成注册。
- **防火墙配置**：脚本会自动配置防火墙规则，但建议您检查防火墙设置以确保只有必要的端口开放。
- **安全性**：安装完成后，请确保通过禁用 root 登录、使用 SSH 密钥等措施来加固服务器的安全。

## 常见问题

### 1. 如何查看我的节点是否成功安装？
安装完成后，您可以运行以下命令来检查节点状态：
```bash
sonaric node-info
```
如果节点正常运行，您将看到节点信息。

 ✨ Node information loaded:
 ├─🧊 ID             12D3XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ├─📥 Leader         wavy-cream-yacht
 ├─🧊 Version        v1.1.0
 ...

### 2. 我可以在多个服务器上运行多个节点吗？
是的，您可以在多个服务器上安装并注册多个节点，并且所有节点可以在 Sonaric GUI 或 CLI 中集中管理。

### 3. 我遇到安装问题怎么办？
如果遇到问题，请查看脚本中的故障排除部分，或者在 [Sonaric Discord 社区](https://discord.gg/sonaric) 中寻求帮助。

## 贡献

如果您发现任何 bug 或有改进建议，欢迎提交 Issue 或 Pull Request。

## 许可证

MIT License - 请参阅 [LICENSE](LICENSE) 文件以了解更多信息。

---

感谢使用 Sonaric AI Node 自动化安装脚本！希望它能帮助您快速部署 Sonaric Node。如果有任何问题，请随时与我们联系。
```
