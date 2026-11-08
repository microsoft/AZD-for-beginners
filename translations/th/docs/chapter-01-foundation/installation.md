# คู่มือการติดตั้งและตั้งค่า

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [พื้นฐาน AZD](azd-basics.md)
- **➡️ ถัดไป**: [โปรเจกต์แรกของคุณ](first-project.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาเน้น AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้จะพาคุณผ่านขั้นตอนการติดตั้งและตั้งค่า Azure Developer CLI (azd) บนระบบของคุณ คุณจะได้เรียนรู้วิธีติดตั้งหลายแบบสำหรับระบบปฏิบัติการต่างๆ การตั้งค่าการยืนยันตัวตน และการตั้งค่าเบื้องต้นเพื่อเตรียมสภาพแวดล้อมพัฒนาเพื่อการดีพลอยบน Azure

## เป้าหมายการเรียนรู้

เมื่อเรียนจบบทนี้ คุณจะสามารถ:
- ติดตั้ง Azure Developer CLI บนระบบปฏิบัติการของคุณสำเร็จ
- ตั้งค่าการยืนยันตัวตนกับ Azure ด้วยหลายวิธี
- จัดเตรียมสภาพแวดล้อมพัฒนาด้วยสิ่งที่จำเป็น
- เข้าใจตัวเลือกการติดตั้งต่างๆ และเลือกใช้ในเวลาที่เหมาะสม
- แก้ปัญหาการติดตั้งและตั้งค่าทั่วไปได้

## ผลลัพธ์การเรียนรู้

หลังจากเรียนจบบทนี้ คุณจะสามารถ:
- ติดตั้ง azd โดยใช้วิธีที่เหมาะสมกับแพลตฟอร์มของคุณ
- ยืนยันตัวตนกับ Azure โดยใช้ azd auth login
- ตรวจสอบการติดตั้งและทดสอบคำสั่ง azd เบื้องต้น
- ตั้งค่าสภาพแวดล้อมพัฒนาเพื่อใช้งาน azd อย่างมีประสิทธิภาพ
- แก้ไขปัญหาการติดตั้งทั่วไปได้ด้วยตัวเอง

คู่มือฉบับนี้จะช่วยคุณติดตั้งและตั้งค่า Azure Developer CLI บนระบบของคุณ ไม่ว่าจะใช้ระบบปฏิบัติการหรือสภาพแวดล้อมการพัฒนาแบบใด

## สิ่งที่ต้องมีล่วงหน้า

ก่อนติดตั้ง azd ตรวจสอบว่าคุณมี:
- **บัญชี Azure** - [สร้างบัญชีฟรี](https://azure.microsoft.com/free/)
- **Azure CLI** (ไม่บังคับ) - สำหรับตัวอย่างที่ใช้ `az` โดย azd จะยืนยันตัวตนเองแยกต่างหาก
- **Git** - สำหรับโคลนเทมเพลตและจัดการเวอร์ชัน
- **Docker** (ไม่บังคับ) - สำหรับแอปพลิเคชันแบบคอนเทนเนอร์

## วิธีการติดตั้ง

### Windows

#### ตัวเลือกที่ 1: Windows Package Manager (แนะนำ)
```cmd
winget install microsoft.azd
```

#### ตัวเลือกที่ 2: สคริปต์ติดตั้ง PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ตัวเลือกที่ 3: Chocolatey
```cmd
choco install azd
```

#### ตัวเลือกที่ 4: ติดตั้งด้วยตนเอง
1. ดาวน์โหลดเวอร์ชันล่าสุดจาก [GitHub](https://github.com/Azure/azure-dev/releases)
2. แตกไฟล์ไปที่ `C:\Program Files\azd\`
3. เพิ่มลงในตัวแปรสภาพแวดล้อม PATH

### macOS

#### ตัวเลือกที่ 1: Homebrew (แนะนำ)
```bash
brew tap azure/azd
brew install azd
```

#### ตัวเลือกที่ 2: สคริปต์ติดตั้ง
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือกที่ 3: ติดตั้งด้วยตนเอง
ดาวน์โหลดไฟล์สำหรับสถาปัตยกรรม macOS ของคุณจาก [the release assets](https://github.com/Azure/azure-dev/releases), แตกไฟล์ และเพิ่มไบนารี `azd` ลงใน `PATH` ของคุณ

### Linux

#### ตัวเลือกที่ 1: สคริปต์ติดตั้ง (แนะนำ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือกที่ 2: ตัวจัดการแพ็คเกจ

**ติดตั้งด้วยตนเองจาก release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

บาง Codespaces และสภาพแวดล้อม dev container มี `azd` รวมอยู่แล้ว แต่ควรตรวจสอบแทนที่จะสมมติไว้:

```bash
azd version
```

หาก `azd` ไม่พบ ให้ติดตั้งด้วยสคริปต์มาตรฐานสำหรับสภาพแวดล้อมนั้น

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

คอนเทนเนอร์ชั่วคราวนี้จะไม่เก็บสถานะล็อกอินระหว่างการใช้งาน สำหรับการดีพลอยซ้ำๆ ให้ใช้ [การตั้งค่า dev container](dev-containers.md); การสร้างคอนเทนเนอร์ก็ต้องเข้าถึง Docker daemon จากภายในคอนเทนเนอร์ด้วย

## ✅ ตรวจสอบการติดตั้ง

หลังติดตั้ง ตรวจเช็คว่า azd ทำงานถูกต้อง:

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
azd version 1.x.x (commit xxxxxx)
```

**หมายเหตุ**: หมายเลขเวอร์ชันจริงอาจแตกต่าง ตรวจสอบที่ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) สำหรับเวอร์ชันล่าสุด

**✅ รายการตรวจสอบความสำเร็จการติดตั้ง:**
- [ ] `azd version` แสดงหมายเลขเวอร์ชันโดยไม่มีข้อผิดพลาด
- [ ] `azd --help` แสดงเอกสารคำสั่ง
- [ ] `azd template list` แสดงเทมเพลตที่มี
- [ ] คุณสามารถสร้างไดเรกทอรีทดสอบและรัน `azd init` ได้สำเร็จ

**ถ้าตรวจสอบผ่านทั้งหมด คุณพร้อมไปที่ [โปรเจกต์แรกของคุณ](first-project.md)!**

## การตั้งค่าการยืนยันตัวตน

### การตั้งค่าแนะนำสำหรับผู้เริ่มต้น

สำหรับเวิร์กโฟลว์ AZD-first ลงชื่อด้วย `azd auth login`

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

ใช้การลงชื่อเข้าใช้ Azure CLI เฉพาะเมื่อคุณวางแผนจะรันคำสั่ง `az` เองในหลักสูตรนี้

### การยืนยันตัวตน Azure CLI (ไม่บังคับ)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### ควรใช้วิธีลงชื่อเข้าใช้อะไร?

- ใช้ `azd auth login` หากคุณเดินตามเส้นทาง AZD สำหรับผู้เริ่มต้นและรันคำสั่ง `azd` เป็นหลัก
- ใช้ `az login` ด้วยเมื่อคุณต้องการรันคำสั่ง Azure CLI เช่น `az account show` หรือดูทรัพยากรโดยตรง
- หากแบบฝึกหัดมีทั้งคำสั่ง `azd` และ `az` ให้รันคำสั่งลงชื่อเข้าใช้ทั้งคู่ตอนเริ่มต้นครั้งเดียว

### การยืนยันตัวตนด้วยโค้ดอุปกรณ์
หากคุณใช้ระบบไม่มีหน้าจอหรือมีปัญหาเบราว์เซอร์:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
สำหรับสภาพแวดล้อมอัตโนมัติ:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### ตรวจสอบการตั้งค่าทั้งหมดของคุณ

หากต้องการตรวจสอบความพร้อมอย่างรวดเร็วก่อนเริ่มบทที่ 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## การตั้งค่า

### การตั้งค่าทั่วไป
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### ตัวแปรสภาพแวดล้อม
เพิ่มลงในโปรไฟล์เชลล์ของคุณ (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## การรวมกับ IDE

### Visual Studio Code
ติดตั้งส่วนขยาย Azure Developer CLI:
1. เปิด VS Code
2. ไปที่ส่วนขยาย (Ctrl+Shift+X)
3. ค้นหา "Azure Developer CLI"
4. ติดตั้งส่วนขยาย

คุณสมบัติ:
- IntelliSense สำหรับ azure.yaml
- คำสั่งในเทอร์มินัลแบบรวม
- การเรียกดูเทมเพลต
- การตรวจสอบการดีพลอย

### GitHub Codespaces
สร้าง `.devcontainer/devcontainer.json`:
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

#### การปฏิเสธสิทธิ์ (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### ปัญหา PATH
เพิ่ม azd เข้า PATH ด้วยตนเอง:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### ความขัดแย้งของเวอร์ชัน
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### ขอความช่วยเหลือเพิ่มเติม
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## การอัปเดต azd

### ตรวจสอบการอัปเดต
azd จะเตือนเมื่อมีเวอร์ชันใหม่กว่า และคุณสามารถตรวจสอบเวอร์ชันปัจจุบันได้ด้วย:
```bash
azd version
```

### การอัปเดตด้วยตนเอง

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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

**Azure CLI (az)**: เครื่องมือระดับต่ำสำหรับจัดการทรัพยากร Azure ทีละตัว
- `az webapp create`, `az storage account create`
- ทีละทรัพยากร
- เน้นการจัดการโครงสร้างพื้นฐาน

**Azure Developer CLI (azd)**: เครื่องมือระดับสูงสำหรับดีพลอยแอปพลิเคชันอย่างครบถ้วน
- `azd up` ดีพลอยแอปทั้งหมดพร้อมทรัพยากรทุกอย่าง
- เวิร์กโฟลว์แบบเทมเพลต
- เน้นประสิทธิภาพนักพัฒนา

**ทั้งสองแยกกันทำงาน**: azd ใช้การยืนยันตัวตนของตัวเองโดยดีฟอลต์ ติดตั้งและลงชื่อเข้าใช้ Azure CLI เฉพาะสำหรับคำสั่ง `az` หรือตั้งใจเลือกใช้ `azd config set auth.useAzCliAuth true`
</details>

<details>
<summary><strong>ฉันใช้ azd กับทรัพยากร Azure ที่มีอยู่ได้ไหม?</strong></summary>

ได้แน่นอน! คุณสามารถ:
1. นำเข้าทรัพยากรที่มีอยู่เข้าสู่สภาพแวดล้อม azd
2. อ้างอิงทรัพยากรที่มีอยู่ในเทมเพลต Bicep ของคุณ
3. ใช้ azd เพื่อดีพลอยใหม่ควบคู่กับโครงสร้างพื้นฐานที่มีอยู่

ดู [คู่มือการตั้งค่า](../chapter-03-configuration/configuration.md) สำหรับรายละเอียด
</details>

<details>
<summary><strong>azd ใช้งานกับ Azure Government หรือ Azure China ได้ไหม?</strong></summary>

ได้ ให้ตั้งค่าคลาวด์:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

หากคุณใช้ Azure CLI ด้วย ให้ตั้งค่า `az cloud set --name ...` แยกต่างหาก บริการเทมเพลตและการมีโมเดลต่างกันตามคลาวด์
</details>

<details>
<summary><strong>ฉันใช้ azd ในท่อ CI/CD ได้ไหม?</strong></summary>

ใช่แน่นอน! azd ออกแบบมาสำหรับอัตโนมัติ:
- การรวมกับ GitHub Actions
- รองรับ Azure DevOps
- การยืนยันตัวตนแบบ service principal
- โหมดไม่ต้องโต้ตอบ

ดู [คู่มือการดีพลอย](../chapter-04-infrastructure/deployment-guide.md) สำหรับรูปแบบ CI/CD
</details>

<details>
<summary><strong>ค่าบริการของการใช้ azd คือเท่าไหร่?</strong></summary>

azd ตัวโปรแกรม **ฟรีทั้งหมด** และเป็นโอเพนซอร์ส คุณจ่ายแค่:
- ทรัพยากร Azure ที่คุณดีพลอย
- ค่าใช้จ่ายการใช้งาน Azure (เช่น ค่าคอมพิวต์, ที่เก็บ ฯลฯ)

ใช้ `azd provision --preview` เพื่อตรวจสอบทรัพยากรที่จะแนะนำ จากนั้นประมาณค่าใช้จ่ายด้วย [เครื่องมือคำนวณราคาของ Azure](https://azure.microsoft.com/pricing/calculator/) โหมดพรีวิวไม่คิดราคา
</details>

## ขั้นตอนต่อไป

1. **ลงชื่อเข้าใช้อย่างสมบูรณ์**: ตรวจสอบว่าคุณเข้าถึงบัญชี Azure ได้
2. **ลองดีพลอยครั้งแรก**: ทำตาม [คู่มือโปรเจกต์แรก](first-project.md)
3. **สำรวจเทมเพลต**: เรียกดูเทมเพลตที่มีด้วย `azd template list`
4. **ตั้งค่า IDE ของคุณ**: จัดเตรียมสภาพแวดล้อมพัฒนา

## การสนับสนุน

หากพบปัญหา:
- [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [รายงานปัญหา](https://github.com/Azure/azure-dev/issues)
- [สนทนาชุมชน](https://github.com/Azure/azure-dev/discussions)
- [สนับสนุน Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - รับคำแนะนำคำสั่ง Azure ได้โดยตรงในตัวแก้ไขด้วย `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [พื้นฐาน AZD](azd-basics.md) 
- **➡️ ถัดไป**: [โปรเจกต์แรกของคุณ](first-project.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาเน้น AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ การติดตั้งเสร็จสิ้น!** ดำเนินการต่อไปที่ [โปรเจกต์แรกของคุณ](first-project.md) เพื่อเริ่มสร้างด้วย azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->