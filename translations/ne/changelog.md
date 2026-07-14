# परिवर्तनकथा - AZD लागि सुरु गर्नेहरूका लागि

## परिचय

यो परिवर्तनकथा AZD लागि सुरु गर्नेहरू रिपोजिटरीको सबै महत्वपूर्ण परिवर्तनहरू, अद्यावधिकहरू, र सुधारहरूलाई दस्तावेज गर्दछ। हामी सेमेन्टिक भर्सनिङका सिद्धान्तहरू अनुसरण गर्छौं र प्रयोगकर्ताहरूलाई भर्सनहरू बीच के परिवर्तन भएको छ बुझ्न मद्दत गर्न यो लग राख्छौं।

## सिकाइ लक्ष्यहरू

यस परिवर्तनकथा हेरेर, तपाईंले:
- नयाँ सुविधाहरू र सामग्री थपहरूको बारेमा सूचित रहनुहुनेछ
- अवस्थित दस्तावेजहरूमा गरिएको सुधारहरू बुझ्नुहुनेछ
- बग सुधारहरू र सच्याउने कामहरू ट्र्याक गर्नुहुनेछ जसले सहीताको सुनिश्चित गर्छ
- सिकाइ सामग्रीहरूको विकासलाई समयसंगै पछ्याउनुहुनेछ

## सिकाइ परिणामहरू

परिवर्तनकथा प्रविष्टि समीक्षा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- सिकाइका लागि उपलब्ध नयाँ सामग्री र स्रोतहरू पहिचान गर्न
- कुन खण्डहरू अद्यावधिक वा सुधार गरिएको छ बुझ्न
- सबैभन्दा हालका सामग्रीहरूका आधारमा आफ्नो सिकाइ मार्ग योजना बनाउन
- भविष्यका सुधारहरूका लागि प्रतिक्रिया र सुझावहरू दिन

## भर्सन इतिहास

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 रिफ्रेश: भर्सन मुद्रा अपडेट
**यो भर्सनले कोर्सलाई `azd` `1.27.1` (जुलाई 2026, पछिल्लो स्थिर रिलीज) र हालको पूर्वावलोकन AI एजेण्ट विस्तार `azure.ai.agents` `1.0.0-beta.5` सँग पुन: मान्यता दिन्छ, जसले हरेक "प्रमाणित विरुद्ध" ब्यानेरलाई 1.26.0, 1.27.0, र 1.27.1 रिलीजपछि अद्यावधिक बनाउँछ।**

#### परिवर्तनहरू
- **✅ मान्यता आधार रेखा अद्यावधिक** गरिएको छ `azd 1.25.6` (जुन 2026) बाट `azd 1.27.1` (जुलाई 2026) मा मूल README, सबै अध्याय READMEs, अध्याय 1 देव-कन्टेनर पाठ (पिन गरिएको भर्सन उदाहरणहरू सहित), अध्याय 4 कस्टम-टेम्पलेटहरू पाठ, अध्याय 5 बहु-एजेण्ट पाठ, र कार्यशाला कागजातहरूमा
- **🤖 अध्याय 2 आधार रेखा रिफ्रेश** गरिएको छ `azd 1.23.12` (मार्च 2026) बाट `azd 1.27.1` सँग `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, र `microsoft-foundry-integration.md`; मान्यता-सूचनाका मितिहरू 2026-07-13 मा अद्यावधिक
- **🧩 AI एजेण्ट विस्तार बम्प** गरिएको छ `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` बाट हालको `1.0.0-beta.5` रिलीजमा अध्याय 2 README र `agents.md` मा
- **🧪 कार्यशाला मान्यता उदाहरण** (`azd version` आउटपुट) `1.27.1` मा अद्यावधिक

#### सम्बन्धित azd रिलीजहरूमा नोटहरू (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions on Flex Consumption का लागि Go समर्थन, `azd config sub-filter` प्रति-भाडामा सदस्यता फिल्टरहरू, स्व-समावेश विस्तार बन्डलहरू (`azd x pack --bundle`), र `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** मोडेल गर्नुहोस् Azure AI Foundry परियोजनाहरू/एजेण्टहरूलाई सिधै `azure.yaml` मा (Bicep-रहित/Terraform-रहित सुरुवात), App Service का लागि कन्टेनर तैनाथ समर्थन (`host: appservice` + `language: docker`), `azd extension` आदेशहरूका लागि सिधा `-s/--source`, र `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install` को लागि `--no-dependencies` झण्डा, डिप्रिकेटेड मोडेलहरू डिफल्ट रूपमा क्याटलग/कोटा संकेतहरूबाट बहिष्कृत, र धेरै बग सुधारहरू

#### फाइलहरू अद्यावधिक गरियो
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

#### सुरु गर्नेहरूको लागि अन्तरपुरक भर्ना #2: टेम्पलेट लेखन, देव कन्टेनरहरू, पुलुमी, Azure DevOps, सेवा प्रमुखहरू, र थप
**यस भर्सनले azd-कभरज विश्लेषणले देखाएका बाँकी मध्यवर्ती अन्तरहरू बन्द गर्दछ: आफ्नै टेम्पलेट कसरी लेख्ने र प्रकाशित गर्ने, पुनरुत्पादनीय देव-कन्टेनर/कोडस्पेस वातावरणहरू, पुलुमी पूर्वाधार प्रदायक, Azure DevOps CI/CD सरलीकरण, सेवा-प्रधान प्रमाणीकरण, होस्ट रोज्ने मार्गदर्शन (AKS/Spring Apps), `azd restore`/`azd package` व्याख्या, हुक त्रुटि-सम्भाल, र टिम/साझा वातावरण अभ्यासहरू।**

#### थपियो
- **🧱 नयाँ अध्याय 4 पाठ** `docs/chapter-04-infrastructure/custom-templates.md` — आफ्नो azd टेम्पलेट लेख्ने: आवश्यक संरचना (`azure.yaml`, `infra/`, `src/`), `metadata.template` क्षेत्र, पूर्वाधारलाई `uniqueString()` स्रोत टोकन र `azd-env-name` ट्यागद्वारा प्यारामिटर बनाउने, स्थानीय परीक्षण `azd init --template <local-path>` सँग, GitHub मा प्रकाशन, र Awesome AZD ग्यालरीमा पठाउने
- **📦 नयाँ अध्याय 1 पाठ** `docs/chapter-01-foundation/dev-containers.md` — देव कन्टेनर र GitHub Codespaces सँग पुनरुत्पादनीय azd वातावरणहरू: आधिकारिक `ghcr.io/azure/azure-dev/azd` सुविधासहित न्यूनतम `.devcontainer/devcontainer.json`, भाषा-विशिष्ट सुविधाहरू, कन्टेनर होस्टहरूको लागि `docker-in-docker`, र रिमोट साइन-इनको लागि `azd auth login --use-device-code`
- **🧩 azd सँग पुलुमी** सेक्सन `docs/chapter-04-infrastructure/provisioning.md` मा — `infra.provider: pulumi`, पुलुमी फोल्डर संरचना, azd वातावरणहरूलाई म्याक गरिएका स्ट्याकहरू, आवश्यक आउटपुट/ट्यागिङ, र समान `azd up` / `azd down` कार्यप्रवाह
- **🎯 होस्ट-चयन मार्गदर्शन** `docs/chapter-04-infrastructure/provisioning.md` मा — सुरु गर्नेहरूको लागि मैत्रीपूर्ण तुलना `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, र `springapp` बीच, AKS वा Azure Spring Apps कहिले छनोट गर्ने बारे मार्गदर्शनसहित
- **🛠️ Azure DevOps CI/CD सरलीकरण** `docs/chapter-08-production/production-ai-practices.md` मा — `azd pipeline config --provider azdo`, कार्यभार पहिचान संघ (OIDC) सँग सेवा कनेक्शन, जेनेरेट गरिएको `azure-dev.yml`, र भेरिएबल-ग्रुप सेटअप
- **🔑 सेवा प्रमुखहरू (ढाँचा 4)** थपियो `docs/chapter-03-configuration/authsecurity.md` मा — `az ad sp create-for-rbac`, क्लाइएन्ट सिक्रेटसहित गैर-इंटरएक्टिभ `azd auth login` बनाम संघीय/OIDC प्रमाणपत्रहरू, कहिले प्रयोग गर्ने, र सुरक्षित प्रमाणपत्र भण्डारण
- **🪝 हुक त्रुटि-सम्भाल** उप-सेक्सन `docs/chapter-04-infrastructure/deployment-guide.md` मा — निकास कोडहरू र `set -e`, `continueOnError`, अलग्गै हुकहरू परीक्षण गर्न `azd hooks run` सँग, OS-विशिष्ट शेलहरू, र `--debug`
- **👥 टिम / साझा वातावरणहरू** सेक्सन `docs/chapter-03-configuration/configuration.md` मा — के `.azure/` मा हुन्छ, के gitignore गर्ने, प्रति-विकासकर्ता वातावरणहरू, `azd env list`/`select`, र CI/CD मा वातावरण मानहरू दिनु
- **🧰 `azd restore` र विस्तारित `azd package`** व्याख्याहरू `resources/cheat-sheet.md` मा — निर्भरता पुनर्स्थापना र तैनाथ नगरी तैनाथ गर्न मिल्ने वस्तु निर्माण

#### परिवर्तन गरियो
- **🧭 अध्याय 4 पाठ तालिका** नयाँ "आफ्नो टेम्पलेट लेख्ने" पाठ (पाठ 3) समावेश गर्न अद्यावधिक
- **🧭 अध्याय 1 पाठ तालिका** नयाँ "देव कन्टेनर र कोडस्पेस" पाठ (पाठ 5) समावेश गर्न अद्यावधिक; `bring-your-own-app.md` र `dev-containers.md` बीच नेभिगेसन फूटर जोडियो

### [v3.21.0] - 2026-06-16

#### सुरु गर्नेहरूको लागि अन्तरपुरक भर्ना: बहु-एजेण्ट हात-हातको पाठ, "आफ्नै एप ल्याउनुहोस्," Terraform, र CI/CD सरलीकरण
**यस भर्सनले पूर्ण सुरु गर्नेहरूको लागि सबैभन्दा ठूला अन्तरहरू बन्द गर्दछ दुई नयाँ हात-हातका पाठहरू थपेर (तैनाथ गर्न मिल्ने बहु-एजेण्ट सरलीकरण र एउटा विद्यमान एपमा azd जोड्ने), एक सुरु मैत्री हुक परिचय, Terraform-azd सेक्सन, चरण-द्वारा-चरण GitHub Actions पाइपलाइन सरलीकरण, नयाँ पूर्वावलोकन विस्तारहरूको व्याख्या, र स्पष्ट तैनाथ-प्रमाणिकरण चेकलिस्ट।**

#### थपियो
- **🤝 नयाँ अध्याय 5 पाठ** `docs/chapter-05-multi-agent/multi-agent-basics.md` — पूर्ण रूपमा हात-हात, तैनाथ गर्न मिल्ने दुई-एजेण्ट सरलीकरण (ओर्केस्ट्रेटर + विशेषज्ञहरू) सँग वास्तविक टेम्पलेट (`contoso-creative-writer`) प्रयोग गर्दै, कहिले बहु-एजेण्ट प्रयोग गर्ने, `azd up` कार्यप्रवाह बुझ्ने, तैनाथ स्रोतहरू बुझ्ने, एजेण्टहरूको बीच ट्रेसिङ, अनुकूलन, र सफाइ
- **📦 नयाँ अध्याय 1 पाठ** `docs/chapter-01-foundation/bring-your-own-app.md` — विद्यमान परियोजनामा azd कसरी थप्ने `azd init` सँग ("हालको डाइरेक्टरीमा कोड प्रयोग"), `azure.yaml` र `infra/` बुझ्ने, `azd infra generate`, होस्ट पहिचान, र `azd up` सँग तैनाथ
- **🌐 Terraform सँग azd** सेक्सन थपियो `docs/chapter-04-infrastructure/provisioning.md` मा — `infra.provider: terraform` कन्फिग, `.tf` फोल्डर संरचना, आवश्यक `AZURE_*` आउटपुट र `azd-env-name` ट्यागिङ, र समान `azd up` / `azd down` कार्यप्रवाह (जहाँ Terraform समर्थन दाबी गरिएको थियो तर Bicep मात्र देखाइएको थियो त्यो अंतर बन्द गर्छ)
- **⚙️ चरण-द्वारा-चरण GitHub Actions सरलीकरण** `docs/chapter-08-production/production-ai-practices.md` मा — GitHub रिपोबाट स्वचालित तैनाथसम्म: `azd pipeline config`, OIDC संघीय प्रमाणपत्रहरू (संसाधित गोप्य छैन), जेनेरेट गरिएको `azure-dev.yml`, र गोप्य-रूपि भेरिएबल मार्गदर्शन
- **🪝 सुरु मैत्री "हुक नयाँ?" परिचय** `docs/chapter-04-infrastructure/deployment-guide.md` मा — हुक के हो, हुक-चरण तालिका, न्यूनतम पहिलो हुक, र म्यानुअल रूपमा हुक चलाउने `azd hooks run` सँग
- **✅ "तपाईंको तैनाथ प्रमाणित गर्नुहोस्" चेकलिस्ट** थपियो `docs/chapter-01-foundation/first-project.md` को चरण 5 मा — धुवा परीक्षण, स्वास्थ्य अन्त्य-बिन्दु जाँच, र स्पष्ट सफलताको मापदण्ड
- **🧩 नयाँ पूर्वावलोकन विस्तारहरूको व्याख्या** `azure.ai.skills` र `azure.ai.connections` (के हुन् र कहिले प्रयोग गर्ने) `docs/chapter-08-production/production-ai-practices.md` मा

#### परिवर्तन गरियो
- **🧭 अध्याय 5 पाठ तालिका** सुधारिएको: `multi-agent-basics.md` अहिले पाठ 1 हो (एक मात्र पूर्ण रूपमा हात-हात पाठ), इमान्दार लेबलिङसहित पाठ 2 अध्याय 6 मा छ र रिटेल परिदृश्य एउटा वास्तुकला रूपरेखा हो, एक आदेश टेम्पलेट होइन
- **🧭 अध्याय 1 पाठ तालिका** नयाँ "आफ्नै एप ल्याउनुहोस्" पाठ (पाठ 4) समावेश गर्न अपडेट
- **🔗 नेभिगेसन फूटरहरू** अपडेट गरिएको: `first-project.md` अब अगाडि `bring-your-own-app.md` सँग लिंक गर्दछ

#### सच्याइयो
- **🧱 "दाबी गरियो तर छैन" Terraform अन्तर बन्द गरियो** — पाठले पहिले Terraform समर्थनको उल्लेख गर्थ्यो तर देखाएको थिएन
- **🔀 गलत बुझाउने अध्याय 5 क्रस-लिंकहरू सच्याइयो** जसले भनीयो पूर्ण बहु-एजेण्ट कार्यान्वयन छ जब वास्तवमा वास्तुकला रूपरेखा मात्र थियो

#### फाइलहरू अद्यावधिक गरियो
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(नयाँ)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(नयाँ)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 रिफ्रेश, पूर्ण एजेण्ट लाइफसाइकल आदेशहरू र Aspire पुन:ब्रान्डिङ

**यस संस्करणले कोर्सलाई `azd` `1.25.6` (जून 2026) र `azure.ai.agents` `0.1.40-preview` विस्तारसँग पुन: प्रमाणित गर्दछ, एआई निर्देशनलाई "एजेन्टको आधार तयार पार्नुहोस्" बाट पूर्ण एजेन्ट जीवनचक्र (परीक्षण → मूल्यांकन → अनुकूलन → निरीक्षण → मेटाउनुहोस्) सम्म विस्तार गर्दछ, नयाँ `azure.ai.skills` र `azure.ai.connections` पूर्वावलोकन विस्तारहरूलाई प्रस्तुत गर्दछ, र ".NET Aspire" → "Aspire" उत्पादन पुनःब्रान्डलाई उल्लेख गर्दछ।**

#### थपियो
- **🔁 पूर्ण एजेन्ट जीवनचक्र कवरेज** नवसिखुवा र एआई इन्जिनियरहरूको लागि डकुमेन्टहरूमा:
  - `docs/chapter-01-foundation/azd-basics.md` — विस्तार र एआई आदेशहरू खण्डमा जीवनचक्र तालिका (आधार तयार → परीक्षण → मापन → सुधार → निरीक्षण → सफाइ) थपियो
  - `docs/chapter-08-production/production-ai-practices.md` — नयाँ "एजेन्ट जीवनचक्र व्यवस्थापन" खण्ड जसले `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, र `delete --force` समेट्छ
  - `resources/cheat-sheet.md` — विस्तार गरिएको एआई एजेन्ट आदेशहरू `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, र `delete --force` सहित
- **🧩 नयाँ पूर्वावलोकन विस्तारहरू** कागजात गरिएको: `azure.ai.skills` (पुन: प्रयोग हुने एजेन्ट कौशलहरू) र `azure.ai.connections` (फाउन्ड्री कनेक्शनहरू) विस्तार तालिका र चिट शीटमा थपियो
- **⏱️ प्रतिक्रिया-समय निर्देशन** — `azd ai agent invoke` उदाहरणहरूले अब कुल विलम्ब र पहिलो बाइटसम्मको समय प्रिन्ट गर्दा नोट गर्छ
- **📌 संस्करण ब्यानर** मूल README मा जसले सिक्दै गरेकोलाई `azd version` र `azd upgrade` तर्फ निर्देशित गर्दछ

#### परिवर्तन भएको
- **✅ प्रमाणीकरण आधार रेखा अद्यावधिक** `azd 1.23.12` (मार्च 2026) बाट `azd 1.25.6` (जून 2026) सम्म सबै अध्यायका README र कार्यशाला डकुमेन्टहरूमा
- **🤖 अध्याय २ विस्तार नोट** `azure.ai.agents` `0.1.18-preview` बाट `0.1.40-preview` मा अद्यावधिक
- **🧪 कार्यशाला प्रमाणीकरण उदाहरण** (`azd version` आउटपुट) `1.25.6` मा अद्यावधिक
- **🧭 README "आज azd मा के नयाँ छ"** नवीकरण गरिएको जसले समग्र एजेन्ट जीवनचक्र, नयाँ एआई विस्तारहरू, र हालैका जीवन गुणस्तर सुधारहरू (जस्तै `azd init` परिवर्तनीयता, `azd auth login` स्टेल-टोकन हटाउने, `azd tool` पहिलो-चालु प्रम्प्ट) उजागर गर्छ
- **📖 अध्याय २ agents.md (विकल्प 4)** अब सिक्नेहरूलाई `azd up` मा रोकिएर होइन, पोस्ट-डिप्लोय जीवनचक्र आदेशहरू तर्फ निर्देशन गर्दछ

#### सुधारिएको
- **🏷️ उत्पादन नामकरण** — Aspire पुनःब्राण्ड नोट थपियो (".NET Aspire" अब केवल "Aspire"); azd को Aspire समर्थन अपरिवर्तित छ
- **🔎 लाइभ रिलिज प्रमाणीकरण** Azure Developer CLI रिलिज फीडसँग पुष्टि गरिएको: स्थिर CLI `1.25.6` (2026-06-12) र `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### अद्यावधिक फाइलहरू
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

#### शुरुआतकर्ता अनबोर्डिङ स्पष्टता, सेटअप प्रमाणीकरण र अन्तिम AZD आदेश सफाई
**यस संस्करणले AZD 1.23 प्रमाणीकरण स्क्विप पछ्याउँदै नवसिखुवा-केंद्रित कागजात पास गर्दछ: AZD-प्रथम प्रमाणीकरण निर्देशन स्पष्ट गर्दछ, स्थानीय सेटअप प्रमाणीकरण स्क्रिप्टहरू थप्दछ, प्रमुख आदेशहरू लाइभ AZD CLI सँग प्रमाणित गर्दछ, र परिवर्तनलॉग बाहिर अन्तिम पुरानो अंग्रेजी स्रोत आदेश उद्धरणहरू हटाउँछ।**

#### थपियो
- **🧪 सुरुवाती सेटअप प्रमाणीकरण स्क्रिप्टहरू** `validate-setup.ps1` र `validate-setup.sh` सँग जसले सिक्नेहरूलाई अध्याय 1 सुरु गर्नुअघि आवश्यक उपकरणहरू पुष्टि गर्न मद्दत गर्छ
- **✅ अग्रिम सेटअप प्रमाणीकरण चरणहरू** मूल README र अध्याय १ README मा ताकि `azd up` अघि हराएका पूर्वअवश्यकताहरू पत्ता लगाउन सकियोस्

#### परिवर्तन भएको
- **🔐 सुरुवाती प्रमाणीकरण निर्देशन** अब निरन्तर `azd auth login` लाई AZD कार्यप्रवाहहरूको मुख्य मार्गको रूपमा व्यवहार गर्दछ, `az login` वैकल्पिक रूपमा मात्र जब Azure CLI आदेशहरू प्रत्यक्ष प्रयोग गरिन्छ
- **📚 अध्याय १ अनबोर्डिङ प्रवाह** अब सिक्नेहरूलाई स्थापनाअघि आफ्नो स्थानीय सेटअप प्रमाणीकरण गर्न निर्देशन गर्दछ
- **🛠️ प्रमाणीकरण सन्देश** अब स्पष्ट रूपमा ब्लकिङ आवश्यकताहरू र वैकल्पिक Azure CLI चेतावनीहरू अलग पार्दछ AZD मात्र सुरुवाती मार्गका लागि
- **📖 कन्फिगरेसन, समस्या समाधान, र उदाहरण कागजातहरू** अब आवश्यक AZD प्रमाणीकरण र वैकल्पिक Azure CLI साइन-इन बीच भिन्नता जनाउँछन् जहाँ पूर्वमा सन्दर्भ बिना प्रस्तुत थिए

#### सुधारिएको
- **📋 बाँकी अंग्रेजी-श्रोत आदेश उद्धरणहरू** हालको AZD रूपहरूमा अद्यावधिक, चिट शीटमा `azd config show` र `azd monitor --overview` जहाँ Azure Portal अवलोकन निर्देशन चाहिन्छ
- **🧭 अध्याय १ मा सुरुवाती दावीहरू** सबै टेम्प्लेटहरू र Azure स्रोतमा निश्चित त्रुटि-रहित वा रोलब्याक व्यवहारको बढी दाबी नराख्न नरम पारिएको
- **🔎 लाइभ CLI प्रमाणीकरण** पुष्टि गरियो `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, र `azd down --force --purge` को लागि

#### अद्यावधिक फाइलहरू
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

#### AZD 1.23.12 प्रमाणीकरण, कार्यशाला वातावरण विस्तार र एआई मोडेल नवीकरण
**यस संस्करणले कागजात प्रमाणीकरण स्क्विप गर्दछ `azd` `1.23.12` विरुद्ध, पुराना AZD आदेश उदाहरणहरू अद्यावधिक गर्दछ, एआई मोडेल निर्देशनहरू हालको पूर्वनिर्धारितमा ताजा पार्दछ, र कार्यशाला निर्देशनहरू GitHub Codespaces भन्दा बाहिर विकास कन्टेनरहरू र स्थानीय क्लोन समर्थनसँग विस्तार गर्दछ।**

#### थपियो
- **✅ मुख्य अध्यायहरू र कार्यशाला डकुमेन्टहरूमा प्रमाणीकरण नोटहरू** जसले नयाँ वा पुराना CLI बिल्डहरू प्रयोग गर्ने सिक्नेहरूका लागि परीक्षण गरिएको AZD आधारलाइन स्पष्ट बनाउँछ
- **⏱️ लामो समय चल्ने एआई अनुप्रयोग डिप्लोयमेन्टको लागि समय-सीमा निर्देशन** `azd deploy --timeout 1800` प्रयोग गरी
- **🔎 विस्तार निरीक्षण चरणहरू** AI कार्यप्रवाह डकुमेन्टहरूमा `azd extension show azure.ai.agents` सँग
- **🌐 व्यापक कार्यशाला वातावरण निर्देशन** GitHub Codespaces, विकास कन्टेनरहरू, र स्थानीय क्लोनहरू कभर गर्दै MkDocs सँग

#### परिवर्तन भएको
- **📚 अध्याय परिचय README हरू** अब निरन्तर `azd 1.23.12` सँग प्रमाणीकरण उल्लेख गर्दछन् आधार, कन्फिगरेसन, पूर्वाधार, बहु-एजेन्ट, पूर्व-डिप्लोय, समस्या समाधान, र उत्पादन खण्डहरूमा
- **🛠️ AZD आदेश सन्दर्भहरू** सबै डकुमेन्टहरूमा हालको रूपहरूमा अद्यावधिक:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` वा `azd env get-value(s)` सन्दर्भ अनुसार
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` जहाँ Application Insights अवलोकन चाहिन्छ
- **🧪 पूर्वावलोकन पूर्वाधार उदाहरणहरू** हालको समर्थित प्रयोगजस्तै `azd provision --preview` र `azd provision --preview -e production` मा सरल बनाइयो
- **🧭 कार्यशाला प्रवाह** अद्यावधिक गरियो ताकि सिक्नेहरू Codespaces, विकास कन्टेनर, वा स्थानीय क्लोनमा प्रयोग प्रयोग गरेर प्रयोगशाला पूरा गर्न सकून्, केवल Codespaces मात्र नभई
- **🔐 प्रमाणीकरण निर्देशन** अब AZD कार्यप्रवाहहरूका लागि `azd auth login` प्राथमिक तरिका मानिन्छ, र `az login` वैकल्पिक जब Azure CLI आदेशहरू सिधै प्रयोग हुन्छन्

#### सुधारिएको
- **🪟 विन्डोज स्थापना आदेशहरू** हालको `winget` प्याकेज केसिङमा सामान्यीकृत स्थापना मार्गदर्शनमा
- **🐧 लिनक्स स्थापना निर्देशन** असमर्थित वितरण-विशिष्ट `azd` प्याकेज मेनेजर निर्देशनबाट बचिएको र सट्टामा रिलीज एस्सेटहरूमा जनाइएको
- **📦 AI मोडेल उदाहरणहरू** पुराना पूर्वनिर्धारितहरू जस्तै `gpt-35-turbo` र `text-embedding-ada-002` बाट हालका उदाहरणहरू `gpt-4.1-mini`, `gpt-4.1`, र `text-embedding-3-large` सम्म ताजा पारियो
- **📋 डिप्लोयमेन्ट र निदान कोड स्निपेटहरू** हालको वातावरण र स्थिती आदेशहरू प्रयोग गर्ने गरी संशोधित गरियो लग, स्क्रिप्ट र समस्या समाधान चरणहरूमा
- **⚙️ GitHub Actions निर्देशन** `Azure/setup-azd@v1.0.0` बाट `Azure/setup-azd@v2` मा अद्यावधिक
- **🤖 MCP/Copilot सहमति निर्देशन** `azd mcp consent` बाट `azd copilot consent list` मा अद्यावधिक

#### सुधारिएको
- **🧠 AI अध्याय निर्देशन** पूर्वावलोकन-संवेदनशील `azd ai` व्यवहार, टेनन्ट-विशेष लगइन, हालको विस्तार प्रयोग, र अद्यावधिक मोडेल डिप्लोय सिफारिसहरू राम्रोसँग व्याख्या गर्ने
- **🧪 कार्यशाला निर्देशनहरू** बढी यथार्थपरक संस्करण उदाहरणहरू र स्पष्ट वातावरण सेटअप भाषाशैली प्रयोग गर्दै हात-हात प्रयोगशालाहरूका लागि
- **📈 उत्पादन र समस्या समाधान डकुमेन्टहरू** हालको निगरानी, फ्याक्लब्याक मोडेल, र लागत तह उदाहरणहरूसँग राम्रोसँग मेल खाने

#### अद्यावधिक फाइलहरू
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

#### AZD AI CLI आदेशहरू, सामग्री प्रमाणीकरण र टेम्प्लेट विस्तार
**यस संस्करणले सबै AI-संबन्धित अध्यायहरूमा `azd ai`, `azd extension`, र `azd mcp` आदेश कवरेज थप्दछ, agents.md मा भंगिएको लिङ्क र अब प्रयोग नगरिने कोडहरू सुधार्दछ, चिट शीट अद्यावधिक गर्दछ, र उदाहरण टेम्प्लेट खण्डलाई प्रमाणित विवरण र नयाँ Azure AI AZD टेम्प्लेटहरूसँग पुनर्संरचना गर्दछ।**

#### थपियो
- **🤖 AZD AI CLI कवरेज** ७ फाइलहरूमा (पहिले केवल अध्याय ८ मा मात्र):
  - `docs/chapter-01-foundation/azd-basics.md` — नयाँ "विस्तार र एआई आदेशहरू" खण्ड जसले `azd extension`, `azd ai agent init`, र `azd mcp` परिचय गराउँछ
  - `docs/chapter-02-ai-development/agents.md` — विकल्प 4: `azd ai agent init` तुलना तालिका (टेम्प्लेट बनाम म्यानिफेस्ट दृष्टिकोण) सहित
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "फाउन्ड्रीको लागि AZD विस्तारहरू" र "एजेन्ट-प्रथम डिप्लोयमेंट" उप-खण्डहरू

  - `docs/chapter-05-multi-agent/README.md` — क्विक स्टार्टले हाल टेम्प्लेट र म्यानिफेस्ट-आधारित डिप्लोयमेन्ट मार्गहरू देखाउँछ
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — डिप्लोय अनुभागमा अब `azd ai agent init` विकल्प समावेश छ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "डायग्नोस्टिक्सका लागि AZD AI एक्सटेन्सन आदेशहरू" उपभाग
  - `resources/cheat-sheet.md` — नयाँ "AI & एक्सटेन्सन आदेशहरू" खण्ड `azd extension`, `azd ai agent init`, `azd mcp`, र `azd infra generate` सहित
- **📦 नयाँ AZD AI उदाहरण टेम्प्लेटहरू** `microsoft-foundry-integration.md` मा:
  - **azure-search-openai-demo-csharp** — ब्लेजर वेबअसेंबली, सेमेन्टिक कर्नेल, र भ्वाइस च्याट समर्थन सहित .NET RAG च्याट
  - **azure-search-openai-demo-java** — Langchain4J सँग Java RAG च्याट, ACA/AKS डिप्लोय विकल्पहरूसहित
  - **contoso-creative-writer** — Azure AI एजेन्ट सेवा, Bing ग्राउन्डिङ, र Prompty प्रयोग गर्ने बहु-एजेन्ट सिर्जनात्मक लेखन एप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB सहित सर्भरलेस RAG, Ollama स्थानीय विकास समर्थन सहित
  - **chat-with-your-data-solution-accelerator** — प्रशासन पोर्टल, Teams एकीकरण, र PostgreSQL/Cosmos DB विकल्पहरूसहित उद्यम RAG एक्सेलेरेटर
  - **azure-ai-travel-agents** — .NET, Python, Java, र TypeScript मा सर्भरहरूसहित बहु-एजेन्ट MCP समन्वय सन्दर्भ एप
  - **azd-ai-starter** — न्यूनतम Azure AI इन्फ्रास्ट्रक्चर बाइसेप स्टार्टर टेम्प्लेट
  - **🔗 उत्कृष्ट AZD AI ग्यालरी लिङ्क** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (८०+ टेम्प्लेटहरू) को सन्दर्भ

#### सुधारिएको
- **🔗 agents.md नेभिगेसन**: पहिले/अर्को लिङ्कहरू अब अध्याय २ README पाठ क्रमसँग मेल खान्छन् (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md भाँचिएका लिङ्कहरू**: `production-ai-practices.md` लाई `../chapter-08-production/production-ai-practices.md` मा सुधारिएको (३ पटक)
- **📦 agents.md पुरानो कोड**: `opencensus` लाई `azure-monitor-opentelemetry` + OpenTelemetry SDK ले प्रतिस्थापन गरिएको
- **🐛 agents.md अमान्य API**: `max_tokens` लाई `create_agent()` बाट `create_run()` मा `max_completion_tokens` को रूपमा सारिएको
- **🔢 agents.md टोकन गणना**: मोटामोटी `len//4` अनुमानलाई `tiktoken.encoding_for_model()` ले प्रतिस्थापन गरेको
- **azure-search-openai-demo**: सेवाहरूलाई "Cognitive Search + App Service" बाट "Azure AI Search + Azure Container Apps" मा सुधार गरिएको (डिफल्ट होस्ट अक्टोबर २०२४ मा परिवर्तन)
- **contoso-chat**: वर्णनलाई Azure AI Foundry + Prompty सन्दर्भसँग अद्यावधिक गरियो, रिपोजिटरीको वास्तविक शीर्षक र प्राविधिक स्ट्याकसँग मेल खान्छ

#### हटाइयो
- **ai-document-processing**: गैर-कार्यशील टेम्प्लेट सन्दर्भ हटाइयो (AZD टेम्प्लेटको रूपमा सार्वजनिक रूपमा पहुँच योग्य छैन)

#### सुधार गरियो
- **📝 agents.md अभ्यासहरू**: अभ्यास १ मा अपेक्षित आउटपुट र `azd monitor` चरण देखाइएको छ; अभ्यास २ मा पूरा `FunctionTool` दर्ता कोड समावेश छ; अभ्यास ३ मा अस्पष्ट मार्गनिर्देशनलाई ठोस `prepdocs.py` आदेशले प्रतिस्थापन गरियो
- **📚 agents.md स्रोतहरू**: डकुमेन्टेसन लिङ्कहरूलाई हालको Azure AI Agent सेवा दस्तावेज र क्विकस्टार्टमा अद्यावधिक गरियो
- **📋 agents.md अगाडि कदम तालिका**: पूर्ण अध्याय कवरेजका लागि AI कार्यशाला प्रयोगशाला लिङ्क थपियो

#### फाइलहरू अद्यावधिक गरियो
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - २०२६-०२-०५

#### कोर्स नेभिगेसन सुधार
**यस संस्करणले README.md अध्याय नेभिगेसनलाई थप राम्रो तालिका ढाँचासहित सुधार गर्दछ।**

#### परिवर्तनहरू
- **कोर्स म्याप तालिका**: प्रत्यक्ष पाठ लिङ्कहरू, अवधि अनुमानहरू, र जटिलता मूल्याङ्कनहरूसहित सुधारिएको
- **फोल्डर सफाइ**: पुराना फोल्डरहरूको ज्यादातर हटाइयो (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **लिङ्क प्रमाणीकरण**: कोर्स म्याप तालिकाका २१+ आन्तरिक लिङ्कहरू प्रमाणित गरियो

### [v3.16.0] - २०२६-०२-०५

#### उत्पादन नाम अद्यावधिकहरू
**यस संस्करणले उत्पादन सन्दर्भहरूलाई हालको Microsoft ब्रान्डिङमा अद्यावधिक गर्दछ।**

#### परिवर्तनहरू
- **Microsoft Foundry → Microsoft Foundry**: सबै सन्दर्भ गैर-अनुवाद फाइलहरूमा अद्यावधिक गरियो
- **Azure AI Agent Service → Foundry Agents**: सेवा नाम हालको ब्रान्डिङको अनुरूप अद्यावधिक गरियो

#### फाइलहरू अद्यावधिक गरियो
- `README.md` - मुख्य कोर्स ल्यान्डिंग पेज
- `changelog.md` - संस्करण इतिहास
- `course-outline.md` - कोर्स संरचना
- `docs/chapter-02-ai-development/agents.md` - AI एजेन्ट्स गाइड
- `examples/README.md` - उदाहरण दस्तावेज
- `workshop/README.md` - कार्यशाला ल्यान्डिंग पेज
- `workshop/docs/index.md` - कार्यशाला सूची
- `workshop/docs/instructions/*.md` - सबै कार्यशाला निर्देशन फाइलहरू

---

### [v3.15.0] - २०२६-०२-०५

#### मुख्य रिपोजिटरी पुनर्संरचना: अध्याय-आधारित फोल्डर नामहरू
**यस संस्करणले स्पष्ट नेभिगेसनका लागि डकुमेन्टेसनलाई समर्पित अध्याय फोल्डरहरूमा पुनर्संरचना गर्दछ।**

#### फोल्डर नाम परिवर्तनहरू
पुराना फोल्डरहरू अध्याय-संख्या भएका फोल्डरहरूले प्रतिस्थापन गरिएका छन्:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- नयाँ थपियो: `docs/chapter-05-multi-agent/`

#### फाइल स्थानान्तरणहरू
| फाइल | बाट | तर्फ |
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

#### थपियो
- **📚 अध्याय README फाइलहरू**: प्रत्येक अध्याय फोल्डरमा README.md सिर्जना गरियो जसमा:
  - सिकाइ उद्देश्य र अवधि
  - पाठ तालिका विवरणसहित
  - छिटो सुरु कमाण्डहरू
  - अन्य अध्यायहरूमा नेभिगेसन

#### परिवर्तन गरियो
- **🔗 सबै भित्री लिंकहरू अपडेट गरियो**: सबै दस्तावेजीकरण फाइलहरूमा ७८+ पथहरू अपडेट गरियो
- **🗺️ मुख्य README.md**: नयाँ अध्याय संरचनासहित कोर्स नक्सा अपडेट गरियो
- **📝 examples/README.md**: अध्याय फोल्डरहरूमा क्रस-रेफरेन्सहरू अपडेट गरियो

#### हटाइयो
- पुरानो फोल्डर संरचना (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रिपोजिटोरी पुनर्संरचना: अध्याय नेभिगेसन
**यस संस्करणले अध्याय नेभिगेसन README फाइलहरू थप्यो (v3.15.0 द्वारा प्रतिस्थापित)।**

---

### [v3.13.0] - 2026-02-05

#### नयाँ AI एजेन्ट गाइड
**यस संस्करणले Azure Developer CLI को साथ AI एजेन्टहरुको परिनियोजनको लागि व्यापक गाइड थप्यो।**

#### थपियो
- **🤖 docs/microsoft-foundry/agents.md**: पूरा गाइड समेटेको:
  - AI एजेन्टहरू के हुन् र तिनीहरू च्याटबोट भन्दा कसरी फरक छन्
  - तीन छिटो सुरु एजेन्ट टेम्प्लेटहरू (Foundry Agents, Prompty, RAG)
  - एजेन्ट आर्किटेक्चर ढाँचाहरू (एकल एजेन्ट, RAG, बहु-एजेन्ट)
  - उपकरण कन्फिगरेसन र अनुकूलन
  - अनुगमन र मेट्रिक्स ट्र्याकिङ
  - लागत विचारहरू र अप्टिमाइजेशन
  - सामान्य समस्या समाधान परिदृश्यहरू
  - सफलताको मानदण्डसहित तीन व्यावहारिक अभ्यासहरू

#### सामग्री संरचना
- **परिचय**: सुरुवातीहरूको लागि एजेन्ट अवधारणा
- **छिटो सुरु**: `azd init --template get-started-with-ai-agents` द्वारा एजेन्टहरू तैनाथ गर्ने
- **आर्किटेक्चर ढाँचाहरू**: एजेन्ट ढाँचाहरूका दृश्यात्मक चित्रहरू
- **कन्फिगरेसन**: उपकरण सेटअप र वातावरण चरहरू
- **अनुगमन**: एप्लिकेशन इनसाइट्स एकीकरण
- **अभ्यासहरू**: प्रगतिशील व्यावहारिक सिकाइ (२०-४५ मिनेट प्रत्येक)

---

### [v3.12.0] - 2026-02-05

#### DevContainer वातावरण अपडेट
**यस संस्करणले AZD सिकाइ अनुभवका लागि आधुनिक उपकरणहरू र राम्रो पूर्वनिर्धारितहरूसहित विकास कन्टेनर कन्फिगरेसन अपडेट गर्दछ।**

#### परिवर्तन गरियो
- **🐳 बेस इमेज**: `python:3.12-bullseye` बाट `python:3.12-bookworm` (नवीनतम Debian स्थिर) मा अपडेट गरिएको
- **📛 कन्टेनर नाम**: स्पष्टताका लागि "Python 3" बाट "AZD for Beginners" मा नाम परिवर्तन गरिएको

#### थपियो
- **🔧 नयाँ Dev Container सुविधाहरू**:
  - Bicep समर्थन सहित `azure-cli`
  - AZD टेम्प्लेटहरूको लागि LTS संस्करण `node:20`
  - टेम्प्लेट व्यवस्थापनको लागि `github-cli`
  - कन्टेनर एप्लिकेसन तैनाथका लागि `docker-in-docker`

- **🔌 पोर्ट अग्रेषण**: सामान्य विकासका लागि पूर्व-कन्फिगर गरिएका पोर्टहरू:
  - ८००० (MkDocs पूर्वावलोकन)
  - ३००० (वेब एपहरू)
  - ५००० (Python Flask)
  - ८०८० (API हरू)

- **🧩 नयाँ VS Code एक्सटेन्सनहरू**:
  - `ms-python.vscode-pylance` - सुधारिएको Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - Bicep भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure स्रोत व्यवस्थापन
  - `yzhang.markdown-all-in-one` - Markdown सम्पादन
  - `DavidAnson.vscode-markdownlint` - Markdown लिन्टिङ
  - `bierner.markdown-mermaid` - Mermaid आरेख समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml का लागि)
  - `eamodio.gitlens` - Git दृश्यिकरण
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS Code सेटिङहरू**: Python इन्टरप्रेटर, सेभ गर्दा स्वरूपण, र सेतो ठाउँ काट्ने पूर्वनिर्धारित सेटिङहरू थपिएको

- **📦 requirements-dev.txt अपडेट गरिएको**:
  - MkDocs मिनिफाइ प्लगइन थपियो
  - कोड गुणस्तरका लागि pre-commit थपियो
  - Azure SDK प्याकेजहरू थपियो (azure-identity, azure-mgmt-resource)

#### सुधारियो
- **पोस्ट-क्रिएट कमाण्ड**: अब कन्टेनर सुरु हुँदा AZD र Azure CLI स्थापना जाँच गर्छ

---

### [v3.11.0] - 2026-02-05

#### सुरुकर्तामैत्री README पुनर्निर्माण
**यस संस्करणले README.md लाई सुरुकर्ताहरूका लागि धेरै पहुँचयोग्य बनायो र AI विकासकर्ताहरूका लागि आवश्यक स्रोतहरू थप्यो।**

#### थपियो
- **🆚 Azure CLI र AZD तुलना**: प्रयोग गर्ने समय स्पष्ट उदाहरणहरूसहित व्याख्या
- **🌟 उत्कृष्ट AZD लिंकहरू**: समुदाय टेम्प्लेट ग्यालरी र योगदान स्रोतहरूसँग प्रत्यक्ष लिंकहरू:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - २००+ तयार तैनाथ टेम्प्लेटहरू
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदायमा योगदान
- **🎯 छिटो सुरु गाइड**: सरल ३-चरण शुरूवात अनुभाग (स्थापना → लगइन → तैनाथ)
- **📊 अनुभव-आधारित नेभिगेसन तालिका**: विकासकर्ताको अनुभव आधारमा कहाँबाट सुरु गर्ने स्पष्ट मार्गदर्शन

#### परिवर्तन गरियो
- **README संरचना**: प्रगतिशील प्रकटीकरणका लागि पुन: व्यवस्थित - सबैभन्दा महत्वपूर्ण जानकारी पहिला
- **परिचय खण्ड**: सम्पूर्ण सुरुकर्ताहरूका लागि "The Magic of `azd up`" व्याख्या गरी पुनःलेखन गरियो
- **नक्कल सामग्री हटाइयो**: नक्कल समस्या समाधान खण्ड हटाइयो

- **समस्या समाधान आदेशहरू**: मान्य `azd monitor --logs` प्रयोग गर्न `azd logs` सन्दर्भ फिक्स गरियो

#### फिक्स गरिएको

- **🔐 प्रमाणीकरण आदेशहरू**: `azd auth login` र `azd auth logout` cheat-sheet.md मा थपियो
- **अवैध आदेश सन्दर्भहरू**: README troubleshooting खण्डबाट बाँकी `azd logs` हटाइयो

#### नोटहरू
- **क्षेत्र**: परिवर्तनहरू मुख्य README.md र resources/cheat-sheet.md मा लागू गरियो
- **लक्षित दर्शक**: सुधारहरू विशेष गरी AZD मा नयाँ विकासकर्ताहरूलाई लक्षित गरिएका छन्

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI आदेश सटीकता अपडेट
**यस संस्करणले सम्पूर्ण कागजातमा अवस्थित नभएका AZD आदेशहरू सुधार गर्दछ, सबै कोड उदाहरणहरूले मान्य Azure Developer CLI सिन्ट्याक्स मात्र प्रयोग गर्ने सुनिश्चित गर्दछ।**

#### सुधार गरियो
- **🔧 अवस्थित नभएका AZD आदेशहरू हटाइयो**: अवैध आदेशहरूको व्यापक लेखाजोखा र सुधार:
  - `azd logs` (अस्तित्वमा छैन) → `azd monitor --logs` वा Azure CLI विकल्पहरूले प्रतिस्थापन गरियो
  - `azd service` सबआदेशहरू (अस्तित्वमा छैन) → `azd show` र Azure CLI सँग प्रतिस्थापन गरियो
  - `azd infra import/export/validate` (अस्तित्वमा छैन) → हटाइयो वा मान्य विकल्पले प्रतिस्थापन गरियो
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` झण्डाहरू (अस्तित्वमा छैन) → हटाइयो
  - `azd provision --what-if/--rollback` झण्डाहरू (अस्तित्वमा छैन) → `--preview` प्रयोगमा परिमार्जन गरियो
  - `azd config validate` (अस्तित्वमा छैन) → `azd config list` सँग प्रतिस्थापन गरियो
  - `azd info`, `azd history`, `azd metrics` (अस्तित्वमा छैन) → हटाइयो

- **📚 आदेश सुधारसँग जोडिएका फाइलहरू अपडेट गरियो**:
  - `resources/cheat-sheet.md`: आदेश सन्दर्भमा ठूलो परिमार्जन
  - `docs/deployment/deployment-guide.md`: रोलन व्याक र परिनियोजन रणनीतिमा सुधार
  - `docs/troubleshooting/debugging.md`: लग विश्लेषण खण्डहरू सुधार गरियो
  - `docs/troubleshooting/common-issues.md`: ट्रबलसुटिंग आदेशहरू अपडेट गरियो
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिङ खण्ड सुधार
  - `docs/getting-started/azd-basics.md`: निगरानी आदेशहरू सुधार
  - `docs/getting-started/first-project.md`: निगरानी र डिबगिङ उदाहरणहरू अपडेट गरियो
  - `docs/getting-started/installation.md`: मद्दत र संस्करण उदाहरणहरू सुधार
  - `docs/pre-deployment/application-insights.md`: लग हेर्ने आदेशहरू सुधार
  - `docs/pre-deployment/coordination-patterns.md`: एजेन्ट डिबगिङ आदेशहरू सुधार

- **📝 संस्करण सन्दर्भ अपडेट भयो**: 
  - `docs/getting-started/installation.md`: हार्डकोड गरिएको `1.5.0` संस्करणलाई `1.x.x` सामान्य संस्करणमा परिवर्तन गरी रिलिजहरूमा लिंक थपियो

#### परिमार्जन गरियो
- **रोलन व्याक रणनीतिहरू**: प्रलेखनलाई Git-आधारित रोलब्याक प्रयोगमा परिमार्जित गरियो (AZD मा स्थानीय रोलब्याक छैन)
- **लग हेर्ने**: `azd logs` सन्दर्भहरू `azd monitor --logs`, `azd monitor --live`, र Azure CLI आदेशहरूमा प्रतिस्थापन गरियो
- **प्रदर्शन खण्ड**: अवस्थित नभएका समानान्तर/वृद्धि परिनियोजन झण्डाहरू हटाइयो, मान्य विकल्पहरू प्रदान गरियो

#### प्राविधिक विवरणहरू
- **मान्य AZD आदेशहरू**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **मान्य azd monitor झण्डाहरू**: `--live`, `--logs`, `--overview`
- **हटाइएका सुविधाहरू**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### नोटहरू
- **सत्यापन**: आदेशहरू Azure Developer CLI v1.23.x सँग प्रमाणित गरियो

---

### [v3.9.0] - 2026-02-05

#### कार्यशाला पूर्ति र कागजात गुणस्तर सुधार
**यस संस्करणले अन्तरक्रियात्मक कार्यशाला मोड्युलहरू पूरा गर्छ, सबै टुक्रिएका कागजात लिंकहरू ठीक गर्छ, र Microsoft AZD प्रयोग गर्ने AI विकासकर्ताहरूको लागि समग्र सामग्री गुणस्तर सुधार गर्दछ।**

#### थपियो
- **📝 CONTRIBUTING.md**: नयाँ योगदान दिशानिर्देश दस्तावेज संग:
  - समस्या रिपोर्ट गर्ने स्पष्ट निर्देशनहरू र परिवर्तन प्रस्ताव गर्न गाइड
  - नयाँ सामग्रीका लागि कागजात मानकहरू
  - कोड उदाहरण दिशानिर्देश र कमिट मेसेज कन्वेन्शनहरू
  - समुदाय सहभागिता जानकारी

#### पूरा गरियो
- **🎯 कार्यशाला मोड्युल 7 (Wrap-up)**: पूर्णरूपमा पूर्ण गरिएको समापन मोड्युल संग:
  - कार्यशालाका उपलब्धिहरूको व्यापक सारांश
  - AZD, टेम्प्लेटहरू, र Microsoft Foundry सम्बन्धी प्रमुख अवधारणाहरू
  - सिकाइ यात्रा निरन्तरता सिफारिसहरू
  - कार्यशाला चुनौती अभ्यासहरू जटिलता रेटिङ्स सहित
  - समुदाय प्रतिक्रिया र सहयोग लिंकहरू

- **📚 कार्यशाला मोड्युल 3 (Deconstruct)**: सिकाइ उद्देश्यहरू अपडेट गरियो:
  - GitHub Copilot सँग MCP सर्भरहरू सक्रिय गर्ने मार्गदर्शन
  - AZD टेम्प्लेट फोल्डर संरचना बुझ्न
  - Infrastructure-as-code (Bicep) संगठनात्मक नमुनाहरू
  - व्यावहारिक प्रयोगशाला निर्देशहरू

- **🔧 कार्यशाला मोड्युल 6 (Teardown)**: सम्पन्न गरियो संग:
  - स्रोत सफाई र लागत व्यवस्थापन उद्देश्यहरू
  - सुरक्षित पूर्वाधार समाप्तिका लागि `azd down` को प्रयोग
  - सफ्ट-डिलिटेड कग्निटिभ सेवाहरू पुन: प्राप्ति मार्गदर्शन
  - GitHub Copilot र Azure Portal का लागि बोनस अन्वेषण प्रेरणा

#### सुधार गरियो
- **🔗 टुटेका लिंक सुधारहरू**: १५+ भित्रका कागजात लिंकहरू ठीक गरियो:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md को पथहरू सुधार गरियो
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md र production-ai-practices.md पथहरू सुधार गरियो
  - `docs/getting-started/first-project.md`: अवस्थित नभएको cicd-integration.md लाई deployment-guide.md सँग प्रतिस्थापन गरियो
  - `examples/retail-scenario.md`: FAQ र troubleshooting guide का पथहरू सुधार गरियो
  - `examples/container-app/microservices/README.md`: कोर्स होम र deployment guide का पथहरू सुधार गरियो
  - `resources/faq.md` र `resources/glossary.md`: AI अध्याय सन्दर्भहरू अपडेट गरियो
  - `course-outline.md`: प्रशिक्षक गाइड र AI कार्यशाला प्रयोगशाला सन्दर्भहरू सुधार गरियो

- **📅 कार्यशाला स्थिति ब्यानर**: "निर्माणाधीन" बाट सक्रिय कार्यशाला स्थितिमा फेब्रुअरी २०२६ मिति सहित अपडेट गरियो

- **🔗 कार्यशाला नेभिगेसन**: कार्यशाला README.md मा अवस्थित नभएको lab-1-azd-basics फोल्डर तर्फका टुटेका नेभिगेसन लिंकहरू सुधार गरियो

#### परिमार्जन गरियो
- **कार्यशाला प्रस्तुति**: "निर्माणाधीन" चेतावनी हटाइयो, कार्यशाला अब पूर्ण भयो र प्रयोगका लागि तयार छ
- **नेभिगेसन निरन्तरता**: सबै कार्यशाला मोड्युलहरूमा उपयुक्त अन्तर-मोड्युल नेभिगेसन सुनिश्चित गरियो
- **सिकाइ मार्ग सन्दर्भहरू**: अध्यायको माइक्रोसफ्ट फाउन्ड्री पथहरू सही गरी अद्यावधिक गरियो

#### प्रमाणित गरिएको
- ✅ सबै अंग्रेजी मार्कडाउन फाइलहरूमा वैध आन्तरिक लिंकहरू छन्
- ✅ कार्यशाला मोड्युल ०-७ पूर्ण सिकाइ उद्देश्यहरूसँग छन्
- ✅ अध्याय र मोड्युलहरू बीचमा नेभिगेसन सही छ
- ✅ सामग्री Microsoft AZD प्रयोग गर्ने AI विकासकर्ताहरूका लागि उपयुक्त छ
- ✅ सुरुवाती भाषाशैली र संरचना सम्पूर्णमा कायम राखियो
- ✅ CONTRIBUTING.md ले समुदाय योगदानकर्ताहरूका लागि स्पष्ट मार्गदर्शन प्रदान गर्छ

#### प्राविधिक कार्यान्वयन
- **लिंक सत्यापन**: स्वचालित PowerShell स्क्रिप्टले सबै .md आन्तरिक लिंकहरू प्रमाणित गर्यो
- **सामग्री लेखाजोखा**: कार्यशालाको पूर्णता र सुरुवात अनुकूलतालाई म्यानुअल जाँच गरियो
- **नेभिगेसन प्रणाली**: अध्याय र मोड्युल नेभिगेसन ढाँचा एकरूप रूपमा लागू गरियो

#### नोटहरू
- **क्षेत्र**: परिवर्तनहरू अंग्रेजी कागजातहरूमा मात्र लागू गरियो
- **अनुवादहरू**: यस संस्करणमा अनुवाद फोल्डरहरू अपडेट भएनन् (स्वचालित अनुवाद पछि समक्रमण हुनेछ)
- **कार्यशाला अवधि**: पूर्ण कार्यशालाले अब ३-४ घण्टा प्रयोगशाला सिकाइ प्रदान गर्दछ

---

### [v3.8.0] - 2025-11-19

#### उन्नत कागजातः निगरानी, सुरक्षा, र बहु-एजेन्ट नमूनाहरू
**यस संस्करणले Application Insights एकीकरण, प्रमाणीकरण नमूनाहरू, र उत्पादन परिनियोजनका लागि बहु-एजेन्ट समन्वयमा व्यापक A-ग्रेड पाठहरू थपेको छ।**

#### थपियो
- **📊 Application Insights एकीकरण पाठ**: `docs/pre-deployment/application-insights.md` मा:
  - AZD-केन्द्रित परिनियोजन स्वचालित प्रावधानसहित
  - Application Insights + Log Analytics का पूर्ण Bicep टेम्प्लेटहरू
  - कस्टम टेलेमेट्री सहित कार्यरत Python अनुप्रयोगहरू (१२००+ लाइनहरू)
  - AI/LLM निगरानी नमूनाहरू (Microsoft Foundry मोडेलहरूको टोकन/लागत ट्र्याकिङ)
  - ६ Mermaid आलेखहरू (वास्तुकला, वितरण ट्रेसिङ, टेलेमेट्री प्रवाह)
  - ३ व्यावहारिक अभ्यासहरू (अलर्ट, ड्यासबोर्ड, AI निगरानी)
  - कुस्टो प्रश्न उदाहरणहरू र लागत अनुकूलन रणनीतिहरू
  - लाइभ मेट्रिक्स स्ट्रिमिङ र वास्तविक-समय डिबगिङ
  - ४०-५० मिनेट सिकाइ समय पार उत्पादन नमूनाहरू सहित

- **🔐 प्रमाणीकरण र सुरक्षा नमूनाहरू पाठ**: `docs/getting-started/authsecurity.md` मा:
  - ३ प्रमाणीकरण नमूनाहरू (कनेक्शन स्ट्रिङहरू, Key Vault, प्रबन्धित पहिचान)
  - सुरक्षित परिनियोजनको लागि पूर्ण Bicep पूर्वाधार टेम्प्लेटहरू
  - Azure SDK एकीकरण गरिएको Node.js अनुप्रयोग कोड
  - ३ पूर्ण अभ्यासहरू (प्रबन्धित पहिचान सक्षम गर्ने, प्रयोगकर्ता-पठाइएको पहिचान, Key Vault रोटेशन)
  - सुरक्षा उत्तम अभ्यासहरू र RBAC कन्फिगरेसनहरू
  - समस्या समाधान मार्गदर्शन र लागत विश्लेषण
  - उत्पादन-तैयार पासवर्ड-रहित प्रमाणीकरण नमूनाहरू

- **🤖 बहु-एजेन्ट समन्वय नमूनाहरू पाठ**: `docs/pre-deployment/coordination-patterns.md` मा:
  - ५ समन्वय नमूनाहरू (क्रमागत, समानान्तर, पदानुक्रमिक, घटना-चालित, सहमति)
  - पूर्ण कार्यकुशलता सेवा कार्यान्वयन (Python/Flask, १५००+ लाइनहरू)
  - ३ विशेष एजेन्ट कार्यान्वयनहरू (अनुसन्धान, लेखक, सम्पादक)
  - सन्देश कतारका लागि सेवा बस एकीकरण
  - वितरण प्रणालीहरूका लागि Cosmos DB राज्य व्यवस्थापन
  - एजेन्ट अन्तरक्रियाहरू देखाउने ६ Mermaid आलेखहरू
  - ३ उन्नत अभ्यासहरू (समय सीमा ह्यान्डल, पुनः प्रयास तर्क, सर्किट ब्रेकर)
  - लागत वितरण ($२४०-५६५/महिना) र अनुकूलन रणनीतिहरू सहित
  - निगरानीको लागि Application Insights एकीकरण

#### सुधार गरियो
- **पूर्व-परिनियोजन अध्याय**: अब व्यापक निगरानी र समन्वय नमूनाहरू समावेश गर्दछ
- **सुरूवात अध्याय**: व्यावसायिक प्रमाणीकरण नमूनाहरूले समृद्ध
- **उत्पादन तयारी**: सुरक्षा देखि अवलोकनसम्म पूर्ण समेटिएको
- **कोर्स रूपरेखा**: अध्याय ३ र ६ का नयाँ पाठहरू सन्दर्भित गर्दै अपडेट गरिएको

#### परिमार्जन गरियो
- **सिकाइ प्रगति**: सिकाइक्रम भित्र सुरक्षा र निगरानी राम्रोसँग एकीकृत गरियो
- **कागजात गुणस्तर**: नयाँ पाठहरूमा समान रुपमा A-ग्रेड मापदण्ड (९५-९७%)
- **उत्पादन नमूनाहरू**: उद्यम परिनियोजनको लागि पूर्ण अन्त-देखि-अन्त कवरेज

#### सुधार गरियो
- **डेभलपर अनुभव**: विकासदेखि उत्पादन निगरानी सम्म स्पष्ट मार्ग
- **सुरक्षा मापदण्डहरू**: प्रमाणीकरण र गोप्य व्यवस्थापनका लागि व्यावसायिक नमूनाहरू
- **अवलोकनीयता**: AZD सँग पूर्ण Application Insights एकीकरण
- **AI कार्यभारहरू**: Microsoft Foundry मोडेलहरू र बहु-एजेन्ट प्रणालीहरूको लागि विशेष निगरानी

#### प्रमाणित गरिएको
- ✅ सबै पाठहरू पूर्ण कार्यरत कोड (टुक्राहरू होइन) समावेश गर्दछन्
- ✅ दृश्य सिकाइका लागि १९ वटा Mermaid आलेखहरू (३ पाठहरूमा)
- ✅ ९ वटा व्यावहारिक अभ्यासहरू प्रमाणित चरणहरूसहित
- ✅ `azd up` मार्फत परिनियोजन गर्न सकिने उत्पादन-तयार Bicep टेम्प्लेटहरू
- ✅ लागत विश्लेषण र अनुकूलन रणनीतिहरू
- ✅ समस्या समाधान मार्गदर्शन र उत्तम अभ्यासहरू
- ✅ ज्ञान परीक्षणहरू सँग प्रमाणिकरण आदेशहरू

#### कागजात ग्रेडिङ परिणामहरू
- **docs/pre-deployment/application-insights.md**: - व्यापक निगरानी मार्गदर्शन
- **docs/getting-started/authsecurity.md**: - व्यावसायिक सुरक्षा नमूनाहरू
- **docs/pre-deployment/coordination-patterns.md**: - उन्नत बहु-एजेन्ट वास्तुकलाहरू
- **समग्र नयाँ सामग्री**: - समान उच्च गुणस्तर मापदण्डहरू

#### प्राविधिक कार्यान्वयन
- **Application Insights**: Log Analytics + कस्टम टेलेमेट्री + वितरण ट्रेसिङ
- **प्रमाणीकरण**: प्रबन्धित पहिचान + Key Vault + RBAC नमूनाहरू
- **बहु-एजेन्ट**: सेवा बस + Cosmos DB + कन्टेनर एप्स + आयोजक
- **निगरानी**: लाइभ मेट्रिक्स + कुस्टो क्वेरीहरू + अलर्ट + ड्यासबोर्डहरू
- **लागत व्यवस्थापन**: नमुना रणनीतिहरू, अवधारण नीतिहरू, बजेट नियन्त्रणहरू

### [v3.7.0] - 2025-11-19

#### कागजात गुणस्तर सुधार र नयाँ Microsoft Foundry मोडेल उदाहरण
**यस संस्करणले रिपोजिटोरीभरि कागजात गुणस्तर सुधार गर्दछ र gpt-4.1 चैट इन्टरफेस सहित पूर्ण Microsoft Foundry मोडेल परिनियोजन उदाहरण थप्दछ।**

#### थपियो
- **🤖 Microsoft Foundry मोडेल चैट उदाहरण**: पूर्ण gpt-4.1 परिनियोजन `examples/azure-openai-chat/` मा कार्यान्वयनसहित:
  - पूर्ण Microsoft Foundry मोडेल पूर्वाधार (gpt-4.1 मोडेल परिनियोजन)
  - संवाद इतिहास सहित Python कमाण्ड-लाइन चैट इन्टरफेस
  - सुरक्षित API कुञ्जी भण्डारणका लागि Key Vault एकीकरण
  - टोकन प्रयोग ट्र्याकिङ र लागत अनुमान
  - दर सीमितकरण र त्रुटि ह्यान्डलिङ
  - ३५-४५ मिनेट परिनियोजन मार्गदर्शन सहित व्यापक README
  - ११ उत्पादन-तयार फाइलहरू (Bicep टेम्प्लेटहरू, Python अनुप्रयोग, कन्फिगरेसन)
- **📚 कागजात अभ्यासहरू**: कन्फिगरेसन मार्गदर्शकमा व्यावहारिक अभ्यासहरू थपियो:
  - अभ्यास १: बहु-पर्यावरण कन्फिगरेसन (१५ मिनेट)
  - अभ्यास २: गोप्य व्यवस्थापन अभ्यास (१० मिनेट)
  - स्पष्ट सफलता मापदण्ड र प्रमाणिकरण चरणहरू
- **✅ परिनियोजन सत्यापन**: परिनियोजन मार्गदर्शकमा सत्यापन खण्ड थपियो:
  - स्वास्थ्य परीक्षण प्रक्रिया
  - सफलता मापदण्ड सूची
  - सबै परिनियोजन आदेशहरूको अपेक्षित आउटपुटहरू
  - समस्या समाधान छिटो सन्दर्भ

#### सुधार गरियो
- **examples/README.md**: A-ग्रेड गुणस्तरमा अपडेट गरियो (९३%):
  - सबै सम्बन्धित खण्डहरूमा azure-openai-chat थपियो
  - स्थानीय उदाहरण संख्या ३ बाट ४ मा अपडेट गरियो
  - AI अनुप्रयोग उदाहरण तालिकामा थपियो
  - मध्यवर्ती प्रयोगकर्ताका लागि त्वरित सुरूवातमा समावेश गरियो
  - Microsoft Foundry टेम्प्लेट सेक्सनमा थपियो
  - तुलना म्याट्रिक्स र प्रविधि फेला पार्ने खण्डहरू अपडेट गरियो
- **कागजात गुणस्तर**: docs फोल्डरहरूमा B+ (८७%) बाट A- (९२%) सम्म सुधार गरियो

  - महत्वपूर्ण कमाण्डका उदाहरणहरूमा अपेक्षित आउटपुटहरू थपियो
  - कन्फिगरेसन परिवर्तनहरूको प्रमाणीकरण चरणहरू समावेश गरियो
  - व्यावहारिक अभ्यासहरूसँग हातमा सिकाइलाई सुधार गरियो

#### परिवर्तनहरू
- **सिकाइ प्रगति**: मध्यम स्तरका सिक्नेहरूको लागि AI उदाहरणहरूको राम्रो एकीकरण
- **डकुमेन्टेशन संरचना**: स्पष्ट परिणामहरू सहित थप व्यवहार्य अभ्यासहरू
- **प्रमाणीकरण प्रक्रिया**: मुख्य कार्यप्रवाहहरूमा स्पष्ट सफलता मापदण्ड थपियो

#### सुधारिएको
- **डेभलपर अनुभव**: Microsoft Foundry मोडेलहरूको परिनियोजन अब ३५-४५ मिनेट लिन्छ (कठिन विकल्पहरूको तुलनामा ६०-९० मिनेट)
- **लागत पारदर्शिता**: Microsoft Foundry मोडेल उदाहरणको लागि स्पष्ट लागत अनुमान ($५०-२००/महिना)
- **सिकाइ मार्ग**: AI विकासकर्ताहरूका लागि azure-openai-chat बाट स्पष्ट प्रवेश बिन्दु
- **डकुमेन्टेशन मापदण्डहरू**: अपेक्षित आउटपुट र प्रमाणीकरण चरणहरू सुसंगत

#### प्रमाणित
- ✅ Microsoft Foundry मोडेल उदाहरण `azd up` सँग पूर्ण-functional छ
- ✅ सबै ११ कार्यान्वयन फाइलहरू व्याकरणगत रूपमा सही
- ✅ README निर्देशनहरू वास्तविक परिनियोजन अनुभवसँग मेल खान्छ
- ✅ डकुमेन्टेशन लिंकहरू ८+ स्थानहरूमा अपडेट गरिएको
- ✅ उदाहरणहरूको सूचीले ४ स्थानीय उदाहरणहरू ठीक प्रतिनिधित्व गर्छ
- ✅ तालिकाहरूमा कुनै नक्कली बाह्य लिंक छैन
- ✅ सबै नेभिगेसन रिफरेन्सहरू सही

#### प्राविधिक कार्यान्वयन
- **Microsoft Foundry मोडेल आर्किटेक्चर**: gpt-4.1 + Key Vault + Container Apps ढाँचा
- **सुरक्षा**: Managed Identity तयार, Key Vault मा गोप्य जानकारीहरू
- **मोनिटरिङ**: Application Insights एकीकरण
- **लागत व्यवस्थापन**: टोकन ट्र्याकिङ र प्रयोग करी महारथ
- **परिनियोजन**: पूर्ण सेटअपका लागि एकल `azd up` कमाण्ड

### [v3.6.0] - २०२५-११-१९

#### मुख्य अपडेट: Container App परिनियोजन उदाहरणहरू
**यो संस्करणले Azure Developer CLI (AZD) प्रयोग गरेर व्यापक, उत्पादन-तयार कन्टेनर अनुप्रयोग परिनियोजन उदाहरणहरू प्रस्तुत गर्दछ, पूर्ण डकुमेन्टेशन र सिकाइ मार्गमा समावेश सहित।**

#### थपियो
- **🚀 Container App उदाहरणहरू**: `examples/container-app/` मा नयाँ स्थानीय उदाहरणहरू:
  - [मास्टर गाइड](examples/container-app/README.md): कन्टेनराइज्ड परिनियोजनहरूको पूर्ण अवलोकन, छिटो सुरु, उत्पादन, र उन्नत ढाँचाहरू
  - [साधारण Flask API](../../examples/container-app/simple-flask-api): प्रारम्भिक-मैत्री REST API स्केल-टु-शून्य, हेल्थ प्रोब, मोनिटरिङ, र समस्याहरू समाधान
  - [माइक्रोसर्भिस आर्किटेक्चर](../../examples/container-app/microservices): उत्पादन-तयार बहु-सेवा परिनियोजन (API Gateway, Product, Order, User, Notification), एसिंक्रोनस मेसेजिङ, Service Bus, Cosmos DB, Azure SQL, वितरण ट्रेसिङ, ब्लू-ग्रीन/क्यानरी परिनियोजन
- **सर्वोत्कृष्ट अभ्यासहरू**: सुरक्षा, मोनिटरिङ, लागत अनुकूलन, र контейनरीकृत कार्यभारहरूको लागि CI/CD मार्गनिर्देशन
- **कोड नमूनाहरू**: पूर्ण `azure.yaml`, Bicep टेम्प्लेटहरू, र बहु-भाषा सेवा कार्यान्वयनहरू (Python, Node.js, C#, Go)
- **परीक्षण र समस्या समाधान**: अन्तदेखि अन्त परीक्षण परिदृश्यहरू, मोनिटरिङ कमाण्डहरू, समस्या समाधान मार्गनिर्देशन

#### परिवर्तनहरू
- **README.md**: "स्थानीय उदाहरणहरू - Container Applications" अन्तर्गत नयाँ कन्टेनर एप उदाहरणहरू फीचर र लिंक अपडेट गरियो
- **examples/README.md**: कन्टेनर एप उदाहरणहरूलाई हाइलाइट गर्न अप्डेट गरिएको, तुलना म्याट्रिक्स प्रविष्टिहरू थपियो, र टेक्नोलोजी/आर्किटेक्चर सन्दर्भहरू अपडेट गरियो
- **कोर्स आउटलाइन्ड र अध्ययन गाइड**: सम्बन्धित अध्यायहरूमा नयाँ कन्टेनर एप उदाहरणहरू र परिनियोजन ढाँचाहरू उल्लेख गरिएको

#### प्रमाणित
- ✅ सबै नयाँ उदाहरणहरू `azd up` सँग परिनियोजन योग्य र सर्वश्रेष्ठ अभ्यासहरू पालना गर्छन्
- ✅ डकुमेन्टेशन अन्तर-लिंकहरू र नेभिगेसन अपडेट गरिएको
- ✅ उदाहरणहरूले शुरुआतीदेखि उन्नत परिदृश्यहरू समेट्छ, जसमा उत्पादन माइक्रोसर्भिसहरू पनि छन्

#### नोटहरू
- **क्षेत्र**: इंग्रेजी डकुमेन्टेशन र उदाहरणहरू मात्र
- **अगाडिका कदमहरू**: भविष्यका संस्करणहरूमा थप उन्नत कन्टेनर ढाँचाहरू र CI/CD स्वचालन सहित विस्तार गर्नुहोस्

### [v3.5.0] - २०२५-११-१९

#### उत्पादन ब्राण्ड परिवर्तन: Microsoft Foundry
**यो संस्करणले "Microsoft Foundry" को लागि सबै अंग्रेजी डकुमेन्टेशनमा व्यापक उत्पादन नाम परिवर्तन लागू गर्दछ, Microsoft को आधिकारिक ब्राण्ड परिवर्तनको प्रतिबिम्ब।**

#### परिवर्तनहरू
- **🔄 उत्पादन नाम अपडेट**: "Microsoft Foundry" बाट "Microsoft Foundry" सम्म पूर्ण ब्राण्ड परिवर्तन
  - `docs/` फोल्डरमा सबै इंग्रेजी डकुमेन्टेशनमा सन्दर्भहरू अपडेट गरियो
  - फोल्डर नाम परिवर्तन: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - फाइल नाम परिवर्तन: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - कुल: ७ डकुमेन्टेशन फाइलहरूमा २३ सन्दर्भहरू अपडेट

- **📁 फोल्डर संरचना परिवर्तनहरू**:
  - `docs/ai-foundry/` लाई `docs/microsoft-foundry/` मा नाम परिवर्तन
  - सबै क्रस-रिफरेन्सहरू नयाँ फोल्डर संरचनालाई प्रतिबिम्बित गर्न अपडेट गरियो
  - सबै डकुमेन्टेशनमा नेभिगेसन लिंकहरू प्रमाणीकरण गरियो

- **📄 फाइल नाम परिवर्तनहरू**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - सबै आन्तरिक लिंकहरू नयाँ फाइल नाम सन्दर्भ गर्न अपडेट गरियो

#### अपडेट गरिएका फाइलहरू
- **अध्याय डकुमेन्टेशन** (७ फाइलहरू):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ३ नेभिगेसन लिंक अपडेट
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ४ उत्पादन नाम सन्दर्भ अपडेट
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पहिले नै Microsoft Foundry प्रयोगमा छ (पहिलेका अपडेटहरूबाट)
  - `docs/microsoft-foundry/production-ai-practices.md` - ३ सन्दर्भहरू अपडेट (सारांश, समुदाय प्रतिक्रिया, डकुमेन्टेशन)
  - `docs/getting-started/azd-basics.md` - ४ क्रस-रिफरेन्स लिंक अपडेट
  - `docs/getting-started/first-project.md` - २ अध्याय नेभिगेसन लिंक अपडेट
  - `docs/getting-started/installation.md` - २ अर्को अध्याय लिंक अपडेट
  - `docs/troubleshooting/ai-troubleshooting.md` - ३ सन्दर्भ अपडेट (नेभिगेसन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - १ नेभिगेसन लिंक अपडेट
  - `docs/troubleshooting/debugging.md` - १ नेभिगेसन लिंक अपडेट

- **कोर्स संरचना फाइलहरू** (२ फाइलहरू):
  - `README.md` - १७ सन्दर्भ अपडेट (कोर्स अवलोकन, अध्याय शीर्षकहरू, टेम्प्लेट खण्ड, सामुदायिक धारणा)
  - `course-outline.md` - १४ सन्दर्भ अपडेट (अवलोकन, सिकाइ उद्देश्यहरू, अध्याय स्रोतहरू)

#### प्रमाणित
- ✅ अंग्रेजी डकुमेन्टमा "ai-foundry" फोल्डर पथ सन्दर्भहरू अझै बाँकी छैनन्
- ✅ अंग्रेजी डकुमेन्टमा "Microsoft Foundry" उत्पादन नाम सन्दर्भहरू बाँकी छैनन्
- ✅ सबै नेभिगेसन लिंक नयाँ फोल्डर संरचनासँग काम गर्छन्
- ✅ फाइल र फोल्डर नाम परिवर्तन सफलतापूर्वक सम्पन्न
- ✅ अध्यायहरूबीच क्रस-रिफरेन्सहरू प्रमाणीकरण गरियो

#### नोटहरू
- **क्षेत्र**: परिवर्तनहरू केवल `docs/` फोल्डरमा अंग्रेजी डकुमेन्टेशनमा लागू
- **अनुवादहरू**: यस संस्करणमा अनुवाद फोल्डरहरू (`translations/`) अपडेट गरिएको छैन
- **वर्कशप**: यस संस्करणमा वर्कशप सामग्रीहरू (`workshop/`) अपडेट गरिएको छैन
- **उदाहरणहरू**: उदाहरण फाइलहरू अझै पुराना नामकरण सन्दर्भ गर्न सक्छन् (भविष्य अपडेटमा सम्बोधन गरिने)
- **बाह्य लिंकहरू**: बाह्य URL र GitHub रिपोजिटरी सन्दर्भहरू अपरिवर्तित छन्

#### योगदानकर्ताहरूका लागि माइग्रेशन गाइड
यदि तपाईंसँग पुरानो संरचना सन्दर्भ गर्दै स्थानीय ब्रान्चहरू वा डकुमेन्टेशन छ भने:
1. फोल्डर सन्दर्भहरू अपडेट गर्नुहोस्: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फाइल सन्दर्भहरू अपडेट गर्नुहोस्: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पादन नाम प्रतिस्थापन गर्नुहोस्: "Microsoft Foundry" → "Microsoft Foundry"
4. सबै आन्तरिक डकुमेन्ट लिंकहरू अझै काम गर्छन् भनी प्रमाणीकरण गर्नुहोस्

---

### [v3.4.0] - २०२५-१०-२४

#### पूर्वावलोकन र प्रमाणीकरणमा सुधार
**यो संस्करणले नयाँ Azure Developer CLI पूर्वावलोकन सुविधा र वर्कशप प्रयोगकर्ता अनुभवमा व्यापक समर्थन थप्छ।**

#### थपियो
- **🧪 azd provision --preview सुविधा डकुमेन्टेशन**: नयाँ पूर्वावलोकन पूर्वाधिकारको व्यापक कभर
  - कमाण्ड सन्दर्भ र प्रयोग उदाहरणहरू छिटो शीटमा
  - व्यवस्थापन मार्गदर्शिकामा विस्तृत एकीकरण र फाइदाहरू
  - सुरक्षित परिनियोजन प्रमाणीकरणका लागि प्रि-फ्लाइट चेक
  - सुरक्षात्मक परिनियोजन अभ्यासहरूसँग शुरुवात गाइड अपडेटहरू
- **🚧 वर्कशप स्थिति ब्यानेर**: वर्कशप विकास अवस्थाको व्यावसायिक HTML ब्यानेर
  - स्पष्ट प्रयोगकर्ता सञ्चारका लागि ग्रेडियेन्ट डिजाइन र निर्माण सूचकहरू
  - पारदर्शिताको लागि अन्तिम अपडेट मिति
  - सबै उपकरण प्रकारहरूका लागि मोबाइल-उत्तरदायी डिजाइन

#### सुधार गरियो
- **पूर्वाधिकार सुरक्षा**: परिनियोजन डकुमेन्टेशनमा पूर्वावलोकन कार्यक्षमता एकीकृत
- **पूर्व-परिनियोजन प्रमाणीकरण**: स्वचालित स्क्रिप्टहरूले अब पूर्वावलोकन परीक्षण समावेश गर्छ
- **डेभलपर कार्यप्रवाह**: सर्वोत्तम अभ्यासको रूपमा पूर्वावलोकन समावेश गरी कमाण्ड क्रम अपडेट
- **वर्कशप अनुभव**: सामग्री विकास अवस्थाबारे प्रयोगकर्ताहरुलाई स्पष्ट अपेक्षा सेट

#### परिवर्तनहरू
- **परिनियोजन सर्वोत्तम अभ्यास**: पूर्वावलोकन-प्रथम कार्यप्रवाह अब सिफारिस गरिएको अपरोध
- **डकुमेन्टेशन प्रवाह**: सिकाइ प्रक्रियामा पूर्वावलोकन प्रमाणीकरण पहिले सारिएको
- **वर्कशप प्रस्तुति**: विकास समयरेखा स्पष्ट गर्दै व्यावसायिक स्थिति सञ्चार

#### सुधारिएको
- **सुरक्षा-प्रथम दृष्टिकोण**: परिनियोजन अघि पूर्वावलोकन प्रमाणीकरण गर्न सकिन्छ
- **टोली सहकार्य**: समीक्षा र अनुमोदनका लागि पूर्वावलोकन नतिजाहरू साझेदारी गर्न सकिन्छ
- **लागत जागरूकता**: पूर्वाधिकार अघि स्रोत लागतको राम्रो बुझाइ
- **जोखिम न्यूनीकरण**: अग्रीम प्रमाणीकरणले परिनियोजन असफलताहरू घटायो

#### प्राविधिक कार्यान्वयन
- **बहु-डकुमेन्ट एकीकरण**: चार महत्वपूर्ण फाइलहरूमा पूर्वावलोकन सुविधा डकुमेन्टेड
- **कमाण्ड ढाँचा**: डकुमेन्टेशनभर सुसंगत सिन्ट्याक्स र उदाहरणहरू
- **सर्वोत्तम अभ्यास एकीकरण**: प्रमाणीकरण कार्यप्रवाह र स्क्रिप्टहरूमा पूर्वावलोकन समावेश
- **दृश्य सूचकहरू**: नयाँ सुविधा पत्ता लगाउन स्पष्ट मार्किङहरू

#### वर्कशप पूर्वाधिकार
- **स्थिति सञ्चार**: ग्रेडियेन्ट शैलीसहित व्यावसायिक HTML ब्यानेर
- **प्रयोगकर्ता अनुभव**: स्पष्ट विकास अवस्थाले भ्रम रोक्छ
- **व्यावसायिक प्रस्तुति**: अपेक्षा सेट गर्दै रिपोजिटरी विश्वसनीयता कायम राख्छ
- **समयरेखा पारदर्शिता**: अक्टूबर २०२५ अन्तिम अपडेट मिति जवाफदेहिताका लागि

### [v3.3.0] - २०२५-०९-२४

#### सुधारिएको वर्कशप सामग्री र अन्तरक्रियात्मक सिकाइ अनुभव
**यो संस्करणले ब्राउजरमा आधारित अन्तरक्रियात्मक मार्गदर्शकहरू र संरचित सिकाइ मार्गहरू सहित व्यापक वर्कशप सामग्रीहरू प्रस्तुत गर्दछ।**

#### थपियो
- **🎥 अन्तरक्रियात्मक वर्कशप गाइड**: MkDocs पूर्वावलोकन क्षमताका साथ ब्राउजरमा आधारित वर्कशप अनुभव
- **📝 संरचित वर्कशप निर्देशनहरू**: खोजदेखि अनुकूलनसम्म ७ चरणको निर्देशनात्मक सिकाइ मार्ग
  - ०-परिचय: वर्कशप अवलोकन र सेटअप
  - १-AI टेम्प्लेट चयन: टेम्प्लेट खोज र छनोट प्रक्रिया
  - २-AI टेम्प्लेट प्रमाणीकरण: परिनियोजन र प्रमाणीकरण प्रक्रिया
  - ३-AI टेम्प्लेट विखण्डन: टेम्प्लेट आर्किटेक्चर बुझ्ने
  - ४-AI टेम्प्लेट कन्फिगर: कन्फिगरेसन र अनुकूलन
  - ५-AI टेम्प्लेट अनुकूलन: उन्नत संशोधनहरू र पुनरावृत्ति
  - ६-पूर्वाधिकार भत्काउने: सफा गर्ने र स्रोत व्यवस्थापन
  - ७-समापन: सारांश र आगामी कदमहरू
- **🛠️ वर्कशप उपकरण**: सुधारिएको सिकाइ अनुभवका लागि Material थिम सहित MkDocs कन्फिगरेसन
- **🎯 हातमा सिकाइ मार्ग**: ३ चरण पद्धति (खोज → परिनियोजन → अनुकूलन)
- **📱 GitHub Codespaces एकीकरण**: सहज विकास वातावरण सेटअप

#### सुधार गरियो
- **AI वर्कशप ल्याब**: व्यापक २-३ घण्टाको संरचित सिकाइ अनुभव विस्तार
- **वर्कशप डकुमेन्टेशन**: नेभिगेसन र दृश्य सहायता सहित व्यावसायिक प्रस्तुति
- **सिकाइ प्रगति**: टेम्प्लेट छनोटदेखि उत्पादन परिनियोजनसम्म स्पष्ट चरण-द्वारा-चरण मार्गदर्शन
- **डेभलपर अनुभव**: प्रवाह-सरल विकास कार्यप्रवाहहरूको लागि समायोजन उपकरण

#### सुधारिएको
- **पहुँचयोग्यता**: खोज, प्रतिलिपि गर्ने सुविधा, र थीम परिवर्तन सहित ब्राउजर-आधारित इन्टरफेस
- **आत्म–गति सिकाइ**: फरक सिकाइ गतिहरू समायोजन गर्ने लचिलो वर्कशप संरचना
- **व्यावहारिक प्रयोग**: वास्तविक-विश्व AI टेम्प्लेट परिनियोजन परिदृश्यहरू
- **समुदाय एकीकरण**: वर्कशप समर्थन र सहकार्यका लागि Discord एकीकरण

#### वर्कशप फिचरहरू
- **अन्तर्निहित खोज**: छिटो कुञ्जीशब्द र पाठ खोज
- **कोड ब्लक प्रतिलिपि गर्ने**: सबै कोड उदाहरणहरूमा होभर-टु-कपी सुविधा
- **थीम टगल**: फरक रुचिहरूका लागि डार्क/लाईट मोड समर्थन
- **दृश्य सामग्रीहरू**: बुझाइ सुधार गर्न स्क्रिनशटहरू र चित्रहरू
- **मद्दत एकीकरण**: समुदाय समर्थनका लागि सिधा Discord पहुँच

### [v3.2.0] - २०२५-०९-१७

#### ठूलो नेभिगेसन पुनर्संरचना र अध्याय-आधारित सिकाइ प्रणाली
**यो संस्करणले सम्पूर्ण रिपोजिटरीभरि सुधारिएको नेभिगेसन सहित व्यापक अध्याय-आधारित सिकाइ संरचना प्रस्तुत गर्दछ।**

#### थपियो
- **📚 अध्याय-आधारित सिकाइ प्रणाली**: सम्पूर्ण कोर्सलाई ८ प्रगतिशील सिकाइ अध्यायहरूमा पुनर्संरचना
  - अध्याय १: आधार र छिटो सुरु (⭐ - ३०-४५ मिनेट)
  - अध्याय २: AI-प्रथम विकास (⭐⭐ - १-२ घण्टा)
  - अध्याय ३: कन्फिगरेसन र प्रमाणीकरण (⭐⭐ - ४५-६० मिनेट)
  - अध्याय ४: इन्फ्रास्ट्रक्चर एस कोड र परिनियोजन (⭐⭐⭐ - १-१.५ घण्टा)
  - अध्याय ५: बहु-एजेन्ट AI समाधानहरू (⭐⭐⭐⭐ - २-३ घण्टा)
  - अध्याय ६: पूर्व-परिनियोजन प्रमाणीकरण र योजना (⭐⭐ - १ घण्टा)
  - अध्याय ७: समस्या समाधान र डीबगिङ (⭐⭐ - १-१.५ घण्टा)
  - अध्याय ८: उत्पादन र उद्यम ढाँचाहरू (⭐⭐⭐⭐ - २-३ घण्टा)
- **📚 व्यापक नेभिगेसन प्रणाली**: सबै डकुमेन्टेशनमा सुसंगत नेभिगेसन हेडर र फुटरहरू
- **🎯 प्रगति ट्र्याकिङ**: कोर्स पूरा जाँचसूची र सिकाइ प्रमाणीकरण प्रणाली
- **🗺️ सिकाइ मार्गदर्शन**: विभिन्न अनुभव स्तर र लक्ष्यहरूको लागि स्पष्ट प्रवेश बिन्दुहरू
- **🔗 क्रस-रिफरेन्स नेभिगेसन**: सम्बन्धित अध्यायहरू र पूर्वापेक्षाहरू स्पष्ट लिंक गरिएका

#### सुधार गरियो
- **README संरचना**: अध्याय-आधारित संगठनसहित संरचित सिकाइ प्लेटफर्ममा रूपान्तरण
- **डकुमेन्टेशन नेभिगेसन**: प्रत्येक पृष्ठमा अहिले अध्याय सन्दर्भ र प्रगतिशील मार्गदर्शन समावेश
- **टेम्प्लेट संगठन**: उदाहरणहरू र टेम्प्लेटहरू उपयुक्त सिकाइ अध्यायहरूको लागि म्याप गरिएको

- **संसाधन एकीकरण**: सम्बन्धित अध्यायहरूसँग जडान गरिएका चिट शीटहरू, FAQ, र अध्ययन मार्गदर्शकहरू
- **कार्यशाला एकीकरण**: बहु अध्याय सिकाइ उद्देश्यहरूसँग मिलाइएको हातमा प्रयोग प्रयोगशालाहरू

#### परिवर्तन गरिएको
- **सिकाइ प्रगति**: रैखिक कागजातबाट लचिलो अध्याय-आधारित सिकाइमा सारियो
- **कन्फिगरेसन स्थान**: सिकाइ प्रवाह सुधारका लागि कन्फिगरेसन मार्गदर्शिकालाई अध्याय ३ मा पुनःअवस्थित गरियो
- **AI सामग्री एकीकरण**: सिकाइ यात्रामा AI-विशिष्ट सामग्रीको राम्रो एकीकरण
- **उत्पादन सामग्री**: एंटरप्राइज सिक्नेहरूका लागि अध्याय ८ मा उन्नत ढाँचाहरू संक्षेप गरिएको

#### सुधार गरिएको
- **प्रयोगकर्ता अनुभव**: स्पष्ट नेभिगेसन ब्रेडक्रम्ब्स र अध्याय प्रगति सूचकहरू
- **पहुँचयोग्यता**: सजिलो कोर्स यात्रा लागि सुसंगत नेभिगेसन ढाँचाहरू
- **व्यावसायिक प्रस्तुति**: शैक्षिक र कर्पोरेट प्रशिक्षणका लागि विश्वविद्यालय-शैली कोर्स संरचना उपयुक्त
- **सिकाइ क्षमता**: सुधारिएको संगठनमार्फत सम्बन्धित सामग्री खोज्न समय कम भयो

#### प्राविधिक कार्यान्वयन
- **नेभिगेसन हेडरहरू**: ४०+ कागजात फाइलहरूमा मानकीकृत अध्याय नेभिगेसन
- **फुटर नेभिगेसन**: सुसंगत प्रगति मार्गदर्शन र अध्याय पूरा भएका सूचकहरू
- **क्रस-लिंकिङ**: सम्बन्धित अवधारणाहरूलाई जोड्ने व्यापक आन्तरिक लिंकिङ प्रणाली
- **अध्याय म्यापिङ**: टेम्प्लेट र उदाहरणहरू सिकाइ उद्देश्यहरूसँग स्पष्ट रूपमा सम्बन्धित

#### अध्ययन मार्गदर्शक सुधार
- **📚 व्यापक सिकाइ उद्देश्यहरू**: ८-अध्याय प्रणालीसँग मेल खाने गरी पुनर्संरचना गरिएको अध्ययन मार्गदर्शक
- **🎯 अध्याय आधारित मूल्याङ्कन**: प्रत्येक अध्यायमा विशेष सिकाइ उद्देश्यहरू र व्यावहारिक अभ्यासहरू
- **📋 प्रगति ट्र्याकिङ**: मापन गर्न मिल्ने नतिजा र पूरा गर्ने चेकलिस्टसहित साप्ताहिक सिकाइ तालिका
- **❓ मूल्याङ्कन प्रश्नहरू**: प्रत्येक अध्यायका लागि ज्ञान प्रमाणीकरण प्रश्नहरू व्यावसायिक नतिजासहित
- **🛠️ व्यावहारिक अभ्यासहरू**: वास्तविक परिनियोजन परिदृश्यहरू र समस्या समाधानसहित हातमा कार्यहरू
- **📊 दक्षता प्रगति**: आधारभूत अवधारणाहरूबाट एंटरप्राइज ढाँचासम्म स्पष्ट उन्नति, करियर विकासमा केन्द्रित
- **🎓 प्रमाणपत्र फ्रेमवर्क**: व्यावसायिक विकास नतिजाहरू र समुदाय मान्यता प्रणाली
- **⏱️ समयरेखा व्यवस्थापन**: लक्ष्य मिलाउने संरचित १०-सप्ताह सिकाइ योजना

### [v3.1.0] - 2025-09-17

#### बहु-एजेन्ट AI समाधानहरू सुधारिएको
**यस संस्करणले बहु-एजेन्ट खुद्रा समाधानलाई राम्रो एजेन्ट नामाकरण र सुधारिएको कागजातहरूसँग सुधार गर्दछ।**

#### परिवर्तन गरिएको
- **बहु-एजेन्ट शब्दावली**: खुद्रा बहु-एजेन्ट समाधानमा स्पष्टताको लागि "कोरा एजेन्ट" लाई "ग्राहक एजेन्ट"सँग प्रतिस्थापन गरियो
- **एजेन्ट संरचना**: सबै कागजातहरू, ARM टेम्प्लेटहरू, र कोड उदाहरणहरूमा सुसंगत "ग्राहक एजेन्ट" नाम प्रयोग गर्न अद्यावधिक गरियो
- **कन्फिगरेसन उदाहरणहरू**: अद्यावधिक नामाकरण कन्वेन्सनसहित आधुनिक एजेन्ट कन्फिगरेसन ढाँचाहरू
- **कागजात सुसंगतता**: सबै सन्दर्भहरू व्यावसायिक, व्याख्यात्मक एजेन्ट नामहरू प्रयोग गर्न सुनिश्चित गरियो

#### सुधारिएको
- **ARM टेम्प्लेट प्याकेज**: ग्राहक एजेन्ट सन्दर्भहरूसहित retail-multiagent-arm-template अपडेट गरियो
- **संरचना चित्रहरू**: अद्यावधिक नामाकरणसहित मर्मेड चित्रहरू ताजा गरियो
- **कोड उदाहरणहरू**: Python क्लास र कार्यान्वयन उदाहरणहरू अब CustomerAgent नामाकरण प्रयोग गर्छन्
- **पर्यावरण चरहरू**: CUSTOMER_AGENT_NAME कन्वेन्सनहरू प्रयोग गर्न सबै परिनियोजन स्क्रिप्टहरू अद्यावधिक गरियो

#### सुधारिएको
- **डेभलपर अनुभव**: कागजातहरूमा स्पष्ट एजेन्ट भूमिका र जिम्मेवारीहरू
- **उत्पादन तत्परता**: एंटरप्राइज नामाकरण कन्वेन्सनसंग सुधारिएको मेल
- **सिकाइ सामाग्री**: शैक्षिक प्रयोजनका लागि बढी सामान्य एजेन्ट नामाकरण
- **टेम्प्लेट प्रयोगकर्ता अनुभव**: एजेन्ट कार्यहरू र परिनियोजन ढाँचाहरूको सजिलो बुझाइ

#### प्राविधिक विवरण
- ग्राहक एजेन्ट सन्दर्भहरूसहित मर्मेड संरचना चित्रहरू अद्यावधिक गरियो
- Python उदाहरणहरूमा CoraAgent क्लास नामहरूलाई CustomerAgent सँग प्रतिस्थापन गरियो
- ARM टेम्प्लेट JSON कन्फिगरेसनहरूलाई "customer" एजेन्ट प्रकार प्रयोग गर्न परिवर्तन गरियो
- पर्यावरण चरहरू CORA_AGENT_* बाट CUSTOMER_AGENT_* ढाँचाहरूमा अद्यावधिक गरियो
- सबै परिनियोजन आदेशहरू र कन्टेनर कन्फिगरेसनहरू ताजा गरियो

### [v3.0.0] - 2025-09-12

#### प्रमुख परिवर्तनहरू - AI डेभलपर फोकस र Microsoft Foundry एकीकरण
**यस संस्करणले रिपोजिटोरीलाई व्यापक AI-केंद्रित सिकाइ स्रोतमा Microsoft Foundry एकीकरणसहित रूपान्तरण गर्छ।**

#### थपियो
- **🤖 AI-प्रथम सिकाइ मार्ग**: AI डेभलपरहरू र इन्जिनियरहरूलाई प्राथमिकतादिने पूर्ण पुनर्संरचना
- **Microsoft Foundry एकीकरण मार्गदर्शक**: AZD लाई Microsoft Foundry सेवासँग जोड्ने व्यापक कागजात
- **AI मोडेल परिनियोजन ढाँचाहरू**: मोडेल चयन, कन्फिगरेसन, र उत्पादन परिनियोजन रणनीतिहरू समेटिएको विस्तृत मार्गदर्शक
- **AI कार्यशाला प्रयोगशाला**: AI अनुप्रयोगहरूलाई AZD-परिनियोज्य समाधानहरूमा रूपान्तरण गर्ने २-३ घण्टाको हातमा प्रयोग कार्यशाला
- **उत्पादन AI उत्तम अभ्यासहरू**: AI वर्कलोडहरू स्केलिङ, अनुगमन, र सुरक्षाका लागि एंटरप्राइज-तयार ढाँचाहरू
- **AI-विशिष्ट समस्यासँग जुझ्ने मार्गदर्शक**: Microsoft Foundry मोडेलहरू, संज्ञानात्मक सेवाहरू, र AI परिनियोजन समस्याहरूका लागि व्यापक समस्या समाधान
- **AI टेम्प्लेट ग्यालरी**: जटिलता मूल्यांकनसहित Microsoft Foundry टेम्प्लेटहरूको विशेष संग्रह
- **कार्यशाला सामग्रीहरू**: हातमा प्रयोग प्रयोगशालाहरू र संदर्भ सामग्रीहरूसहित पूर्ण कार्यशाला संरचना

#### सुधारिएको
- **README संरचना**: Microsoft Foundry Discord बाट ४५% समुदाय रुचिसहित AI-डेभलपर-केंद्रित
- **सिकाइ मार्गहरू**: विद्यार्थी र DevOps इन्जिनियरहरूका लागि परम्परागत मार्गहरूसँगै समर्पित AI डेभलपर यात्रा
- **टेम्प्लेट सिफारिसहरू**: azure-search-openai-demo, contoso-chat, र openai-chat-app-quickstart समावेश AI टेम्प्लेटहरू
- **समुदाय एकीकरण**: AI-विशिष्ट च्यानल र छलफलहरूसहित Discord समुदाय समर्थनमा वृद्धि

#### सुरक्षा र उत्पादन फोकस
- **प्रबन्धित पहिचान ढाँचाहरू**: AI-विशिष्ट प्रमाणीकरण र सुरक्षा कन्फिगरेसनहरू
- **खर्च अनुकूलन**: AI वर्कलोडहरूको लागि टोकन प्रयोग ट्र्याकिङ र बजेट नियन्त्रण
- **बहु-क्षेत्र परिनियोजन**: विश्वव्यापी AI अनुप्रयोग परिनियोजनका रणनीतिहरू
- **प्रदर्शन अनुगमन**: AI-विशिष्ट मेट्रिक्स र एप्लिकेसन इनसाइट्स एकीकरण

#### कागजात गुणस्तर
- **रैखिक कोर्स संरचना**: आरम्भदेखि उन्नत AI परिनियोजन ढाँचाहरू सम्म तार्किक प्रगति
- **प्रमाणीकरण गरिएका URLहरू**: सबै बाह्य रिपोजिटोरी लिङ्कहरू प्रमाणित र पहुँचयोग्य
- **पूर्ण संदर्भ**: सबै आन्तरिक कागजात लिङ्कहरू प्रमाणीकरण र कार्यशील
- **उत्पादन तत्पर**: वास्तविक-विश्व उदाहरणहरूसहित एंटरप्राइज परिनियोजन ढाँचाहरू

### [v2.0.0] - 2025-09-09

#### प्रमुख परिवर्तनहरू - रिपोजिटोरी पुनर्संरचना र व्यावसायिक सुधार
**यस संस्करणले रिपोजिटोरी संरचना र सामग्री प्रस्तुतीकरणमा ठूलो पुनरावृत्ति प्रतिनिधित्व गर्दछ।**

#### थपियो
- **संरचित सिकाइ फ्रेमवर्क**: सबै कागजात पृष्ठहरूमा अब परिचय, सिकाइ लक्ष्यहरू, र सिकाइ परिणाम अनुभागहरू सहित
- **नेभिगेसन प्रणाली**: निर्देशित सिकाइ प्रगतिको लागि सबै कागजातहरूमा अघिल्लो/अर्को पाठ लिङ्कहरू थपियो
- **अध्ययन मार्गदर्शक**: सिकाइ उद्देश्यहरू, अभ्यास अभ्यासहरू, र मूल्याङ्कन सामग्रीहरूसहित व्यापक study-guide.md
- **व्यावसायिक प्रस्तुति**: पहुँचयोग्यता र व्यावसायिक रूप सुधार्न सबै इमोजी आइकनहरू हटाइयो
- **सामग्री संरचना सुधार**: सिकाइ सामग्रीहरूको संगठन र प्रवाह सुधारियो

#### परिवर्तन गरिएको
- **कागजात ढाँचा**: सबै कागजातहरूलाई सुसंगत सिकाइ-केंद्रित संरचनामा मानकीकृत गरियो
- **नेभिगेसन प्रवाह**: सबै सिकाइ सामग्रीमार्फत तार्किक प्रगति अपनाइयो
- **सामग्री प्रस्तुति**: स्पष्ट, व्यावसायिक स्वरूपमा सजावटी तत्व हटाइयो
- **लिङ्क संरचना**: नयाँ नेभिगेसन प्रणाली समर्थन गर्न सबै आन्तरिक लिङ्कहरू अपडेट गरियो

#### सुधारिएको
- **पहुँचयोग्यता**: सुधारिएको स्क्रीन रिडर अनुकूलताका लागि इमोजी निर्भरता हटाइयो
- **व्यावसायिक उपस्थिति**: एंटरप्राइज सिकाइका लागि सफा, शैक्षिक-शैली प्रस्तुति
- **सिकाइ अनुभव**: प्रत्येक पाठका लागि स्पष्ट उद्देश्य र नतिजासहित संरचित दृष्टिकोण
- **सामग्री संगठन**: सम्बन्धित विषयहरूबीच सुधारिएको तार्किक प्रवाह र जडान

### [v1.0.0] - 2025-09-09

#### प्रारम्भिक रिलिज - व्यापक AZD सिकाइ रिपोजिटोरी

#### थपियो
- **मुख्य कागजात संरचना**
  - पूर्ण सुरु गर्ने मार्गदर्शिका श्रृंखला
  - व्यापक परिनियोजन र व्यवस्था कागजातहरू
  - विस्तृत समस्या समाधान स्रोतहरू र डिबगिङ मार्गदर्शकहरू
  - प्रि-परिनियोजन प्रमाणीकरण उपकरण र प्रक्रियाहरू

- **सुरु गर्ने मोड्युल**
  - AZD आधारहरू: मुख्य अवधारणाहरू र शब्दावली
  - स्थापना मार्गदर्शिका: प्लेटफर्म-विशिष्ट सेटअप निर्देशहरू
  - कन्फिगरेसन मार्गदर्शिका: वातावरण सेटअप र प्रमाणीकरण
  - पहिलो परियोजना ट्युटोरियल: चरण-दर-चरण हातमा सिकाइ

- **परिनियोजन र व्यवस्था मोड्युल**
  - परिनियोजन मार्गदर्शिका: पूर्ण कार्यप्रवाह कागजातहरू
  - व्यवस्था मार्गदर्शिका: Bicep सँग इन्फ्रास्ट्रक्चर कोडका रूपमा
  - उत्पादन परिनियोजनका लागि उत्तम अभ्यासहरू
  - बहु-सेवा संरचना ढाँचाहरू

- **प्रि-परिनियोजन प्रमाणीकरण मोड्युल**
  - क्षमता योजना: Azure स्रोत उपलब्धता प्रमाणीकरण
  - SKU चयन: व्यापक सेवा स्तर मार्गदर्शन
  - प्रि-फ्लाइट जाँचहरू: स्वचालित प्रमाणीकरण स्क्रिप्टहरू (PowerShell र Bash)
  - लागत अनुमान र बजेट योजना उपकरणहरू

- **समस्या समाधान मोड्युल**
  - सामान्य समस्या: प्रायः देखिने समस्याहरू र समाधानहरू
  - डिबगिङ मार्गदर्शिका: प्रणालीगत समस्या समाधान विधिहरू
  - उन्नत डायग्नोस्टिक प्रविधिहरू र उपकरणहरू
  - प्रदर्शन अनुगमन र अनुकूलन

- **संसाधनहरू र सन्दर्भहरू**
  - कमाण्ड चिट शीट: आवश्यक कमाण्डहरूको छिटो संदर्भ
  - शब्दावली: व्यापक शब्द र संक्षेप परिभाषाहरू
  - FAQ: प्रायः सोधिने प्रश्नहरूको विस्तृत उत्तरहरू
  - बाह्य स्रोत लिङ्कहरू र समुदाय जडानहरू

- **उदाहरणहरू र टेम्प्लेटहरू**
  - सरल वेब अनुप्रयोग उदाहरण
  - स्थिर वेबसाइट परिनियोजन टेम्प्लेट
  - कन्टेनर अनुप्रयोग कन्फिगरेसन
  - डेटाबेस एकीकरण ढाँचाहरू
  - माइक्रोसर्भिस संरचना उदाहरणहरू
  - सर्भरलेस फंक्शन कार्यान्वयनहरू

#### सुविधाहरू
- **बहु-प्लेटफर्म समर्थन**: Windows, macOS, र Linux का लागि स्थापना र कन्फिगरेसन मार्गदर्शकहरू
- **बहु-कौशल स्तरहरू**: विद्यार्थीहरूदेखि व्यावसायिक विकासकर्ताहरूका लागि डिजाइन गरिएको सामग्री
- **व्यावहारिक फोकस**: हातमा प्रयोग उदाहरणहरू र वास्तविक-विश्व परिदृश्यहरू
- **व्यापक समेटिएको**: आधारभूत अवधारणाहरूदेखि उन्नत एंटरप्राइज ढाँचाहरू सम्म
- **सुरक्षा-प्रथम दृष्टिकोण**: सुरक्षा उत्तम अभ्यासहरू समग्र समावेश गरिएका
- **खर्च अनुकूलन**: लागत-कुशल परिनियोजन र स्रोत व्यवस्थापनका लागि मार्गदर्शन

#### कागजात गुणस्तर
- **विस्तृत कोड उदाहरणहरू**: व्यावहारिक, परीक्षण गरिएका कोड नमूनाहरू
- **चरण-द्वारा-चरण निर्देशनहरू**: स्पष्ट, कार्यान्वयन योग्य मार्गदर्शन
- **व्यापक त्रुटि ह्यान्डलिङ**: सामान्य समस्याहरूको लागि समस्या समाधान
- **उत्तम अभ्यासहरू एकीकरण**: उद्योग मापदण्डहरू र सिफारिसहरू
- **संस्करण अनुकूलता**: नवीनतम Azure सेवा र azd सुविधाहरूसँग अद्यावधिक

## योजना गरिएको भविष्य सुधारहरू

### संस्करण 3.1.0 (योजना गरिएको)
#### AI प्लेटफर्म विस्तार
- **बहु-मोडेल समर्थन**: Hugging Face, Azure Machine Learning, र कस्टम मोडेलहरूका लागि एकीकरण ढाँचाहरू
- **AI एजेन्ट फ्रेमवर्कहरू**: LangChain, Semantic Kernel, र AutoGen परिनियोजनका लागि टेम्प्लेटहरू
- **उन्नत RAG ढाँचाहरू**: Azure AI Search भन्दा बाहिर भेक्टर डाटाबेस विकल्पहरू (Pinecone, Weaviate, आदि)
- **AI अवलोकनयोग्यता**: मोडेल प्रदर्शन, टोकन प्रयोग, र प्रतिक्रियाको गुणस्तरको सुधारिएको अनुगमन

#### डेभलपर अनुभव
- **VS कोड एक्सटेन्सन**: समाहित AZD + Microsoft Foundry विकास अनुभव
- **GitHub Copilot एकीकरण**: AI-सहायता प्राप्त AZD टेम्प्लेट जेनेरेसन
- **इन्टरएक्टिभ ट्युटोरियलहरू**: AI परिदृश्यहरूसँग स्वतः प्रमाणीकरण सहित हातमा कोडिङ अभ्यासहरू
- **भिडियो सामग्री**: दृष्टिगत सिक्नेहरूका लागि सहयोगी भिडियो ट्युटोरियलहरू AI परिनियोजनमा केन्द्रित

### संस्करण 4.0.0 (योजना गरिएको)
#### एंटरप्राइज AI ढाँचाहरू
- **शासन फ्रेमवर्क**: AI मोडेल शासन, अनुपालन, र अडिट ट्रेलहरू
- **बहु-टेनन्ट AI**: पृथक AI सेवाहरूका साथ बहु ग्राहक सेवा गर्ने ढाँचाहरू
- **एज AI परिनियोजन**: Azure IoT Edge र कन्टेनर उदाहरणहरूसँग एकीकरण
- **हाइब्रिड क्लाउड AI**: AI वर्कलोडहरूको लागि बहु-क्लाउड र हाइब्रिड परिनियोजन ढाँचाहरू

#### उन्नत सुविधाहरू
- **AI पाइपलाइन स्वचालन**: Azure Machine Learning पाइपलाइनहरूसँग MLOps एकीकरण
- **उन्नत सुरक्षा**: शून्य-विश्वास ढाँचाहरू, निजी अन्तविन्दुहरू, र उन्नत खतरा संरक्षण
- **प्रदर्शन अनुकूलन**: उच्च-थ्रूपुट AI अनुप्रयोगहरूको लागि उन्नत ट्यूनिङ र स्केलिङ रणनीतिहरू
- **वैश्विक वितरण**: AI अनुप्रयोगहरूको लागि सामग्री वितरण र एज क्यासिङ ढाँचाहरू

### संस्करण 3.0.0 (योजना गरिएको) - हालको रिलिजद्वारा सरयूगारी गरिएको
#### प्रस्तावित थपहरू - अहिले v3.0.0 मा लागू भएका
- ✅ **AI-केंद्रित सामग्री**: व्यापक Microsoft Foundry एकीकरण (पूरा भयो)
- ✅ **इन्टरएक्टिभ ट्युटोरियलहरू**: हातमा AI कार्यशाला प्रयोगशाला (पूरा भयो)
- ✅ **उन्नत सुरक्षा मोड्युल**: AI-विशिष्ट सुरक्षा ढाँचाहरू (पूरा भयो)
- ✅ **प्रदर्शन अनुकूलन**: AI वर्कलोड ट्युनिङ रणनीतिहरू (पूरा भयो)

### संस्करण 2.1.0 (योजना गरिएको) - आंशिक रूपमा v3.0.0 मा लागू
#### साना सुधारहरू - केही हालको रिलिजमा पूरा भएका
- ✅ **थप उदाहरणहरू**: AI-केंद्रित परिनियोजन परिदृश्यहरू (पूरा भयो)
- ✅ **विस्तृत FAQ**: AI-विशिष्ट प्रश्नहरू र समस्या समाधान (पूरा भयो)
- **उपकरण एकीकरण**: सुधारिएको IDE र सम्पादक एकीकरण मार्गदर्शकहरू
- ✅ **अनुगमन विस्तार**: AI-विशिष्ट अनुगमन र सचेतना ढाँचाहरू (पूरा भयो)

#### अझै भविष्य रिलिजका लागि योजना बनाइयो
- **मोबाइल-मैत्री कागजातहरू**: मोबाइल सिकाइका लागि प्रतिक्रियाशील डिजाइन
- **अफलाइन पहुँच**: डाउनलोड गर्न मिल्ने कागजात प्याकेजहरू
- **सुधारिएको IDE एकीकरण**: AZD + AI कार्यप्रवाहहरूको लागि VS कोड विस्तार
- **समुदाय ड्यासबोर्ड**: वास्तविक-समय समुदाय मेट्रिक्स र योगदान ट्र्याकिङ

## Changelog मा योगदान गर्ने

### परिवर्तन रिपोर्टिङ्ग
यस रिपोजिटोरीमा योगदान गर्दा, कृपया सुनिश्चित गर्नुहोस् कि changelog प्रविष्टिहरू समावेश छन्:

१. **संस्करण नम्बर**: सेम्यान्टिक संस्करण निर्धारण पालना गर्दै (मेजर.माइनर.प्याच)
२. **मिति**: YYYY-MM-DD ढाँचामा रिलिज वा अपडेट मिति
३. **श्रेणी**: थपियो, परिवर्तन गरिएको, पुरानो, हटाइएको, सुधारिएको, सुरक्षा
४. **स्पष्ट वर्णन**: के परिवर्तन भयो भन्ने संक्षिप्त वर्णन
५. **प्रभाव मूल्याङ्कन**: परिवर्तनहरूले विद्यमान प्रयोगकर्ताहरूमा कसरी असर गर्छ

### परिवर्तन श्रेणीहरू

#### थपियो
- नयाँ सुविधाहरू, कागजात अनुभागहरू, वा क्षमता
- नयाँ उदाहरणहरू, टेम्प्लेटहरू, वा सिकाइ स्रोतहरू
- अतिरिक्त उपकरणहरू, स्क्रिप्टहरू, वा उपयुक्तताहरू

#### परिवर्तन गरिएको
- विद्यमान कार्यक्षमतामा वा कागजातमा संशोधन
- स्पष्टता वा शुद्धता सुधार्न अद्यावधिक
- सामग्री वा संगठनको पुनर्संरचना

#### पुरानो
- चरणबद्ध हुँदै हटाइँदै आएका सुविधा वा दृष्टिकोणहरू
- हटाउन अनुसूचित कागजात अनुभागहरू
- जसका लागि राम्रो विकल्पहरू छन् विधिहरू

#### हटाइयो
- अब सान्दर्भिक नभएका सुविधा, कागजात, वा उदाहरणहरू
- पुरानो जानकारी वा पुरानो दृष्टिकोणहरू
- पुनरावृत्ति वा संक्षेप गरिएको सामग्री

#### सुधारिएको
- कागजात वा कोडमा त्रुटिहरूको सुधार
- रिपोर्ट गरिएका समस्याहरू वा मुद्दाहरूको समाधान
- शुद्धता वा कार्यक्षमतामा सुधार


#### सुरक्षा
- सुरक्षा सम्बन्धित सुधारहरू वा फिक्सहरू
- सुरक्षा उत्तम अभ्यासहरूमा अपडेटहरू
- सुरक्षा कमजोरिहरूको समाधान

### सेमान्टिक संस्करण निर्देशनहरू

#### मुख्य संस्करण (X.0.0)
- प्रयोगकर्ताको क्रियाकलाप आवश्यक पर्ने भंग हुने परिवर्तनहरू
- सामग्री वा संगठनको महत्वपूर्ण पुनर्संरचना
- आधारभूत दृष्टिकोण वा विधिको परिवर्तनहरू

#### सानो संस्करण (X.Y.0)
- नयाँ सुविधाहरू वा सामग्री थपहरू
- पछाडिको अनुकूलतालाई कायम राख्ने सुधारहरू
- अतिरिक्त उदाहरणहरू, उपकरणहरू, वा स्रोतहरू

#### प्याच संस्करण (X.Y.Z)
- बग फिक्सहरू र सुधारहरू
- अवस्थित सामग्रीमा स-साना सुधारहरू
- स्पष्टिकरणहरू र स-साना सुधारहरू

## समुदाय प्रतिक्रिया र सुझावहरू

हामी यस सिकाइ स्रोत सुधार गर्न सक्रिय रूपमा समुदाय प्रतिक्रिया प्रोत्साहित गर्दछौं:

### कसरी प्रतिक्रिया दिने
- **GitHub Issues**: समस्या रिपोर्ट गर्नुहोस् वा सुधार सुझाव दिनुहोस् (AI-विशेष समस्याहरू स्वागत छ)
- **Discord Discussions**: विचारहरू साझा गर्नुहोस् र Microsoft Foundry समुदायसँग संलग्न हुनुहोस्
- **Pull Requests**: सामग्रीमा प्रत्यक्ष सुधार योगदान गर्नुहोस्, विशेष गरी AI टेम्प्लेट र गाइडहरूमा
- **Microsoft Foundry Discord**: #Azure च्यानलमा AZD + AI छलफलहरूमा भाग लिनुहोस्
- **Community Forums**: फराकिलो Azure विकासकर्ता छलफलहरूमा भाग लिनुहोस्

### प्रतिक्रिया श्रेणीहरू
- **AI सामग्री सहीता**: AI सेवा एकीकरण र परिनियोजन जानकारीमा सुधारहरू
- **सिकाइ अनुभव**: AI विकासकर्ताको सिकाइ प्रवाह सुधारका लागि सुझावहरू
- **हराएको AI सामग्री**: थप AI टेम्प्लेटहरू, ढाँचा वा उदाहरणहरूको अनुरोध
- **पहुंच योग्यता**: विविध सिकाइ आवश्यकताहरूका लागि सुधारहरू
- **AI उपकरण एकीकरण**: AI विकास कार्यप्रवाह एकीकरण सुधारका लागि सुझावहरू
- **उत्पादन AI ढाँचा**: उद्यम AI परिनियोजन ढाँचा अनुरोधहरू

### प्रतिक्रिया प्रतिबद्धता
- **समस्या प्रतिक्रिया**: रिपोर्ट गरिएका समस्याहरूका लागि ४८ घन्टाभित्र
- **विशेषता अनुरोधहरू**: एक हप्ताभित्र मूल्याङ्कन
- **समुदाय योगदानहरू**: एक हप्ताभित्र समीक्षा
- **सुरक्षा समस्याहरू**: तात्कालिक प्राथमिकतामा छिटो प्रतिक्रिया

## मर्मत तालिका

### नियमित अपडेटहरू
- **मासिक समीक्षा**: सामग्रीको सहीता र लिंक प्रमाणीकरण
- **त्रैमासिक अपडेटहरू**: मुख्य सामग्री थप र सुधारहरू
- **छैमासिक समीक्षा**: व्यापक पुनर्संरचना र सुधार
- **वार्षिक रिलीजहरू**: मुख्य संस्करण अपडेटहरू महत्वपूर्ण सुधारहरूसहित

### निगरानी र गुणस्तर आश्वासन
- **स्वचालित परीक्षण**: कोड उदाहरण र लिंकहरूको नियमित प्रमाणीकरण
- **समुदाय प्रतिक्रिया समावेश**: प्रयोगकर्ता सुझावहरूको नियमित समाहित
- **प्रविधि अपडेटहरू**: नवीनतम Azure सेवाहरू र azd रिलीजहरूसँग मिलान
- **पहुंच योग्यता अडिटहरू**: समावेशी डिजाइन सिद्धान्तहरूको नियमित समीक्षा

## संस्करण समर्थन नीति

### वर्तमान संस्करण समर्थन
- **नवीनतम मुख्य संस्करण**: पूर्ण समर्थन नियमित अपडेटसहित
- **अघिल्लो मुख्य संस्करण**: १२ महिना सुरक्षा अपडेट र महत्वपूर्ण फिक्सहरू
- **पुराना संस्करणहरू**: समुदाय समर्थन मात्र, आधिकारिक अपडेटहरू छैनन्

### माइग्रेशन मार्गनिर्देशन
जब मुख्य संस्करणहरू रिलिज हुन्छन्, हामी प्रदान गर्छौं:
- **माइग्रेशन गाइडहरू**: चरण-द्वारा-चरण संक्रमण निर्देशनहरू
- **अनुकूलता नोटहरू**: भंग हुने परिवर्तनहरूको विवरण
- **उपकरण समर्थन**: माइग्रेशन सहयोगका लागि स्क्रिप्ट वा यूटिलिटीहरू
- **समुदाय समर्थन**: माइग्रेशन प्रश्नहरूको लागि समर्पित फोरमहरू

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [अध्ययन मार्गदर्शिका](resources/study-guide.md)
- **अर्को पाठ**: फिर्ता जानुहोस् [मुख्य README](README.md)

**अद्यावधिक रहनुहोस्**: नयाँ रिलिजहरू र सिकाइ सामग्रीको महत्वपूर्ण अपडेटहरूको सूचना पाउनको लागि यस रिपोजिटरीलाई हेर्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->