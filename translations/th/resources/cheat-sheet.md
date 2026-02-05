# แผ่นโกงคำสั่ง - คำสั่ง AZD ที่จำเป็น

**อ้างอิงด่วนสำหรับทุกบท**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 เริ่มต้นอย่างรวดเร็ว**: [บทที่ 1: พื้นฐานและเริ่มต้นอย่างรวดเร็ว](../README.md#-chapter-1-foundation--quick-start)
- **🤖 คำสั่ง AI**: [บทที่ 2: การพัฒนาแบบ AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ขั้นสูง**: [บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## บทนำ

แผ่นโกงนี้รวบรวมคำสั่ง Azure Developer CLI ที่ใช้บ่อยที่สุด โดยจัดหมวดหมู่พร้อมตัวอย่างการใช้งาน เหมาะสำหรับการค้นหาอย่างรวดเร็วระหว่างการพัฒนา การแก้ไขปัญหา และการดำเนินงานประจำวันกับโปรเจกต์ azd

## เป้าหมายการเรียนรู้

เมื่อใช้แผ่นโกงนี้ คุณจะ:
- เข้าถึงคำสั่งและไวยากรณ์ Azure Developer CLI ที่จำเป็นได้ทันที
- เข้าใจการจัดหมวดหมู่คำสั่งตามฟังก์ชันและกรณีการใช้งาน
- อ้างอิงตัวอย่างการใช้งานจริงสำหรับสถานการณ์การพัฒนาและการปรับใช้ทั่วไป
- เข้าถึงคำสั่งแก้ไขปัญหาเพื่อแก้ไขปัญหาได้อย่างรวดเร็ว
- ค้นหาตัวเลือกการตั้งค่าขั้นสูงและการปรับแต่งได้อย่างมีประสิทธิภาพ
- ใช้คำสั่งจัดการสภาพแวดล้อมและการทำงานหลายสภาพแวดล้อม

## ผลลัพธ์การเรียนรู้

เมื่ออ้างอิงแผ่นโกงนี้เป็นประจำ คุณจะสามารถ:
- ใช้คำสั่ง azd ได้อย่างมั่นใจโดยไม่ต้องอ้างอิงเอกสารเต็มรูปแบบ
- แก้ไขปัญหาทั่วไปได้อย่างรวดเร็วด้วยคำสั่งวินิจฉัยที่เหมาะสม
- จัดการหลายสภาพแวดล้อมและสถานการณ์การปรับใช้อย่างมีประสิทธิภาพ
- ใช้ฟีเจอร์ขั้นสูงและตัวเลือกการตั้งค่า azd ตามความจำเป็น
- แก้ไขปัญหาการปรับใช้ด้วยลำดับคำสั่งที่เป็นระบบ
- ปรับปรุงการทำงานผ่านการใช้ทางลัดและตัวเลือก azd อย่างมีประสิทธิภาพ

## คำสั่งเริ่มต้นใช้งาน

### การตรวจสอบสิทธิ์
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### การเริ่มต้นโปรเจกต์
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## คำสั่งการปรับใช้หลัก

### ขั้นตอนการปรับใช้อย่างสมบูรณ์
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### เฉพาะโครงสร้างพื้นฐาน
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

# Provision with what-if analysis
azd provision --what-if
```

### เฉพาะแอปพลิเคชัน
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### การสร้างและการแพ็กเกจ
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 การจัดการสภาพแวดล้อม

### การดำเนินการเกี่ยวกับสภาพแวดล้อม
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### ตัวแปรสภาพแวดล้อม
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ คำสั่งการตั้งค่า

### การตั้งค่าทั่วไป
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### การตั้งค่าโปรเจกต์
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 การตรวจสอบและบันทึก

### บันทึกแอปพลิเคชัน
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### การตรวจสอบ
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ คำสั่งการบำรุงรักษา

### การล้างข้อมูล
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### การอัปเดต
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 คำสั่งขั้นสูง

### การตั้งค่าท่อและ CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### การจัดการโครงสร้างพื้นฐาน
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
```

### การจัดการบริการ
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 ขั้นตอนการทำงานด่วน

### ขั้นตอนการทำงานสำหรับการพัฒนา
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### ขั้นตอนการทำงานหลายสภาพแวดล้อม
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### ขั้นตอนการแก้ไขปัญหา
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 คำสั่งการดีบัก

### ข้อมูลการดีบัก
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### การดีบักเทมเพลต
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 คำสั่งไฟล์และไดเรกทอรี

### โครงสร้างโปรเจกต์
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 การจัดรูปแบบผลลัพธ์

### ผลลัพธ์แบบ JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ผลลัพธ์แบบตาราง
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 การรวมคำสั่งทั่วไป

### สคริปต์ตรวจสอบสุขภาพ
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### การตรวจสอบการปรับใช้
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### การเปรียบเทียบสภาพแวดล้อม
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### สคริปต์ล้างทรัพยากร
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ตัวแปรสภาพแวดล้อม

### ตัวแปรสภาพแวดล้อมทั่วไป
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 คำสั่งฉุกเฉิน

### การแก้ไขด่วน
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### คำสั่งกู้คืน
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 เคล็ดลับมือโปร

### ชื่อย่อสำหรับการทำงานที่รวดเร็ว
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### ทางลัดฟังก์ชัน
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ความช่วยเหลือและเอกสาร

### การขอความช่วยเหลือ
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### ลิงก์เอกสาร
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**เคล็ดลับ**: บุ๊กมาร์กแผ่นโกงนี้และใช้ `Ctrl+F` เพื่อค้นหาคำสั่งที่คุณต้องการอย่างรวดเร็ว!

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [การตรวจสอบก่อนการปรับใช้](../docs/pre-deployment/preflight-checks.md)
- **บทเรียนถัดไป**: [อภิธานศัพท์](glossary.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้