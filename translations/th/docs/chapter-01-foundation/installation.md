# คู่มือการติดตั้งและตั้งค่า

**การนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐานและเริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [พื้นฐาน AZD](azd-basics.md)
- **➡️ ถัดไป**: [โปรเจกต์แรกของคุณ](first-project.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้จะนำคุณผ่านขั้นตอนการติดตั้งและกำหนดค่า Azure Developer CLI (azd) บนระบบของคุณ คุณจะได้เรียนรู้วิธีการติดตั้งหลายแบบสำหรับระบบปฏิบัติการที่แตกต่างกัน การตั้งค่าการรับรองความถูกต้อง และการกำหนดค่าเริ่มต้นเพื่อเตรียมสภาพแวดล้อมการพัฒนาของคุณสำหรับการปรับใช้ใน Azure

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- ติดตั้ง Azure Developer CLI บนระบบปฏิบัติการของคุณได้สำเร็จ
- กำหนดค่าการรับรองความถูกต้องกับ Azure โดยใช้วิธีการต่างๆ
- ตั้งค่าสภาพแวดล้อมการพัฒนาด้วยสิ่งที่จำเป็นสำหรับการเริ่มต้น
- เข้าใจตัวเลือกการติดตั้งต่างๆ และเวลาที่ควรใช้แต่ละวิธี
- แก้ไขปัญหาทั่วไปที่เกิดขึ้นในการติดตั้งและตั้งค่า

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้นบทเรียนนี้ คุณจะสามารถ:
- ติดตั้ง azd โดยใช้วิธีที่เหมาะสมกับแพลตฟอร์มของคุณ
- รับรองความถูกต้องกับ Azure โดยใช้คำสั่ง azd auth login
- ตรวจสอบการติดตั้งและทดสอบคำสั่ง azd เบื้องต้น
- กำหนดค่าสภาพแวดล้อมการพัฒนาเพื่อใช้งาน azd อย่างมีประสิทธิภาพ
- แก้ไขปัญหาการติดตั้งทั่วไปด้วยตนเอง

คู่มือนี้จะช่วยคุณติดตั้งและกำหนดค่า Azure Developer CLI บนระบบของคุณ ไม่ว่าคุณจะใช้ระบบปฏิบัติการหรือสภาพแวดล้อมการพัฒนาแบบใด

## ข้อกำหนดเบื้องต้น

ก่อนติดตั้ง azd ให้ตรวจสอบว่าคุณมี:
- **การสมัครใช้งาน Azure** - [สร้างบัญชีฟรี](https://azure.microsoft.com/free/)
- **Azure CLI** - สำหรับการรับรองความถูกต้องและการจัดการทรัพยากร
- **Git** - สำหรับโคลนเทมเพลตและควบคุมเวอร์ชัน
- **Docker** (ตัวเลือก) - สำหรับแอปพลิเคชันแบบคอนเทนเนอร์

## วิธีการติดตั้ง

### Windows

#### ตัวเลือกที่ 1: Windows Package Manager (แนะนำ)
```cmd
winget install microsoft.azd
```

#### ตัวเลือกที่ 2: สคริปต์ติดตั้ง PowerShell
```powershell
# มีประโยชน์เมื่อ winget ไม่สามารถใช้งานได้
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ตัวเลือกที่ 3: Chocolatey
```cmd
choco install azd
```

#### ตัวเลือกที่ 4: การติดตั้งด้วยตนเอง
1. ดาวน์โหลดเวอร์ชันล่าสุดจาก [GitHub](https://github.com/Azure/azure-dev/releases)
2. แตกไฟล์ไปที่ `C:\Program Files\azd\`
3. เพิ่มในตัวแปร PATH ของระบบ

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
```bash
# ดาวน์โหลดและติดตั้ง
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ตัวเลือกที่ 1: สคริปต์ติดตั้ง (แนะนำ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ตัวเลือกที่ 2: ตัวจัดการแพ็กเกจ

**การติดตั้งด้วยตนเองจากไฟล์ release:**
```bash
# ดาวน์โหลดไฟล์เก็บถาวรล่าสุดสำหรับสถาปัตยกรรม Linux ของคุณจาก:
# https://github.com/Azure/azure-dev/releases
# จากนั้นแตกไฟล์และเพิ่มไบนารี azd ลงใน PATH ของคุณ.
```

### GitHub Codespaces

บาง Codespaces และสภาพแวดล้อมคอนเทนเนอร์สำหรับนักพัฒนาอาจมี `azd` ติดตั้งไว้แล้ว แต่คุณควรตรวจสอบแทนที่จะสมมติว่ามี:

```bash
azd version
```

หากไม่มี `azd` ให้ติดตั้งด้วยสคริปต์มาตรฐานสำหรับสภาพแวดล้อมนั้น

### Docker

```bash
# รัน azd ในคอนเทนเนอร์
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# สร้างชื่อแทนเพื่อให้ใช้งานง่ายขึ้น
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ตรวจสอบการติดตั้ง

หลังการติดตั้ง ให้ตรวจสอบว่า azd ทำงานได้อย่างถูกต้อง:

```bash
# ตรวจสอบเวอร์ชัน
azd version

# ดูความช่วยเหลือ
azd --help

# แสดงรายการแม่แบบที่มีใช้งานได้
azd template list
```

ผลลัพธ์ที่คาดหวัง:
```
azd version 1.x.x (commit xxxxxx)
```

**หมายเหตุ**: หมายเลขเวอร์ชันจริงอาจแตกต่าง ตรวจสอบที่ [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) สำหรับเวอร์ชันล่าสุด

**✅ รายการตรวจสอบความสำเร็จการติดตั้ง:**
- [ ] คำสั่ง `azd version` แสดงหมายเลขเวอร์ชันโดยไม่มีข้อผิดพลาด
- [ ] คำสั่ง `azd --help` แสดงเอกสารคำสั่ง
- [ ] คำสั่ง `azd template list` แสดงเทมเพลตที่มีอยู่
- [ ] คุณสามารถสร้างไดเรกทอรีทดสอบและรัน `azd init` ได้สำเร็จ

**ถ้าผ่านทุกข้อ คุณพร้อมที่จะไปต่อที่ [โปรเจกต์แรกของคุณ](first-project.md)!**

## การตั้งค่าการรับรองความถูกต้อง

### การตั้งค่าสำหรับผู้เริ่มต้น (แนะนำ)

สำหรับเวิร์กโฟลว์แบบ AZD-first ลงชื่อเข้าใช้ด้วย `azd auth login`

```bash
# จำเป็นสำหรับคำสั่ง AZD เช่น azd up
azd auth login

# ตรวจสอบสถานะการรับรองความถูกต้องของ AZD
azd auth login --check-status
```

ใช้การลงชื่อเข้าใช้ Azure CLI เฉพาะเมื่อคุณวางแผนจะรันคำสั่ง `az` ด้วยตนเองในคอร์สนี้

### การรับรองความถูกต้องด้วย Azure CLI (ตัวเลือก)
```bash
# ติดตั้ง Azure CLI หากยังไม่ได้ติดตั้ง
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: ดูเอกสารติดตั้ง Azure CLI สำหรับดิสทริบิวชันของคุณ

# เข้าสู่ระบบ Azure
az login

# ตรวจสอบการตรวจสอบสิทธิ์
az account show
```

### ควรใช้วิธีลงชื่อเข้าใช้อะไร?

- ใช้ `azd auth login` หากคุณกำลังติดตามเส้นทาง AZD สำหรับผู้เริ่มต้นและเน้นรันคำสั่ง `azd`
- ใช้ `az login` เมื่อคุณต้องการรันคำสั่ง Azure CLI เช่น `az account show` หรือดูทรัพยากรโดยตรง
- หากแบบฝึกหัดมีทั้งคำสั่ง `azd` และ `az` ให้รันทั้งสองคำสั่งลงชื่อเข้าใช้ครั้งเดียวเมื่อต้น

### การรับรองความถูกต้องด้วยรหัสอุปกรณ์ (Device Code)
ถ้าคุณใช้ระบบที่ไม่มีเบราว์เซอร์หรือมีปัญหาในการใช้งานเบราว์เซอร์:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
สำหรับสภาพแวดล้อมอัตโนมัติ:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### ตรวจสอบการตั้งค่าให้ครบถ้วน

ถ้าคุณต้องการตรวจสอบความพร้อมอย่างรวดเร็วก่อนเริ่มบทที่ 1:

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
# ตั้งค่าการสมัครสมาชิกเริ่มต้น
azd config set defaults.subscription <subscription-id>

# ตั้งค่าตำแหน่งเริ่มต้น
azd config set defaults.location eastus2

# ดูการตั้งค่าทั้งหมด
azd config show
```

### ตัวแปรสภาพแวดล้อม
เพิ่มในโปรไฟล์เชลล์ของคุณ (`.bashrc`, `.zshrc`, `.profile`):
```bash
# การกำหนดค่า Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# การกำหนดค่า azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # เปิดใช้งานการล็อกดีบัก
```

## การรวมกับ IDE

### Visual Studio Code
ติดตั้งส่วนขยาย Azure Developer CLI:
1. เปิด VS Code
2. ไปที่ Extensions (Ctrl+Shift+X)
3. ค้นหา "Azure Developer CLI"
4. ติดตั้งส่วนขยาย

ฟีเจอร์:
- IntelliSense สำหรับ azure.yaml
- คำสั่งเทอร์มินัลรวม
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
2. กำหนดค่าใบรับรอง Azure
3. ใช้เทอร์มินัลรวมสำหรับคำสั่ง azd

## 🐛 แก้ไขปัญหาการติดตั้ง

### ปัญหาทั่วไป

#### การปฏิเสธสิทธิ์ (Windows)
```powershell
# เรียกใช้ PowerShell ในฐานะผู้ดูแลระบบ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### ปัญหา PATH
เพิ่ม azd ใน PATH ด้วยตนเอง:

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

# ข้ามการตรวจสอบ SSL (ไม่แนะนำสำหรับการใช้งานจริง)
azd config set http.insecure true
```

#### ความขัดแย้งของเวอร์ชัน
```bash
# ลบการติดตั้งเก่า
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: ลบไฟล์ไบนารี azd หรือ symlink ก่อนทำการติดตั้งใหม่

# ทำความสะอาดการตั้งค่า
rm -rf ~/.azd
```

### ขอความช่วยเหลือเพิ่มเติม
```bash
# เปิดใช้งานการบันทึกดีบัก
export AZD_DEBUG=true
azd <command> --debug

# ดูการตั้งค่าปัจจุบัน
azd config show

# ดูสถานะการปรับใช้ปัจจุบัน
azd show
```

## การอัปเดต azd

### ตรวจสอบการอัปเดต
azd จะแจ้งเตือนเมื่อมีเวอร์ชันใหม่ และคุณสามารถตรวจสอบเวอร์ชันปัจจุบันด้วย:
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
<summary><strong>azd กับ az CLI ต่างกันอย่างไร?</strong></summary>

**Azure CLI (az)**: เครื่องมือระดับล่างสำหรับจัดการทรัพยากร Azure ทีละรายการ
- `az webapp create`, `az storage account create`
- จัดการทรัพยากรทีละตัว
- เน้นการจัดการโครงสร้างพื้นฐาน

**Azure Developer CLI (azd)**: เครื่องมือระดับสูงสำหรับการปรับใช้แอปพลิเคชันทั้งหมด
- `azd up` ปรับใช้แอปและทรัพยากรทั้งหมด
- ใช้เวิร์กโฟลว์ตามเทมเพลต
- เน้นประสิทธิภาพนักพัฒนา

**คุณต้องใช้ทั้งสองอย่าง**: azd ใช้ az CLI สำหรับการรับรองความถูกต้อง
</details>

<details>
<summary><strong>สามารถใช้ azd กับทรัพยากร Azure ที่มีอยู่แล้วได้ไหม?</strong></summary>

ได้! คุณสามารถ:
1. นำเข้าทรัพยากรที่มีอยู่เข้าสู่สภาพแวดล้อม azd
2. อ้างอิงทรัพยากรในเทมเพลต Bicep ที่ใช้อยู่แล้ว
3. ใช้ azd สำหรับการปรับใช้ใหม่พร้อมกับโครงสร้างพื้นฐานที่มีอยู่

ดูรายละเอียดได้ที่ [คู่มือการกำหนดค่า](configuration.md)
</details>

<details>
<summary><strong>azd ใช้งานกับ Azure Government หรือ Azure China ได้ไหม?</strong></summary>

ได้ ให้ตั้งค่าคลาวด์:
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
<summary><strong>azd ใช้งานในระบบ CI/CD ได้ไหม?</strong></summary>

ได้แน่นอน! azd ออกแบบมาเพื่อระบบอัตโนมัติ:
- รวมกับ GitHub Actions
- รองรับ Azure DevOps
- รับรองความถูกต้องด้วย service principal
- โหมดทำงานแบบไม่ต้องโต้ตอบ

ดูตัวอย่างรูปแบบ CI/CD ได้ที่ [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)
</details>

<details>
<summary><strong>การใช้ azd มีค่าใช้จ่ายเท่าใด?</strong></summary>

azd เป็น **ฟรีทั้งหมด** และโอเพนซอร์ส คุณจะเสียค่าบริการเฉพาะ:
- ทรัพยากร Azure ที่คุณปรับใช้
- ค่าใช้จ่ายการใช้งาน Azure (เช่น การประมวลผล, ที่เก็บข้อมูล)

ใช้คำสั่ง `azd provision --preview` เพื่อประเมินค่าใช้จ่ายก่อนปรับใช้
</details>

## ขั้นตอนถัดไป

1. **เสร็จสิ้นการรับรองความถูกต้อง**: ตรวจสอบว่าคุณสามารถเข้าถึงการสมัครใช้งาน Azure ได้
2. **ลองปรับใช้โปรเจกต์แรกของคุณ**: ทำตาม [คู่มือโปรเจกต์แรก](first-project.md)
3. **สำรวจเทมเพลต**: เรียกดูเทมเพลตที่มีด้วยคำสั่ง `azd template list`
4. **ตั้งค่า IDE ของคุณ**: กำหนดค่าสภาพแวดล้อมการพัฒนา

## การสนับสนุน

หากคุณพบปัญหา:
- [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [รายงานปัญหา](https://github.com/Azure/azure-dev/issues)
- [พูดคุยในชุมชน](https://github.com/Azure/azure-dev/discussions)
- [สนับสนุน Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - รับคำแนะนำคำสั่ง Azure ในตัวแก้ไขของคุณโดยตรงด้วย `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐานและเริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [พื้นฐาน AZD](azd-basics.md)
- **➡️ ถัดไป**: [โปรเจกต์แรกของคุณ](first-project.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ติดตั้งเสร็จสมบูรณ์!** ดำเนินการต่อไปที่ [โปรเจกต์แรกของคุณ](first-project.md) เพื่อเริ่มสร้างด้วย azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้องสูงสุด แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อน เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่มีความสำคัญสูง ขอแนะนำให้ใช้การแปลโดยมืออาชีพที่เป็นมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->