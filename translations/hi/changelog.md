# चेंजलॉग - AZD शुरुआत के लिए

## परिचय

यह चेंजलॉग AZD शुरुआत के लिए भंडार में सभी उल्लेखनीय बदलावों, अपडेट्स, और सुधारों का दस्तावेज़ीकरण करता है। हम सिमेंटिक संस्करण सिद्धांतों का पालन करते हैं और इस लॉग को बनाए रखते हैं ताकि उपयोगकर्ताओं को यह समझने में मदद मिल सके कि संस्करणों के बीच क्या बदल गया है।

## सीखने के उद्देश्य

इस चेंजलॉग की समीक्षा करके, आप:
- नई विशेषताओं और सामग्री जोड़ने के बारे में सूचित रहेंगे
- मौजूदा दस्तावेज़ में किए गए सुधारों को समझेंगे
- त्रुटि सुधारों और सुधारों को ट्रैक करेंगे ताकि सटीकता सुनिश्चित हो सके
- समय के साथ सीखने की सामग्री के विकास का पालन करेंगे

## सीखने के परिणाम

चेंजलॉग प्रविष्टियों की समीक्षा करने के बाद, आप सक्षम होंगे:
- सीखने के लिए उपलब्ध नई सामग्री और संसाधनों की पहचान करना
- यह समझना कि किन अनुभागों को अपडेट या सुधारित किया गया है
- सबसे वर्तमान सामग्री के आधार पर अपनी सीखने की योजना बनाना
- भविष्य में सुधारों के लिए प्रतिक्रिया और सुझाव देना

## संस्करण इतिहास

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 रिफ्रेश: संस्करण मुद्रा अपडेट
**यह संस्करण `azd` `1.27.1` (जुलाई 2026, नवीनतम स्थिर रिलीज़) और वर्तमान प्रीव्यू AI एजेंट एक्सटेंशन `azure.ai.agents` `1.0.0-beta.5` के खिलाफ कोर्स को पुनः प्रमाणित करता है, 1.26.0, 1.27.0, और 1.27.1 रिलीज़ के बाद सभी "प्रमाणित के खिलाफ" बैनर को अद्यतन करता है।**

#### बदला गया
- **✅ सत्यापन बेसलाइन अपडेट** की गई `azd 1.25.6` (जून 2026) से `azd 1.27.1` (जुलाई 2026) तक रूट README, सभी चैप्टर README, चैप्टर 1 डेवलपर-कंटेनर पाठ (पिन किए गए संस्करण उदाहरणों सहित), चैप्टर 4 कस्टम-टेम्प्लेट पाठ, चैप्टर 5 मल्टी-एजेंट पाठ, और कार्यशाला दस्तावेज़ों में
- **🤖 चैप्टर 2 बेसलाइन रिफ्रेश** की गई `azd 1.23.12` (मार्च 2026) से `azd 1.27.1` तक `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, और `microsoft-foundry-integration.md` में; सत्यापन-नोट तिथियों को 2026-07-13 तक अपडेट किया गया
- **🧩 AI एजेंट एक्सटेंशन बढ़ाया गया** `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` से वर्तमान `1.0.0-beta.5` रिलीज़ तक चैप्टर 2 README और `agents.md` में
- **🧪 कार्यशाला सत्यापन उदाहरण** (`azd version` आउटपुट) को अपडेट किया गया `1.27.1` तक

#### संबंधित azd रिलीज़ पर नोट्स (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions पर Flex Consumption के लिए Go समर्थन, `azd config sub-filter` प्रति-टेनेंट सब्सक्रिप्शन फ़िल्टर्स, स्व-समावेशी एक्सटेंशन बंडल (`azd x pack --bundle`), और `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** `azure.yaml` में सीधे Azure AI Foundry प्रोजेक्ट/एजेंट मॉडलिंग (Bicep-रहित/Terraform-रहित इनिट), App Service (`host: appservice` + `language: docker`) के लिए कंटेनर तैनाती समर्थन, सीधे `-s/--source` के लिए `azd extension` कमांड, और `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install` के लिए `--no-dependencies` फ़्लैग, डिफ़ॉल्ट रूप से कैटलॉग/कोटा प्रॉम्प्ट से हटाए गए अप्रचलित मॉडल, और कई बग फिक्स

#### अपडेट किए गए फाइलें
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### शुरुआतकर्ता गैप-फिल #2: टेम्प्लेट ऑथरिंग, डेवलपर कंटेनर, पुलमी, एज्योर देवऑप्स, सर्विस प्रिंसिपल, और अधिक
**यह संस्करण azd-कवरिज़ विश्लेषण द्वारा सामने आए शेष मध्यवर्ती अंतरालों को बंद करता है: अपनी स्वयं की टेम्प्लेट को कैसे लिखें और प्रकाशित करें, पुनरुत्पादनीय डेवलपर कंटेनर/कोडस्पेस वातावरण, पुलमी इंफ्रास्ट्रक्चर प्रोवाइडर, Azure DevOps CI/CD वॉकथ्रू, सर्विस-प्रिंसिपल प्रमाणीकरण, होस्ट-चयन मार्गदर्शन (AKS/Spring Apps), `azd restore`/`azd package` व्याख्याएं, हुक त्रुटि-हैंडलिंग, और टीम/साझा वातावरण अभ्यास।**

#### जोड़ा गया
- **🧱 नया चैप्टर 4 पाठ** `docs/chapter-04-infrastructure/custom-templates.md` — अपनी स्वयं की azd टेम्प्लेट लेखन: आवश्यक संरचना (`azure.yaml`, `infra/`, `src/`), `metadata.template` फ़ील्ड, `uniqueString()` संसाधन टोकन और `azd-env-name` टैग के साथ इन्फ्रास्ट्रक्चर पैरामीटराइजिंग, `azd init --template <local-path>` के साथ स्थानीय परीक्षण, GitHub पर प्रकाशन, और Awesome AZD गैलरी में सबमिशन
- **📦 नया चैप्टर 1 पाठ** `docs/chapter-01-foundation/dev-containers.md` — डेवलपर कंटेनर और GitHub Codespaces के साथ पुनरुत्पादनीय azd वातावरण: आधिकारिक `ghcr.io/azure/azure-dev/azd` फीचर का न्यूनतम `.devcontainer/devcontainer.json`, भाषा-विशिष्ट फीचर, कंटेनर होस्ट के लिए `docker-in-docker`, और रिमोट साइन-इन के लिए `azd auth login --use-device-code`
- **🧩 पुलमी के साथ azd** अनुभाग `docs/chapter-04-infrastructure/provisioning.md` में — `infra.provider: pulumi`, पुलमी फ़ोल्डर लेआउट, स्टैक्स का azd वातावरण से मैपिंग, आवश्यक आउटपुट/टैगिंग, और समान `azd up` / `azd down` वर्कफ़्लो
- **🎯 होस्ट-चयन मार्गदर्शन** `docs/chapter-04-infrastructure/provisioning.md` में — एक शुरुआतकर्ता-फ्रेंडली तुलना `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, और `springapp` की, और कब AKS या Azure Spring Apps चुनें इस पर मार्गदर्शन
- **🛠️ Azure DevOps CI/CD वॉकथ्रू** `docs/chapter-08-production/production-ai-practices.md` में — `azd pipeline config --provider azdo`, सेवा कनेक्शन वर्कलोड पहचान फेडरेशन (OIDC) के साथ, जनरेटेड `azure-dev.yml`, और वेरिएबल-ग्रुप सेटअप
- **🔑 सर्विस प्रिंसिपल (पैटर्न 4)** को `docs/chapter-03-configuration/authsecurity.md` में जोड़ा गया — `az ad sp create-for-rbac`, क्लाइंट सीक्रेट के साथ गैर-इंटरएक्टिव `azd auth login` बनाम फेडरेटेड/OIDC क्रेडेंशियल, उपयोग कब करें, और सुरक्षित क्रेडेंशियल स्टोरेज
- **🪝 हुक त्रुटि-हैंडलिंग** उपखंड `docs/chapter-04-infrastructure/deployment-guide.md` में — निकास कोड और `set -e`, `continueOnError`, `azd hooks run` के साथ हुक को अलग से परीक्षण करना, OS-विशिष्ट शेल, और `--debug`
- **👥 टीम / साझा वातावरण** अनुभाग `docs/chapter-03-configuration/configuration.md` में — `.azure/` में क्या रहता है, gitignore क्या करें, प्रति-डेवलपर वातावरण, `azd env list`/`select`, और CI/CD में वातावरण मान प्रदान करना
- **🧰 `azd restore` और विस्तारित `azd package`** व्याख्याएं `resources/cheat-sheet.md` में — निर्भरता पुनर्स्थापना और बिना तैनाती के डिप्लॉय योग्य आर्टिफैक्ट बनाना

#### बदला गया
- **🧭 चैप्टर 4 पाठ तालिका** अपडेट की गई नई "अपनी स्वयं की टेम्प्लेट लेखन" पाठ (पाठ 3) को शामिल करने के लिए
- **🧭 चैप्टर 1 पाठ तालिका** अपडेट की गई नई "डेवलपर कंटेनर और कोडस्पेसेस" पाठ (पाठ 5) को शामिल करने के लिए; नेविगेशन फुटर्स को `bring-your-own-app.md` और `dev-containers.md` के बीच जोड़ा गया

### [v3.21.0] - 2026-06-16

#### शुरुआती गैप-फिल: हैंड्स-ऑन मल्टी-एजेंट पाठ, "अपना ऐप ले आएं," टेराफॉर्म, और CI/CD वॉकथ्रू
**यह संस्करण पूर्ण शुरुआती गाइड के लिए सबसे बड़े अंतरालों को बंद करता है जिसमें दो नए हैंड्स-ऑन पाठ शामिल हैं (एक तैनात मल्टी-एजेंट वॉकथ्रू और मौजूदा ऐप में azd जोड़ना), शुरुआती-फ्रेंडली हुक परिचय, टेराफॉर्म-विद-azd अनुभाग, स्टेप-बाय-स्टेप GitHub Actions पाइपलाइन वॉकथ्रू, नए प्रीव्यू एक्सटेंशनों के लिए एक व्याख्याकार, और स्पष्ट तैनाती-सत्यापन चेकलिस्ट।**

#### जोड़ा गया
- **🤝 नया चैप्टर 5 पाठ** `docs/chapter-05-multi-agent/multi-agent-basics.md` — एक पूरी तरह से हैंड्स-ऑन, तैनात किए जा सकने वाले दो-एजेंट वॉकथ्रू (ऑर्केस्ट्रेटर + विशेषज्ञ) का उपयोग करते हुए एक वास्तविक टेम्प्लेट (`contoso-creative-writer`), मल्टी-एजेंट कब उपयोग करें, `azd up` वर्कफ़्लो, तैनात संसाधनों को समझना, क्रॉस-एजेंट ट्रेसिंग, अनुकूलन, और सफाई शामिल
- **📦 नया चैप्टर 1 पाठ** `docs/chapter-01-foundation/bring-your-own-app.md` — मौजूदा प्रोजेक्ट में azd जोड़ना `azd init` ("वर्तमान निर्देशिका में कोड उपयोग करें") के साथ, `azure.yaml` और `infra/` को समझना, `azd infra generate`, होस्ट पहचान, और `azd up` के साथ तैनाती करना
- **🌐 टेराफॉर्म के साथ azd** अनुभाग जोड़ा गया `docs/chapter-04-infrastructure/provisioning.md` में — `infra.provider: terraform` कॉन्फ़िग, `.tf` फ़ोल्डर लेआउट, आवश्यक `AZURE_*` आउटपुट्स और `azd-env-name` टैगिंग, और समान `azd up` / `azd down` वर्कफ़्लो (वह अंतराल बंद करता है जहां टेराफॉर्म समर्थन का दावा किया गया था लेकिन केवल Bicep दिखाया गया था)
- **⚙️ स्टेप-बाय-स्टेप GitHub Actions वॉकथ्रू** `docs/chapter-08-production/production-ai-practices.md` में — GitHub रिपॉजिटरी से स्वचालित तैनाती तक: `azd pipeline config`, OIDC फेडरेटेड क्रेडेंशियल (कोई संग्रहीत सीक्रेट नहीं), जनरेटेड `azure-dev.yml`, और सीक्रेट-बनाम-वेरिएबल्स मार्गदर्शन
- **🪝 शुरुआती "हुक्स में नए?" परिचय** `docs/chapter-04-infrastructure/deployment-guide.md` में — हुक क्या है, हुक-स्टेज तालिका, एक न्यूनतम पहला हुक, और मैन्युअली `azd hooks run` के साथ हुक चलाना
- **✅ "अपनी तैनाती सत्यापित करें" चेकलिस्ट** जोड़ी गई चरण 5 में `docs/chapter-01-foundation/first-project.md` — स्मोक टेस्ट, हेल्थ-एंडपॉइंट जांच, और स्पष्ट सफलता मापदंड
- **🧩 नए प्रीव्यू एक्सटेंशनों के लिए व्याख्याकार** `azure.ai.skills` और `azure.ai.connections` (यह क्या हैं और कब उपयोग करें) `docs/chapter-08-production/production-ai-practices.md` में

#### बदला गया
- **🧭 चैप्टर 5 पाठ तालिका** सुधारी गई: `multi-agent-basics.md` अब पाठ 1 है (केवल पूरा हैंड्स-ऑन पाठ), ईमानदार लेबलिंग कि पाठ 2 चैप्टर 6 में है और रिटेल परिदृश्य एक आर्किटेक्चर ब्लूप्रिंट है, कोई एक-कमांड टेम्प्लेट नहीं
- **🧭 चैप्टर 1 पाठ तालिका** अब नए "अपना ऐप ले आएं" पाठ (पाठ 4) को शामिल करती है
- **🔗 नेविगेशन फुटर्स** अपडेट किए गए: `first-project.md` अब आगे के लिए लिंक करता है `bring-your-own-app.md` की ओर

#### ठीक किया गया
- **🧱 "दावा लेकिन गायब" टेराफॉर्म गैप बंद किया गया** — कोर्स ने पहले टेराफॉर्म समर्थन का संदर्भ दिया था लेकिन इसे नहीं दिखाया था
- **🔀 भ्रामक चैप्टर 5 क्रॉस-लिंक सुधारे गए** जो यह संकेत देते थे कि पूर्ण मल्टी-एजेंट कार्यान्वयन मौजूद था जबकि केवल एक आर्किटेक्चर ब्लूप्रिंट था

#### अपडेट किए गए फाइलें
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(नया)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(नया)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 रिफ्रेश, पूर्ण एजेंट लाइफसायकल कमांड और Aspire रीब्रांड

**यह संस्करण `azd` `1.25.6` (जून 2026) और `azure.ai.agents` `0.1.40-preview` एक्सटेंशन के खिलाफ पाठ्यक्रम को पुनः सत्यापित करता है, "एजेंट बनाना" से लेकर पूर्ण एजेंट जीवनचक्र (परीक्षण → मूल्यांकन → अनुकूलन → निरीक्षण → हटाना) तक AI मार्गदर्शन का विस्तार करता है, नए `azure.ai.skills` और `azure.ai.connections` प्रीव्यू एक्सटेंशनों को प्रदर्शित करता है, और ".NET Aspire" → "Aspire" उत्पाद के पुनः ब्रांडिंग को नोट करता है।**

#### जोड़ा गया
- **🔁 शुरुआती और AI इंजीनियरों के लिए पूर्ण एजेंट जीवनचक्र कवरैज** दस्तावेज़ों में:
  - `docs/chapter-01-foundation/azd-basics.md` — एक्सटेंशंस और AI कमांड्स अनुभाग में जीवनचक्र तालिका (स्कैफोल्ड → परीक्षण → मापन → सुधार → निरीक्षण → सफाई) जोड़ी गई
  - `docs/chapter-08-production/production-ai-practices.md` — नया "एजेंट जीवनचक्र प्रबंधन" अनुभाग जो `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, और `delete --force` को कवर करता है
  - `resources/cheat-sheet.md` — AI एजेंट कमांड्स को `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, और `delete --force` के साथ विस्तारित किया गया
- **🧩 नए प्रीव्यू एक्सटेंशंस** दस्तावेजीकृत: `azure.ai.skills` (पुन: प्रयोज्य एजेंट कौशल) और `azure.ai.connections` (Foundry कनेक्शंस) को एक्सटेंशंस तालिका और चीट शीट में जोड़ा गया
- **⏱️ प्रतिक्रिया-समय मार्गदर्शन** — `azd ai agent invoke` उदाहरण अब यह नोट करते हैं कि यह कुल विलंबता और प्रथम बाइट तक समय प्रिंट करता है
- **📌 संस्करण बैनर** रूट README में जो शिक्षार्थियों को `azd version` और `azd upgrade` की ओर निर्देशित करता है

#### बदला गया
- **✅ सत्यापन बेसलाइन अपडेट की गई** `azd 1.23.12` (मार्च 2026) से `azd 1.25.6` (जून 2026) पर सभी अध्याय READMEs और वर्कशॉप डॉक्स में
- **🤖 अध्याय 2 विस्तार नोट** अपडेट किया गया `azure.ai.agents` `0.1.18-preview` से `0.1.40-preview` में
- **🧪 वर्कशॉप सत्यापन उदाहरण** (`azd version` आउटपुट) को `1.25.6` में अपडेट किया गया
- **🧭 README "आज के azd में नया क्या है"** को रीफ़्रेश किया गया ताकि अंत-से-अंत एजेंट जीवनचक्र, नए AI एक्सटेंशंस, और हाल के गुणवत्ता सुधार (`azd init` आईडेम्पोटेंसी, `azd auth login` स्टेल-टोकन साफ़ करना, `azd tool` पहले रन प्रॉम्प्ट) को हाइलाइट किया जा सके
- **📖 अध्याय 2 agents.md (विकल्प 4)** अब शिक्षार्थियों को पोस्ट-डिप्लॉय जीवनचक्र कमांड्स की ओर निर्देशित करता है न कि केवल `azd up` पर रोकता है

#### ठीक किया गया
- **🏷️ उत्पाद नामकरण** — Aspire पुनः ब्रांडिंग नोट जोड़ा गया ("`.NET Aspire` अब केवल `Aspire` है"); azd की Aspire सपोर्ट अपरिवर्तित है
- **🔎 लाइव रिलीज़ सत्यापन** Azure Developer CLI रिलीज़ फ़ीड के खिलाफ पुष्टि की गई: स्थिर CLI `1.25.6` (2026-06-12) और `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### अपडेट की गई फाइल्स
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### शुरुआती ऑनबोर्डिंग स्पष्टता, सेटअप सत्यापन और अंतिम AZD कमांड सफाई
**यह संस्करण AZD 1.23 सत्यापन स्वीप के बाद शुरू करता है एक शुरुआती-केंद्रित डॉक्यूमेंटेशन पास: यह AZD-प्रथम प्रमाणीकरण मार्गदर्शन को स्पष्ट करता है, स्थानीय सेटअप सत्यापन स्क्रिप्ट जोड़ता है, प्रमुख कमांड्स को लाइव AZD CLI के खिलाफ सत्यापित करता है, और चेंजलॉग के बाहर पुराने अंग्रेज़ी- स्रोत कमांड संदर्भों को हटाता है।**

#### जोड़ा गया
- **🧪 शुरुआती सेटअप सत्यापन स्क्रिप्ट्स** `validate-setup.ps1` और `validate-setup.sh` के साथ ताकि शिक्षार्थी अध्याय 1 शुरू करने से पहले आवश्यक टूल्स की पुष्टि कर सकें
- **✅ आरंभिक सेटअप सत्यापन कदम** रूट README और अध्याय 1 README में ताकि `azd up` से पहले आवश्यकताओं की कमी पकड़ ली जा सके

#### बदला गया
- **🔐 शुरुआती प्रमाणीकरण मार्गदर्शन** अब लगातार `azd auth login` को AZD वर्कफ़्लोज़ के लिए प्राथमिक मार्ग के रूप में मानता है, जबकि `az login` वैकल्पिक बताया गया है जब तक कि Azure CLI कमांड्स सीधे उपयोग न किए जाएं
- **📚 अध्याय 1 ऑनबोर्डिंग फ्लो** अब शिक्षार्थियों को स्थानीय सेटअप सत्यापित करने की दिशा में निर्देशित करता है इंस्टॉलेशन, प्रमाणीकरण, और पहले डिप्लॉयमेंट कदम से पहले
- **🛠️ सत्यापन संदेश** अब स्पष्ट रूप से अवरुद्ध आवश्यकताओं को AZD-केवल शुरुआती पथ के लिए वैकल्पिक Azure CLI चेतवानीयों से अलग करता है
- **📖 कॉन्फ़िगरेशन, समस्या निवारण, और उदाहरण डॉक्यूमेंट्स** अब आवश्यक AZD प्रमाणीकरण और वैकल्पिक Azure CLI साइन-इन के बीच भेद करता है जहां पहले दोनों संदर्भ बिना प्रसंग के प्रस्तुत किए थे

#### ठीक किया गया
- **📋 शेष अंग्रेज़ी- स्रोत कमांड संदर्भ** वर्तमान AZD स्वरूपों में अपडेट किए गए, जिसमें चीट शीट में `azd config show` और `azd monitor --overview` शामिल हैं जहां Azure पोर्टल अवलोकन मार्गदर्शन था
- **🧭 अध्याय 1 में शुरुआती दावे** कुछ नरम किए गए ताकि सभी टेम्प्लेट और Azure संसाधनों पर त्रुटि-मुक्त या रोलबैक व्यवहार की गारंटी न दी जाए
- **🔎 लाइव CLI सत्यापन** वर्तमान समर्थन की पुष्टि करता है `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, और `azd down --force --purge`

#### अपडेट की गई फाइल्स
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 सत्यापन, वर्कशॉप पर्यावरण विस्तार और AI मॉडल ताज़ा
**यह संस्करण `azd` `1.23.12` के खिलाफ एक डॉक्यूमेंटेशन सत्यापन स्वीप करता है, पुरानी AZD कमांड उदाहरणों को अपडेट करता है, AI मॉडल मार्गदर्शन को वर्तमान डिफ़ॉल्ट्स तक ताज़ा करता है, और वर्कशॉप निर्देशों को GitHub Codespaces से परे विस्तृत करता है ताकि dev कंटेनरों और स्थानीय क्लोन्स का समर्थन भी हो सके।**

#### जोड़ा गया
- **✅ मुख्य अध्यायों और वर्कशॉप डॉक्स में सत्यापन नोट्स** ताकि परीक्षित AZD बेसलाइन नए या पुराने CLI बिल्ड का उपयोग करने वाले शिक्षार्थियों के लिए स्पष्ट हो
- **⏱️ तैनाती टाइमआउट मार्गदर्शन** लंबी चलने वाली AI एप डेप्लॉयमेंट के लिए `azd deploy --timeout 1800`
- **🔎 एक्सटेंशन निरीक्षण कदम** `azd extension show azure.ai.agents` के साथ AI वर्कफ़्लो डॉक्स में
- **🌐 व्यापक वर्कशॉप पर्यावरण मार्गदर्शन** GitHub Codespaces, dev कंटेनर, और लोकल क्लोन्स को MkDocs के साथ कवर करता है

#### बदला गया
- **📚 अध्याय प्रारंभ READMEs** अब निरंतर रूप से सभी बुनियादी, कॉन्फ़िगरेशन, इन्फ्रास्ट्रक्चर, मल्टी-एजेंट, प्री-डिप्लॉयमेंट, समस्या निवारण, और उत्पादकता अनुभागों में `azd 1.23.12` के विरुद्ध सत्यापन नोट करते हैं
- **🛠️ AZD कमांड संदर्भ** डॉक्यूमेंट में वर्तमान स्वरूपों के लिए अपडेट किए गए:
  - `azd config list` → `azd config show`
  - `azd env show` → संदर्भ के अनुसार `azd env list` या `azd env get-value(s)`
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → जहां एप्लिकेशन इंसाइट्स अवलोकन अपेक्षित हो `azd monitor --overview`
- **🧪 प्राविजन प्रीव्यू उदाहरणों** को वर्तमान समर्थित उपयोग जैसे `azd provision --preview` और `azd provision --preview -e production` तक सरल किया गया
- **🧭 वर्कशॉप फ्लो** अपडेट किया गया ताकि शिक्षार्थी Codespaces, dev कंटेनर या लोकल क्लोन में लैब्स पूरे कर सकें न कि केवल Codespaces-केवल निष्पादन मान कर
- **🔐 प्रमाणीकरण मार्गदर्शन** अब AZD वर्कफ्लोज़ के लिए `azd auth login` को प्राथमिक मानता है, जबकि `az login` को वैकल्पिक बताया गया है जब Azure CLI कमांड सीधे उपयोग हों

#### ठीक किया गया
- **🪟 विंडोज इंस्टाल कमांड्स** इंस्टालेशन गाइड में वर्तमान `winget` पैकेज केसिंग के साथ सामान्यीकृत
- **🐧 लिनक्स इंस्टाल मार्गदर्शन** असमर्थित डistro-विशिष्ट `azd` पैकेज मैनेजर निर्देशों से बचने के लिए सही किया गया और जहां उपयुक्त रिलीज परिसंपत्तियों की ओर संकेत किया गया
- **📦 AI मॉडल उदाहरण** पुराने डिफ़ॉल्ट जैसे `gpt-35-turbo` और `text-embedding-ada-002` से वर्तमान उदाहरण जैसे `gpt-4.1-mini`, `gpt-4.1`, और `text-embedding-3-large` तक ताज़ा
- **📋 तैनाती और डायग्नोस्टिक्स स्निपेट्स** लॉग्स, स्क्रिप्ट्स, और समस्या निवारण कदमों में वर्तमान वातावरण और स्थिति कमांड के उपयोग के लिए सही किया गया
- **⚙️ GitHub Actions मार्गदर्शन** को `Azure/setup-azd@v1.0.0` से `Azure/setup-azd@v2` में अपडेट किया गया
- **🤖 MCP/Copilot सहमति मार्गदर्शन** को `azd mcp consent` से `azd copilot consent list` में अपडेट किया गया

#### बेहतर किया गया
- **🧠 AI अध्याय मार्गदर्शन** अब प्रीव्यू-संवेदनशील `azd ai` व्यवहार, टेनेन्ट-विशिष्ट लॉगिन, वर्तमान एक्सटेंशन उपयोग, और अपडेटेड मॉडल तैनाती सिफारिशों को बेहतर समझाता है
- **🧪 वर्कशॉप निर्देश** अब अधिक यथार्थवादी संस्करण उदाहरणों और स्पष्ट पर्यावरण सेटअप भाषा का उपयोग करते हैं हाथ-पर लैब्स के लिए
- **📈 उत्पादकता और समस्या निवारण डॉक्स** अब वर्तमान मॉनिटरिंग, फॉलबैक मॉडल, और लागत-स्तर उदाहरणों के साथ बेहतर संगति रखते हैं

#### अपडेट की गई फाइल्स
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI कमांड्स, सामग्री सत्यापन और टेम्प्लेट विस्तार
**यह संस्करण `azd ai`, `azd extension`, और `azd mcp` कमांड कवर करता है सभी AI-संबंधित अध्यायों में, agents.md में टूटे हुए लिंक और अप्रचलित कोड को ठीक करता है, चीट शीट को अपडेट करता है, और उदाहरण टेम्प्लेट्स अनुभाग का पुनरावलोकन करता है जो सत्यापित विवरणों और नए Azure AI AZD टेम्प्लेट्स के साथ है।**

#### जोड़ा गया
- **🤖 AZD AI CLI कवरैज** 7 फ़ाइलों में (पहले केवल अध्याय 8 में था):
  - `docs/chapter-01-foundation/azd-basics.md` — नया "एक्सटेंशंस और AI कमांड्स" सेक्शन जो `azd extension`, `azd ai agent init`, और `azd mcp` का परिचय देता है
  - `docs/chapter-02-ai-development/agents.md` — विकल्प 4: `azd ai agent init` तुलना तालिका के साथ (टेम्प्लेट बनाम मैनिफेस्ट तरीका)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD एक्सटेंशंस फॉर फाउंड्री" और "एजेंट-प्रथम तैनाती" उपखंड

  - `docs/chapter-05-multi-agent/README.md` — क्विक स्टार्ट अब टेम्प्लेट और मेनिफेस्ट-आधारित डिप्लॉयमेंट पाथ दोनों दिखाता है
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — डिप्लॉय सेक्शन अब `azd ai agent init` विकल्प शामिल करता है
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "डायग्नोस्टिक्स के लिए AZD AI एक्सटेंशन कमांड" उपखंड
  - `resources/cheat-sheet.md` — नया "AI & एक्सटेंशंस कमांड" सेक्शन `azd extension`, `azd ai agent init`, `azd mcp`, और `azd infra generate` के साथ
- **📦 नए AZD AI उदाहरण टेम्प्लेट** `microsoft-foundry-integration.md` में:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, और वॉइस चैट समर्थन के साथ .NET RAG चैट
  - **azure-search-openai-demo-java** — Langchain4J का उपयोग करते हुए Java RAG चैट, ACA/AKS डिप्लॉयमेंट विकल्पों के साथ
  - **contoso-creative-writer** — Azure AI एजेंट सेवा, Bing Grounding, और Prompty का उपयोग करने वाला मल्टी-एजेंट क्रिएटिव राइटिंग ऐप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB के साथ सर्वरलेस RAG, Ollama स्थानीय विकास समर्थन के साथ
  - **chat-with-your-data-solution-accelerator** — एंटरप्राइज़ RAG एक्सेलेरेटर एडमिन पोर्टल, Teams इंटीग्रेशन, और PostgreSQL/Cosmos DB विकल्पों के साथ
  - **azure-ai-travel-agents** — .NET, Python, Java, और TypeScript में सर्वरों के साथ मल्टी-एजेंट MCP ऑर्केस्ट्रेशन संदर्भ ऐप
  - **azd-ai-starter** — न्यूनतम Azure AI इन्फ्रास्ट्रक्चर बाइसेप स्टार्टर टेम्प्लेट
  - **🔗 Awesome AZD AI गैलरी लिंक** — [awesome-azd AI गैलरी](https://azure.github.io/awesome-azd/?tags=ai) का संदर्भ (80+ टेम्प्लेट)

#### ठीक किया गया
- **🔗 agents.md नेविगेशन**: पिछले/अगले लिंक अब अध्याय 2 README पाठ क्रम से मेल खाते हैं (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md टूटी हुई लिंक**: `production-ai-practices.md` को `../chapter-08-production/production-ai-practices.md` से ठीक किया गया (3 बार)
- **📦 agents.md पुराना कोड**: `opencensus` को `azure-monitor-opentelemetry` + OpenTelemetry SDK से बदला गया
- **🐛 agents.md अमान्य API**: `max_tokens` को `create_agent()` से हटाकर `create_run()` में `max_completion_tokens` के रूप में स्थानांतरित किया गया
- **🔢 agents.md टोकन गिनती**: मोटा `len//4` अनुमान `tiktoken.encoding_for_model()` से बदला गया
- **azure-search-openai-demo**: सेवाओं को "Cognitive Search + App Service" से "Azure AI Search + Azure Container Apps" में सही किया गया (डिफ़ॉल्ट होस्ट अक्टूबर 2024 में बदला)
- **contoso-chat**: विवरण को अपडेट किया गया Azure AI Foundry + Prompty का संदर्भ देते हुए, रिपॉ के वास्तविक शीर्षक और तकनीकी स्टैक से मेल खाता है

#### हटाया गया
- **ai-document-processing**: गैर-कार्यक्षम टेम्प्लेट संदर्भ हटा दिया गया (रिपॉ सार्वजनिक रूप से AZD टेम्प्लेट के रूप में उपलब्ध नहीं)

#### सुधार किया गया
- **📝 agents.md अभ्यास**: अभ्यास 1 अब अपेक्षित आउटपुट और `azd monitor` चरण दिखाता है; अभ्यास 2 में पूर्ण `FunctionTool` पंजीकरण कोड शामिल है; अभ्यास 3 अस्पष्ट दिशानिर्देशों को ठोस `prepdocs.py` कमांड्स से बदलता है
- **📚 agents.md संसाधन**: दस्तावेज़ीकरण लिंक को वर्तमान Azure AI Agent Service दस्तावेज और क्विकस्टार्ट से अपडेट किया गया
- **📋 agents.md अगले कदम तालिका**: संपूर्ण अध्याय कवरेज के लिए AI वर्कशॉप लैब लिंक जोड़ा गया

#### अपडेट की गई फाइलें
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### कोर्स नेविगेशन संवर्द्धन
**यह संस्करण README.md अध्याय नेविगेशन को विस्तारित तालिका प्रारूप के साथ बेहतर बनाता है।**

#### बदला गया
- **कोर्स मैप टेबल**: सीधे पाठ लिंक, अवधि अनुमान, और जटिलता रेटिंग के साथ संवर्द्धित
- **फ़ोल्डर सफाई**: अनावश्यक पुराने फ़ोल्डरों को हटाया गया (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **लिंक सत्यापन**: कोर्स मैप टेबल में सभी 21+ आंतरिक लिंक सत्यापित

### [v3.16.0] - 2026-02-05

#### उत्पाद नाम अपडेट
**यह संस्करण उत्पाद संदर्भों को वर्तमान Microsoft ब्रांडिंग के अनुसार अपडेट करता है।**

#### बदला गया
- **Microsoft Foundry → Microsoft Foundry**: सभी संदर्भ गैर-अनुवाद फ़ाइलों में अपडेट किए गए
- **Azure AI Agent Service → Foundry Agents**: सेवा नाम वर्तमान ब्रांडिंग को दर्शाने के लिए अपडेट किया गया

#### अपडेट की गई फाइलें
- `README.md` - मुख्य कोर्स लैंडिंग पृष्ठ
- `changelog.md` - संस्करण इतिहास
- `course-outline.md` - कोर्स संरचना
- `docs/chapter-02-ai-development/agents.md` - AI एजेंट गाइड
- `examples/README.md` - उदाहरण दस्तावेज़ीकरण
- `workshop/README.md` - कार्यशाला लैंडिंग पृष्ठ
- `workshop/docs/index.md` - कार्यशाला सूचकांक
- `workshop/docs/instructions/*.md` - सभी कार्यशाला निर्देश फ़ाइलें

---

### [v3.15.0] - 2026-02-05

#### प्रमुख रिपोजिटरी पुनर्गठन: अध्याय-आधारित फ़ोल्डर नाम
**यह संस्करण स्पष्ट नेविगेशन के लिए दस्तावेज़ीकरण को समर्पित अध्याय फ़ोल्डरों में पुनर्गठित करता है।**

#### फ़ोल्डर नाम परिवर्तन
पुराने फ़ोल्डरों को अध्याय-संख्यांकित फ़ोल्डरों से बदल दिया गया है:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- नया जोड़ा गया: `docs/chapter-05-multi-agent/`

#### फ़ाइल स्थानांतरण
| फ़ाइल | से | तक |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |

| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### जोड़ा गया
- **📚 अध्याय README फ़ाइलें**: प्रत्येक अध्याय फ़ोल्डर में README.md बनाया गया जिसमें:
  - सीखने के उद्देश्य और अवधि
  - विवरण के साथ पाठ तालिका
  - त्वरित प्रारंभ कमांड्स
  - अन्य अध्यायों के लिए नेविगेशन

#### बदला गया
- **🔗 सभी आंतरिक लिंक अपडेट किए गए**: 78+ पथ सभी दस्तावेज़ फ़ाइलों में अपडेट किए गए
- **🗺️ मुख्य README.md**: नए अध्याय संरचना के साथ कोर्स मैप अपडेट किया गया
- **📝 examples/README.md**: अध्याय फ़ोल्डरों के लिए क्रॉस-रेफरेंस अपडेट किए गए

#### हटाया गया
- पुरानी फ़ोल्डर संरचना (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रिपॉजिटरी पुनर्गठन: अध्याय नेविगेशन
**इस संस्करण में अध्याय नेविगेशन README फ़ाइलें जोड़ी गईं (v3.15.0 द्वारा प्रतिस्थापित)।**

---

### [v3.13.0] - 2026-02-05

#### नया AI एजेंट्स गाइड
**यह संस्करण Azure Developer CLI के साथ AI एजेंट तैनात करने के लिए एक व्यापक गाइड जोड़ता है।**

#### जोड़ा गया
- **🤖 docs/microsoft-foundry/agents.md**: पूर्ण गाइड जिसमें शामिल हैं:
  - AI एजेंट्स क्या हैं और वे चैटबॉट्स से कैसे अलग हैं
  - तीन त्वरित प्रारंभ एजेंट टेम्प्लेट (Foundry Agents, Prompty, RAG)
  - एजेंट आर्किटेक्चर पैटर्न (सिंगल एजेंट, RAG, मल्टी-एजेंट)
  - उपकरण विन्यास और अनुकूलन
  - निगरानी और मेट्रिक्स ट्रैकिंग
  - लागत विचार और अनुकूलन
  - सामान्य ट्रबलशूटिंग परिदृश्य
  - तीन व्यावहारिक अभ्यास सफलता मानदंड के साथ

#### सामग्री संरचना
- **परिचय**: शुरुआती के लिए एजेंट अवधारणाएं
- **त्वरित प्रारंभ**: `azd init --template get-started-with-ai-agents` के साथ एजेंट तैनात करें
- **आर्किटेक्चर पैटर्न**: एजेंट पैटर्न के दृश्य चित्र
- **विन्यास**: उपकरण सेटअप और पर्यावरण चर
- **निगरानी**: एप्लिकेशन इनसाइट्स एकीकरण
- **अभ्यास**: प्रगतिशील हाथों-पर अभ्यास (प्रत्येक 20-45 मिनट)

---

### [v3.12.0] - 2026-02-05

#### DevContainer पर्यावरण अपडेट
**यह संस्करण विकास कंटेनर कॉन्फ़िगरेशन को आधुनिक उपकरणों और बेहतर डिफ़ॉल्ट के साथ AZD सीखने के अनुभव के लिए अपडेट करता है।**

#### बदला गया
- **🐳 बेस इमेज**: `python:3.12-bullseye` से अपडेट करके `python:3.12-bookworm` (नवीनतम डेबियन स्थिर)
- **📛 कंटेनर नाम**: स्पष्टता के लिए "Python 3" से "AZD for Beginners" में नामित किया गया

#### जोड़ा गया
- **🔧 नए Dev Container फीचर्स**:
  - `azure-cli` जिसमें Bicep समर्थन सक्षम है
  - `node:20` (AZD टेम्प्लेट के लिए LTS संस्करण)
  - टेम्प्लेट प्रबंधन के लिए `github-cli`
  - कंटेनर ऐप तैनाती के लिए `docker-in-docker`

- **🔌 पोर्ट फॉरवर्डिंग**: सामान्य विकास के लिए पूर्व-कॉन्फ़िगर किए गए पोर्ट:
  - 8000 (MkDocs पूर्वावलोकन)
  - 3000 (वेब ऐप)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 नए VS कोड एक्सटेंशंस**:
  - `ms-python.vscode-pylance` - उन्नत Python इंटेलीसेंस
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - Bicep भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure संसाधन प्रबंधन
  - `yzhang.markdown-all-in-one` - Markdown संपादन
  - `DavidAnson.vscode-markdownlint` - Markdown लिंटिंग
  - `bierner.markdown-mermaid` - Mermaid आरेख समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml के लिए)
  - `eamodio.gitlens` - Git विज़ुअलाइज़ेशन
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS कोड सेटिंग्स**: Python इंटरप्रेटर, फॉर्मेट ऑन सेव, और व्हाइटस्पेस ट्रिमिंग के लिए डिफ़ॉल्ट सेटिंग्स जोड़े गए

- **📦 अपडेटेड requirements-dev.txt**:
  - MkDocs मिनिफाई प्लगइन जोड़ा गया
  - कोड गुणवत्ता के लिए प्री-कमिट जोड़ा गया
  - Azure SDK पैकेज जोड़े गए (azure-identity, azure-mgmt-resource)

#### ठीक किया गया
- **पोस्ट-क्रिएट कमांड**: कंटेनर स्टार्ट पर अब AZD और Azure CLI इंस्टॉलेशन सत्यापित करता है

---

### [v3.11.0] - 2026-02-05

#### शुरुआती के लिए README ओवरहाल
**इस संस्करण में README.md को शुरुआती उपयोगकर्ताओं के लिए अधिक सुलभ बनाने और AI डेवलपर्स के लिए आवश्यक संसाधन जोड़ने के लिए महत्वपूर्ण सुधार किया गया है।**

#### जोड़ा गया
- **🆚 Azure CLI बनाम AZD तुलना**: प्रत्येक उपकरण का उपयोग कब करना है इसका स्पष्ट वर्णन व्यावहारिक उदाहरणों के साथ
- **🌟 शानदार AZD लिंक**: समुदाय टेम्प्लेट गैलरी और योगदान संसाधनों के सीधे लिंक:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तैनाती के लिए तैयार टेम्प्लेट
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदाय योगदान
- **🎯 त्वरित प्रारंभ गाइड**: सरल 3-चरण प्रारंभ अनुभाग (इंस्टॉल करें → लॉगिन करें → तैनात करें)
- **📊 अनुभव आधारित नेविगेशन तालिका**: डेवलपर अनुभव के आधार पर कहां से शुरू करें इसका स्पष्ट मार्गदर्शन

#### बदला गया
- **README संरचना**: प्रगतिशील प्रकटीकरण के लिए पुनर्गठित - प्रमुख जानकारी पहले
- **परिचय अनुभाग**: पूर्ण शुरुआती के लिए "The Magic of `azd up`" समझाने के लिए पुनर्लेखित
- **डुप्लिकेट सामग्री हटाई गई**: डुप्लिकेट ट्रबलशूटिंग अनुभाग हटा दिया गया

- **समस्या निवारण कमांड**: मान्य `azd monitor --logs` का उपयोग करने के लिए `azd logs` संदर्भ को ठीक किया गया

#### ठीक किया गया

- **🔐 प्रमाणीकरण कमांड**: `azd auth login` और `azd auth logout` cheat-sheet.md में जोड़े गए
- **अमान्य कमांड संदर्भ**: README ट्रबलशूटिंग अनुभाग से शेष `azd logs` हटा दिया गया

#### नोट्स
- **स्कोप**: मुख्य README.md और resources/cheat-sheet.md पर परिवर्तन लागू किए गए
- **लक्षित दर्शक**: सुधार विशेष रूप से AZD के नए डेवलपर्स के लिए हैं

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI कमांड सटीकता अपडेट
**इस संस्करण ने संपूर्ण दस्तावेज़ में मौजूद गैर-मौजूद AZD कमांड्स को ठीक किया है, यह सुनिश्चित करते हुए कि सभी कोड उदाहरण वैध Azure Developer CLI सिंटैक्स का उपयोग करें।**

#### ठीक किया गया
- **🔧 गैर-मौजूद AZD कमांड हटाए गए**: अमान्य कमांड का व्यापक ऑडिट और सुधार:
  - `azd logs` (नहीं है) → `azd monitor --logs` या Azure CLI विकल्पों से बदला गया
  - `azd service` उपकमांड (नहीं हैं) → `azd show` और Azure CLI से बदला गया
  - `azd infra import/export/validate` (नहीं हैं) → हटाया गया या वैध विकल्पों से बदला गया
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` फ्लैग (नहीं हैं) → हटा दिया गया
  - `azd provision --what-if/--rollback` फ्लैग (नहीं हैं) → `--preview` का उपयोग करने के लिए अपडेट किया गया
  - `azd config validate` (नहीं है) → `azd config list` से बदला गया
  - `azd info`, `azd history`, `azd metrics` (नहीं हैं) → हटा दिया गया

- **📚 कमांड सुधारों के साथ फ़ाइलें अपडेट की गईं**:
  - `resources/cheat-sheet.md`: कमांड संदर्भ का बड़ा पुनर्निरीक्षण
  - `docs/deployment/deployment-guide.md`: रोलबैक और डिप्लॉयमेंट रणनीतियाँ ठीक की गईं
  - `docs/troubleshooting/debugging.md`: लॉग विश्लेषण अनुभाग सुधारा गया
  - `docs/troubleshooting/common-issues.md`: ट्रबलशूटिंग कमांड अपडेट किए गए
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिंग सेक्शन ठीक किया गया
  - `docs/getting-started/azd-basics.md`: मोनिटरिंग कमांड सुधार किए गए
  - `docs/getting-started/first-project.md`: मॉनिटरिंग और डिबगिंग उदाहरण अपडेट किए गए
  - `docs/getting-started/installation.md`: मदद और संस्करण उदाहरण ठीक किए गए
  - `docs/pre-deployment/application-insights.md`: लॉग दृश्यता कमांड ठीक किए गए
  - `docs/pre-deployment/coordination-patterns.md`: एजेंट डिबगिंग कमांड ठीक किए गए

- **📝 संस्करण संदर्भ अपडेट किया गया**: 
  - `docs/getting-started/installation.md`: हार्डकोडेड `1.5.0` संस्करण को सामान्य `1.x.x` में बदल दिया गया, रिलीज़ लिंक के साथ

#### बदला गया
- **रोलबैक रणनीतियाँ**: दस्तावेज़ को Git-आधारित रोलबैक का उपयोग करने के लिए अपडेट किया गया (AZD में मूल रोलबैक नहीं है)
- **लॉग देखना**: `azd logs` संदर्भों को `azd monitor --logs`, `azd monitor --live`, और Azure CLI कमांड से बदला गया
- **प्रदर्शन अनुभाग**: गैर-मौजूद समानांतर/इन्क्रीमेंटल डिप्लॉयमेंट फ्लैग हटाए गए, वैध विकल्प दिए गए

#### तकनीकी विवरण
- **वैध AZD कमांड**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **वैध azd monitor फ्लैग**: `--live`, `--logs`, `--overview`
- **हटाए गए फीचर्स**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### नोट्स
- **सत्यापन**: कमांड Azure Developer CLI v1.23.x के खिलाफ सत्यापित किए गए

---

### [v3.9.0] - 2026-02-05

#### कार्यशाला पूर्णता और दस्तावेज़ गुणवत्ता अपडेट
**इस संस्करण में इंटरैक्टिव कार्यशाला मॉड्यूल पूरे किए गए हैं, सभी टूटे हुए दस्तावेज़ लिंक ठीक किए गए हैं, और माइक्रोसॉफ्ट AZD उपयोग करने वाले AI डेवलपर्स के लिए समग्र सामग्री गुणवत्ता में सुधार किया गया है।**

#### जोड़ा गया
- **📝 CONTRIBUTING.md**: नए योगदान दिशानिर्देश दस्तावेज़ के साथ:
  - मुद्दे रिपोर्ट करने और परिवर्तन प्रस्तावित करने के स्पष्ट निर्देश
  - नई सामग्री के लिए दस्तावेज़ मानक
  - कोड उदाहरण दिशानिर्देश और कमिट संदेश कन्वेंशन्स
  - सामुदायिक सहभागिता जानकारी

#### पूरा किया गया
- **🎯 कार्यशाला मॉड्यूल 7 (समापन)**: पूरी तरह पूरा समापन मॉड्यूल के साथ:
  - कार्यशाला उपलब्धियों का व्यापक सारांश
  - AZD, टेम्पलेट्स, और Microsoft Foundry के प्रमुख अवधारणा अनुभाग
  - सीखने की यात्रा जारी रखने के सुझाव
  - कार्यशाला चुनौती अभ्यास कठिनाई रेटिंग के साथ
  - सामुदायिक प्रतिक्रिया और समर्थन लिंक

- **📚 कार्यशाला मॉड्यूल 3 (विखंडन)**: अद्यतन सीखने के उद्देश्य के साथ:
  - GitHub Copilot MCP सर्वरों के साथ सक्रियकरण गाइडलाइन
  - AZD टेम्पलेट फ़ोल्डर संरचना की समझ
  - इन्फ्रास्ट्रक्चर-एज-कोड (Bicep) संगठन पैटर्न
  - व्यावहारिक लैब निर्देश

- **🔧 कार्यशाला मॉड्यूल 6 (डिसमेन्टल)**: पूरा किया गया:
  - संसाधन सफाई और लागत प्रबंधन उद्देश्य
  - सुरक्षित इन्फ्रास्ट्रक्चर डिप्रोविजनिंग के लिए `azd down` का उपयोग
  - सॉफ्ट-डिलीटेड कॉग्निटिव सेवाओं की पुनर्प्राप्ति मार्गदर्शन
  - GitHub Copilot और Azure Portal के लिए बोनस एक्सप्लोरेशन प्रॉम्प्ट

#### ठीक किया गया
- **🔗 टूटे हुए लिंक ठीक किए गए**: 15+ टूटे हुए आंतरिक दस्तावेज़ लिंक सुलझाए गए:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md के पथ ठीक किए गए
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md और production-ai-practices.md पथ सही किए गए
  - `docs/getting-started/first-project.md`: गैर-मौजूद cicd-integration.md को deployment-guide.md से बदला गया
  - `examples/retail-scenario.md`: FAQ और ट्रबलशूटिंग गाइड पथ ठीक किए गए
  - `examples/container-app/microservices/README.md`: कोर्स होम और डिप्लॉयमेंट गाइड पथ सही किए गए
  - `resources/faq.md` और `resources/glossary.md`: AI अध्याय संदर्भ अपडेट किए गए
  - `course-outline.md`: प्रशिक्षक गाइड और AI कार्यशाला लैब संदर्भ ठीक किए गए

- **📅 कार्यशाला स्थिति बैनर**: "अंडर कंस्ट्रक्शन" से सक्रिय कार्यशाला स्थिति पर फरवरी 2026 तारीख के साथ अपडेट किया गया

- **🔗 कार्यशाला नेविगेशन**: कार्यशाला README.md में टूटे हुए नेविगेशन लिंक ठीक किए गए जो गैर-मौजूद lab-1-azd-basics फ़ोल्डर की ओर इशारा कर रहे थे

#### बदला गया
- **कार्यशाला प्रस्तुति**: "अंडर कंस्ट्रक्शन" चेतावनी हटाई गई, कार्यशाला अब पूरी और उपयोग के लिए तैयार है
- **नेविगेशन स्थिरता**: सभी कार्यशाला मॉड्यूल में उचित अंतः-मॉड्यूल नेविगेशन सुनिश्चित किया गया
- **सीखने पथ संदर्भ**: अध्याय के क्रॉस-संदर्भ सही microsoft-foundry पथों का उपयोग करने के लिए अपडेट किए गए

#### सत्यापित
- ✅ सभी अंग्रेज़ी मार्कडाउन फ़ाइलों में वैध आंतरिक लिंक
- ✅ कार्यशाला मॉड्यूल 0-7 सीखने के उद्देश्यों के साथ पूर्ण
- ✅ अध्यायों और मॉड्यूल के बीच नेविगेशन सही ढंग से कार्य करता है
- ✅ सामग्री Microsoft AZD उपयोगकर्ता AI डेवलपर्स के लिए उपयुक्त है
- ✅ शुरुआत के लिए उपयुक्त भाषा और संरचना बनाए रखी गई है
- ✅ CONTRIBUTING.md सामुदायिक योगदानकर्ताओं के लिए स्पष्ट दिशा-निर्देश प्रदान करता है

#### तकनीकी निष्पादन
- **लिंक सत्यापन**: ऑटोमेटेड PowerShell स्क्रिप्ट ने सभी .md आंतरिक लिंक सत्यापित किए
- **सामग्री ऑडिट**: कार्यशाला की पूर्णता और शुरुआत के लिए उपयुक्तता की मैनुअल समीक्षा
- **नेविगेशन सिस्टम**: अध्याय और मॉड्यूल नेविगेशन पैटर्न की निरंतरता लागू की गई

#### नोट्स
- **स्कोप**: परिवर्तन केवल अंग्रेज़ी दस्तावेज़ पर लागू
- **अनुवाद**: इस संस्करण में अनुवाद फ़ोल्डर अपडेट नहीं हुए (स्वचालित अनुवाद बाद में सिंक करेगा)
- **कार्यशाला अवधि**: पूरी कार्यशाला अब 3-4 घंटे का व्यावहारिक सीखने का अनुभव प्रदान करती है

---

### [v3.8.0] - 2025-11-19

#### उन्नत दस्तावेज़ीकरण: मॉनिटरिंग, सुरक्षा, और मल्टी-एजेंट पैटर्न
**यह संस्करण एप्लिकेशन इनसाइट्स एकीकरण, प्रमाणीकरण पैटर्न, और प्रोडक्शन डिप्लॉयमेंट के लिए मल्टी-एजेंट समन्वय पर व्यापक A-ग्रेड पाठ जोड़ता है।**

#### जोड़ा गया
- **📊 एप्लिकेशन इनसाइट्स एकीकरण पाठ**: `docs/pre-deployment/application-insights.md` में:
  - AZD-केंद्रित डिप्लॉयमेंट के साथ स्वचालित प्रोविजनिंग
  - एप्लिकेशन इनसाइट्स + लॉग एनालिटिक्स के लिए पूर्ण Bicep टेम्पलेट्स
  - कस्टम टेलीमेट्री के साथ कार्यरत Python एप्लिकेशन (1,200+ लाइनों के साथ)
  - AI/LLM मॉनिटरिंग पैटर्न (Microsoft Foundry Models टोकन/लागत ट्रैकिंग)
  - 6 मर्मेड आरेख (आर्किटेक्चर, वितरित ट्रेसिंग, टेलीमेट्री प्रवाह)
  - 3 व्यावहारिक अभ्यास (चेतावनियां, डैशबोर्ड, AI मॉनिटरिंग)
  - कुस्टो क्वेरी उदाहरण और लागत अनुकूलन रणनीतियाँ
  - लाइव मेट्रिक्स स्ट्रीमिंग और वास्तविक समय डिबगिंग
  - उत्पादन-तैयार पैटर्न के साथ 40-50 मिनट सीखने का समय

- **🔐 प्रमाणीकरण और सुरक्षा पैटर्न पाठ**: `docs/getting-started/authsecurity.md` में:
  - 3 प्रमाणीकरण पैटर्न (कनेक्शन स्ट्रिंग्स, Key Vault, प्रबंधित पहचान)
  - सुरक्षित डिप्लॉयमेंट के लिए पूर्ण Bicep इन्फ्रास्ट्रक्चर टेम्पलेट्स
  - Azure SDK एकीकरण के साथ Node.js एप्लिकेशन कोड
  - 3 पूर्ण अभ्यास (प्रबंधित पहचान सक्षम करना, उपयोगकर्ता-नामित पहचान, Key Vault रोटेशन)
  - सुरक्षा सर्वोत्तम प्रथाएँ और RBAC कॉन्फ़िगरेशन
  - ट्रबलशूटिंग गाइड और लागत विश्लेषण
  - उत्पादन-तैयार पासवर्डलेस प्रमाणीकरण पैटर्न

- **🤖 मल्टी-एजेंट समन्वय पैटर्न पाठ**: `docs/pre-deployment/coordination-patterns.md` में:
  - 5 समन्वय पैटर्न (क्रमिक, समानांतर, पदानुक्रमित, इवेंट-चालित, सहमति)
  - पूर्ण ऑर्केस्ट्रेटर सेवा कार्यान्वयन (Python/Flask, 1,500+ लाइनों के साथ)
  - 3 विशेष एजेंट कार्यान्वयन (रिसर्च, राइटर, एडिटर)
  - मैसेज क्यूइंग के लिए सर्विस बस एकीकरण
  - वितरित सिस्टम के लिए Cosmos DB राज्य प्रबंधन
  - एजेंट इंटरैक्शन दर्शाने वाले 6 मर्मेड आरेख
  - 3 उन्नत अभ्यास (टाइमआउट प्रबंधन, पुनः प्रयास लॉजिक, सर्किट ब्रेकर)
  - लागत ब्रेकडाउन ($240-565/महीना) अनुकूलन रणनीतियों के साथ
  - मॉनिटरिंग के लिए एप्लिकेशन इनसाइट्स एकीकरण

#### उन्नत किया गया
- **पूर्व-डिप्लॉयमेंट अध्याय**: अब व्यापक मॉनिटरिंग और समन्वय पैटर्न शामिल हैं
- **शुरुआत अध्याय**: पेशेवर प्रमाणीकरण पैटर्न के साथ उन्नत
- **उत्पादन तत्परता**: सुरक्षा से प्रेक्षणीयता तक पूर्ण कवरेज
- **कोर्स रूपरेखा**: अध्याय 3 और 6 में नए पाठों के संदर्भ के साथ अपडेट किया गया

#### बदला गया
- **सीखने की प्रगति**: सुरक्षा और मॉनिटरिंग को कोर्स भर बेहतर एकीकृत किया गया
- **दस्तावेज़ गुणवत्ता**: नए पाठों में सुसंगत A-ग्रेड मानक (95-97%)
- **उत्पादन पैटर्न**: एंटरप्राइज़ डिप्लॉयमेंट के लिए पूर्ण अंत-से-अंत कवरेज

#### सुधारा गया
- **डेवलपर अनुभव**: विकास से उत्पादन मॉनिटरिंग तक स्पष्ट मार्ग
- **सुरक्षा मानक**: प्रमाणीकरण और गुप्त प्रबंधन के लिए पेशेवर पैटर्न
- **प्रेक्षणीयता**: AZD के साथ पूर्ण एप्लिकेशन इनसाइट्स एकीकरण
- **AI वर्कलोड**: Microsoft Foundry Models और मल्टी-एजेंट सिस्टम के लिए विशेष मॉनिटरिंग

#### सत्यापित
- ✅ सभी पाठों में पूर्ण कार्यशील कोड (स्निपेट नहीं)
- ✅ दृश्य शिक्षण के लिए मर्मेड आरेख (कुल 19, 3 पाठों में)
- ✅ सत्यापन चरणों के साथ व्यावहारिक अभ्यास (9 कुल)
- ✅ उत्पादन-तैयार Bicep टेम्पलेट्स जिन्हें `azd up` से डिप्लॉय किया जा सकता है
- ✅ लागत विश्लेषण और अनुकूलन रणनीतियाँ
- ✅ ट्रबलशूटिंग गाइड और सर्वोत्तम प्रथाएँ
- ✅ सत्यापन कमांड सहित ज्ञान जांच पॉइंट

#### दस्तावेज़ ग्रेडिंग परिणाम
- **docs/pre-deployment/application-insights.md**: - व्यापक मॉनिटरिंग गाइड
- **docs/getting-started/authsecurity.md**: - पेशेवर सुरक्षा पैटर्न
- **docs/pre-deployment/coordination-patterns.md**: - उन्नत मल्टी-एजेंट आर्किटेक्चर
- **कुल नई सामग्री**: - सुसंगत उच्च गुणवत्ता मानक

#### तकनीकी निष्पादन
- **एप्लिकेशन इनसाइट्स**: लॉग एनालिटिक्स + कस्टम टेलीमेट्री + वितरित ट्रेसिंग
- **प्रमाणीकरण**: प्रबंधित पहचान + Key Vault + RBAC पैटर्न
- **मल्टी-एजेंट**: सर्विस बस + Cosmos DB + कंटेनर ऐप्स + ऑर्केस्ट्रेशन
- **मॉनिटरिंग**: लाइव मेट्रिक्स + कुस्टो क्वेरी + अलर्ट + डैशबोर्ड
- **लागत प्रबंधन**: सैंपलिंग रणनीतियाँ, रिटेंशन नीति, बजट नियंत्रण

### [v3.7.0] - 2025-11-19

#### दस्तावेज़ गुणवत्ता सुधार और नया Microsoft Foundry Models उदाहरण
**यह संस्करण रिपॉजिटरी में दस्तावेज़ की गुणवत्ता को बढ़ाता है और gpt-4.1 चैट इंटरफ़ेस के साथ Microsoft Foundry Models के एक पूर्ण डिप्लॉयमेंट उदाहरण को जोड़ता है।**

#### जोड़ा गया
- **🤖 Microsoft Foundry Models चैट उदाहरण**: `examples/azure-openai-chat/` में कार्यरत gpt-4.1 डिप्लॉयमेंट के साथ पूरा कार्यान्वयन:
  - पूरा Microsoft Foundry Models इन्फ्रास्ट्रक्चर (gpt-4.1 मॉडल डिप्लॉयमेंट)
  - वार्तालाप इतिहास के साथ Python कमांड-लाइन चैट इंटरफ़ेस
  - सुरक्षित API कुंजी संग्रहण के लिए Key Vault एकीकरण
  - टोकन उपयोग ट्रैकिंग और लागत अनुमान
  - दर सीमित करना और त्रुटि हैंडलिंग
  - 35-45 मिनट डिप्लॉयमेंट गाइड के साथ व्यापक README
  - 11 उत्पादन-तैयार फ़ाइलें (Bicep टेम्पलेट्स, Python ऐप, कॉन्फ़िगरेशन)
- **📚 दस्तावेज़ अभ्यास**: कॉन्फ़िगरेशन गाइड में व्यावहारिक अभ्यास जोड़े गए:
  - अभ्यास 1: मल्टी-पर्यावरण कॉन्फ़िगरेशन (15 मिनट)
  - अभ्यास 2: गुप्त प्रबंधन अभ्यास (10 मिनट)
  - स्पष्ट सफलता मानदंड और सत्यापन चरण
- **✅ डिप्लॉयमेंट सत्यापन**: डिप्लॉयमेंट गाइड में सत्यापन अनुभाग जोड़ा गया:
  - स्वास्थ्य जांच प्रक्रियाएँ
  - सफलता मानदंड सूची
  - सभी डिप्लॉयमेंट कमांड के अपेक्षित आउटपुट
  - ट्रबलशूटिंग त्वरित संदर्भ

#### उन्नत किया गया
- **examples/README.md**: A-ग्रेड गुणवत्ता (93%) में अपडेट किया गया:
  - सभी संबंधित अनुभागों में azure-openai-chat जोड़ा गया
  - स्थानीय उदाहरण संख्या 3 से 4 तक बढ़ाई गई
  - AI एप्लिकेशन उदाहरण तालिका में जोड़ा गया
  - मध्यवर्ती उपयोगकर्ताओं के लिए क्विक स्टार्ट में एकीकृत
  - Microsoft Foundry टेम्पलेट्स अनुभाग में जोड़ा गया
  - तुलना मैट्रिक्स और प्रौद्योगिकी खोज अनुभाग अपडेट किया गया
- **दस्तावेज़ गुणवत्ता**: docs फ़ोल्डर में B+ (87%) से A- (92%) में सुधार किया गया:

  - महत्वपूर्ण कमांड उदाहरणों में अपेक्षित आउटपुट जोड़े गए
  - कॉन्फ़िगरेशन परिवर्तनों के लिए सत्यापन चरण शामिल किए गए
  - व्यावहारिक अभ्यासों के साथ हाथों-हाथ सीखना बेहतर बनाया गया

#### बदला हुआ
- **शिक्षण प्रगति**: मध्यवर्ती शिक्षार्थियों के लिए AI उदाहरणों का बेहतर एकीकरण
- **दस्तावेज़ संरचना**: स्पष्ट परिणामों के साथ अधिक व्यावहारिक अभ्यास
- **सत्यापन प्रक्रिया**: प्रमुख कार्यप्रवाहों में स्पष्ट सफलता मानदंड जोड़े गए

#### सुधार हुआ
- **डेवलपर अनुभव**: Microsoft Foundry मॉडल्स का परिनियोजन अब 35-45 मिनट में (जटिल विकल्पों के लिए 60-90 की तुलना में)
- **लागत पारदर्शिता**: Microsoft Foundry मॉडल उदाहरण के लिए स्पष्ट लागत अनुमान ($50-200/महीना)
- **शिक्षण पथ**: AI डेवलपर्स के लिए azure-openai-chat के साथ स्पष्ट प्रवेश बिंदु
- **दस्तावेज़ीकरण मानक**: सुसंगत अपेक्षित आउटपुट और सत्यापन चरण

#### सत्यापित
- ✅ Microsoft Foundry मॉडल उदाहरण पूरी तरह से `azd up` के साथ कार्यरत
- ✅ सभी 11 कार्यान्वयन फाइलें व्याकरणिक रूप से सही
- ✅ README निर्देश वास्तविक परिनियोजन अनुभव से मेल खाते हैं
- ✅ दस्तावेज़ लिंक 8+ स्थानों पर अपडेट किए गए
- ✅ उदाहरणों की सूची में 4 स्थानीय उदाहरण सटीक रूप में दर्शाए गए हैं
- ✅ तालिकाओं में कोई डुप्लिकेट बाहरी लिंक नहीं
- ✅ सभी नेविगेशन संदर्भ सही हैं

#### तकनीकी कार्यान्वयन
- **Microsoft Foundry मॉडल वास्तुकला**: gpt-4.1 + Key Vault + Container Apps पैटर्न
- **सुरक्षा**: प्रबंधित पहचान तैयार, Key Vault में रहस्य
- **निगरानी**: Application Insights एकीकरण
- **लागत प्रबंधन**: टोकन ट्रैकिंग और उपयोग अनुकूलन
- **परिनियोजन**: पूर्ण सेटअप के लिए एकल `azd up` कमांड

### [v3.6.0] - 2025-11-19

#### मुख्य अपडेट: कंटेनर ऐप परिनियोजन उदाहरण
**यह संस्करण Azure Developer CLI (AZD) का उपयोग करके व्यापक, उत्पादन-तैयार कंटेनर एप्लिकेशन परिनियोजन उदाहरण प्रस्तुत करता है, पूर्ण दस्तावेजीकरण और सीखने के पथ में एकीकरण के साथ।**

#### जोड़ा गया
- **🚀 कंटेनर ऐप उदाहरण**: `examples/container-app/` में नए स्थानीय उदाहरण:
  - [Master Guide](examples/container-app/README.md): कंटेनरीकृत परिनियोजन का पूर्ण अवलोकन, त्वरित शुरूआत, उत्पादन, और उन्नत पैटर्न
  - [Simple Flask API](../../examples/container-app/simple-flask-api): शुरुआत करने वालों के लिए REST API जिसमें scale-to-zero, हेल्थ प्रोब, निगरानी और समस्या निवारण शामिल हैं
  - [Microservices Architecture](../../examples/container-app/microservices): उत्पादन-तैयार बहु-सेवा परिनियोजन (API गेटवे, प्रोडक्ट, ऑर्डर, यूजर, नोटिफिकेशन), असिंक्रोनस मैसेजिंग, सर्विस बस, Cosmos DB, Azure SQL, वितरित ट्रेसिंग, ब्लू-ग्रीन/कैनेरी परिनियोजन
- **सर्वोत्तम प्रथाएं**: कंटेनरीकृत कार्यभार के लिए सुरक्षा, निगरानी, लागत अनुकूलन, और CI/CD मार्गदर्शन
- **कोड नमूने**: पूर्ण `azure.yaml`, Bicep टेम्पलेट, और बहुभाषी सेवा कार्यान्वयन (Python, Node.js, C#, Go)
- **परीक्षण और समस्या निवारण**: अंत-से-अंत परीक्षण परिदृश्य, निगरानी कमांड, समस्या निवारण मार्गदर्शन

#### बदला हुआ
- **README.md**: नए कंटेनर ऐप उदाहरणों को "Local Examples - Container Applications" के अंतर्गत दिखाने और लिंक करने के लिए अपडेट किया गया
- **examples/README.md**: कंटेनर ऐप उदाहरणों को उजागर करने, तुलना मैट्रिक्स प्रविष्टियों को जोड़ने, और प्रौद्योगिकी/वास्तुकला संदर्भों को अपडेट किया गया
- **कोर्स आउटलाइन और अध्ययन गाइड**: प्रासंगिक अध्यायों में नए कंटेनर ऐप उदाहरणों और परिनियोजन पैटर्न का संदर्भ जोड़ा गया

#### सत्यापित
- ✅ सभी नए उदाहरण `azd up` के साथ परिनियोज्य और सर्वोत्तम प्रथाओं का पालन करते हैं
- ✅ दस्तावेज़ीकरण क्रॉस-लिंक और नेविगेशन अपडेट किए गए
- ✅ उदाहरण शुरुआती से उन्नत परिदृश्यों को कवर करते हैं, जिसमें उत्पादन माइक्रोसर्विसेस शामिल हैं

#### नोट्स
- **सीमा**: केवल अंग्रेज़ी दस्तावेज़ीकरण और उदाहरण
- **अगले कदम**: भविष्य के संस्करणों में अतिरिक्त उन्नत कंटेनर पैटर्न और CI/CD स्वचालन के साथ विस्तार

### [v3.5.0] - 2025-11-19

#### उत्पाद पुनर्ब्रांडिंग: Microsoft Foundry
**यह संस्करण सभी अंग्रेज़ी दस्तावेज़ीकरण में "Microsoft Foundry" से "Microsoft Foundry" के व्यापक उत्पाद नाम परिवर्तन को लागू करता है, जो Microsoft के आधिकारिक पुनर्ब्रांडिंग को दर्शाता है।**

#### बदला हुआ
- **🔄 उत्पाद नाम अपडेट**: "Microsoft Foundry" से "Microsoft Foundry" को पूरा पुनर्ब्रांडिंग
  - `docs/` फ़ोल्डर में सभी संदर्भ अपडेट किए गए
  - फ़ोल्डर नाम बदला गया: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - फाइल का नाम बदला गया: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - कुल: 7 दस्तावेज़ीकरण फाइलों में 23 सामग्री संदर्भ अपडेट किए गए

- **📁 फ़ोल्डर संरचना परिवर्तन**:
  - `docs/ai-foundry/` का नाम `docs/microsoft-foundry/` में बदला गया
  - सभी क्रॉस-संदर्भ नई फ़ोल्डर संरचना को दर्शाने के लिए अपडेट किए गए
  - सभी दस्तावेज़ीकरण में नेविगेशन लिंक मान्य किए गए

- **📄 फाइल रिनेमिंग**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - सभी आंतरिक लिंक नए फ़ाइल नाम के संदर्भ के लिए अपडेट किए गए

#### अपडेट की गई फाइलें
- **अध्याय दस्तावेज़ीकरण** (7 फाइलें):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 नेविगेशन लिंक अपडेट
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 उत्पाद नाम संदर्भ अपडेट
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पहले से ही Microsoft Foundry उपयोग में (पिछले अपडेट्स से)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 संदर्भ अपडेट (समीक्षा, समुदाय प्रतिक्रिया, दस्तावेज़ीकरण)
  - `docs/getting-started/azd-basics.md` - 4 क्रॉस-रेफ़रेंस लिंक अपडेट
  - `docs/getting-started/first-project.md` - 2 अध्याय नेविगेशन लिंक अपडेट
  - `docs/getting-started/installation.md` - 2 अगले अध्याय लिंक अपडेट
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 संदर्भ अपडेट (नेविगेशन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - 1 नेविगेशन लिंक अपडेट
  - `docs/troubleshooting/debugging.md` - 1 नेविगेशन लिंक अपडेट

- **कोर्स संरचना फाइलें** (2 फाइलें):
  - `README.md` - 17 संदर्भ अपडेट (कोर्स अवलोकन, अध्याय शीर्षक, टेम्प्लेट अनुभाग, समुदाय जानकारी)
  - `course-outline.md` - 14 संदर्भ अपडेट (अवलोकन, सीखने के उद्देश्य, अध्याय संसाधन)

#### सत्यापित
- ✅ अंग्रेज़ी दस्तावेज़ों में "ai-foundry" फ़ोल्डर पथ संदर्भ शून्य
- ✅ अंग्रेज़ी दस्तावेज़ों में "Microsoft Foundry" उत्पाद नाम संदर्भ शून्य
- ✅ नई फ़ोल्डर संरचना के साथ सभी नेविगेशन लिंक कार्यरत
- ✅ फाइल और फ़ोल्डर नाम बदलना सफलतापूर्वक पूरा हुआ
- ✅ अध्यायों के बीच क्रॉस-रेफरेंस सत्यापित

#### नोट्स
- **सीमा**: परिवर्तन केवल `docs/` फ़ोल्डर में अंग्रेज़ी दस्तावेज़ीकरण पर लागू
- **अनुवाद**: अनुवाद फ़ोल्डर (`translations/`) इस संस्करण में अपडेट नहीं हुए
- **कार्यशाला**: कार्यशाला सामग्री (`workshop/`) इस संस्करण में अपडेट नहीं हुई
- **उदाहरण**: उदाहरण फाइलें अभी भी पुरानी नामकरण संदर्भित कर सकती हैं (भविष्य के अपडेट में संबोधित किया जाएगा)
- **बाहरी लिंक**: बाहरी URL और GitHub रिपॉजिटरी संदर्भ अपरिवर्तित

#### योगदानकर्ताओं के लिए माइग्रेशन गाइड
यदि आपके स्थानीय शाखाएँ या दस्तावेज़ पुराने संरचना को संदर्भित करते हैं:
1. फ़ोल्डर संदर्भ अपडेट करें: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फ़ाइल संदर्भ अपडेट करें: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पाद नाम बदलें: "Microsoft Foundry" → "Microsoft Foundry"
4. सत्यापित करें कि सभी आंतरिक दस्तावेज़ लिंक अभी भी काम करते हैं

---

### [v3.4.0] - 2025-10-24

#### इन्फ़्रास्ट्रक्चर प्रीव्यू और सत्यापन संवर्द्धन
**यह संस्करण नए Azure Developer CLI पूर्वावलोकन फीचर के लिए व्यापक समर्थन प्रस्तुत करता है और कार्यशाला उपयोगकर्ता अनुभव को बेहतर बनाता है।**

#### जोड़ा गया
- **🧪 azd provision --preview फीचर दस्तावेज़ीकरण**: नए इन्फ्रास्ट्रक्चर प्रीव्यू क्षमता का व्यापक कवरेज
  - कमांड संदर्भ और उपयोग उदाहरण चीट शीट में
  - प्रावधान गाइड में उपयोग मामलों और लाभों के साथ विस्तृत एकीकरण
  - सुरक्षित परिनियोजन सत्यापन के लिए प्री-फ्लाइट चेक एकीकरण
  - सुरक्षा-प्रथम परिनियोजन अभ्यासों के साथ शुरूआती मार्गदर्शिका अपडेट
- **🚧 कार्यशाला स्थिति बैनर**: पेशेवर HTML बैनर जो कार्यशाला विकास स्थिति दर्शाता है
  - स्पष्ट उपयोगकर्ता संचार के लिए निर्माण सूचक के साथ ग्रेडिएंट डिज़ाइन
  - पारदर्शिता के लिए अंतिम अद्यतन समय चिह्न
  - सभी डिवाइस प्रकारों के लिए मोबाइल-प्रतिक्रियाशील डिज़ाइन

#### संवर्द्धित
- **इन्फ्रास्ट्रक्चर सुरक्षा**: परिनियोजन दस्तावेज़ीकरण में पूरा प्रीव्यू कार्यक्षमता एकीकृत
- **पूर्व-परिनियोजन सत्यापन**: स्वचालित स्क्रिप्ट में अब इन्फ्रास्ट्रक्चर प्रीव्यू परीक्षण शामिल
- **डेवलपर कार्यप्रवाह**: सर्वोत्तम प्रथा के रूप में प्रीव्यू को कमांड अनुक्रम में शामिल किया गया
- **कार्यशाला अनुभव**: सामग्री विकास स्थिति के बारे में उपयोगकर्ताओं के लिए स्पष्ट अपेक्षाएँ निर्धारित

#### बदला हुआ
- **परिनियोजन सर्वोत्तम प्रथाएं**: अब प्रीव्यू-प्रथम कार्यप्रवाह सिफारिश की जाती है
- **दस्तावेज़ प्रवाह**: शिक्षण प्रक्रिया में इन्फ्रास्ट्रक्चर सत्यापन को पहले स्थान पर ले जाया गया
- **कार्यशाला प्रस्तुति**: स्पष्ट विकास समयरेखा के साथ पेशेवर स्थिति संचार

#### बेहतर किया गया
- **सुरक्षा-प्रथम दृष्टिकोण**: परिनियोजन से पहले अब इन्फ्रास्ट्रक्चर परिवर्तनों का सत्यापन किया जा सकता है
- **टीम सहयोग**: समीक्षा और अनुमोदन के लिए प्रीव्यू परिणाम साझा किए जा सकते हैं
- **लागत जागरूकता**: प्रावधान से पहले संसाधन लागतों की बेहतर समझ
- **जोखिम शमन**: अग्रिम सत्यापन के माध्यम से परिनियोजन विफलताओं में कमी

#### तकनीकी कार्यान्वयन
- **मल्टी-डॉक्यूमेंट एकीकरण**: प्रीव्यू फीचर को 4 प्रमुख फाइलों में दस्तावेजीकृत किया गया
- **कमांड पैटर्न**: दस्तावेज़ीकरण में निरंतर वाक्य विन्यास और उदाहरण
- **सर्वोत्तम प्रथा एकीकरण**: सत्यापन कार्यप्रवाह और स्क्रिप्ट में प्रीव्यू शामिल
- **दृश्य संकेतक**: खोजनीयता के लिए स्पष्ट नया फीचर चिन्ह

#### कार्यशाला इन्फ्रास्ट्रक्चर
- **स्थिति संचार**: ग्रेडिएंट स्टाइलिंग के साथ पेशेवर HTML बैनर
- **उपयोगकर्ता अनुभव**: स्पष्ट विकास स्थिति भ्रम से बचाता है
- **पेशेवर प्रस्तुति**: रिपॉजिटरी विश्वसनीयता बनाए रखते हुए अपेक्षाएँ निर्धारित करता है
- **टाइमलाइन पारदर्शिता**: अक्टूबर 2025 अंतिम अद्यतन समय चिह्न जवाबदेही के लिए

### [v3.3.0] - 2025-09-24

#### संवर्द्धित कार्यशाला सामग्री और इंटरैक्टिव शिक्षण अनुभव
**यह संस्करण ब्राउज़र-आधारित इंटरैक्टिव मार्गदर्शिकाओं और संरचित सीखने के रास्तों के साथ व्यापक कार्यशाला सामग्री प्रस्तुत करता है।**

#### जोड़ा गया
- **🎥 इंटरैक्टिव कार्यशाला गाइड**: MkDocs पूर्वावलोकन क्षमता के साथ ब्राउज़र-आधारित कार्यशाला अनुभव
- **📝 संरचित कार्यशाला निर्देश**: खोज से अनुकूलन तक 7-चरण निर्देशित सीखने का मार्ग
  - 0-परिचय: कार्यशाला अवलोकन और सेटअप
  - 1-AI-टेम्पलेट चयन: टेम्पलेट खोज और चयन प्रक्रिया
  - 2-AI-टेम्पलेट सत्यापन: परिनियोजन और सत्यापन प्रक्रियाएँ
  - 3-AI-टेम्पलेट विघटन: टेम्पलेट वास्तुकला की समझ
  - 4-AI-टेम्पलेट कॉन्फ़िगरेशन: कॉन्फ़िगरेशन और अनुकूलन
  - 5-AI-टेम्पलेट अनुकूलन: उन्नत संशोधन और पुनरावृत्तियाँ
  - 6-इन्फ्रास्ट्रक्चर हटाना: सफाई और संसाधन प्रबंधन
  - 7-समापन: सारांश और अगले कदम
- **🛠️ कार्यशाला उपकरण**: बेहतर सीखने के अनुभव के लिए Material थीम के साथ MkDocs कॉन्फ़िगरेशन
- **🎯 हाथों-हाथ सीखने का पथ**: 3-चरण पद्धति (खोज → परिनियोजन → अनुकूलन)
- **📱 GitHub Codespaces एकीकरण**: निर्बाध विकास वातावरण सेटअप

#### संवर्द्धित
- **AI कार्यशाला लैब**: 2-3 घंटे के व्यापक संरचित सीखने के अनुभव के साथ विस्तारित
- **कार्यशाला दस्तावेज़ीकरण**: नेविगेशन और दृश्य सहायता के साथ पेशेवर प्रस्तुति
- **शिक्षण प्रगति**: टेम्पलेट चयन से उत्पादन परिनियोजन तक स्पष्ट चरण-दर-चरण मार्गदर्शन
- **डेवलपर अनुभव**: सुव्यवस्थित विकास कार्यप्रवाह के लिए एकीकृत उपकरण

#### बेहतर बनाया गया
- **पहुँच क्षमता**: खोज, कॉपी कार्यक्षमता, और थीम टॉगल के साथ ब्राउज़र-आधारित इंटरफ़ेस
- **स्वयं-गति सीखना**: विभिन्न सीखने की गति के अनुरूप लचीली कार्यशाला संरचना
- **व्यावहारिक अनुप्रयोग**: वास्तविक दुनिया के AI टेम्पलेट परिनियोजन परिदृश्य
- **समुदाय एकीकरण**: कार्यशाला समर्थन और सहयोग के लिए Discord एकीकरण

#### कार्यशाला सुविधाएँ
- **इन-बिल्ट खोज**: त्वरित कीवर्ड और पाठ खोज
- **कोड ब्लॉक्स कॉपी करें**: सभी कोड उदाहरणों के लिए होवर-टू-कॉपी कार्यक्षमता
- **थीम टॉगल**: विभिन्न प्राथमिकताओं के लिए डार्क/लाइट मोड समर्थन
- **दृश्य संसाधन**: बेहतर समझ के लिए स्क्रीनशॉट और आरेख
- **मदद एकीकरण**: समुदाय समर्थन के लिए सीधे Discord पहुंच

### [v3.2.0] - 2025-09-17

#### प्रमुख नेविगेशन पुनर्संरचना और अध्याय-आधारित शिक्षण प्रणाली
**यह संस्करण पूरे रिपॉजिटरी में बेहतर नेविगेशन के साथ व्यापक अध्याय-आधारित शिक्षण संरचना पेश करता है।**

#### जोड़ा गया
- **📚 अध्याय-आधारित शिक्षण प्रणाली**: पूरे कोर्स को 8 प्रगतिशील सीखने वाले अध्यायों में पुनर्संरचित किया गया
  - अध्याय 1: नींव और त्वरित शुरुआत (⭐ - 30-45 मिनट)
  - अध्याय 2: AI-प्रथम विकास (⭐⭐ - 1-2 घंटे)
  - अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण (⭐⭐ - 45-60 मिनट)
  - अध्याय 4: कोड के रूप में इन्फ्रास्ट्रक्चर और परिनियोजन (⭐⭐⭐ - 1-1.5 घंटे)
  - अध्याय 5: बहु-एजेंट AI समाधान (⭐⭐⭐⭐ - 2-3 घंटे)
  - अध्याय 6: पूर्व-परिनियोजन सत्यापन और योजना (⭐⭐ - 1 घंटा)
  - अध्याय 7: समस्या निवारण और डिबगिंग (⭐⭐ - 1-1.5 घंटे)
  - अध्याय 8: उत्पादन और उद्यम पैटर्न (⭐⭐⭐⭐ - 2-3 घंटे)
- **📚 व्यापक नेविगेशन सिस्टम**: सभी दस्तावेज़ीकरण में स्थिर नेविगेशन हेडर और फुटर
- **🎯 प्रगति ट्रैकिंग**: कोर्स पूर्णता चेकलिस्ट और सीखने का सत्यापन प्रणाली
- **🗺️ सीखने के मार्गदर्शन**: विभिन्न अनुभव स्तरों और लक्ष्यों के लिए स्पष्ट प्रवेश बिंदु
- **🔗 क्रॉस-रेफरेंस नेविगेशन**: संबंधित अध्याय और पूर्वापेक्षाएँ स्पष्ट रूप से लिंक की गईं

#### संवर्द्धित
- **README संरचना**: अध्याय-आधारित संगठन के साथ संरचित शिक्षण मंच में परिवर्तित
- **दस्तावेज़ीकरण नेविगेशन**: प्रत्येक पृष्ठ अब अध्याय संदर्भ और प्रगति मार्गदर्शन शामिल करता है
- **टेम्पलेट संगठन**: उपयुक्त सीखने के अध्यायों में उदाहरण और टेम्पलेट्स को मैप किया गया

- **संसाधन एकीकरण**: संबंधित अध्यायों से जुड़े चीट शीट, अक्सर पूछे जाने वाले प्रश्न, और अध्ययन गाइड
- **कार्यशाला एकीकरण**: कई अध्याय के शिक्षण उद्देश्यों के लिए मैप किए गए हाथों-पर लैब

#### बदला गया
- **शिक्षण प्रगति**: रैखिक दस्तावेज़ीकरण से लचीले अध्याय-आधारित शिक्षण की ओर स्थानांतरित
- **कॉन्फ़िगरेशन स्थान**: बेहतर शिक्षण प्रवाह के लिए अध्याय 3 के रूप में कॉन्फ़िगरेशन गाइड का पुनर्स्थापन
- **एआई सामग्री एकीकरण**: शिक्षण यात्रा के दौरान एआई-विशिष्ट सामग्री का बेहतर एकीकरण
- **उत्पादन सामग्री**: एंटरप्राइज शिक्षार्थियों के लिए अध्याय 8 में उन्नत पैटर्न समेकित

#### सुधरा हुआ
- **उपयोगकर्ता अनुभव**: स्पष्ट नेविगेशन ब्रेडक्रंब्स और अध्याय प्रगति संकेतक
- **प्रवेशयोग्यता**: पाठ्यक्रम के आसान चयन के लिए सुसंगत नेविगेशन पैटर्न
- **पेशेवर प्रस्तुति**: अकादमिक और कॉर्पोरेट प्रशिक्षण के लिए उपयुक्त विश्वविद्यालय-शैली पाठ्यक्रम संरचना
- **शिक्षण दक्षता**: बेहतर संगठन के माध्यम से संबंधित सामग्री खोजने का समय कम किया गया

#### तकनीकी कार्यान्वयन
- **नेविगेशन हेडर**: 40+ दस्तावेज़ीकरण फ़ाइलों में मानकीकृत अध्याय नेविगेशन
- **फ़ुटर नेविगेशन**: सुसंगत प्रगति मार्गदर्शन और अध्याय पूर्णता संकेतक
- **क्रॉस-लिंकिंग**: संबंधित अवधारणाओं को जोड़ने वाली व्यापक आंतरिक लिंकिंग प्रणाली
- **अध्याय मैपिंग**: शिक्षण उद्देश्यों के साथ स्पष्ट रूप से जुड़े टेम्पलेट और उदाहरण

#### अध्ययन गाइड सुधार
- **📚 व्यापक शिक्षण उद्देश्य**: 8-अध्याय प्रणाली के अनुसार पुनःसंरचित अध्ययन गाइड
- **🎯 अध्याय-आधारित आकलन**: प्रत्येक अध्याय में विशिष्ट शिक्षण उद्देश्य और व्यावहारिक अभ्यास शामिल
- **📋 प्रगति ट्रैकिंग**: सप्ताहिक शिक्षण अनुसूची मापन योग्य परिणामों और पूर्णता चेकलिस्ट के साथ
- **❓ आकलन प्रश्न**: प्रत्येक अध्याय के लिए ज्ञान प्रमाणीकरण प्रश्न पेशेवर परिणामों के साथ
- **🛠️ व्यावहारिक अभ्यास**: वास्तविक तैनाती परिदृश्यों और समस्या निवारण के साथ हाथों-पर गतिविधियाँ
- **📊 कौशल प्रगति**: बुनियादी अवधारणाओं से एंटरप्राइस पैटर्न तक स्पष्ट प्रगति, कैरियर विकास पर ध्यान केंद्रित
- **🎓 प्रमाणन ढांचा**: पेशेवर विकास परिणाम और समुदाय पहचान प्रणाली
- **⏱️ समय प्रबंधन**: मील का पत्थर सत्यापन के साथ संरचित 10-सप्ताह की शिक्षण योजना

### [v3.1.0] - 2025-09-17

#### उन्नत मल्टी-एजेंट एआई समाधान
**यह संस्करण बेहतर एजेंट नामकरण और उन्नत दस्तावेज़ीकरण के साथ मल्टी-एजेंट रिटेल समाधान को सुधारता है।**

#### बदला गया
- **मल्टी-एजेंट शब्दावली**: रिटेल मल्टी-एजेंट समाधान में "कोरा एजेंट" को "ग्राहक एजेंट" से बदला गया स्पष्ट समझ के लिए
- **एजेंट आर्किटेक्चर**: सभी दस्तावेज़, ARM टेम्पलेट, और कोड उदाहरणों को "ग्राहक एजेंट" नामकरण के साथ अपडेट किया गया
- **कॉन्फ़िगरेशन उदाहरण**: नवीनतम नामकरण कन्वेंशनों के साथ एजेंट कॉन्फ़िगरेशन पैटर्नों का आधुनिकीकरण
- **दस्तावेज़ीकरण सुसंगतता**: सभी संदर्भों को पेशेवर, वर्णनात्मक एजेंट नामों का उपयोग सुनिश्चित किया गया

#### उन्नत
- **ARM टेम्पलेट पैकेज**: रिटेल-मल्टीएजेंट-ARM-टेम्पलेट को ग्राहक एजेंट संदर्भों के साथ अपडेट किया गया
- **आर्किटेक्चर डायराम**: Mermaid डायरामों को नए एजेंट नामकरण के साथ ताज़ा किया गया
- **कोड उदाहरण**: पायथन क्लासेस और कार्यान्वयन उदाहरण अब CustomerAgent नामकरण का उपयोग करते हैं
- **पर्यावरण चर**: सभी डिप्लॉयमेंट स्क्रिप्ट को CUSTOMER_AGENT_NAME कन्वेंशनों के साथ अपडेट किया गया

#### सुधरा हुआ
- **डेवलपर अनुभव**: दस्तावेज़ीकरण में स्पष्ट एजेंट भूमिकाएं और जिम्मेदारियां
- **उत्पादन तत्परता**: एंटरप्राइज नामकरण कन्वेंशनों के साथ बेहतर संरेखण
- **शिक्षण सामग्री**: शैक्षिक उद्देश्यों के लिए अधिक सहज एजेंट नामकरण
- **टेम्पलेट उपयोगिता**: एजेंट कार्यों और तैनाती पैटर्न की समझ को सरल बनाया गया

#### तकनीकी विवरण
- ग्राहक एजेंट संदर्भों के साथ अपडेटेड Mermaid आर्किटेक्चर डायग्राम
- पायथन उदाहरणों में CoraAgent क्लास नामों को CustomerAgent से बदला गया
- JSON कॉन्फ़िगरेशन में "customer" एजेंट प्रकार का उपयोग करने के लिए ARM टेम्पलेट संशोधित किया गया
- परिवेश चर को CORA_AGENT_* से CUSTOMER_AGENT_* पैटर्न में अपडेट किया गया
- सभी डिप्लॉयमेंट कमांड और कंटेनर कॉन्फ़िगरेशन ताज़ा किए गए

### [v3.0.0] - 2025-09-12

#### मुख्य बदलाव - एआई डेवलपर फोकस और Microsoft Foundry एकीकरण
**यह संस्करण रिपोजिटरी को व्यापक एआई-केंद्रित शिक्षा संसाधन और Microsoft Foundry एकीकरण के साथ बदलता है।**

#### जोड़ा गया
- **🤖 एआई-प्रथम शिक्षण पथ**: एआई डेवलपर और इंजीनियरों को प्राथमिकता देने के लिए पूर्ण पुनर्गठन
- **Microsoft Foundry एकीकरण गाइड**: AZD को Microsoft Foundry सेवाओं से जोड़ने के लिए व्यापक दस्तावेज़ीकरण
- **एआई मॉडल तैनाती पैटर्न**: मॉडल चयन, कॉन्फ़िगरेशन, और उत्पादन तैनाती रणनीतियों को शामिल करने वाला विस्तृत गाइड
- **एआई कार्यशाला लैब**: 2-3 घंटे के हैंड्स-ऑन कार्यशाला AZD-डिप्लॉयबल समाधानों में एआई अनुप्रयोगों के रूपांतरण के लिए
- **उत्पादन एआई सर्वश्रेष्ठ अभ्यास**: स्केलिंग, निगरानी, और सुरक्षा के लिए एंटरप्राइज-रेडी पैटर्न
- **एआई-विशिष्ट समस्या निवारण गाइड**: Microsoft Foundry मॉडल, कॉग्निटिव सर्विसेज़, और AI तैनाती मुद्दों के लिए व्यापक समस्या निवारण
- **एआई टेम्पलेट गैलरी**: जटिलता रेटिंग के साथ Microsoft Foundry टेम्पलेट्स का प्रमुख संग्रह
- **कार्यशाला सामग्री**: हैंड्स-ऑन लैब और संदर्भ सामग्री के साथ पूर्ण कार्यशाला संरचना

#### उन्नत
- **रीडमी संरचना**: एआई-डेवलपर केंद्रित, Microsoft Foundry Discord से 45% सामुदायिक रुचि डेटा के साथ
- **शिक्षण पथ**: छात्रों और DevOps इंजीनियरों के पारंपरिक पथों के साथ समर्पित AI डेवलपर यात्रा
- **टेम्पलेट सिफारिशें**: azure-search-openai-demo, contoso-chat, और openai-chat-app-quickstart सहित प्रमुख AI टेम्पलेट्स
- **समुदाय एकीकरण**: AI-विशिष्ट चैनलों और चर्चाओं के साथ बेहतर Discord समुदाय समर्थन

#### सुरक्षा और उत्पादन फोकस
- **प्रबंधित पहचान पैटर्न**: AI-विशिष्ट प्रमाणीकरण और सुरक्षा कॉन्फ़िगरेशन
- **लागत अनुकूलन**: टोकन उपयोग ट्रैकिंग और AI कार्यभार के लिए बजट नियंत्रण
- **मल्टी-क्षेत्र तैनाती**: वैश्विक AI अनुप्रयोग तैनाती के लिए रणनीतियाँ
- **प्रदर्शन निगरानी**: AI-विशिष्ट मेट्रिक्स और एप्लिकेशन इनसाइट्स एकीकरण

#### दस्तावेज़ीकरण गुणवत्ता
- **रैखिक पाठ्यक्रम संरचना**: शुरुआती से उन्नत AI तैनाती पैटर्न तक तार्किक प्रगति
- **मान्यताप्राप्त URL**: सभी बाहरी रिपोजिटरी लिंक सत्यापित और सुलभ
- **पूर्ण संदर्भ**: सभी आंतरिक दस्तावेज़ीकरण लिंक सत्यापित और कार्यशील
- **उत्पादन तैयार**: वास्तविक दुनिया के उदाहरणों के साथ एंटरप्राइज तैनाती पैटर्न

### [v2.0.0] - 2025-09-09

#### मुख्य बदलाव - रिपोजिटरी पुनर्संरचना और पेशेवर सुधार
**यह संस्करण रिपोजिटरी संरचना और सामग्री प्रस्तुति का एक महत्वपूर्ण पुनर्गठन दर्शाता है।**

#### जोड़ा गया
- **संरचित शिक्षण फ्रेमवर्क**: सभी दस्तावेज़ीकरण पृष्ठों में अब परिचय, शिक्षण लक्ष्य, और सीखने के परिणाम अनुभाग शामिल हैं
- **नेविगेशन सिस्टम**: मार्गदर्शित शिक्षण प्रगति के लिए सभी दस्तावेज़ीकरण में पिछले/अगले पाठ लिंक जोड़े गए
- **अध्ययन गाइड**: शिक्षण उद्देश्य, अभ्यास, और आकलन सामग्री के साथ व्यापक study-guide.md
- **पेशेवर प्रस्तुति**: बेहतर पहुंच योग्यता और पेशेवर दिखावट के लिए सभी इमोजी चिह्न हटाए गए
- **सामग्री संरचना में सुधार**: शिक्षण सामग्रियों के संगठन और प्रवाह में सुधार

#### बदला गया
- **दस्तावेज़ीकरण प्रारूप**: सभी दस्तावेज़ीकरण को सुसंगत शिक्षण केंद्रित संरचना के साथ मानकीकृत किया गया
- **नेविगेशन प्रवाह**: सभी शिक्षण सामग्री के माध्यम से तार्किक प्रगति लागू की गई
- **सामग्री प्रस्तुति**: स्पष्ट, पेशेवर स्वरूपण के पक्ष में सजावटी तत्व हटाए गए
- **लिंक संरचना**: नए नेविगेशन सिस्टम का समर्थन करने के लिए सभी आंतरिक लिंक अपडेट किए गए

#### सुधरा हुआ
- **पहुँचयोग्यता**: बेहतर स्क्रीन रीडर संगतता के लिए इमोजी निर्भरता हटाई गई
- **पेशेवर दिखावट**: एंटरप्राइज शिक्षण के लिए साफ-सुथरा, शैक्षणिक शैली प्रस्तुति
- **शिक्षण अनुभव**: प्रत्येक पाठ के लिए स्पष्ट उद्देश्य और परिणाम के साथ संरचित दृष्टिकोण
- **सामग्री संगठन**: संबंधित विषयों के बीच बेहतर तार्किक प्रवाह और संपर्क

### [v1.0.0] - 2025-09-09

#### आरंभिक संस्करण - व्यापक AZD शिक्षण रिपोजिटरी

#### जोड़ा गया
- **मुख्य दस्तावेज़ीकरण संरचना**
  - पूर्ण प्रारंभिक गाइड श्रृंखला
  - व्यापक तैनाती और प्रोविजनिंग दस्तावेज़ीकरण
  - विस्तृत समस्या निवारण संसाधन और डिबगिंग गाइड
  - पूर्व-तैनाती सत्यापन उपकरण और प्रक्रियाएं

- **शुरूआती मॉड्यूल**
  - AZD मूल बातें: मुख्य अवधारणाएं और शब्दावली
  - इंस्टॉलेशन गाइड: प्लेटफ़ॉर्म-विशिष्ट सेटअप निर्देश
  - कॉन्फ़िगरेशन गाइड: पर्यावरण सेटअप और प्रमाणीकरण
  - पहला प्रोजेक्ट ट्यूटोरियल: चरण-दर-चरण हैंड्स-ऑन सीखना

- **तैनाती और प्रोविजनिंग मॉड्यूल**
  - तैनाती गाइड: पूर्ण वर्कफ़्लो दस्तावेज़ीकरण
  - प्रोविजनिंग गाइड: Bicep के साथ इन्फ़्रास्ट्रक्चर एज कोड
  - उत्पादन तैनाती के लिए सर्वोत्तम अभ्यास
  - बहु-सेवा आर्किटेक्चर पैटर्न

- **पूर्व-तैनाती सत्यापन मॉड्यूल**
  - क्षमता योजना: Azure संसाधन उपलब्धता सत्यापन
  - SKU चयन: व्यापक सेवा स्तर मार्गदर्शन
  - पूर्व उड़ान जांच: स्वचालित सत्यापन स्क्रिप्ट (पावरशेल और बैश)
  - लागत अनुमान और बजट योजना उपकरण

- **समस्या निवारण मॉड्यूल**
  - सामान्य मुद्दे: अक्सर सामना की जाने वाली समस्याएं और समाधान
  - डिबगिंग गाइड: व्यवस्थित समस्या निवारण विधियाँ
  - उन्नत निदान तकनीकें और उपकरण
  - प्रदर्शन निगरानी और अनुकूलन

- **संसाधन और संदर्भ**
  - कमांड चीट शीट: आवश्यक कमांड के लिए त्वरित संदर्भ
  - शब्दकोश: व्यापक शब्दावली और संक्षिप्त नाम परिभाषाएं
  - अक्सर पूछे जाने वाले प्रश्न: सामान्य प्रश्नों के विस्तृत उत्तर
  - बाहरी संसाधन लिंक और सामुदायिक कनेक्शन

- **उदाहरण और टेम्पलेट**
  - सरल वेब एप्लिकेशन उदाहरण
  - स्थिर वेबसाइट तैनाती टेम्पलेट
  - कंटेनर एप्लिकेशन कॉन्फ़िगरेशन
  - डेटाबेस एकीकरण पैटर्न
  - माइक्रोसर्विस आर्किटेक्चर उदाहरण
  - सर्वरलेस फ़ंक्शन कार्यान्वयन

#### विशेषताएँ
- **मल्टी-प्लेटफ़ॉर्म समर्थन**: Windows, macOS, और Linux के लिए स्थापना और कॉन्फ़िगरेशन गाइड
- **अनेक कौशल स्तर**: छात्रों से लेकर पेशेवर डेवलपरों तक के लिए सामग्री डिज़ाइन की गई
- **व्यावहारिक फोकस**: हाथों-पर उदाहरण और वास्तविक दुनिया के परिदृश्य
- **व्यापक कवरेज**: मूलभूत अवधारणाओं से लेकर उन्नत एंटरप्राइज पैटर्न तक
- **सुरक्षा-प्रथम दृष्टिकोण**: पूरी सामग्री में एकीकृत सुरक्षा सर्वोत्तम अभ्यास
- **लागत अनुकूलन**: लागत प्रभावी तैनातियों और संसाधन प्रबंधन के लिए मार्गदर्शन

#### दस्तावेज़ीकरण गुणवत्ता
- **विस्तृत कोड उदाहरण**: व्यावहारिक, परीक्षण किए गए कोड नमूने
- **चरण-दर-चरण निर्देश**: स्पष्ट, क्रियाशील मार्गदर्शन
- **व्यापक त्रुटि प्रबंधन**: सामान्य मुद्दों के लिए समस्या निवारण
- **सर्वोत्तम अभ्यास एकीकरण**: उद्योग मानक और सिफारिशें
- **संस्करण संगतता**: नवीनतम Azure सेवाओं और azd सुविधाओं के साथ अद्यतन

## नियोजित भविष्य के उन्नयन

### संस्करण 3.1.0 (नियोजित)
#### एआई प्लेटफ़ॉर्म विस्तार
- **मल्टी-मॉडल समर्थन**: Hugging Face, Azure Machine Learning, और कस्टम मॉडलों के लिए एकीकरण पैटर्न
- **एआई एजेंट फ्रेमवर्क**: LangChain, Semantic Kernel, और AutoGen तैनातियों के लिए टेम्पलेट्स
- **उन्नत RAG पैटर्न**: Azure AI Search के अलावा वेक्टर डेटाबेस विकल्प (Pinecone, Weaviate, आदि)
- **एआई पर्यवेक्षण**: मॉडल प्रदर्शन, टोकन उपयोग, और प्रतिक्रिया गुणवत्ता के लिए उन्नत निगरानी

#### डेवलपर अनुभव
- **VS कोड एक्सटेंशन**: एकीकृत AZD + Microsoft Foundry विकास अनुभव
- **GitHub Copilot एकीकरण**: AI-सहायता प्राप्त AZD टेम्पलेट उत्पादन
- **इंटरएक्टिव ट्यूटोरियल**: AI परिदृश्यों के लिए स्वतः सत्यापन के साथ हैंड्स-ऑन कोडिंग अभ्यास
- **वीडियो सामग्री**: AI तैनाती पर केंद्रित विज़ुअल शिक्षार्थियों के लिए सहायक वीडियो ट्यूटोरियल

### संस्करण 4.0.0 (नियोजित)
#### एंटरप्राइज एआई पैटर्न
- **शासन ढांचा**: AI मॉडल शासन, अनुपालन, और ऑडिट ट्रेल
- **मल्टी-टेनेंट AI**: अलग-थलग AI सेवाओं के साथ कई ग्राहकों की सेवा के पैटर्न
- **एज AI तैनाती**: Azure IoT Edge और कंटेनर इंस्टेंस के साथ एकीकरण
- **हाइब्रिड क्लाउड AI**: AI कार्यभार के लिए मल्टी-क्लाउड और हाइब्रिड तैनाती पैटर्न

#### उन्नत विशेषताएं
- **एआई पाइपलाइन स्वचालन**: Azure Machine Learning पाइपलाइन के साथ MLOps एकीकरण
- **उन्नत सुरक्षा**: ज़ीरो-ट्रस्ट पैटर्न, निजी एंडपॉइंट, और उन्नत खतरा संरक्षण
- **प्रदर्शन अनुकूलन**: उच्च थ्रूपुट एआई अनुप्रयोगों के लिए उन्नत ट्यूनिंग और स्केलिंग रणनीतियां
- **वैश्विक वितरण**: AI अनुप्रयोगों के लिए सामग्री वितरण और एज कैशिंग पैटर्न

### संस्करण 3.0.0 (नियोजित) - वर्तमान रिलीज़ द्वारा प्रतिस्थापित
#### प्रस्तावित जोड़ - अब v3.0.0 में लागू
- ✅ **एआई-केंद्रित सामग्री**: व्यापक Microsoft Foundry एकीकरण (पूर्ण)
- ✅ **इंटरएक्टिव ट्यूटोरियल**: हैंड्स-ऑन AI कार्यशाला लैब (पूर्ण)
- ✅ **उन्नत सुरक्षा मॉड्यूल**: AI-विशिष्ट सुरक्षा पैटर्न (पूर्ण)
- ✅ **प्रदर्शन अनुकूलन**: AI कार्यभार ट्यूनिंग रणनीतियां (पूर्ण)

### संस्करण 2.1.0 (नियोजित) - आंशिक रूप से v3.0.0 में लागू
#### मामूली सुधार - कुछ वर्तमान रिलीज़ में पूर्ण हुए
- ✅ **अतिरिक्त उदाहरण**: AI-केंद्रित तैनाती परिदृश्य (पूर्ण)
- ✅ **विस्तारित FAQ**: AI-विशिष्ट प्रश्न और समस्या निवारण (पूर्ण)
- **उपकरण एकीकरण**: संवर्धित IDE और संपादक एकीकरण गाइड
- ✅ **निगरानी विस्तार**: AI-विशिष्ट निगरानी और अलर्टिंग पैटर्न (पूर्ण)

#### अभी भी भविष्य के रिलीज़ के लिए नियोजित
- **मोबाइल-फ्रेंडली दस्तावेज़ीकरण**: मोबाइल सीखने के लिए उत्तरदायी डिज़ाइन
- **ऑफ़लाइन पहुंच**: डाउनलोड करने योग्य दस्तावेज़ पैकेज
- **संवर्धित IDE एकीकरण**: AZD + AI वर्कफ़्लोज़ के लिए VS कोड एक्सटेंशन
- **समुदाय डैशबोर्ड**: वास्तविक समय समुदाय मेट्रिक्स और योगदान ट्रैकिंग

## चेंजलाग में योगदान

### बदलाव रिपोर्ट करना
इस रिपोजिटरी में योगदान करते समय, कृपया सुनिश्चित करें कि चेंजलाग प्रविष्टियों में शामिल हों:

1. **संस्करण संख्या**: सेमांटिक संस्करणन ( major.minor.patch) का पालन
2. **तारीख**: रिलीज़ या अपडेट की तारीख YYYY-MM-DD प्रारूप में
3. **श्रेणी**: जोड़ा गया, बदला गया, अप्रचलित किया गया, हटाया गया, फिक्स किया गया, सुरक्षा
4. **साफ विवरण**: जो बदला गया उसकी संक्षिप्त व्याख्या
5. **प्रभाव मूल्यांकन**: बदलाव मौजूदा उपयोगकर्ताओं को कैसे प्रभावित करता है

### बदलाव की श्रेणियाँ

#### जोड़ा गया
- नई सुविधाएँ, दस्तावेज़ अनुभाग, या क्षमताएँ
- नए उदाहरण, टेम्पलेट, या शिक्षण संसाधन
- अतिरिक्त उपकरण, स्क्रिप्ट, या यूटिलिटीज़

#### बदला गया
- मौजूदा कार्यक्षमता या दस्तावेज़ में संशोधन
- स्पष्टता या सटीकता में सुधार के लिए अपडेट
- सामग्री या संगठन का पुनर्गठन

#### अप्रचलित किया गया
- हटाए जाने वाले फीचर्स या दृष्टिकोण
- हटाने के लिए निर्धारित दस्तावेज़ अनुभाग
- बेहतर विकल्पों वाले तरीके

#### हटाया गया
- अब प्रासंगिक नहीं फीचर, दस्तावेज़, या उदाहरण
- पुरानी जानकारी या अप्रचलित दृष्टिकोण
- अतिरिक्‍त या समेकित सामग्री

#### फिक्स किया गया
- दस्तावेज़ या कोड में त्रुटियों के सुधार
- रिपोर्ट की गई समस्याओं या मुद्दों का समाधान
- सटीकता या कार्यक्षमता में सुधार


#### सुरक्षा
- सुरक्षा संबंधी सुधार या फिक्सेस
- सुरक्षा सर्वोत्तम प्रथाओं के अपडेट
- सुरक्षा कमजोरियों का समाधान

### सेमांटिक संस्करण दिशानिर्देश

#### प्रमुख संस्करण (X.0.0)
- टूटने वाले बदलाव जिनके लिए उपयोगकर्ता की क्रिया आवश्यक है
- सामग्री या संगठन की महत्वपूर्ण पुनर्गठन
- बदलाव जो मौलिक दृष्टिकोण या कार्यप्रणाली को बदलते हैं

#### गौण संस्करण (X.Y.0)
- नए फीचर्स या सामग्री जोड़ना
- उन सुधारों जो पिछली संगतता बनाए रखते हैं
- अतिरिक्त उदाहरण, उपकरण, या संसाधन

#### पैच संस्करण (X.Y.Z)
- बग फिक्स और सुधार
- मौजूदा सामग्री के छोटे सुधार
- स्पष्टिकरण और छोटे सुधार

## समुदाय प्रतिक्रिया और सुझाव

हम इस सीखने वाले संसाधन को बेहतर बनाने के लिए सक्रिय रूप से समुदाय की प्रतिक्रिया प्रोत्साहित करते हैं:

### प्रतिक्रिया कैसे दें
- **GitHub Issues**: समस्याओं की रिपोर्ट करें या सुधार सुझाएं (AI-विशिष्ट मुद्दे स्वागत योग्य हैं)
- **Discord Discussions**: विचार साझा करें और Microsoft Foundry समुदाय के साथ जुड़ें
- **Pull Requests**: सामग्री में सीधे सुधारों में योगदान करें, विशेषकर AI टेम्पलेट और गाइड्स
- **Microsoft Foundry Discord**: #Azure चैनल में AZD + AI चर्चाओं में भाग लें
- **Community Forums**: व्यापक Azure डेवलपर चर्चाओं में भाग लें

### प्रतिक्रिया श्रेणियाँ
- **AI सामग्री की सटीकता**: AI सेवा एकीकरण और परिनियोजन जानकारी में सुधार
- **सीखने का अनुभव**: बेहतर AI डेवलपर सीखने के प्रवाह के लिए सुझाव
- **अनुपस्थित AI सामग्री**: अतिरिक्त AI टेम्पलेट, पैटर्न, या उदाहरणों के अनुरोध
- **सुलभता**: विविध सीखने की जरूरतों के लिए सुधार
- **AI टूल एकीकरण**: बेहतर AI विकास वर्कफ़्लो एकीकरण के सुझाव
- **उत्पादन AI पैटर्न**: एंटरप्राइज़ AI परिनियोजन पैटर्न अनुरोध

### प्रतिक्रिया प्रतिबद्धता
- **मुद्दा प्रतिक्रिया**: रिपोर्ट किए गए समस्याओं के लिए 48 घंटे के भीतर
- **फीचर अनुरोध**: एक सप्ताह के भीतर मूल्यांकन
- **समुदाय योगदान**: एक सप्ताह के भीतर समीक्षा
- **सुरक्षा मुद्दे**: तत्काल प्राथमिकता के साथ त्वरित प्रतिक्रिया

## रखरखाव अनुसूची

### नियमित अपडेट
- **मासिक समीक्षा**: सामग्री सटीकता और लिंक सत्यापन
- **त्रैमासिक अपडेट**: मुख्य सामग्री जोड़ और सुधार
- **अर्धवार्षिक समीक्षा**: व्यापक पुनर्गठन और सुधार
- **वार्षिक रिलीज**: महत्वपूर्ण सुधारों के साथ प्रमुख संस्करण अपडेट

### निगरानी और गुणवत्ता आश्वासन
- **स्वचालित परीक्षण**: कोड उदाहरणों और लिंक का नियमित सत्यापन
- **समुदाय प्रतिक्रिया एकीकरण**: उपयोगकर्ता सुझावों का नियमित समावेशन
- **तकनीकी अपडेट**: नवीनतम Azure सेवाओं और azd रिलीज के साथ संरेखण
- **सुलभता ऑडिट**: समावेशी डिज़ाइन सिद्धांतों के लिए नियमित समीक्षा

## संस्करण समर्थन नीति

### वर्तमान संस्करण समर्थन
- **नवीनतम प्रमुख संस्करण**: नियमित अपडेट के साथ पूर्ण समर्थन
- **पिछला प्रमुख संस्करण**: सुरक्षा अपडेट और महत्वपूर्ण फिक्सेस 12 महीनों के लिए
- **पुराने संस्करण**: केवल समुदाय समर्थन, कोई आधिकारिक अपडेट नहीं

### माइग्रेशन मार्गदर्शन
जब प्रमुख संस्करण जारी किए जाते हैं, हम प्रदान करते हैं:
- **माइग्रेशन गाइड्स**: चरण-दर-चरण संक्रमण निर्देश
- **संगतता नोट्स**: टूटने वाले बदलावों के विवरण
- **टूल सपोर्ट**: माइग्रेशन में मदद के लिए स्क्रिप्ट या यूटिलिटीज़
- **समुदाय समर्थन**: माइग्रेशन प्रश्नों के लिए समर्पित फोरम

---

**नेविगेशन**
- **पिछला पाठ**: [Study Guide](resources/study-guide.md)
- **अगला पाठ**: वापस जाएं [Main README](README.md)

**अद्यतन रहें**: इस रिपॉजिटरी को वॉच करें ताकि नई रिलीज़ और सीखने की सामग्री के महत्वपूर्ण अपडेट की सूचनाएं प्राप्त हों।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->