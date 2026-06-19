# 2. ตรวจสอบเทมเพลต

> ตรวจสอบโดยใช้ `azd 1.25.6` ในเดือนมิถุนายน 2026

!!! tip "เมื่อจบบทเรียนนี้คุณจะสามารถ"

    - [ ] วิเคราะห์สถาปัตยกรรมโซลูชัน AI
    - [ ] เข้าใจขั้นตอนการปรับใช้ AZD
    - [ ] ใช้ GitHub Copilot เพื่อขอความช่วยเหลือเกี่ยวกับการใช้งาน AZD
    - [ ] **แลป 2:** ปรับใช้ & ตรวจสอบเทมเพลต AI Agents

---


## 1. บทนำ

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) หรือ `azd` คือเครื่องมือแบบบรรทัดคำสั่งแบบโอเพ่นซอร์สที่ช่วยให้กระบวนการทำงานของนักพัฒนาง่ายขึ้นในการสร้างและปรับใช้แอปพลิเคชันไปยัง Azure  

[เทมเพลต AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) เป็นที่เก็บข้อมูลมาตรฐานที่รวมโค้ดตัวอย่างแอปพลิเคชัน, ทรัพยากร _infrastructure-as-code_ และไฟล์กำหนดค่าของ `azd` สำหรับสถาปัตยกรรมโซลูชันที่สอดคล้องกัน การจัดหาโครงสร้างพื้นฐานก็ง่ายเพียงแค่ใช้คำสั่ง `azd provision` - ขณะที่การใช้ `azd up` จะช่วยให้คุณจัดเตรียมโครงสร้างพื้นฐาน **และ** ปรับใช้แอปพลิเคชันของคุณพร้อมกันได้เลย!

ดังนั้น การเริ่มต้นพัฒนาแอปพลิเคชันของคุณจึงง่ายเหมือนการค้นหา _เทมเพลต AZD Starter_ ที่ใกล้เคียงกับความต้องการแอปพลิเคชันและโครงสร้างพื้นฐานของคุณที่สุด - จากนั้นปรับแต่งที่เก็บข้อมูลให้เหมาะกับสถานการณ์ของคุณ

ก่อนที่เราจะเริ่มกัน มาแน่ใจก่อนว่าคุณได้ติดตั้ง Azure Developer CLI แล้ว

1. เปิดเทอร์มินัลใน VS Code และพิมพ์คำสั่งนี้:

      ```bash title="" linenums="0"
      azd version
      ```

1. คุณควรเห็นผลลัพธ์ประมาณนี้!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**ตอนนี้คุณพร้อมที่จะเลือกและปรับใช้เทมเพลตด้วย azd แล้ว**

---

## 2. การเลือกเทมเพลต

แพลตฟอร์ม Microsoft Foundry มาพร้อมกับ [ชุดเทมเพลต AZD ที่แนะนำ](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) ที่ครอบคลุมสถานการณ์โซลูชันยอดนิยม เช่น _การทำงานอัตโนมัติ workflow ของหลายเอเจนต์_ และ _การประมวลผลเนื้อหาหลายรูปแบบ_ คุณยังสามารถค้นพบเทมเพลตเหล่านี้ได้ที่พอร์ทัล Microsoft Foundry

1. เยี่ยมชม [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. ลงชื่อเข้าใช้พอร์ทัล Microsoft Foundry เมื่อมีการขอ - คุณจะเห็นหน้าตาประมาณนี้

![Pick](../../../../../translated_images/th/01-pick-template.60d2d5fff5ebc374.webp)


ตัวเลือก **Basic** คือเทมเพลตเริ่มต้นของคุณ:

1. [ ] [เริ่มต้นกับ AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) ซึ่งปรับใช้แอปแชทพื้นฐาน _พร้อมข้อมูลของคุณ_ ไปยัง Azure Container Apps ใช้เทมเพลตนี้เพื่อสำรวจสถานการณ์แชทบอท AI เบื้องต้น
1. [X] [เริ่มต้นกับ AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ซึ่งยังปรับใช้ AI Agent มาตรฐาน (พร้อม Foundry Agents) ใช้เทมเพลตนี้เพื่อทำความคุ้นเคยกับโซลูชัน AI แบบ agentic ที่เกี่ยวข้องกับเครื่องมือและโมเดล

เปิดลิงก์ที่สองในแท็บเบราว์เซอร์ใหม่ (หรือคลิก `Open in GitHub` สำหรับการ์ดที่เกี่ยวข้อง) คุณควรเห็นที่เก็บโค้ดสำหรับเทมเพลต AZD นี้ ใช้เวลาสักครู่เพื่อสำรวจ README สถาปัตยกรรมแอปพลิเคชันที่คุณเห็นมีลักษณะดังนี้:

![Arch](../../../../../translated_images/th/architecture.8cec470ec15c65c7.webp)

---

## 3. การเปิดใช้งานเทมเพลต

ลองปรับใช้เทมเพลตนี้และตรวจสอบว่าสามารถใช้งานได้จริง เราจะทำตามคำแนะนำในส่วน [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)

1. เลือกสภาพแวดล้อมการทำงานสำหรับที่เก็บเทมเพลต:

      - **GitHub Codespaces**: คลิก [ลิงก์นี้](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) และยืนยัน `Create codespace`
      - **โคลนลงมาในเครื่องหรือ dev container**: โคลน `Azure-Samples/get-started-with-ai-agents` และเปิดใน VS Code

1. รอจนกว่าเทอร์มินัล VS Code พร้อมใช้งาน จากนั้นพิมพ์คำสั่งนี้:

   ```bash title="" linenums="0"
   azd up
   ```

ทำตามขั้นตอนของเวิร์กโฟลว์ที่คำสั่งนี้จะเริ่ม

1. คุณจะถูกขอให้ลงชื่อเข้าใช้ Azure - ปฏิบัติตามคำแนะนำเพื่อยืนยันตัวตน
1. ป้อนชื่อสภาพแวดล้อมที่ไม่ซ้ำกันสำหรับคุณ - เช่น ฉันใช้ `nitya-mshack-azd`
1. คำสั่งนี้จะสร้างโฟลเดอร์ `.azure/` - คุณจะเห็นโฟลเดอร์ย่อยที่มีชื่อสภาพแวดล้อมนั้น
1. คุณจะถูกขอให้เลือกชื่อการสมัครใช้งาน - เลือกค่าเริ่มต้น
1. คุณจะถูกขอให้เลือกตำแหน่ง - ใช้ `East US 2`

ตอนนี้รอจนกว่าการจัดเตรียมจะเสร็จสิ้น **ใช้เวลาประมาณ 10-15 นาที**

1. เมื่อเสร็จแล้ว คอนโซลของคุณจะแสดงข้อความ SUCCESS ดังนี้:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. ใน Azure Portal ของคุณจะมี resource group ที่จัดเตรียมไว้ตามชื่อสภาพแวดล้อม:

      ![Infra](../../../../../translated_images/th/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **ตอนนี้คุณพร้อมที่จะตรวจสอบโครงสร้างพื้นฐานและแอปพลิเคชันที่ปรับใช้แล้ว**

---

## 4. การตรวจสอบเทมเพลต

1. เข้าไปที่หน้า Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - ล็อกอินเมื่อมีการขอ
1. คลิกที่ RG สำหรับชื่อสภาพแวดล้อมของคุณ - คุณจะเห็นหน้าตาดังที่แสดงข้างต้น

      - คลิกที่ Azure Container Apps resource
      - คลิกที่ Application Url ในส่วน _Essentials_ (มุมขวาบน)

1. คุณควรเห็นหน้าอินเทอร์เฟซแอปพลิเคชันโฮสต์แบบหน้าแรกดังนี้:

   ![App](../../../../../translated_images/th/03-test-application.471910da12c3038e.webp)

1. ลองถาม [คำถามตัวอย่างบางข้อ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. ถาม: ```What is the capital of France?``` 
      1. ถาม: ```What's the best tent under $200 for two people, and what features does it include?```

1. คุณควรได้รับคำตอบที่คล้ายกับที่แสดงด้านล่าง _แต่ทำงานอย่างไร?_

      ![App](../../../../../translated_images/th/03-test-question.521c1e863cbaddb6.webp)

---

## 5. การตรวจสอบ Agent

Azure Container App ปรับใช้ endpoint ที่เชื่อมต่อกับ AI Agent ที่ถูกจัดเตรียมไว้ในโปรเจกต์ Microsoft Foundry สำหรับเทมเพลตนี้ มาดูความหมายของเรื่องนั้นกัน

1. กลับไปยังหน้า _Overview_ ของ resource group ใน Azure Portal

1. คลิกที่ `Microsoft Foundry` resource ในรายการนั้น

1. คุณจะเห็นดังนี้ คลิกปุ่ม `Go to Microsoft Foundry Portal`
   ![Foundry](../../../../../translated_images/th/04-view-foundry-project.fb94ca41803f28f3.webp)

1. คุณจะเห็นหน้าของโปรเจกต์ Foundry สำหรับแอป AI ของคุณ
   ![Project](../../../../../translated_images/th/05-visit-foundry-portal.d734e98135892d7e.webp)

1. คลิกที่ `Agents` - คุณจะเห็น Agent เริ่มต้นที่ถูกจัดเตรียมในโปรเจกต์ของคุณ
   ![Agents](../../../../../translated_images/th/06-visit-agents.bccb263f77b00a09.webp)

1. เลือกมัน - คุณจะเห็นรายละเอียดของ Agent สังเกตจุดต่อไปนี้:

      - ตัว agent ใช้ File Search เป็นค่าเริ่มต้น (เสมอ)
      - ส่วน `Knowledge` ของ agent แสดงว่ามีไฟล์ 32 ไฟล์ที่อัปโหลด (สำหรับการค้นหาไฟล์)
      ![Agents](../../../../../translated_images/th/07-view-agent-details.0e049f37f61eae62.webp)

1. ดูตัวเลือก `Data+indexes` ในเมนูด้านซ้ายและคลิกเพื่อดูรายละเอียด

      - คุณควรเห็นไฟล์ข้อมูล 32 ไฟล์ที่อัปโหลดเพื่อใช้เป็นความรู้
      - เหล่านี้จะตรงกับไฟล์ลูกค้า 12 ไฟล์และไฟล์สินค้า 20 ไฟล์ภายใต้ `src/files`
      ![Data](../../../../../translated_images/th/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**คุณได้ตรวจสอบการทำงานของ Agent แล้ว!** 

1. การตอบกลับของ agent มีพื้นฐานจากความรู้ในไฟล์เหล่านั้น
1. ตอนนี้คุณสามารถถามคำถามที่เกี่ยวกับข้อมูลเหล่านั้นและได้รับคำตอบที่มีพื้นฐาน
1. ตัวอย่าง: `customer_info_10.json` อธิบายการซื้อ 3 รายการโดย "Amanda Perez"

กลับไปที่แท็บเบราว์เซอร์ที่มี Container App endpoint และถามว่า: `What products does Amanda Perez own?` คุณควรเห็นบางอย่างคล้ายนี้:

![Data](../../../../../translated_images/th/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. สนามเด็กเล่นของ Agent

ลองสร้างความเข้าใจเพิ่มเติมเกี่ยวกับความสามารถของ Microsoft Foundry โดยลองใช้งาน Agent ใน Agents Playground

1. กลับไปที่หน้า `Agents` ใน Microsoft Foundry - เลือก agent เริ่มต้น
1. คลิกตัวเลือก `Try in Playground` - คุณจะเห็น UI Playground ดังนี้
1. ถามคำถามเดิม: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/th/09-ask-in-playground.a1b93794f78fa676.webp)

คุณจะได้รับคำตอบเหมือนกัน (หรือคล้ายกัน) - แต่คุณจะได้รับข้อมูลเพิ่มเติมที่ช่วยให้เข้าใจคุณภาพ, ค่าใช้จ่าย และประสิทธิภาพของแอป agentic ของคุณด้วย ตัวอย่างเช่น:

1. สังเกตว่าการตอบกลับอ้างอิงข้อมูลไฟล์ที่ใช้เป็นพื้นฐาน
1. วางเมาส์เหนือชื่อไฟล์เหล่านี้ - ข้อมูลนั้นตรงกับคำถามและคำตอบที่แสดงหรือไม่?

คุณยังเห็นแถบ _สถิติ_ ด้านล่างคำตอบด้วย

1. วางเมาส์เหนือเมตริกใด ๆ เช่น ความปลอดภัย คุณจะเห็นแบบนี้
1. การประเมินที่ได้ตรงกับความรู้สึกของคุณเกี่ยวกับระดับความปลอดภัยของคำตอบหรือไม่?

      ![Data](../../../../../translated_images/th/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. การสังเกตการณ์ในตัว (Built-in Observability)

การสังเกตการณ์คือการติดตั้งเครื่องมือในแอปพลิเคชันของคุณเพื่อสร้างข้อมูลที่ช่วยให้เข้าใจ, แก้ไขปัญหา, และปรับปรุงประสิทธิภาพการทำงานของแอป เพื่อให้เห็นภาพ:

1. คลิกปุ่ม `View Run Info` - คุณจะเห็นมุมมองนี้ นี่คือตัวอย่างของ [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) ที่ทำงานจริง _คุณยังสามารถดูมุมมองนี้โดยคลิก Thread Logs ในเมนูหลัก_

   - เข้าใจขั้นตอนการทำงานและเครื่องมือที่ agent ใช้งาน
   - เข้าใจจำนวน Token ทั้งหมด (เทียบกับการใช้ output tokens) สำหรับคำตอบ
   - เข้าใจเวลาหน่วงและตำแหน่งที่ใช้เวลาในระหว่างการประมวลผล

      ![Agent](../../../../../translated_images/th/10-view-run-info.b20ebd75fef6a1cc.webp)

1. คลิกแท็บ `Metadata` เพื่อดูคุณลักษณะเพิ่มเติมที่อาจมีประโยชน์สำหรับการดีบักปัญหาในภายหลัง

      ![Agent](../../../../../translated_images/th/11-view-run-info-metadata.7966986122c7c2df.webp)


1. คลิกแท็บ `Evaluations` เพื่อดูการประเมินอัตโนมัติที่ทำกับคำตอบของ agent ซึ่งรวมถึงการประเมินความปลอดภัย (เช่น ความเสียหายต่อตัวเอง) และการประเมินเฉพาะ agent (เช่น การแก้เจตนา, การปฏิบัติตามงาน)

      ![Agent](../../../../../translated_images/th/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. สุดท้าย คลิกแท็บ `Monitoring` ในเมนูด้านข้าง

      - เลือกแท็บ `Resource usage` ในหน้าที่แสดง - และดูเมตริกต่าง ๆ
      - ติดตามการใช้งานแอปพลิเคชันในแง่ของค่าใช้จ่าย (tokens) และภาระงาน (requests)
      - ติดตามความหน่วงของแอปพลิเคชันตั้งแต่ไบต์แรก (การประมวลผลอินพุต) ถึงไบต์สุดท้าย (เอาต์พุต)

      ![Agent](../../../../../translated_images/th/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. ตัวแปรสภาพแวดล้อม (Environment Variables)

จนถึงตอนนี้ เราได้เดินผ่านการปรับใช้ในเบราว์เซอร์และตรวจสอบว่าโครงสร้างพื้นฐานถูกจัดเตรียมและแอปพลิเคชันใช้งานได้ปกติ แต่หากต้องการทำงานกับโค้ดแอปพลิเคชัน _โดยตรง_ เราต้องกำหนดค่าตัวแปรสภาพแวดล้อมในเครื่องสำหรับการทำงานกับทรัพยากรเหล่านี้ การใช้ `azd` ทำให้ง่ายขึ้นมาก

1. Azure Developer CLI [ใช้ตัวแปรสภาพแวดล้อม](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) เพื่อเก็บและจัดการการตั้งค่ากำหนดค่าสำหรับการปรับใช้แอปพลิเคชัน

1. ตัวแปรสภาพแวดล้อมจะถูกเก็บไว้ใน `.azure/<env-name>/.env` - ซึ่งช่วยจำกัดขอบเขตให้ชัดเจนสำหรับสภาพแวดล้อม `env-name` ที่ใช้ระหว่างการปรับใช้และช่วยแยกแยะสภาพแวดล้อมระหว่างเป้าหมายปรับใช้ต่าง ๆ ในที่เก็บเดียวกัน

1. ตัวแปรสภาพแวดล้อมจะถูกโหลดโดยอัตโนมัติเมื่อคำสั่ง `azd` ทำงานกับคำสั่งเฉพาะ (เช่น `azd up`) อย่างไรก็ตาม `azd` จะไม่อ่านตัวแปรสภาพแวดล้อมระดับ OS (เช่น กำหนดไว้ในเชลล์) โดยตรง - ให้ใช้คำสั่ง `azd set env` และ `azd get env` เพื่อโอนข้อมูลระหว่างสคริปต์แทน


ลองใช้คำสั่งกันสักหน่อย:

1. เรียกดูตัวแปรสภาพแวดล้อมทั้งหมดที่ตั้งไว้สำหรับ `azd` ในสภาพแวดล้อมนี้:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      คุณจะเห็นผลลัพธ์ประมาณนี้:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. เรียกดูค่าตัวแปรเฉพาะ - เช่น ฉันอยากรู้ว่าได้ตั้งค่า `AZURE_AI_AGENT_MODEL_NAME` หรือไม่

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      คุณจะเห็นผลลัพธ์ประมาณนี้ - ค่านี้ไม่ได้ตั้งไว้เป็นค่าเริ่มต้น!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. ตั้งค่าตัวแปรสภาพแวดล้อมใหม่สำหรับ `azd` ตัวอย่างนี้เราปรับชื่อโมเดล agent _หมายเหตุ: การเปลี่ยนแปลงใด ๆ จะถูกบันทึกทันทีในไฟล์ `.azure/<env-name>/.env`

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      ตอนนี้เราควรเห็นว่าค่าถูกตั้งไว้แล้ว:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. สังเกตว่าทรัพยากรบางอย่างมีความถาวร (เช่น การปรับใช้โมเดล) และต้องใช้มากกว่าแค่ `azd up` เพื่อบังคับให้ปรับใช้ซ้ำ เราจะลองถอนการติดตั้งเดิมแล้วปรับใช้ใหม่พร้อมตัวแปรสภาพแวดล้อมที่เปลี่ยนไป

1. **รีเฟรช** หากคุณเคยปรับใช้โครงสร้างพื้นฐานโดยใช้เทมเพลต azd มาก่อนหน้านี้ - คุณสามารถ _รีเฟรช_ สถานะตัวแปรสภาพแวดล้อมในเครื่องจากสถานะปัจจุบันของการปรับใช้ Azure ของคุณได้โดยใช้คำสั่งนี้:

      ```bash title="" linenums="0"
      azd env refresh
      ```

นี่คือวิธีที่ทรงพลังในการ _ซิงค์_ ตัวแปรสภาพแวดล้อมข้ามสองหรือมากกว่าสองสภาพแวดล้อมการพัฒนาท้องถิ่น (เช่น ทีมที่มีนักพัฒนาหลายคน) — อนุญาตให้โครงสร้างพื้นฐานที่ปรับใช้ทำหน้าที่เป็นความจริงพื้นฐานสำหรับสถานะของตัวแปร env สมาชิกทีมเพียงแค่ _รีเฟรช_ ตัวแปรเพื่อให้กลับมาซิงค์กัน

---

## 9. ขอแสดงความยินดี 🏆

คุณเพิ่งทำงานแบบครบวงจรที่คุณได้:

- [X] เลือกเทมเพลต AZD ที่คุณต้องการใช้
- [X] เปิดเทมเพลตในสภาพแวดล้อมการพัฒนาที่รองรับ
- [X] ปรับใช้เทมเพลตและตรวจสอบว่ามันทำงานได้

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->