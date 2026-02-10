# คู่มือการติดตั้งและการตั้งค่า

**การนำทางบทเรียน:**
- **📚 หน้าโครงการ**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นด่วน
- **⬅️ ก่อนหน้า**: [AZD Basics](azd-basics.md)
- **➡️ ถัดไป**: [Your First Project](first-project.md)
- **🚀 บทถัดไป**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้จะพาคุณติดตั้งและกำหนดค่า Azure Developer CLI (azd) บนระบบของคุณ คุณจะได้เรียนรู้หลายวิธีการติดตั้งสำหรับระบบปฏิบัติการต่างๆ การตั้งค่าการตรวจสอบสิทธิ์ และการกำหนดค่าเริ่มต้นเพื่อเตรียมสภาพแวดล้อมการพัฒนาสำหรับการปรับใช้บน Azure

## เป้าหมายการเรียนรู้

เมื่อสิ้นสุดบทเรียนนี้ คุณจะ:
- ติดตั้ง Azure Developer CLI บนระบบปฏิบัติการของคุณสำเร็จ
- กำหนดค่าการตรวจสอบสิทธิ์กับ Azure โดยใช้วิธีต่างๆ
- ตั้งค่าสภาพแวดล้อมการพัฒนาด้วยข้อกำหนดล่วงหน้าที่จำเป็น
- เข้าใจตัวเลือกการติดตั้งต่างๆ และเมื่อใดควรใช้แต่ละแบบ
- แก้ไขปัญหาการติดตั้งและการตั้งค่าทั่วไป

## ผลลัพธ์การเรียนรู้

หลังจากเรียนจบบทนี้ คุณจะสามารถ:
- ติดตั้ง azd โดยใช้วิธีที่เหมาะสมกับแพลตฟอร์มของคุณ
- ตรวจสอบสิทธิ์กับ Azure โดยใช้ `azd auth login`
- ยืนยันการติดตั้งและทดสอบคำสั่ง azd พื้นฐาน
- กำหนดค่าสภาพแวดล้อมการพัฒนาให้ใช้งาน azd ได้อย่างเหมาะสม
- แก้ไขปัญหาการติดตั้งทั่วไปได้ด้วยตนเอง

คู่มือนี้จะช่วยให้คุณติดตั้งและกำหนดค่า Azure Developer CLI บนระบบของคุณ ไม่ว่าจะเป็นระบบปฏิบัติการหรือสภาพแวดล้อมการพัฒนาใดก็ตาม

## ข้อกำหนดเบื้องต้น

ก่อนติดตั้ง azd ให้ตรวจสอบว่าคุณมี:
- **บัญชีสมาชิก Azure** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - สำหรับการตรวจสอบสิทธิ์และการจัดการทรัพยากร
- **Git** - สำหรับการโคลนเทมเพลตและการควบคุมเวอร์ชัน
- **Docker** (ไม่จำเป็น) - สำหรับแอปที่อยู่ในคอนเทนเนอร์

## วิธีการติดตั้ง

### Windows

#### ตัวเลือก 1: PowerShell (แนะนำ)
```powershell
# เรียกใช้ในฐานะผู้ดูแลระบบหรือด้วยสิทธิ์ระดับสูง
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ตัวเลือก 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### ตัวเลือก 3: Chocolatey
```cmd
choco install azd
```

#### ตัวเลือก 4: การติดตั้งด้วยตนเอง
1. ดาวน์โหลดรุ่นล่าสุดจาก [GitHub](https://github.com/Azure/azure-dev/releases)
2. แตกไฟล์ไปที่ `C:\Program Files\azd\`
3. เพิ่มลงในตัวแปรสภาพแวดล้อม PATH

### macOS

#### ตัวเลือก 1: Homebrew (แนะนำ)
```bash
brew tap azure/azd
brew install azd
```

#### ตัวเลือก 2: สคริปต์ติดตั้ง
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือก 3: การติดตั้งด้วยตนเอง
```bash
# ดาวน์โหลดและติดตั้ง
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ตัวเลือก 1: สคริปต์ติดตั้ง (แนะนำ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือก 2: ตัวจัดการแพ็กเกจ

**Ubuntu/Debian:**
```bash
# เพิ่มที่เก็บแพ็กเกจของ Microsoft
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

azd ถูกติดตั้งไว้ล่วงหน้าใน GitHub Codespaces เพียงสร้าง codespace แล้วเริ่มใช้งาน azd ได้ทันที

### Docker

```bash
# รัน azd ในคอนเทนเนอร์
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# สร้างนามแฝงเพื่อการใช้งานที่ง่ายขึ้น
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ยืนยันการติดตั้ง

หลังการติดตั้ง ให้ยืนยันว่า azd ทำงานถูกต้อง:

```bash
# ตรวจสอบเวอร์ชัน
azd version

# ดูความช่วยเหลือ
azd --help

# แสดงรายการเทมเพลตที่มี
azd template list
```

ผลลัพธ์ที่คาดว่า:
```
azd version 1.x.x (commit xxxxxx)
```

**หมายเหตุ**: หมายเลขเวอร์ชันจริงจะแตกต่างกัน ตรวจสอบ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) สำหรับเวอร์ชันล่าสุด

**✅ รายการตรวจสอบความสำเร็จในการติดตั้ง:**
- [ ] `azd version` แสดงหมายเลขเวอร์ชันโดยไม่มีข้อผิดพลาด
- [ ] `azd --help` แสดงเอกสารคำสั่ง
- [ ] `azd template list` แสดงเทมเพลตที่มีอยู่
- [ ] `az account show` แสดงบัญชีสมาชิก Azure ของคุณ
- [ ] คุณสามารถสร้างไดเรกทอรีทดสอบและรัน `azd init` ได้สำเร็จ

**หากการตรวจสอบทั้งหมดผ่าน คุณพร้อมที่จะไปยัง [Your First Project](first-project.md)!**

## การตั้งค่าการตรวจสอบสิทธิ์

### การตรวจสอบสิทธิ์ด้วย Azure CLI (แนะนำ)
```bash
# ติดตั้ง Azure CLI หากยังไม่ได้ติดตั้ง
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# ลงชื่อเข้าใช้ Azure
az login

# ยืนยันการพิสูจน์ตัวตน
az account show
```

### การตรวจสอบสิทธิ์ด้วยรหัสอุปกรณ์
ถ้าคุณใช้ระบบแบบ headless หรือติดปัญหาเบราว์เซอร์:
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

## การกำหนดค่า

### การกำหนดค่าทั่วโลก
```bash
# ตั้งค่าการสมัครใช้งานเริ่มต้น
azd config set defaults.subscription <subscription-id>

# ตั้งค่าตำแหน่งเริ่มต้น
azd config set defaults.location eastus2

# ดูการกำหนดค่าทั้งหมด
azd config list
```

### ตัวแปรสภาพแวดล้อม
เพิ่มในโปรไฟล์เชลล์ของคุณ (`.bashrc`, `.zshrc`, `.profile`):
```bash
# การกำหนดค่า Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# การกำหนดค่า azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # เปิดการบันทึกสำหรับการดีบัก
```

## การผสานรวมกับ IDE

### Visual Studio Code
ติดตั้งส่วนขยาย Azure Developer CLI:
1. เปิด VS Code
2. ไปที่ Extensions (Ctrl+Shift+X)
3. ค้นหา "Azure Developer CLI"
4. ติดตั้งส่วนขยาย

คุณสมบัติ:
- IntelliSense สำหรับ azure.yaml
- คำสั่งเทอร์มินอลที่รวมอยู่
- เรียกดูเทมเพลต
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
2. กำหนดค่าเครดิตของ Azure
3. ใช้เทอร์มินอลที่รวมอยู่สำหรับคำสั่ง azd

## 🐛 การแก้ไขปัญหาในการติดตั้ง

### ปัญหาที่พบบ่อย

#### ถูกปฏิเสธสิทธิ์ (Windows)
```powershell
# เรียกใช้ PowerShell ในฐานะผู้ดูแลระบบ
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
# กำหนดค่าพร็อกซี
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# ข้ามการตรวจสอบ SSL (ไม่แนะนำให้ใช้ในสภาพแวดล้อมการผลิต)
azd config set http.insecure true
```

#### ความขัดแย้งของเวอร์ชัน
```bash
# ลบการติดตั้งเก่า
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# ล้างการกำหนดค่า
rm -rf ~/.azd
```

### ขอความช่วยเหลือเพิ่มเติม
```bash
# เปิดใช้งานการบันทึกดีบัก
export AZD_DEBUG=true
azd <command> --debug

# ดูการกำหนดค่าปัจจุบัน
azd config list

# ดูสถานะการปรับใช้ปัจจุบัน
azd show
```

## การอัปเดต azd

### การอัปเดตอัตโนมัติ
azd จะแจ้งเมื่อมีการอัปเดต:
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

## 💡 คำถามที่พบบ่อย

<details>
<summary><strong>ความแตกต่างระหว่าง azd กับ az CLI คืออะไร?</strong></summary>

**Azure CLI (az)**: เครื่องมือระดับต่ำสำหรับการจัดการทรัพยากร Azure แต่ละรายการ
- `az webapp create`, `az storage account create`
- ทีละทรัพยากร
- มุ่งเน้นการจัดการโครงสร้างพื้นฐาน

**Azure Developer CLI (azd)**: เครื่องมือระดับสูงสำหรับการปรับใช้แอปพลิเคชันแบบครบวงจร
- `azd up` ปรับใช้แอปทั้งหมดพร้อมทรัพยากรที่เกี่ยวข้อง
- เวิร์กโฟลว์แบบเทมเพลต
- มุ่งเน้นเพิ่มประสิทธิภาพให้กับนักพัฒนา

**คุณจำเป็นต้องใช้ทั้งสองอย่าง**: azd ใช้ az CLI สำหรับการตรวจสอบสิทธิ์
</details>

<details>
<summary><strong>ฉันสามารถใช้ azd กับทรัพยากร Azure ที่มีอยู่แล้วได้หรือไม่?</strong></summary>

ได้! คุณสามารถ:
1. นำเข้าทรัพยากรที่มีอยู่ลงในสภาพแวดล้อมของ azd
2. อ้างอิงทรัพยากรที่มีอยู่ในเทมเพลต Bicep ของคุณ
3. ใช้ azd สำหรับการปรับใช้ใหม่ควบคู่ไปกับโครงสร้างพื้นฐานที่มีอยู่

ดู [คู่มือการกำหนดค่า](configuration.md) สำหรับรายละเอียด
</details>

<details>
<summary><strong>azd ทำงานกับ Azure Government หรือ Azure China ได้หรือไม่?</strong></summary>

ได้ ให้กำหนดค่า cloud:
```bash
# Azure ภาครัฐ
az cloud set --name AzureUSGovernment
az login

# Azure ประเทศจีน
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>ฉันสามารถใช้ azd ในท่อ CI/CD ได้หรือไม่?</strong></summary>

ได้แน่นอน! azd ถูกออกแบบมาสำหรับการทำงานอัตโนมัติ:
- การผสานรวมกับ GitHub Actions
- รองรับ Azure DevOps
- การตรวจสอบสิทธิ์ด้วย service principal
- โหมดไม่ต้องโต้ตอบ

ดู [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) สำหรับรูปแบบ CI/CD
</details>

<details>
<summary><strong>ค่าใช้จ่ายในการใช้ azd เป็นอย่างไร?</strong></summary>

azd เอง **ฟรีทั้งหมด** และเป็นโอเพนซอร์ส คุณจะจ่ายเฉพาะ:
- ทรัพยากร Azure ที่คุณปรับใช้
- ค่าใช้จ่ายการใช้งาน Azure (คอมพิวต์, เก็บข้อมูล เป็นต้น)

ใช้ `azd provision --preview` เพื่อประเมินค่าใช้จ่ายก่อนการปรับใช้
</details>

## ขั้นตอนถัดไป

1. **ทำการตรวจสอบสิทธิ์ให้เสร็จ**: ตรวจสอบว่าคุณเข้าถึงบัญชีสมาชิก Azure ได้
2. **ลองปรับใช้แรกของคุณ**: ทำตาม [First Project Guide](first-project.md)
3. **สำรวจเทมเพลต**: เรียกดูเทมเพลตที่มีอยู่ด้วย `azd template list`
4. **กำหนดค่า IDE ของคุณ**: ตั้งค่าสภาพแวดล้อมการพัฒนา

## การสนับสนุน

หากคุณพบปัญหา:
- [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [รายงานปัญหา](https://github.com/Azure/azure-dev/issues)
- [ชุมชนการสนทนา](https://github.com/Azure/azure-dev/discussions)
- [การสนับสนุนของ Azure](https://azure.microsoft.com/support/)

---

**การนำทางบทเรียน:**
- **📚 หน้าโครงการ**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นด่วน
- **⬅️ ก่อนหน้า**: [AZD Basics](azd-basics.md) 
- **➡️ ถัดไป**: [Your First Project](first-project.md)
- **🚀 บทถัดไป**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ติดตั้งเสร็จสมบูรณ์!** ไปยัง [Your First Project](first-project.md) เพื่อเริ่มสร้างด้วย azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วยปัญญาประดิษฐ์ [Co-op Translator](https://github.com/Azure/co-op-translator). แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลแบบอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง. เอกสารต้นฉบับในภาษาต้นฉบับควรถือเป็นแหล่งข้อมูลอ้างอิงที่เป็นทางการ. สำหรับข้อมูลที่สำคัญ เราแนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ. เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดจากการใช้คำแปลนี้.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->