# โครงสร้างพื้นฐาน Multi-Agent สำหรับการค้าปลีก

**ตัวอย่างสถาปัตยกรรมขั้นสูง — ไม่ใช่แอปพลิเคชัน multi-agent ที่ทำงานได้จริง**

[หน้าแรกหลักสูตร](../../README.md) ·
[บทที่ 5](../../docs/chapter-05-multi-agent/README.md) ·
[แผนผังสถาปัตยกรรม](../retail-scenario.md)

## สิ่งที่นี่ติดตั้ง

โฟลเดอร์นี้ประกอบด้วยแม่แบบ ARM, พารามิเตอร์ และสคริปต์การติดตั้ง Bash
ไม่มี **`azure.yaml` หรือซอร์สแอปพลิเคชันค้าปลีก** ใดๆ

| ทรัพยากร | สถานะจริงหลังจากการจัดหา |
|---|---|
| บัญชี Azure OpenAI หลัก | การปรับใช้ `gpt-4.1-chat` โดยใช้ `gpt-4.1` เวอร์ชัน `2025-04-14`, `GlobalStandard` |
| บัญชี OpenAI สำรอง (ไม่บังคับ) | `gpt-4.1-mini-inventory`, รุ่น `gpt-4.1-mini` เวอร์ชัน `2025-04-14`, `GlobalStandard` |
| บัญชี Embeddings (ไม่บังคับ) | `text-embedding-ada-002` เวอร์ชัน `2`, `Standard`; ไม่มีสายงานการจัดทำดัชนี |
| บัญชี Grader OpenAI | `gpt-4.1-grader`, รุ่น `gpt-4.1` เวอร์ชัน `2025-04-14`, `GlobalStandard`; ไม่มีผู้ประเมิน |
| การค้นหา AI | บริการว่าง; ไม่มีดัชนีหรือเอกสาร |
| การจัดเก็บ | `documents` และภาชนะบรรจุ blob `uploads` ว่างเปล่า |
| Cosmos DB | บัญชีแบบ Serverless, ฐานข้อมูล `chathistory`, ภาชนะบรรจุ `conversations` แบ่งพาร์ทิชันโดย `/userId`, TTL ของไอเทม 30 วัน |
| Container Apps | ตัวเราท์เตอร์และส่วนหน้ารันทั้งคู่บน `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` ที่พอร์ต 80 |
| Key Vault (ไม่บังคับ) | ห้องนิรภัยที่เปิดใช้งาน RBAC ว่างเปล่า; **ไม่มีความลับหรือการมอบหมายบทบาท** |
| Application Insights / Log Analytics (ไม่บังคับ) | ทรัพยากรและการเก็บรวบรวมบันทึกสภาพแวดล้อม; ไม่มีการติดตั้งแอปแบบกำหนดเอง, การแจ้งเตือน หรือแดชบอร์ด |
| Document Intelligence | บัญชี S0; ไม่มีเวิร์กโฟลว์การประมวลผลเอกสาร |

Legacy Bing Search v7 ถูกยกเลิกเมื่อวันที่ 11 สิงหาคม 2025 และ **ไม่ได้ถูกจัดเตรียม**.
ไม่มีการดำเนินการผสานรวมเว็บกราวด์ดิ้งอื่นแทน.

**ไม่ได้รวมอยู่:** ตัวแทนลูกค้า/สินค้าคงคลัง, API เราท์เตอร์ `/chat`, ส่วนหน้าหน้าจอแชต,
สคีมาค้นหาหรือสคริปต์การนำเข้า, Azure Container Registry, จุดเชื่อมต่อส่วนตัว,
ตัวตนที่จัดการ, การมอบหมาย RBAC, การสลับสำรองอัตโนมัติ, Front Door, สแกนเนอร์ทีมแดง,
CLI ประเมินผล, การตรวจสอบสิทธิ์ หรือ CI/CD.

ข้อความสำเร็จของ ARM ยืนยันเพียงการจัดเตรียมทรัพยากรเท่านั้น ไม่รับรอง
การทำงานของแอปพลิเคชัน, ความปลอดภัย, ความพร้อมใช้งาน หรือความพร้อมสำหรับผลิตจริง.

## ข้อกำหนดเบื้องต้นและค่าใช้จ่าย

- Bash (Git Bash/WSL บน Windows) และ
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- การสมัครสมาชิกที่มีสิทธิ์สร้างทรัพยากรทั้งหมดที่ระบุไว้
- ตรวจสอบความพร้อมใช้งานของ **แต่ละรุ่น/เวอร์ชัน/SKU ในแต่ละภูมิภาคที่เลือก** และ
  โควต้าสำหรับการสมัครสมาชิกของคุณ ค่าปริยายคือตัวอย่าง ไม่ใช่ข้อรับประกัน
  ดู [ความพร้อมใช้งานของรุ่น](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- เลือกกลุ่มทรัพยากรเฉพาะที่คุณสามารถลบได้หลังจากทดสอบเสร็จ.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

ตำแหน่งเริ่มต้น: หลัก `eastus2`, รอง `westus2`, embeddings `francecentral`;
ค่าเริ่มต้น grader อยู่ในภูมิภาคหลัก เว้นแต่จะกำหนด `graderLocation`
`--no-multi-region` ข้ามบัญชีรองและ embeddings; ไม่ข้ามบัญชี grader


Search มีค่าใช้จ่ายในขณะที่จัดเตรียมแม้จะว่างเปล่า. จำนวนสำเนาขั้นต่ำของคอนเทนเนอร์,
ความซ้ำซ้อนของการจัดเก็บ, คำขอ/พื้นที่จัดเก็บ Cosmos DB, โทเค็นของโมเดล, การเรียก Document Intelligence
และการนำเข้าบันทึก/พื้นที่จัดเก็บสามารถเพิ่มค่าใช้จ่ายได้ ไม่มีค่าคงที่หรือการตรวจสอบ
ยอดรวมรายเดือน** ประเมินจำนวน SKU ที่แน่นอนใน
[Azure pricing calculator](https://azure.microsoft.com/pricing/calculator/) และ
กำหนดงบประมาณก่อนทำการปรับใช้

### โหมดการปรับใช้

การตั้งค่าเหล่านี้เป็นขนาดของทรัพยากร **ไม่ใช่การรับรองการผลิตหรือ SLA**

| โหมด | หน่วยความจุ Chat / mini / embedding / grader | ตัวทำซ้ำของเราเตอร์ | ตัวทำซ้ำของ frontend | ชั้นการค้นหา | การจัดเก็บข้อมูล |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basic, 1 ตัวทำซ้ำ | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 ตัวทำซ้ำ | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 ตัวทำซ้ำ | Standard_GRS |

หน่วยความจุของโมเดลขึ้นอยู่กับเฉพาะโมเดล/SKU; ห้ามนำมารวมกันเป็นการรับประกัน TPM สากล
โหมดพรีเมียมไม่ได้เปิดใช้งาน Container Apps ที่มีความทนทานโซน: ซึ่งต้องการ
การออกแบบเครือข่ายเพิ่มเติม Basic Search รองรับการค้นหาแบบเวกเตอร์โดยมี
ข้อจำกัดบริการ; ไม่ได้ขัดแย้งกับเวกเตอร์โดยธรรมชาติ

## 🚀 การปรับใช้อย่างรวดเร็ว

ทบทวน `azuredeploy.json` และ `azuredeploy.parameters.json` ก่อน คำสั่งด้านล่างนี้
**สร้างทรัพยากร Azure ที่มีค่าใช้จ่าย**; ไม่ใช่การตรวจสอบแบบออฟไลน์

จากโฟลเดอร์รากของรีโพสิตอรี:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

สคริปต์ใช้เส้นทางสัมพันธ์กับไดเรกทอรีของมันเอง ตรวจสอบการเข้าสู่ระบบ/เครื่องมือ/อาร์กิวเมนต์,
สร้างกรุ๊ปทรัพยากรถ้าไม่มี, ตรวจสอบการปรับใช้, จัดเตรียม และ
แสดงผลลัพธ์ที่ไม่ใช่ความลับ ไม่ต้องการหรือทำการดึง `jq`,
การเติมข้อมูล, การดึงความลับ หรือการตั้งค่าแอปพลิเคชันหลังปรับใช้

ค่าคำสั่งในบรรทัดคำสั่งของสคริปต์จะเขียนทับค่าที่สอดคล้องใน
ไฟล์พารามิเตอร์ แก้ไขไฟล์พารามิเตอร์สำหรับการตั้งค่าเช่น ภูมิภาครอง/ภูมิภาคอันดับสาม;
ใช้การปรับใช้ CLI ตรงถ้าคุณต้องการเขียนทับพารามิเตอร์โดยอิสระ:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

การจัดเตรียมอาจใช้เวลาระหว่าง 15–45 นาทีหรือมากกว่านั้น และอาจล้มเหลวจากข้อจำกัดโควต้าภูมิภาคหรือ
ข้อจำกัดวงจรชีวิตโมเดล อย่าลองใหม่โดยไม่อ่านผลการทำงานที่ล้มเหลวก่อน

## ตัวเลือกการกำหนดค่า

| พารามิเตอร์ | ค่าเริ่มต้นในเทมเพลต | ความหมาย |
|---|---|---|
| `projectName` | จำเป็น (`retail` ในไฟล์พารามิเตอร์) | ตัวอักษรพิมพ์เล็ก/ตัวเลข 3–10 ตัว |
| `location` | ตำแหน่งกรุ๊ปทรัพยากร | ภูมิภาคหลัก (`eastus2` ในไฟล์พารามิเตอร์) |
| `secondaryLocation` | `westus2` | ภูมิภาคบัญชี mini model |
| `tertiaryLocation` | `francecentral` | ภูมิภาคบัญชี embeddings |
| `graderLocation` | ภูมิภาคหลัก | ภูมิภาคบัญชี grader อิสระ |
| `environmentName` | `dev` | `dev`, `staging` หรือ `prod`; ชื่อเท่านั้น ไม่ใช่การตั้งค่าการป้องกัน |
| `deploymentMode` | `standard` | เลือก SKU/ความจุ |
| `enableMultiRegion` | `true` | เพิ่มบัญชีรองและ embeddings |
| `enableMonitoring` | `true` | เพิ่ม Insights/workspace และการเก็บบันทึกสภาพแวดล้อม |
| `enableSecurity` | `true` | สร้าง vault ว่างเปล่าที่เปิดใช้ RBAC เท่านั้น |

พารามิเตอร์ `openAiApiVersion` ที่ทำให้เข้าใจผิดถูกลบออก: เวอร์ชัน API ข้อมูลระนาบการทำงาน
ไม่ได้ควบคุมเวอร์ชันทรัพยากร ARM หรือเวอร์ชันโมเดล คู่ชื่อ/เวอร์ชันโมเดล
อยู่ใน `variables.modelDeployments`; ตรวจสอบพร้อมกันกับ SKU การปรับใช้

## ตรวจสอบการจัดเตรียม

ใช้ชื่อการปรับใช้จากผลลัพธ์ของสคริปต์หรือ `az deployment group list`
สำหรับการปรับใช้ตรงข้างต้น:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

คาดหวัง: สถานะการปรับใช้ `Succeeded` หากล้มเหลว ให้ตรวจสอบรายละเอียดข้อผิดพลาดการทำงาน
เพียงรายการทรัพยากรที่แสดงไม่น่าเชื่อถือในการตรวจสอบสถานะการจัดเตรียม

ทดสอบ placeholder **root** ไม่ใช่ endpoint ตัวแทนที่ไม่มีอยู่จริง:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

คาดหวัง: หน้า hello-world HTTP 200, **ไม่ใช่การตอบสนองแชท** ข้อผิดพลาด HTTP
ไม่ถือเป็นการตรวจสอบที่สำเร็จ

เพื่อทดสอบการอนุมานโมเดลหลักจริง (มีค่าใช้จ่าย):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

คาดหวัง: JSON ที่มี `choices` และ `usage` ชื่อการปรับใช้คือ
`gpt-4.1-chat` ไม่ใช่ชื่อโมเดลพื้นฐาน `gpt-4.1`

## 🔧 หลังการปรับใช้: ขั้นตอนถัดไป

นี่คือ **งานค้างการพัฒนา** ไม่ใช่แบบฝึกหัดที่เสร็จสมบูรณ์:

1. ดำเนินการตัวแทนลูกค้า/สินค้าเชื่อมต่อและสัญญา router ให้ได้รับการรับรอง
2. ดำเนินการ frontend และตรวจสอบการกำหนดค่า
3. สร้างและเติมดัชนีการค้นหาที่มีขนาด/โปรไฟล์ตรงกับโมเดล embedding ของคุณ
   และจัดการกับข้อผิดพลาดและการอัปเดตเอกสาร
4. สร้าง registry และกำหนดสิทธิ์/ตัวตนสำหรับการดึงภาพ
5. สร้างและส่งภาพจริง เปลี่ยนพอร์ต ingress และ probes ของ Container App
   ให้ตรงกับภาพเหล่านั้นก่อนการทดสอบ; พอร์ต 80 ที่นี่เป็นของ placeholder
6. กำหนด secret หรือ managed identities และบทบาทข้อมูลระนาบขอบเขต อย่า
   อ้างอิงชื่อความลับสมมติ: แบบฟอร์มนี้ไม่สร้างความลับแอปพลิเคชันใดๆ
7. ติดตั้งแอปพลิเคชัน กำหนดการแจ้งเตือน ทดสอบความล้มเหลว/การกู้คืน และประเมินผล
   ผลลัพธ์ด้วยข้อมูลพื้นฐานที่เป็นตัวแทนและการตรวจสอบโดยมนุษย์

ดู [แผนผังสถาปัตยกรรม](../retail-scenario.md) สำหรับขอบเขตการออกแบบ

## การแก้ไขปัญหาและขอบเขตความปลอดภัย

- **โมเดลไม่พร้อมใช้งาน:** ตรวจสอบโมเดล/เวอร์ชัน/SKU ภูมิภาค และโควต้าการสมัครใช้งาน;
  สคริปต์นี้ไม่ตรวจสอบแคตตาล็อกโมเดลล่วงหน้า
- **ปิดการตรวจสอบ:** ที่อยู่บันทึกสภาพแวดล้อมคือ `none` ไม่ใช่การกำหนดค่า Log Analytics ที่ว่างเปล่าผิดพลาด

- **เป็นแค่ตัวแทน:** `/chat` การประเมินตัวแทน และการดูดซับไฟล์ไม่มีอยู่จริง
- **เครือข่าย/ตัวตน:** จุดเชื่อมต่อสาธารณะและการตรวจสอบสิทธิ์ภายในเปิดใช้งาน
  การเปิดใช้งาน Key Vault RBAC เพียงอย่างเดียวไม่สร้างมอบหมายบทบาทหรือตัวตน
- **สภาพแวดล้อมการผลิต:** เพิ่มการตรวจสอบสิทธิ์ ตัวตนที่เจาะจง การจัดการความลับ
  เครือข่ายส่วนตัวเมื่อเหมาะสม การออกแบบความพร้อมใช้งาน และการทดสอบการดำเนินงาน
  บัญชีโมเดลหลายภูมิภาคเพียงอย่างเดียวไม่สนับสนุนการสำรองข้อมูล

## การล้างข้อมูล

ไม่มีโปรเจกต์ AZD ที่นี่; `azd down` ไม่ใช่คำสั่งล้างข้อมูล
หลังจากตรวจสอบว่ากลุ่มมีเพียงทรัพยากรการเรียนรู้ของคุณเท่านั้น:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

คาดว่าจะเกิดขึ้นหลังการลบเสร็จสิ้น: `false` ทรัพยากร Key Vault และ Cognitive Services
ที่ถูกลบแบบซอฟต์อาจยังคงชื่อไว้ได้; การลบอย่างถาวรต้องมีสิทธิ์ที่เหมาะสม
ตรวจสอบ Cost Management สำหรับค่าบริการที่ล่าช้า

[รายงานปัญหา](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->