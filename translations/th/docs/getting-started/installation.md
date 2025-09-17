<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T20:58:42+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "th"
}
-->
# คู่มือการติดตั้งและตั้งค่า

**ก่อนหน้า:** [เอกสารหลัก](../../README.md) | **ถัดไป:** [พื้นฐาน AZD](azd-basics.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้จะช่วยคุณติดตั้งและตั้งค่า Azure Developer CLI (azd) บนระบบของคุณ คุณจะได้เรียนรู้วิธีการติดตั้งหลายรูปแบบสำหรับระบบปฏิบัติการต่าง ๆ การตั้งค่าการยืนยันตัวตน และการตั้งค่าเริ่มต้นเพื่อเตรียมสภาพแวดล้อมการพัฒนาสำหรับการใช้งาน Azure

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- ติดตั้ง Azure Developer CLI บนระบบปฏิบัติการของคุณได้สำเร็จ
- ตั้งค่าการยืนยันตัวตนกับ Azure ด้วยวิธีการหลากหลาย
- ตั้งค่าสภาพแวดล้อมการพัฒนาด้วยสิ่งที่จำเป็น
- เข้าใจตัวเลือกการติดตั้งต่าง ๆ และรู้ว่าเมื่อใดควรใช้แต่ละตัวเลือก
- แก้ไขปัญหาทั่วไปเกี่ยวกับการติดตั้งและการตั้งค่า

## ผลลัพธ์การเรียนรู้

หลังจากจบบทเรียนนี้ คุณจะสามารถ:
- ติดตั้ง azd ด้วยวิธีที่เหมาะสมสำหรับแพลตฟอร์มของคุณ
- ยืนยันตัวตนกับ Azure โดยใช้คำสั่ง `azd auth login`
- ตรวจสอบการติดตั้งและทดสอบคำสั่งพื้นฐานของ azd
- ตั้งค่าสภาพแวดล้อมการพัฒนาเพื่อการใช้งาน azd อย่างมีประสิทธิภาพ
- แก้ไขปัญหาการติดตั้งทั่วไปได้ด้วยตัวเอง

คู่มือนี้จะช่วยคุณติดตั้งและตั้งค่า Azure Developer CLI บนระบบของคุณ ไม่ว่าคุณจะใช้ระบบปฏิบัติการหรือสภาพแวดล้อมการพัฒนาแบบใด

## สิ่งที่ต้องเตรียมก่อนเริ่ม

ก่อนติดตั้ง azd ตรวจสอบให้แน่ใจว่าคุณมี:
- **การสมัครสมาชิก Azure** - [สร้างบัญชีฟรี](https://azure.microsoft.com/free/)
- **Azure CLI** - สำหรับการยืนยันตัวตนและการจัดการทรัพยากร
- **Git** - สำหรับการโคลนเทมเพลตและการควบคุมเวอร์ชัน
- **Docker** (ไม่บังคับ) - สำหรับแอปพลิเคชันที่ใช้คอนเทนเนอร์

## วิธีการติดตั้ง

### Windows

#### ตัวเลือกที่ 1: PowerShell (แนะนำ)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ตัวเลือกที่ 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### ตัวเลือกที่ 3: Chocolatey
```cmd
choco install azd
```

#### ตัวเลือกที่ 4: การติดตั้งด้วยตนเอง
1. ดาวน์โหลดเวอร์ชันล่าสุดจาก [GitHub](https://github.com/Azure/azure-dev/releases)
2. แตกไฟล์ไปที่ `C:\Program Files\azd\`
3. เพิ่มลงในตัวแปร PATH ของระบบ

### macOS

#### ตัวเลือกที่ 1: Homebrew (แนะนำ)
```bash
brew tap azure/azd
brew install azd
```

#### ตัวเลือกที่ 2: สคริปต์การติดตั้ง
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือกที่ 3: การติดตั้งด้วยตนเอง
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ตัวเลือกที่ 1: สคริปต์การติดตั้ง (แนะนำ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือกที่ 2: ตัวจัดการแพ็กเกจ

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd ถูกติดตั้งไว้ล่วงหน้าใน GitHub Codespaces เพียงสร้าง codespace และเริ่มใช้งาน azd ได้ทันที

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ตรวจสอบการติดตั้ง

หลังการติดตั้ง ตรวจสอบว่า azd ทำงานได้อย่างถูกต้อง:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

ผลลัพธ์ที่คาดหวัง:
```
azd version 1.5.0 (commit abc123)
```

## การตั้งค่าการยืนยันตัวตน

### การยืนยันตัวตนด้วย Azure CLI (แนะนำ)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### การยืนยันตัวตนด้วย Device Code
หากคุณใช้ระบบที่ไม่มีหน้าจอหรือมีปัญหาเกี่ยวกับเบราว์เซอร์:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
สำหรับสภาพแวดล้อมอัตโนมัติ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## การตั้งค่า

### การตั้งค่าทั่วไป
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### ตัวแปรสภาพแวดล้อม
เพิ่มลงในโปรไฟล์เชลล์ของคุณ (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## การผสานรวมกับ IDE

### Visual Studio Code
ติดตั้งส่วนขยาย Azure Developer CLI:
1. เปิด VS Code
2. ไปที่ Extensions (Ctrl+Shift+X)
3. ค้นหา "Azure Developer CLI"
4. ติดตั้งส่วนขยาย

ฟีเจอร์:
- IntelliSense สำหรับ azure.yaml
- คำสั่งในเทอร์มินัลแบบบูรณาการ
- การเรียกดูเทมเพลต
- การติดตามการปรับใช้

### GitHub Codespaces
สร้างไฟล์ `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. ติดตั้งปลั๊กอิน Azure
2. ตั้งค่าข้อมูลรับรอง Azure
3. ใช้เทอร์มินัลแบบบูรณาการสำหรับคำสั่ง azd

## 🐛 การแก้ไขปัญหาการติดตั้ง

### ปัญหาทั่วไป

#### Permission Denied (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### ปัญหา PATH
เพิ่ม azd ลงใน PATH ด้วยตนเอง:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### ปัญหาเครือข่าย/พร็อกซี
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### ความขัดแย้งของเวอร์ชัน
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### การขอความช่วยเหลือเพิ่มเติม
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## การอัปเดต azd

### การอัปเดตอัตโนมัติ
azd จะแจ้งเตือนเมื่อมีการอัปเดต:
```bash
azd version --check-for-updates
```

### การอัปเดตด้วยตนเอง

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## ขั้นตอนถัดไป

1. **การยืนยันตัวตนให้สมบูรณ์**: ตรวจสอบว่าคุณสามารถเข้าถึงการสมัครสมาชิก Azure ของคุณ
2. **ลองปรับใช้ครั้งแรก**: ทำตาม [คู่มือโปรเจกต์แรก](first-project.md)
3. **สำรวจเทมเพลต**: เรียกดูเทมเพลตที่มีอยู่ด้วย `azd template list`
4. **ตั้งค่า IDE ของคุณ**: ตั้งค่าสภาพแวดล้อมการพัฒนา

## การสนับสนุน

หากคุณพบปัญหา:
- [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [รายงานปัญหา](https://github.com/Azure/azure-dev/issues)
- [การสนทนาชุมชน](https://github.com/Azure/azure-dev/discussions)
- [การสนับสนุน Azure](https://azure.microsoft.com/support/)

---

**ก่อนหน้า:** [เอกสารหลัก](../../README.md) | **ถัดไป:** [พื้นฐาน AZD](azd-basics.md)

**การติดตั้งเสร็จสมบูรณ์!** ไปที่ [โปรเจกต์แรกของคุณ](first-project.md) เพื่อเริ่มต้นสร้างด้วย azd

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้