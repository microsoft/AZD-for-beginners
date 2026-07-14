# การสร้างเทมเพลต azd ของคุณเอง

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 4 - Infrastructure as Code & Deployment
- **⬅️ ก่อนหน้า**: [คู่มือการดีพลอย](deployment-guide.md)
- **🚀 บทถัดไป**: [บทที่ 5: โซลูชันหลายเอเจนท์](../chapter-05-multi-agent/README.md)

> ตรวจสอบความถูกต้องกับ `azd 1.27.1` ในเดือนกรกฎาคม 2026

## บทนำ

จนถึงตอนนี้คุณได้ *ใช้* เทมเพลตด้วยคำสั่ง `azd init --template <name>` แต่เมื่อคุณมีโครงสร้างโครงการที่ทีมของคุณชอบ — เช่น Container App ที่มี Cosmos DB และการมอนิเตอร์ที่เหมาะสม — คุณจะต้องการเปลี่ยนมันเป็นเทมเพลตที่นำกลับมาใช้ซ้ำได้เอง เทมเพลตคือที่เก็บ Git ที่มีโครงสร้างทำนายได้ที่ azd รู้วิธีอ่าน บทเรียนนี้จะแสดงวิธีสร้างเทมเพลตตั้งแต่เริ่มต้น ทดสอบ และ (ถ้าต้องการ) เผยแพร่สู่แกลเลอรีของชุมชน

## เป้าหมายการเรียนรู้

หลังจากจบบทเรียนนี้ คุณจะ:
- เข้าใจว่าทำไมโฟลเดอร์ถึงเป็น "เทมเพลต azd"
- รู้จักไฟล์และโครงสร้างโฟลเดอร์ที่จำเป็น
- เพิ่ม `azure.yaml` และโฟลเดอร์ `infra/` ที่คนอื่นนำกลับมาใช้ได้
- ทดสอบเทมเพลตของคุณในเครื่องก่อนแชร์
- เผยแพร่และ (ถ้าต้องการ) ส่งไปยัง Awesome AZD

## ผลลัพธ์การเรียนรู้

หลังจากจบบทเรียนนี้ คุณจะสามารถ:
- สร้างที่เก็บเทมเพลตใหม่
- พารามิเตอร์โครงสร้างพื้นฐานให้ทำงานได้ในทุก subscription
- ตรวจสอบความถูกต้องของเทมเพลตด้วย `azd init` และ `azd up`
- เพิ่มเมตาดาต้าที่แกลเลอรีชุมชนต้องการ

---

## เทมเพลตคืออะไร จริงๆ แล้ว?

เทมเพลต azd คือ **ที่เก็บ Git** ที่มีอย่างน้อย:

| ไฟล์ / โฟลเดอร์ | จุดประสงค์ | จำเป็น? |
|---------------|---------|-----------|
| `azure.yaml` | อธิบายบริการ โฮสต์ และผู้ให้บริการโครงสร้างพื้นฐาน | ✅ ใช่ |
| `infra/` | Bicep, Terraform, หรือ Pulumi ที่จัดเตรียมทรัพยากร | ✅ ใช่ |
| `src/` (หรือโค้ดของคุณ) | โค้ดแอปพลิเคชันที่ azd ดีพลอย | ✅ ใช่ |
| `README.md` | วิธีใช้เทมเพลต | ✅ แนะนำอย่างยิ่ง |
| `.azdo/` หรือ `.github/` | นิยาม pipeline CI/CD | ไม่บังคับ |
| `.devcontainer/` | สภาพแวดล้อม dev ที่ทำซ้ำได้ | ไม่บังคับ |
| เมตาดาต้า ใน `azure.yaml` | ข้อมูลแกลเลอรี + เทเลเมทรี | ไม่บังคับ (จำเป็นต้องมีเพื่อเผยแพร่) |

ไม่มีสิ่งวิเศษใดที่นี่: เมื่อคุณรัน `azd init --template you/your-repo` azd จะโคลนที่เก็บและอ่าน `azure.yaml`

---

## ขั้นตอนที่ 1: สร้างโครงสร้างที่เก็บ

สร้างโครงสร้างโฟลเดอร์ด้วยมือหรือเริ่มจากเทมเพลตขั้นต่ำและแก้ไข:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# สร้างเค้าโครงมาตรฐาน
mkdir -p src infra
```

รูปแบบพื้นฐานที่เสร็จแล้วดูเหมือนนี้:

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

นี่คือหัวใจของเทมเพลต มันบอก azd ว่าจะดีพลอยอะไรและอย่างไร:

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

> ฟิลด์ `metadata.template` คือสิ่งที่เทเลเมทรีของแกลเลอรีใช้ในการนับการใช้งาน ใช้มาตรฐาน `name@version`

---

## ขั้นตอนที่ 3: ทำให้โครงสร้างพื้นฐานเป็นพารามิเตอร์

กฎสำคัญที่สุดสำหรับเทมเพลตที่ *นำกลับมาใช้ใหม่ได้*: **อย่ากำหนดชื่อ ภูมิภาค หรือค่าที่เฉพาะเจาะจงกับ subscription แบบตายตัว** ให้ใช้พารามิเตอร์และรูปแบบ resource token เพื่อให้เทมเพลตเดียวทำงานใน subscription ใดก็ได้

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

สองสิ่งที่ทำให้เทมเพลตนี้เป็นมิตรแก่การใช้ซ้ำ:

1. **แท็ก `azd-env-name`** — azd ใช้เพื่อติดตามและล้างทรัพยากรตามสภาพแวดล้อม
2. **resource token `uniqueString(...)`** — สร้างคำต่อท้ายที่มั่นคงและไม่ซ้ำทั่วโลกเพื่อไม่ให้ชื่อชนกัน

ให้ไฟล์พารามิเตอร์ที่ตรงกันซึ่งอ่านค่าที่ azd ฉีดจากสภาพแวดล้อม:

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

azd จะแทนที่ `${AZURE_ENV_NAME}` และ `${AZURE_LOCATION}` จากสภาพแวดล้อมปัจจุบันโดยอัตโนมัติ

---

## ขั้นตอนที่ 4: ทดสอบเทมเพลตของคุณในเครื่อง

ก่อนจะแชร์ ให้พิสูจน์ว่าเทมเพลตทำงานได้จากสถานะสะอาด

**ทดสอบจากโฟลเดอร์ในเครื่อง** (ไม่ต้อง push Git):

```bash
# จากไดเรกทอรีว่าง ให้เริ่มต้นโดยใช้เส้นทางเทมเพลตท้องถิ่นของคุณ
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# จัดเตรียม + ปล่อยใช้งานแบบครบวงจร
azd auth login
azd up
```

**แล้วทดสอบการล้างทรัพยากร**—เทมเพลตที่ดีจะล้างได้หมดจด:

```bash
azd down --force --purge
```

ถ้า `azd down` ทิ้งทรัพยากรไว้ แสดงว่าอาจลืมใส่แท็ก `azd-env-name` บนทรัพยากรตัวใดตัวหนึ่ง

> **คำแนะนำ:** รันคำสั่ง `azd provision --preview` ก่อน มันจะทำ what-if และแสดงข้อผิดพลาดของเทมเพลตก่อนสร้างทรัพยากรจริง

---

## ขั้นตอนที่ 5: เผยแพร่เทมเพลต

ดันที่เก็บไปยัง GitHub (เป็นสาธารณะถ้าคุณอยากให้คนอื่นใช้ได้):

```bash
gh repo create my-azd-template --public --source=. --push
```

ตอนนี้ใครก็ใช้ได้:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ขั้นตอนที่ 6 (ไม่บังคับ): ส่งเทมเพลตไปยัง Awesome AZD

[แกลเลอรี Awesome AZD](https://azure.github.io/awesome-azd/) รวบรวมเทมเพลตชุมชน เพื่อถูกแสดง คุณควรรวม:

- ✅ `README.md` ที่ชัดเจนมีรายการสิ่งที่ต้องเตรียม แผนภาพสถาปัตยกรรม และบันทึกค่าใช้จ่าย
- ✅ `azure.yaml` ที่ใช้งานได้พร้อม `metadata.template`
- ✅ โครงสร้างพื้นฐานที่สร้างใหม่สะอาดใน subscription ใหม่
- ✅ ไฟล์ `LICENSE`
- ✅ (แนะนำ) โฟลเดอร์ `.devcontainer/` สำหรับ Codespaces คลิกเดียว

ส่งโดยการเปิด pull request ที่เพิ่มเทมเพลตของคุณในไฟล์ข้อมูลของแกลเลอรี ตามคำแนะนำการร่วมมือที่ [ที่เก็บ Awesome AZD](https://github.com/Azure/awesome-azd)

---

## ปัญหาทั่วไป

| ปัญหา | การแก้ไข |
|---------|-----|
| ชื่อทรัพยากรถูกกำหนดตายตัว | ใช้ resource token `uniqueString()` |
| `azd down` ทิ้งทรัพยากรไว้ | ติดแท็ก `azd-env-name` ให้ทุกทรัพยากร (หรือกลุ่มทรัพยากร) |
| เทมเพลตใช้งานได้กับคุณแต่ล้มเหลวกับผู้อื่น | ลบ subscription ID, tenant ID, และสมมติฐานภูมิภาคออก |
| เอาต์พุตไม่ได้ต่อกับแอป | ส่งออก `SERVICE_<NAME>_ENDPOINT_URL` และเอาต์พุต `AZURE_*` อื่นๆ |
| การส่งไปยังแกลเลอรีถูกปฏิเสธ | เพิ่ม `README.md`, `LICENSE`, และ `metadata.template` |

---

## สรุป

- เทมเพลตคือที่เก็บ Git ที่มี `azure.yaml`, `infra/`, และโค้ดของคุณ
- พารามิเตอร์ทั้งหมด—ชื่อ ภูมิภาค และ ID—เพื่อให้รันที่ใดก็ได้
- ติดแท็กทรัพยากรด้วย `azd-env-name` เสมอเพื่อให้ `azd down` ใช้งานได้
- ทดสอบในเครื่องด้วย `azd init --template <local-path>` ก่อนเผยแพร่
- เพิ่มเมตาดาต้าและ README เพื่อส่งไปยัง Awesome AZD

---

## 🔗 การนำทาง

| ทิศทาง | ทรัพยากร |
|-----------|----------|
| **ก่อนหน้า** | [คู่มือการดีพลอย](deployment-guide.md) |
| **หน้าแรกบท** | [บทที่ 4: Infrastructure as Code](README.md) |
| **บทถัดไป** | [บทที่ 5: โซลูชันหลายเอเจนท์](../chapter-05-multi-agent/README.md) |

## 📖 ทรัพยากรที่เกี่ยวข้อง

- [การจัดเตรียมทรัพยากร](provisioning.md)
- [แกลเลอรี Awesome AZD](https://azure.github.io/awesome-azd/)
- [เอกสารเทมเพลต azd อย่างเป็นทางการ](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->