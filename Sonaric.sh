#!/bin/bash

# 自动化安装和注册 Sonaric AI Node 的脚本

# 步骤 1: 检查系统要求
check_system_requirements() {
  echo "正在检查系统要求..."
  
  # 检查最小内存 (4 GB)
  mem_total=$(free -g | grep Mem | awk '{print $2}')
  if [ "$mem_total" -lt 4 ]; then
    echo "警告: 最小内存为 4 GB，但您的系统只有 $mem_total GB。"
    echo "建议升级内存以获得更好的性能。"
  else
    echo "系统内存充足: $mem_total GB"
  fi
  
  # 检查最小 CPU 核心数 (2 核)
  cpu_cores=$(nproc)
  if [ "$cpu_cores" -lt 2 ]; then
    echo "警告: 最小 CPU 核心数为 2，但您的系统有 $cpu_cores 核。"
    echo "建议升级 CPU 以获得更好的性能。"
  else
    echo "系统 CPU 核心数充足: $cpu_cores 核"
  fi
  
  # 检查磁盘空间 (20 GB)
  disk_space=$(df / --output=avail -h | tail -n 1 | sed 's/[A-Za-z]*//g')
  if [ "$disk_space" -lt 20 ]; then
    echo "警告: 最小磁盘空间为 20 GB，但您的系统只有 $disk_space GB。"
    echo "建议升级磁盘空间。"
  else
    echo "系统磁盘空间充足: $disk_space GB"
  fi
}

# 步骤 2: 安装 Sonaric AI Node
install_sonaric() {
  echo "正在安装 Sonaric AI Node..."
  
  # 下载并执行安装脚本
  bash -c "$(curl -fsSL https://get.sonaric.xyz/scripts/install.sh)"
  
  # 等待安装完成并检查 sonaricd 是否正在运行
  sleep 5
  sonaric_status=$(ps aux | grep sonaricd | grep -v grep)
  if [ -z "$sonaric_status" ]; then
    echo "错误: Sonaric AI Node 安装失败。请检查日志。"
    exit 1
  else
    echo "Sonaric AI Node 安装并成功启动！"
  fi
}

# 步骤 3: 使用 CLI 注册节点
register_node() {
  echo "请访问 Sonaric Discord 服务器获取您的节点注册代码。"
  echo "获得代码后，请在下方输入："
  
  # 提示用户输入注册代码
  read -p "请输入您的节点注册代码: " reg_code
  
  # 使用 CLI 注册节点
  echo "正在使用代码 $reg_code 注册节点"
  sonaric node-register "$reg_code"
  
  # 确认注册
  echo "节点注册完成。您现在应该能在 Sonaric GUI 或 Tracker 中看到此节点。"
}

# 步骤 4: 配置防火墙（可选）
configure_firewall() {
  echo "正在设置防火墙规则..."
  
  # 如果没有安装 UFW，则安装 UFW
  if ! command -v ufw &> /dev/null; then
    sudo apt-get update
    sudo apt-get install ufw -y
  fi

  # 设置默认防火墙规则为拒绝所有传入流量
  sudo ufw default deny incoming
  sudo ufw default allow outgoing
  
  # 允许特定端口（P2P）
  sudo ufw allow 44006/tcp
  sudo ufw deny 44003/tcp
  sudo ufw deny 44004/tcp
  sudo ufw deny 44005/tcp
  
  # 启用防火墙
  sudo ufw enable
  
  echo "防火墙配置成功！"
}

# 步骤 5: 最终设置
final_setup() {
  echo "Sonaric AI Node 安装和配置完成！"
  echo "您现在可以通过 Sonaric GUI 或 CLI 监控和管理您的节点。"
  echo "记住通过禁用 root 登录、使用 SSH 密钥等安全最佳实践来保护您的服务器。"
}

# 主菜单
show_menu() {
  echo "欢迎使用 Sonaric AI Node 自动化安装脚本"
  echo "-----------------------------------------------"
  echo "1. 检查系统要求"
  echo "2. 安装 Sonaric AI Node"
  echo "3. 注册 Sonaric AI Node"
  echo "4. 配置防火墙"
  echo "5. 最终设置"
  echo "6. 退出"
  
  # 获取用户输入选择
  read -p "请选择一个选项: " option
  
  case $option in
    1)
      check_system_requirements
      show_menu
      ;;
    2)
      install_sonaric
      show_menu
      ;;
    3)
      register_node
      show_menu
      ;;
    4)
      configure_firewall
      show_menu
      ;;
    5)
      final_setup
      exit 0
      ;;
    6)
      exit 0
      ;;
    *)
      echo "无效选项，请重新选择。"
      show_menu
      ;;
  esac
}

# 运行脚本
show_menu
