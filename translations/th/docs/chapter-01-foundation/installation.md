# Installation & Setup Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

คู่มือแบบครบวงจรนี้จะช่วยคุณติดตั้งและกำหนดค่า Azure Developer CLI (azd) บนระบบของคุณ คุณจะได้เรียนรู้วิธีการติดตั้งหลายแบบสำหรับระบบปฏิบัติการที่แตกต่างกัน การตั้งค่าการพิสูจน์ตัวตน และการกำหนดค่าเริ่มต้นเพื่อเตรียมสภาพแวดล้อมการพัฒนาของคุณสำหรับการปรับใช้บน Azure

## Learning Goals

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- ติดตั้ง Azure Developer CLI บนระบบปฏิบัติการของคุณได้สำเร็จ
- กำหนดค่าการพิสูจน์ตัวตนกับ Azure ด้วยวิธีต่าง ๆ
- ตั้งค่าสภาพแวดล้อมการพัฒนาด้วยสิ่งที่จำเป็นก่อนเริ่มต้น
- เข้าใจตัวเลือกการติดตั้งที่แตกต่างกันและการใช้งานในแต่ละแบบ
- แก้ไขปัญหาการติดตั้งและการตั้งค่าที่พบบ่อยได้

## Learning Outcomes

หลังจากทำบทเรียนนี้เสร็จ คุณจะสามารถ:
- ติดตั้ง azd โดยใช้วิธีที่เหมาะสมกับแพลตฟอร์มของคุณ
- พิสูจน์ตัวตนกับ Azure ด้วยคำสั่ง azd auth login
- ตรวจสอบการติดตั้งและทดสอบคำสั่ง azd พื้นฐาน
- กำหนดค่าสภาพแวดล้อมการพัฒนาให้ใช้งาน azd ได้อย่างมีประสิทธิภาพ
- แก้ไขปัญหาการติดตั้งทั่วไปด้วยตนเองได้

คู่มือนี้จะช่วยให้คุณติดตั้งและกำหนดค่า Azure Developer CLI บนระบบของคุณ ไม่ว่าจะใช้ระบบปฏิบัติการหรือสภาพแวดล้อมการพัฒนาแบบใดก็ตาม

## Prerequisites

ก่อนติดตั้ง azd ให้แน่ใจว่าคุณมี:
- **Azure subscription** - [สร้างบัญชีฟรี](https://azure.microsoft.com/free/)
- **Azure CLI** - สำหรับการพิสูจน์ตัวตนและจัดการทรัพยากร
- **Git** - สำหรับโคลนเทมเพลตและควบคุมเวอร์ชัน
- **Docker** (ตัวเลือก) - สำหรับแอปพลิเคชันแบบคอนเทนเนอร์

## Installation Methods

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# รันในฐานะผู้ดูแลระบบหรือด้วยสิทธิ์ที่สูงขึ้น
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. ดาวน์โหลดรุ่นล่าสุดจาก [GitHub](https://github.com/Azure/azure-dev/releases)
2. แตกไฟล์ไปที่ `C:\Program Files\azd\`
3. เพิ่มลงในตัวแปรสภาพแวดล้อม PATH

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# ดาวน์โหลดและติดตั้ง
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# เพิ่มที่เก็บแพ็กเกจ Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# ติดตั้ง azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# เพิ่มที่เก็บแพ็กเกจของ Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd ติดตั้งไว้ล่วงหน้าใน GitHub Codespaces เพียงแค่สร้าง codespace แล้วเริ่มใช้งาน azd ได้ทันที

### Docker

```bash
# รัน azd ในคอนเทนเนอร์
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# สร้างนามแฝงเพื่อความสะดวกในการใช้งาน
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verify Installation

หลังการติดตั้ง ให้ตรวจสอบว่า azd ทำงานถูกต้อง:

```bash
# ตรวจสอบเวอร์ชัน
azd version

# ดูคำแนะนำ
azd --help

# รายการแม่แบบที่มีอยู่
azd template list
```

ผลลัพธ์ที่คาดหวัง:
```
azd version 1.x.x (commit xxxxxx)
```

**หมายเหตุ**: ตัวเลขเวอร์ชันจริงจะแตกต่างกัน ตรวจสอบได้ที่ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) สำหรับเวอร์ชันล่าสุด

**✅ รายการตรวจสอบความสำเร็จในการติดตั้ง:**
- [ ] `azd version` แสดงหมายเลขเวอร์ชันโดยไม่มีข้อผิดพลาด
- [ ] `azd --help` แสดงเอกสารคำสั่ง
- [ ] `azd template list` แสดงเทมเพลตที่มีอยู่
- [ ] `az account show` แสดง Azure subscription ของคุณ
- [ ] คุณสามารถสร้างไดเรกทอรีทดสอบและรัน `azd init` ได้สำเร็จ

**ถ้าทุกการตรวจสอบผ่าน คุณพร้อมที่จะไปยัง [Your First Project](first-project.md) แล้ว!**

## Authentication Setup

### Azure CLI Authentication (Recommended)
```bash
# ติดตั้ง Azure CLI หากยังไม่ได้ติดตั้ง
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# เข้าสู่ระบบ Azure
az login

# ตรวจสอบการยืนยันตัวตน
az account show
```

### Device Code Authentication
ถ้าคุณใช้งานบนระบบที่ไม่มี UI หรือมีปัญหาเกี่ยวกับเบราว์เซอร์:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
สำหรับสภาพแวดล้อมแบบอัตโนมัติ:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Global Configuration
```bash
# ตั้งค่าการสมัครสมาชิกเริ่มต้น
azd config set defaults.subscription <subscription-id>

# ตั้งค่าตำแหน่งเริ่มต้น
azd config set defaults.location eastus2

# ดูการตั้งค่าทั้งหมด
azd config list
```

### Environment Variables
เพิ่มในโปรไฟล์ shell ของคุณ (`.bashrc`, `.zshrc`, `.profile`):
```bash
# การกำหนดค่า Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# การกำหนดค่า azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # เปิดใช้งานการบันทึกดีบัก
```

## IDE Integration

### Visual Studio Code
ติดตั้งส่วนขยาย Azure Developer CLI:
1. เปิด VS Code
2. ไปที่ Extensions (Ctrl+Shift+X)
3. ค้นหา "Azure Developer CLI"
4. ติดตั้งส่วนขยาย

ฟีเจอร์:
- IntelliSense สำหรับ azure.yaml
- คำสั่งเทอร์มินัลแบบบูรณาการ
- การเรียกดูเทมเพลต
- การตรวจสอบการปรับใช้

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
2. กำหนดค่า Azure credentials
3. ใช้เทอร์มินัลแบบบูรณาการสำหรับคำสั่ง azd

## 🐛 Troubleshooting Installation

### Common Issues

#### Permission Denied (Windows)
```powershell
# เรียกใช้ PowerShell ในฐานะผู้ดูแลระบบ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH Issues
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

#### Network/Proxy Issues
```bash
# กำหนดค่าพร็อกซี
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# ข้ามการตรวจสอบ SSL (ไม่แนะนำสำหรับใช้งานจริง)
azd config set http.insecure true
```

#### Version Conflicts
```bash
# ลบการติดตั้งเก่า
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# ล้างการกำหนดค่า
rm -rf ~/.azd
```

### Getting More Help
```bash
# เปิดใช้งานการบันทึกข้อมูลดีบัก
export AZD_DEBUG=true
azd <command> --debug

# ดูการตั้งค่าปัจจุบัน
azd config list

# ดูสถานะการปรับใช้ปัจจุบัน
azd show
```

## Updating azd

### Automatic Updates
azd จะแจ้งเตือนเมื่อมีการอัปเดต:
```bash
azd version --check-for-updates
```

### Manual Updates

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

## 💡 Frequently Asked Questions

<details>
<summary><strong>ความแตกต่างระหว่าง azd และ az CLI คืออะไร?</strong></summary>

**Azure CLI (az)**: เครื่องมือระดับต่ำสำหรับจัดการทรัพยากร Azure ทีละรายการ
- `az webapp create`, `az storage account create`
- จัดการทีละทรัพยากร
- มุ่งเน้นการจัดการโครงสร้างพื้นฐาน

**Azure Developer CLI (azd)**: เครื่องมือระดับสูงสำหรับการปรับใช้แอปพลิเคชันทั้งหมด
- `azd up` ปรับใช้แอปทั้งหมดรวมทั้งทรัพยากร
- ใช้เวิร์กโฟลว์แบบเทมเพลต
- เน้นประสิทธิภาพการทำงานของนักพัฒนา

**คุณต้องใช้ทั้งสองตัว**: azd ใช้ az CLI เพื่อการพิสูจน์ตัวตน
</details>

<details>
<summary><strong>ฉันใช้ azd กับทรัพยากร Azure ที่มีอยู่ได้ไหม?</strong></summary>

ได้! คุณสามารถ:
1. นำเข้าทรัพยากรที่มีอยู่เข้าสู่สภาพแวดล้อม azd
2. อ้างอิงทรัพยากรที่มีอยู่ในเทมเพลต Bicep ของคุณ
3. ใช้ azd สำหรับการปรับใช้ใหม่ควบคู่ไปกับโครงสร้างพื้นฐานเดิม

ดูเพิ่มเติมได้ที่ [Configuration Guide](configuration.md)
</details>

<details>
<summary><strong>azd ใช้งานกับ Azure Government หรือ Azure China ได้ไหม?</strong></summary>

ได้แน่นอน ให้ตั้งค่าคลาวด์:
```bash
# Azure รัฐบาล
az cloud set --name AzureUSGovernment
az login

# Azure จีน
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ฉันสามารถใช้ azd ในท่อ CI/CD ได้ไหม?</strong></summary>

แน่นอน! azd ถูกออกแบบมาสำหรับการอัตโนมัติ:
- การรวมกับ GitHub Actions
- รองรับ Azure DevOps
- การพิสูจน์ตัวตนด้วย service principal
- โหมดไม่ต้องโต้ตอบ

ดูรายละเอียดได้ที่ [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) สำหรับรูปแบบ CI/CD
</details>

<details>
<summary><strong>ค่าใช้จ่ายในการใช้ azd คือเท่าไร?</strong></summary>

azd เอง **ฟรีทั้งหมด** และเป็นโอเพนซอร์ส คุณจ่ายเฉพาะ:
- ทรัพยากร Azure ที่คุณปรับใช้
- ค่าใช้จ่ายการบริโภค Azure (compute, storage, ฯลฯ)

ใช้คำสั่ง `azd provision --preview` เพื่อคำนวณค่าใช้จ่ายก่อนการปรับใช้
</details>

## Next Steps

1. **ทำการพิสูจน์ตัวตนให้เสร็จ**: ให้แน่ใจว่าคุณเข้าถึง Azure subscription ได้
2. **ลองปรับใช้โปรเจกต์แรกของคุณ**: ทำตาม [First Project Guide](first-project.md)
3. **สำรวจเทมเพลต**: เรียกดูเทมเพลตที่มีอยู่ด้วย `azd template list`
4. **ตั้งค่า IDE ของคุณ**: จัดเตรียมสภาพแวดล้อมการพัฒนา

## Support

หากพบปัญหา:
- [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [รายงานปัญหา](https://github.com/Azure/azure-dev/issues)
- [ชุมชนพูดคุย](https://github.com/Azure/azure-dev/discussions)
- [การสนับสนุน Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - รับคำแนะนำคำสั่ง Azure โดยตรงในตัวแก้ไขของคุณด้วย `npx skills add microsoft/github-copilot-for-azure`

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation Complete!** ดำเนินการต่อไปที่ [Your First Project](first-project.md) เพื่อเริ่มสร้างโปรเจกต์ด้วย azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**คำปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลหลัก สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลโดยผู้เชี่ยวชาญที่เป็นมนุษย์ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->