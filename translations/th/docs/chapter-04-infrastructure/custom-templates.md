# การเขียนเทมเพลต azd ของคุณเอง

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ ก่อนหน้า**: [Deployment Guide](deployment-guide.md)
- **🚀 บทถัดไป**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> ยืนยันโดย `azd 1.25.6` ในเดือนมิถุนายน 2026.

## บทนำ

จนถึงตอนนี้คุณได้ *ใช้งาน* เทมเพลตด้วย `azd init --template <name>` แต่เมื่อคุณมีรูปแบบโปรเจกต์ที่ทีมชอบ—เช่น Container App ที่มี Cosmos DB และการตรวจสอบที่เหมาะสม—คุณจะต้องการเปลี่ยนมันให้เป็นเทมเพลตที่นำกลับมาใช้ใหม่ได้ เทมเพลตเป็นเพียง Git repository ที่มีโครงสร้างที่คาดเดาได้ซึ่ง azd รู้วิธีอ่าน บทเรียนนี้จะแสดงวิธีสร้างเทมเพลตจากศูนย์ ทดสอบมัน และ (ถ้าต้องการ) เผยแพร่ไปยังแกลเลอรีชุมชน

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะ:
- เข้าใจว่าสิ่งใดทำให้โฟลเดอร์เป็น "azd template"
- รู้ไฟล์และโครงสร้างโฟลเดอร์ที่จำเป็น
- เพิ่ม `azure.yaml` และ `infra/` ที่ผู้อื่นสามารถนำกลับไปใช้ได้
- ทดสอบเทมเพลตของคุณในเครื่องก่อนแชร์
- เผยแพร่มันและ (ถ้าต้องการ) ส่งไปยัง Awesome AZD

## ผลลัพธ์การเรียนรู้

หลังจากทำบทเรียนนี้เสร็จ คุณจะสามารถ:
- สร้างสเกฟโฟลเดอร์รีโพสิโทรีสำหรับเทมเพลตใหม่
- ทำให้โครงสร้างพื้นฐานมีพารามิเตอร์เพื่อให้ทำงานได้ใน subscription ใดก็ได้
- ตรวจสอบเทมเพลตด้วย `azd init` และ `azd up`
- เพิ่มเมตาดาต้าที่แกลเลอรีชุมชนต้องการ

---

## เทมเพลตคืออะไร จริงๆ แล้ว?

An azd template is **ที่เป็น Git repository** that contains, at minimum:

| File / folder | จุดประสงค์ | จำเป็นหรือไม่ |
|---------------|------------|---------------|
| `azure.yaml` | อธิบายบริการ, โฮสต์, และผู้ให้บริการโครงสร้างพื้นฐาน | ✅ ใช่ |
| `infra/` | Bicep, Terraform, หรือ Pulumi ที่จัดเตรียมทรัพยากร | ✅ ใช่ |
| `src/` (หรือโค้ดของคุณ) | โค้ดแอปพลิเคชันที่ azd ปรับใช้ | ✅ ใช่ |
| `README.md` | วิธีการใช้เทมเพลต | ✅ แนะนำอย่างยิ่ง |
| `.azdo/` or `.github/` | คำจำกัดความ pipeline CI/CD | ไม่จำเป็น |
| `.devcontainer/` | สภาพแวดล้อมการพัฒนาที่ทำซ้ำได้ | ไม่จำเป็น |
| `azure.yaml` `metadata` | ข้อมูลแกลเลอรีและเทเลเมทรี | ไม่จำเป็น (จำเป็นเมื่อต้องการเผยแพร่) |

ไม่มีอะไรลึกลับ: เมื่อคุณรัน `azd init --template you/your-repo` azd จะโคลนรีโพและอ่าน `azure.yaml`

---

## ขั้นตอนที่ 1: สร้างโครงร่างรีโพสิโทรี

สร้างโครงสร้างโฟลเดอร์ด้วยมือหรือเริ่มจากเทมเพลตขั้นต่ำแล้วแก้ไข:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# สร้างเค้าโครงมาตรฐาน
mkdir -p src infra
```

การจัดเรียงแบบตัวอย่างที่เสร็จแล้วมักมีลักษณะดังนี้:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## ขั้นตอนที่ 2: เขียน `azure.yaml`

นี่คือหัวใจของเทมเพลต มันบอก azd ว่าจะปรับใช้อะไรและอย่างไร:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> ฟิลด์ `metadata.template` คือสิ่งที่เทเลเมทรีของแกลเลอรีใช้ในการนับการใช้งาน ใช้รูปแบบ `name@version`

---

## ขั้นตอนที่ 3: ทำให้โครงสร้างพื้นฐานมีพารามิเตอร์

กฎข้อเดียวที่สำคัญที่สุดสำหรับเทมเพลตที่ *นำกลับมาใช้ใหม่ได้*: **อย่าใส่ชื่อ ภูมิภาค หรือค่าที่เฉพาะกับ subscription เป็นค่าคงที่** ใช้พารามิเตอร์และรูปแบบ resource token เพื่อให้เทมเพลตเดียวกันทำงานได้ใน subscription ของใครก็ได้

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

สองสิ่งที่ทำให้เทมเพลตเป็นมิตร:

1. **แท็ก `azd-env-name`** — azd ใช้มันเพื่อแทร็กและล้างทรัพยากรตามสภาพแวดล้อม
2. **resource token `uniqueString(...)`** — สร้างคำต่อท้ายที่มีความเสถียรและเป็นเอกลักษณ์ทั่วโลกเพื่อไม่ให้ชื่อชนกัน

จัดเตรียมไฟล์พารามิเตอร์ที่สอดคล้องกันซึ่งอ่านค่าที่ azd ฉีดจากสภาพแวดล้อม:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd จะทดแทน `${AZURE_ENV_NAME}` และ `${AZURE_LOCATION}` จากสภาพแวดล้อมปัจจุบันโดยอัตโนมัติ

---

## ขั้นตอนที่ 4: ทดสอบเทมเพลตของคุณในเครื่อง

ก่อนแชร์ ให้พิสูจน์ว่าเทมเพลตทำงานจากสถานะสะอาด

**ทดสอบจากโฟลเดอร์ในเครื่อง** (ไม่จำเป็นต้อง push ขึ้น Git):

```bash
# จากไดเรกทอรีว่าง ให้เริ่มต้นโดยใช้เส้นทางเทมเพลตในเครื่องของคุณ
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# จัดเตรียมและปรับใช้ตั้งแต่ต้นจนจบ
azd auth login
azd up
```

**จากนั้นทดสอบการลบสิ่งที่สร้างขึ้น**—เทมเพลตที่ดีจะล้างทรัพยากรทั้งหมด:

```bash
azd down --force --purge
```

หาก `azd down` ทิ้งทรัพยากรไว้ แสดงว่าคุณอาจลืมแท็ก `azd-env-name` บนทรัพยากร

> **เคล็ดลับ:** ให้รัน `azd provision --preview` ก่อน มันจะทำ what-if และแสดงข้อผิดพลาดของเทมเพลตก่อนจะสร้างทรัพยากรใดๆ

---

## ขั้นตอนที่ 5: เผยแพร่เทมเพลต

Push รีโพสิโทรีไปยัง GitHub (สาธารณะหากคุณต้องการให้ผู้อื่นใช้งาน):

```bash
gh repo create my-azd-template --public --source=. --push
```

ตอนนี้ใครๆ ก็สามารถใช้งานได้:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ขั้นตอนที่ 6 (ไม่บังคับ): ส่งไปยัง Awesome AZD

แกลเลอรี [Awesome AZD](https://azure.github.io/awesome-azd/) รวบรวมเทมเพลตจากชุมชน เพื่อติดอยู่ในรายการ รีโพของคุณควรมีสิ่งต่อไปนี้:

- ✅ `README.md` ที่ชัดเจนพร้อมข้อกำหนดเบื้องต้น แผนผังสถาปัตยกรรม และหมายเหตุเกี่ยวกับค่าใช้จ่าย
- ✅ `azure.yaml` ที่ใช้งานได้พร้อม `metadata.template`
- ✅ โครงสร้างพื้นฐานที่จัดเตรียมทรัพยากรได้อย่างเรียบร้อยใน subscription ใหม่
- ✅ ไฟล์ `LICENSE`
- ✅ (แนะนำ) มี `.devcontainer/` สำหรับการเปิดใช้งาน Codespaces ด้วยคลิกเดียว

ส่งโดยการเปิด pull request เพื่อเพิ่มเทมเพลตของคุณไปยังไฟล์ข้อมูลของแกลเลอรี ตามคำแนะนำการมีส่วนร่วมที่รีโพ [Awesome AZD repository](https://github.com/Azure/awesome-azd)

---

## ข้อผิดพลาดที่พบบ่อย

| ปัญหา | วิธีแก้ |
|-------|--------|
| การกำหนดชื่อตัวทรัพยากรแบบคงที่ | ใช้ resource token `uniqueString()` |
| `azd down` ทิ้งทรัพยากรไว้ | ติดแท็กทุกทรัพยากร (หรือ resource group) ด้วย `azd-env-name` |
| เทมเพลตใช้งานได้กับคุณแต่ล้มเหลวกับคนอื่น | ลบ subscription IDs, tenant IDs, และสมมติฐานเรื่องภูมิภาค |
| เอาต์พุตไม่ได้เชื่อมต่อกับแอป | ส่งออก `SERVICE_<NAME>_ENDPOINT_URL` และเอาต์พุต `AZURE_*` อื่นๆ |
| การส่งเข้ากลางแกลเลอรีถูกปฏิเสธ | เพิ่ม `README.md`, `LICENSE`, และ `metadata.template` |

---

## สรุป

- เทมเพลตคือเพียงรีโพ Git ที่มี `azure.yaml`, `infra/`, และโค้ดของคุณ
- ทำให้ทุกอย่างเป็นพารามิเตอร์—ชื่อ ภูมิภาค และ ID—เพื่อให้รันได้ที่ไหนก็ได้
- ติดแท็กทรัพยากรด้วย `azd-env-name` เสมอเพื่อให้ `azd down` ทำงานได้
- ทดสอบในเครื่องด้วย `azd init --template <local-path>` ก่อนเผยแพร่
- เพิ่มเมตาดาต้าและ README เพื่อส่งไปยัง Awesome AZD

---

## 🔗 การนำทาง

| ทิศทาง | แหล่งข้อมูล |
|--------|-------------|
| **ก่อนหน้า** | [Deployment Guide](deployment-guide.md) |
| **หน้าหลักบท** | [Chapter 4: Infrastructure as Code](README.md) |
| **บทถัดไป** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 แหล่งข้อมูลที่เกี่ยวข้อง

- [การจัดเตรียมทรัพยากร](provisioning.md)
- [แกลเลอรี Awesome AZD](https://azure.github.io/awesome-azd/)
- [เอกสารอย่างเป็นทางการสำหรับเทมเพลต azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->