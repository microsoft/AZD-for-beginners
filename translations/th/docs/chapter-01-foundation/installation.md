# คู่มือการติดตั้งและตั้งค่า

**การนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐานและเริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [พื้นฐาน AZD](azd-basics.md)
- **➡️ ถัดไป**: [โปรเจกต์แรกของคุณ](first-project.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้จะพาคุณติดตั้งและกำหนดค่า Azure Developer CLI (azd) บนระบบของคุณ คุณจะได้เรียนรู้วิธีติดตั้งหลายแบบสำหรับระบบปฏิบัติการต่าง ๆ การตั้งค่าการยืนยันตัวตน และการกำหนดค่าเริ่มต้นเพื่อเตรียมสภาพแวดล้อมสำหรับการพัฒนาและปรับใช้บน Azure

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- ติดตั้ง Azure Developer CLI บนระบบปฏิบัติการของคุณสำเร็จ
- กำหนดค่าการยืนยันตัวตนกับ Azure ด้วยหลายวิธี
- ตั้งค่าสภาพแวดล้อมสำหรับการพัฒนาด้วยสิ่งที่จำเป็น
- เข้าใจตัวเลือกการติดตั้งต่าง ๆ และเวลาที่ควรใช้แต่ละแบบ
- แก้ไขปัญหาการติดตั้งและการตั้งค่าทั่วไปได้

## ผลลัพธ์การเรียนรู้

หลังจากผ่านบทเรียนนี้ คุณจะสามารถ:
- ติดตั้ง azd โดยใช้วิธีที่เหมาะสมกับแพลตฟอร์มของคุณ
- ยืนยันตัวตนกับ Azure ด้วยคำสั่ง azd auth login
- ตรวจสอบการติดตั้งและทดสอบคำสั่ง azd เบื้องต้น
- ตั้งค่าสภาพแวดล้อมการพัฒนาให้เหมาะสมกับการใช้ azd
- แก้ไขปัญหาการติดตั้งทั่วไปได้ด้วยตัวเอง

คู่มือฉบับนี้จะช่วยคุณติดตั้งและกำหนดค่า Azure Developer CLI บนระบบของคุณ ไม่ว่าจะใช้ระบบปฏิบัติการหรือสภาพแวดล้อมการพัฒนาแบบใด

## สิ่งที่ต้องเตรียมก่อน

ก่อนติดตั้ง azd ตรวจสอบให้แน่ใจว่าคุณมี:
- **บัญชี Azure** - [สร้างบัญชีฟรี](https://azure.microsoft.com/free/)
- **Azure CLI** (ถ้ามี) - สำหรับตัวอย่างที่เรียกใช้ `az` โดยเฉพาะ; azd สามารถยืนยันตัวตนได้เอง
- **Git** - สำหรับโคลนเทมเพลตและควบคุมเวอร์ชัน
- **Docker** (ถ้ามี) - สำหรับแอปพลิเคชันแบบคอนเทนเนอร์

**เส้นทาง Foundry GA บทที่ 2:** ใช้ AZD **1.37.0 หรือใหม่กว่า** ติดตั้งบันเดิลด้วย `azd ext install microsoft.foundry` และใช้ Python **3.13+** และ **uv** ปัจจุบันสำหรับตัวอย่าง hosted-agent โหมดการปรับใช้โค้ดจะสร้างขึ้นจากระยะไกล ดังนั้นจึงไม่ต้องสร้าง Docker บนเครื่องท้องถิ่น สิทธิ์ของ Foundry การมีโมเดลในภูมิภาค และโควต้า ยังจำเป็นต้องใช้; ดูที่ [การตั้งค่า hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## วิธีการติดตั้ง

### Windows

#### ตัวเลือกที่ 1: ตัวจัดการแพ็กเกจ Windows (แนะนำ)
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

#### ตัวเลือกที่ 4: การติดตั้งด้วยตนเอง
1. ดาวน์โหลดเวอร์ชันล่าสุดจาก [GitHub](https://github.com/Azure/azure-dev/releases)
2. แตกไฟล์ไปที่ `C:\Program Files\azd\`
3. เพิ่มไปยังตัวแปรสภาพแวดล้อม PATH

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

#### ตัวเลือกที่ 3: การติดตั้งด้วยตนเอง
ดาวน์โหลดอาร์ไคฟ์สำหรับสถาปัตยกรรม macOS ของคุณจาก [release assets](https://github.com/Azure/azure-dev/releases), แตกไฟล์ และเพิ่มไบนารี `azd` ไปยัง `PATH` ของคุณ

### Linux

#### ตัวเลือกที่ 1: สคริปต์ติดตั้ง (แนะนำ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือกที่ 2: ตัวจัดการแพ็กเกจ

**ติดตั้งด้วยตนเองจาก release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

บาง Codespaces และสภาพแวดล้อม dev container มี `azd` อยู่แล้ว แต่คุณควรตรวจสอบแทนที่จะสมมติ:

```bash
azd version
```

หากขาด `azd` ให้ติดตั้งด้วยสคริปต์มาตรฐานสำหรับสภาพแวดล้อมนั้น

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

คอนเทนเนอร์ชั่วคราวนี้จะไม่เก็บสถานะล็อกอินระหว่างการรัน สำหรับการปรับใช้ซ้ำ ใช้ [การตั้งค่า dev container](dev-containers.md); การสร้างคอนเทนเนอร์ยังต้องใช้ Docker daemon ที่เข้าถึงได้จากภายในคอนเทนเนอร์

## ✅ ยืนยันการติดตั้ง

หลังการติดตั้ง ยืนยันว่า azd ทำงานถูกต้อง:

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
- [ ] `azd template list` แสดงเทมเพลตที่มีให้เลือก
- [ ] คุณสามารถสร้างไดเรกทอรีทดสอบและรัน `azd init` ได้สำเร็จ

**ถ้าตรวจสอบผ่านทั้งหมด คุณพร้อมที่จะดำเนินการสู่ [โครงการแรกของคุณ](first-project.md)!**

## การตั้งค่าการรับรองความถูกต้อง

### การตั้งค่าสำหรับผู้เริ่มต้นที่แนะนำ

สำหรับเวิร์กโฟลว์แบบ AZD-first ให้ลงชื่อเข้าใช้ด้วย `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

ใช้การลงชื่อเข้าใช้ Azure CLI เฉพาะเมื่อคุณวางแผนจะรันคำสั่ง `az` ด้วยตนเองในช่วงของเรียน

### การรับรองความถูกต้อง Azure CLI (ไม่บังคับ)
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

### ควรใช้วิธีการลงชื่อเข้าใช้แบบใด?

- ใช้ `azd auth login` หากคุณกำลังติดตามเส้นทาง AZD สำหรับผู้เริ่มต้นและส่วนใหญ่รันคำสั่ง `azd`
- ใช้ `az login` ด้วยเมื่อคุณต้องการรันคำสั่ง Azure CLI เช่น `az account show` หรือตรวจสอบทรัพยากรโดยตรง
- หากแบบฝึกหัดมีทั้งคำสั่ง `azd` และ `az` ให้รันทั้งสองคำสั่งลงชื่อเข้าใช้ครั้งเดียวตอนเริ่มต้น

### การรับรองความถูกต้องแบบ Device Code
หากคุณใช้ระบบ headless หรือมีปัญหาเบราว์เซอร์:
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

### ตรวจสอบการตั้งค่าให้ครบถ้วน

หากคุณต้องการตรวจสอบความพร้อมอย่างรวดเร็วก่อนเริ่มบทที่ 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## การกำหนดค่า

### การกำหนดค่าระดับโลก
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### ตัวแปรสภาพแวดล้อม
เพิ่มไปยังโปรไฟล์เชลล์ของคุณ (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## การผนวกรวม IDE

### Visual Studio Code
ติดตั้งส่วนขยาย Azure Developer CLI:
1. เปิด VS Code
2. ไปที่ Extensions (Ctrl+Shift+X)
3. ค้นหา "Azure Developer CLI"
4. ติดตั้งส่วนขยาย

คุณสมบัติ:
- IntelliSense สำหรับ azure.yaml
- คำสั่งเทอร์มินัลแบบผนวกรวม
- การเรียกดูเทมเพลต
- การตรวจสอบการปรับใช้

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
2. กำหนดค่า Azure credentials
3. ใช้เทอร์มินัลที่ผนวกรวมสำหรับคำสั่ง azd

## 🐛 การแก้ไขปัญหาการติดตั้ง

### ปัญหาทั่วไป

#### การปฏิเสธสิทธิ์ (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### ปัญหา PATH
เพิ่ม azd ไปยัง PATH ด้วยตนเอง:

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

### การขอความช่วยเหลือเพิ่มเติม
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
azd จะแจ้งเตือนเมื่อมีเวอร์ชันใหม่กว่า และคุณสามารถยืนยันเวอร์ชันปัจจุบันด้วย:
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
<summary><strong>ข้อแตกต่างระหว่าง azd กับ az CLI คืออะไร?</strong></summary>

**Azure CLI (az)**: เครื่องมือระดับต่ำสำหรับการจัดการทรัพยากร Azure รายตัว
- `az webapp create`, `az storage account create`
- จัดการทีละทรัพยากร
- เน้นการจัดการโครงสร้างพื้นฐาน

**Azure Developer CLI (azd)**: เครื่องมือระดับสูงสำหรับการปรับใช้แอปพลิเคชันแบบครบวงจร
- `azd up` ปรับใช้แอปทั้งหมดพร้อมทรัพยากรทั้งหมด
- เวิร์กโฟลว์แบบเทมเพลต
- เน้นประสิทธิภาพผู้พัฒนา

**ใช้งานแยกกัน**: azd ใช้การรับรองความถูกต้องของตัวเองโดยค่าเริ่มต้น ติดตั้งและลงชื่อเข้าใช้ Azure CLI เฉพาะสำหรับคำสั่ง `az` หรือเลือกใช้ `azd config set auth.useAzCliAuth true` อย่างชัดเจน
</details>

<details>
<summary><strong>ใช้ azd กับทรัพยากร Azure ที่มีอยู่ได้ไหม?</strong></summary>

ได้แน่นอน! คุณสามารถ:
1. นำเข้าทรัพยากรที่มีอยู่เข้าสู่สภาพแวดล้อม azd
2. อ้างอิงทรัพยากรที่มีอยู่ในเทมเพลต Bicep ของคุณ
3. ใช้ azd สำหรับการปรับใช้ใหม่ควบคู่กับโครงสร้างพื้นฐานที่มีอยู่

ดู [คู่มือการกำหนดค่า](../chapter-03-configuration/configuration.md) สำหรับรายละเอียด
</details>

<details>
<summary><strong>azd ใช้งานกับ Azure Government หรือ Azure China ได้ไหม?</strong></summary>

ได้ โดยตั้งค่าคลาวด์ดังนี้:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

หากคุณใช้ Azure CLI ด้วย ให้ตั้งค่า `az cloud set --name ...` แยกต่างหาก บริการเทมเพลตและความพร้อมของโมเดลจะแตกต่างกันตามคลาวด์
</details>

<details>
<summary><strong>ใช้ azd ใน pipeline CI/CD ได้ไหม?</strong></summary>

ได้แน่นอน! azd ถูกออกแบบมาเพื่ออัตโนมัติ:
- การผนวกรวม GitHub Actions
- การสนับสนุน Azure DevOps
- การรับรองความถูกต้องด้วย service principal
- โหมดไม่โต้ตอบ

ดู [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) สำหรับรูปแบบ CI/CD
</details>

<details>
<summary><strong>ค่าใช้จ่ายในการใช้ azd คืออะไร?</strong></summary>

azd เป็น **โอเพนซอร์สและฟรีทั้งหมด** คุณจ่ายเพียง:
- ทรัพยากร Azure ที่คุณปรับใช้
- ค่าใช้จ่ายการใช้งาน Azure (คอมพิวต์, สตอเรจ ฯลฯ)

ใช้ `azd provision --preview` เพื่อตรวจสอบทรัพยากรที่เสนอ แล้วประมาณค่าใช้จ่ายด้วย [เครื่องคำนวณราคา Azure](https://azure.microsoft.com/pricing/calculator/) โหมดพรีวิวไม่คำนวณค่าใช้จ่าย
</details>

## ขั้นตอนถัดไป

1. **เสร็จสิ้นการรับรองความถูกต้อง**: ตรวจสอบให้แน่ใจว่าคุณเข้าถึงการสมัคร Azure ของคุณได้
2. **ลองปรับใช้ครั้งแรกของคุณ**: ทำตาม [คู่มือโครงการแรก](first-project.md)
3. **สำรวจเทมเพลต**: เรียกดูเทมเพลตที่มีด้วย `azd template list`
4. **ตั้งค่า IDE ของคุณ**: กำหนดค่าสภาพแวดล้อมพัฒนา

## การสนับสนุน

หากพบปัญหา:
- [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [รายงานปัญหา](https://github.com/Azure/azure-dev/issues)
- [ชุมชนพูดคุย](https://github.com/Azure/azure-dev/discussions)
- [การสนับสนุน Azure](https://azure.microsoft.com/support/)
- [**ทักษะ Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - รับคำแนะนำคำสั่ง Azure ในตัวแก้ไขของคุณโดยตรงด้วย `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบท:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [พื้นฐาน AZD](azd-basics.md) 
- **➡️ ถัดไป**: [โครงการแรกของคุณ](first-project.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ การติดตั้งเสร็จสมบูรณ์!** ไปที่ [โครงการแรกของคุณ](first-project.md) เพื่อเริ่มสร้างด้วย azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->