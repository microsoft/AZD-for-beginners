# परिवर्तन सूची - AZD शुरुवातकर्ताका लागि

## परिचय

यो परिवर्तन सूचिमा AZD For Beginners रिपोजिटरीमा भएका सबै महत्वपूर्ण परिवर्तनहरू, अपडेटहरू, र सुधारहरू दर्ता गरिएको छ। हामी semantic versioning सिद्धान्तहरू पालन गर्छौं र प्रयोगकर्ताहरूलाई संस्करणहरू बीच के बदलियो बुझ्न मद्दत गर्न यो लग राख्छौं।

## अधिगम लक्ष्यहरू

यस परिवर्तन सूचीलाई समीक्षा गरेर, तपाईं:
- नयाँ सुविधाहरू र सामग्री थप्ने बारे सूचित रहनुहुनेछ
- अवस्थित दस्तावेजहरूमा गरिएका सुधारहरू बुझ्न सक्नुहुनेछ
- शुद्धता सुनिश्चित गर्न बग फिक्स र सुधारहरू ट्र्याक गर्न सक्नुहुनेछ
- समयक्रममा सिकाइ सामग्रीहरूको विकासलाई अनुसरण गर्न सक्नुहुनेछ

## अधिगम परिणामहरू

परिवर्तन सूचिका प्रविष्टिहरू समीक्षा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- सिकाइका लागि उपलब्ध नयाँ सामग्री र स्रोतहरू पहिचान गर्न
- कुन भागहरू अपडेट वा सुधार गरिएको छ बुझ्न
- सबैभन्दा आधुनिक सामग्रीका आधारमा आफ्नो सिकाइ मार्ग योजना गर्न
- भविष्यका सुधारहरूको लागि प्रतिक्रिया र सुझाव प्रदान गर्न

## भर्सन इतिहास

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**यस भर्सनले azd-coverage विश्लेषणले देखाएका बाँकी अन्तरिम खाल्तिहरू बन्द गर्छ: आफ्नो टेम्पलेट कसरी लेख्ने र प्रकाशित गर्ने, पुनरुत्पादनीय dev-container/Codespaces वातावरणहरू, Pulumi infrastructure provider, Azure DevOps CI/CD वाकथ्रु, service-principal प्रमाणिकरण, होस्ट-छनौट मार्गदर्शन (AKS/Spring Apps), `azd restore`/`azd package` व्याख्याहरू, हुक त्रुटि-ह्यान्डलिंग, र टोली/साझा-पर्यावरण अभ्यासहरू।**

#### थपिएको
- **🧱 नयाँ अध्याय 4 पाठ** `docs/chapter-04-infrastructure/custom-templates.md` — आफ्नो azd टेम्पलेट लेख्ने तरिका: आवश्यक संरचना (`azure.yaml`, `infra/`, `src/`), `metadata.template` फिल्ड, `uniqueString()` resource token र `azd-env-name` ट्याग प्रयोग गरी इन्फ्रास्ट्रक्चरलाई प्यारामिटराइज गर्ने, स्थानीय रूपमा परीक्षण गर्न `azd init --template <local-path>`, GitHub मा प्रकाशन, र Awesome AZD ग्यालरीमा पेश गर्ने
- **📦 नयाँ अध्याय 1 पाठ** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers र GitHub Codespaces का साथ पुनरुत्पादनीय azd वातावरणहरू: आधिकारिक `ghcr.io/azure/azure-dev/azd` feature प्रयोग गरी न्यूनतम `.devcontainer/devcontainer.json`, भाषा-विशिष्ट फीचरहरू, container hosts को लागि `docker-in-docker`, र रिमोट साइन-इनका लागि `azd auth login --use-device-code`
- **🧩 Pulumi with azd** खण्ड `docs/chapter-04-infrastructure/provisioning.md` मा — `infra.provider: pulumi`, Pulumi फोल्डर लेआउट, स्ट्याकहरू azd वातावरणहरूसँग म्याप गरिएको, आवश्यक outputs/tagging, र समान `azd up` / `azd down` वर्कफ्लो
- **🎯 Host-selection मार्गदर्शन** `docs/chapter-04-infrastructure/provisioning.md` मा — `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, र `springapp` को शुरुवाती-मैत्री तुलना, र कहिले AKS वा Azure Spring Apps छान्ने बारे मार्गदर्शन
- **🛠️ Azure DevOps CI/CD वाकथ्रु** `docs/chapter-08-production/production-ai-practices.md` मा — `azd pipeline config --provider azdo`, workload identity federation (OIDC) सहितको service connection, जनरेट गरिएको `azure-dev.yml`, र variable-group सेटअप
- **🔑 Service Principals (Pattern 4)** `docs/chapter-03-configuration/authsecurity.md` मा थपियो — `az ad sp create-for-rbac`, non-interactive `azd auth login` client secret बनाम federated/OIDC credentials, प्रयोग गर्ने बेला र सुरक्षित क्रेडेन्सियल भण्डारण
- **🪝 हुक त्रुटि-ह्यान्डलिंग** उप-खण्ड `docs/chapter-04-infrastructure/deployment-guide.md` मा — exit codes र `set -e`, `continueOnError`, `azd hooks run` सँग हुकलाई अलग रूपमा परीक्षण गर्ने, OS-विशिष्ट shells, र `--debug`
- **👥 टोली / साझा वातावरणहरू** खण्ड `docs/chapter-03-configuration/configuration.md` मा — `.azure/` मा के हुन्छ, के gitignore गर्ने, प्रति-डेभलपर वातावरणहरू, `azd env list`/`select`, र CI/CD मा वातावरण मानहरू प्रदान गर्ने तरिका
- **🧰 `azd restore` र विस्तारित `azd package`** व्याख्याहरू `resources/cheat-sheet.md` मा — निर्भरता पुनर्स्थापना र deploy नगरी deployable artifact बनाउने प्रक्रिया

#### परिर्वतन गरिएको
- **🧭 अध्याय 4 पाठ तालिका** नयाँ "Authoring Your Own Template" पाठ (पाठ 3) समावेश गर्न अपडेट गरियो
- **🧭 अध्याय 1 पाठ तालिका** नयाँ "Dev Containers & Codespaces" पाठ (पाठ 5) समावेश गर्न अपडेट गरियो; navigation footers `bring-your-own-app.md` र `dev-containers.md` बीच तारिएका

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**यस भर्सनले एक पूर्ण शुरुवातकर्ताका लागि मार्गनिर्देशनका ठूला खाल्तिहरू बन्द गर्छ जसले दुई नयाँ हात-मा-पर्ने पाठहरू (एक deployable multi-agent वाकथ्रु र अवस्थित एपमा azd थप्ने), शुरुवाती-मैत्री hooks परिचय, Terraform-with-azd खण्ड, 단계-द्वारा-स्टेप GitHub Actions पाइपलाइन वाकथ्रु, नयाँ preview extensions का लागि explainer, र स्पष्ट deployment-प्रमाणीकरण चेकलिस्ट थप गर्दछ।**

#### थपिएको
- **🤝 नयाँ अध्याय 5 पाठ** `docs/chapter-05-multi-agent/multi-agent-basics.md` — पूर्ण हात-मा-पर्ने, deployable दुई-एजेन्ट वाकथ्रु (orchestrator + specialists) वास्तविक टेम्पलेट (`contoso-creative-writer`) प्रयोग गर्दै, कहिले multi-agent प्रयोग गर्ने, `azd up` वर्कफ्लो, deploy गरिएका संसाधनहरू बुझ्ने, cross-agent tracing, अनुकूलन, र cleanup समावेश
- **📦 नयाँ अध्याय 1 पाठ** `docs/chapter-01-foundation/bring-your-own-app.md` — अवस्थित प्रोजेक्टमा `azd init` ("use code in the current directory") प्रयोग गरी azd कसरी थप्ने, `azure.yaml` र `infra/` बुझ्ने, `azd infra generate`, host detection, र `azd up` सँग deploy गर्ने तरिका
- **🌐 Terraform with azd** खण्ड `docs/chapter-04-infrastructure/provisioning.md` मा थपियो — `infra.provider: terraform` कन्फिग, `.tf` फोल्डर लेआउट, आवश्यक `AZURE_*` outputs र `azd-env-name` tagging, र समान `azd up` / `azd down` वर्कफ्लो (पहिले Terraform समर्थन दाबी गरिए तर केवल Bicep देखाइएको ठाउँ बन्द गर्छ)
- **⚙️ चरण-द्वारा-चरण GitHub Actions वाकथ्रु** `docs/chapter-08-production/production-ai-practices.md` मा — GitHub repo बाट स्वचालित deploy सम्म: `azd pipeline config`, OIDC federated credentials (स्टोर गरिएको secrets बिना), जनरेट गरिएको `azure-dev.yml`, र secrets-vs-variables मार्गदर्शन
- **🪝 शुरुवाती "हुकहरू नयाँ?" परिचय** `docs/chapter-04-infrastructure/deployment-guide.md` मा — हुक के हो, हुक-स्टेज तालिका, न्यूनतम पहिलो हुक, र `azd hooks run` सँग हुकहरू म्यानुअली चलाउने
- **✅ "Verify Your Deployment" चेकलिस्ट** `docs/chapter-01-foundation/first-project.md` को Step 5 मा थपियो — smoke test, health-endpoint जाँच, र स्पष्ट सफलता मापदण्डहरू
- **🧩 नयाँ preview extensions को explainer** `azure.ai.skills` र `azure.ai.connections` (यी के हुन् र कहिले प्रयोग गर्ने) `docs/chapter-08-production/production-ai-practices.md` मा

#### परिर्वतन गरिएको
- **🧭 अध्याय 5 पाठ तालिका** सुधार गरियो: `multi-agent-basics.md` अब पाठ 1 हो (एक मात्रै पूर्ण रूपमा हात-मा-पर्ने पाठ), ईमानदार लेबलिङ जसले बताउँछ कि पाठ 2 अध्याय 6 मा छ र Retail परिदृश्य एक आर्किटेक्चर ब्लूप्रिन्ट हो, एक-कमाण्ड टेम्पलेट होइन
- **🧭 अध्याय 1 पाठ तालिका** अब नयाँ "Bring Your Own App" पाठ (पाठ 4) समावेश गर्छ
- **🔗 Navigation footers** अपडेट गरियो: `first-project.md` अब अघि `bring-your-own-app.md` लाई लिंक गर्छ

#### समाधान गरियो
- **🧱 "दावी तर हराएको" Terraform खाल्टि बन्द गरियो** — पाठ्यक्रमले पहिले Terraform समर्थन उल्लेख गर्यो तर देखाएको थिएन
- **🔀 अध्याय 5 क्रस-लिङ्कहरू सुधारियो** जसले पूर्ण multi-agent कार्यान्वयन भएको भन्ने भ्रम दिन्थ्यो जब केवल आर्किटेक्चर ब्लूप्रिन्ट मात्र थियो

#### अपडेट गरिएका फाइलहरू
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**यस भर्सनले कोर्सलाई `azd` `1.25.6` (June 2026) र `azure.ai.agents` `0.1.40-preview` extension विरुद्ध पुनःमान्य गर्दछ, AI मार्गदर्शनलाई "scaffold an agent" बाट पूर्ण एजेन्ट लाइफसाइकल (test → evaluate → optimize → inspect → delete) सम्म विस्तार गर्छ, नयाँ `azure.ai.skills` र `azure.ai.connections` preview extensions लाई सतहमा ल्याउँछ, र ".NET Aspire" → "Aspire" उत्पादन रिब्रान्ड नोट गर्दछ।**

#### थपिएको
- **🔁 पूर्ण एजेन्ट लाइफसाइकल कभरेज** शुरुवातकर्ताहरू र AI इन्जिनियरहरूका लागि सबै डक्युमेन्टमा:
  - `docs/chapter-01-foundation/azd-basics.md` — Extensions र AI Commands सेक्सनमा Lifecycle तालिका (scaffold → test → measure → improve → inspect → clean up) थपियो
  - `docs/chapter-08-production/production-ai-practices.md` — नयाँ "Managing the Agent Lifecycle" खण्ड जसले `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, र `delete --force` समेट्छ
  - `resources/cheat-sheet.md` — AI Agent Commands विस्तार: `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, र `delete --force`
- **🧩 नयाँ preview extensions** दस्तावेज गरिएको: `azure.ai.skills` (reusable agent skills) र `azure.ai.connections` (Foundry connections) extensions तालिका र cheat sheet मा थपियो
- **⏱️ प्रतिक्रिया-समय मार्गदर्शन** — `azd ai agent invoke` का उदाहरणहरूले अब कुल लेटेन्सी र time-to-first-byte प्रिन्ट गर्ने कुरा उल्लेख गर्छ
- **📌 भर्सन ब्यानर** मूल README मा सिक्नेहरूलाई `azd version` र `azd upgrade` तर्फ निर्देशित गर्दै थपियो

#### परिर्वतन गरिएको
- **✅ मान्यकरण आधार रेखा अपडेट गरियो** `azd 1.23.12` (March 2026) बाट `azd 1.25.6` (June 2026) मा सबै अध्याय README र कार्यशाला डकमा
- **🤖 अध्याय 2 extension नोट** `azure.ai.agents` `0.1.18-preview` बाट `0.1.40-preview` मा अपडेट गरियो
- **🧪 कार्यशाला मान्यकरण उदाहरण** (`azd version` आउटपुट) `1.25.6` मा अपडेट गरियो
- **🧭 README "What's New in azd Today"** अपडेट गरियो ताकि end-to-end एजेन्ट लाइफसाइकल, नयाँ AI extensions, र हालैका गुणवत्ता-जीवन सुधारहरू (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt) हाइलाइट होस
- **📖 अध्याय 2 agents.md (Option 4)** अब सिक्नेहरूलाई post-deploy लाइफसाइकल कमाण्डहरू तर्फ निर्देश गर्दछ, `azd up` मा रोकिँदैन

#### समाधान गरियो
- **🏷️ उत्पादन नामकरण** — Aspire रब्रान्ड नोट थपियो (".NET Aspire" अब मात्र "Aspire"); azd को Aspire समर्थन अपरिवर्तित छ
- **🔎 लाइभ रिलिज मान्यकरण** Azure Developer CLI रिलिज फीड विरुद्ध पुष्टि गरियो: स्थिर CLI `1.25.6` (2026-06-12) र `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### अपडेट गरिएका फाइलहरू
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
#### सुरुवाती मार्गदर्शन स्पष्टिकरण, सेटअप मान्यकरण र अन्तिम AZD कमाण्ड सरसफाइ
**यो संस्करण AZD 1.23 मान्यकरण स्वीपको पछिल्लो कार्य हो र सुरुकर्तामुखी दस्तावेजीकरण पास समावेश गर्दछ: यसले AZD-प्राथमिक प्रमाणीकरण मार्गदर्शन स्पष्ट गर्छ, स्थानीय सेटअप मान्यकरण स्क्रिप्टहरू थप्छ, मुख्य कमाण्डहरू प्रत्यक्ष AZD CLI सँग प्रमाणित गर्छ, र changelog बाहेकको अन्तिम पुरानो अंग्रेजी-मूल कमाण्ड सन्दर्भहरू हटाउँछ।**

#### थपियो
- **🧪 सुरुकर्ताका लागि सेटअप मान्यकरण स्क्रिप्टहरू** with `validate-setup.ps1` and `validate-setup.sh` ताकि सिक्नेहरूले अध्याय 1 सुरु गर्नु अघि आवश्यक उपकरणहरू पुष्टि गर्न सकून्
- **✅ सुरुमा सेटअप मान्यकरण कदमहरू** रुट README र अध्याय 1 README मा ताकि आवश्यक पूर्वशर्तहरू `azd up` भन्दा पहिले समातिन सकोस्

#### परिवर्तन गरियो
- **🔐 सुरुकर्ताका लागि प्रमाणिकरण मार्गदर्शन** अब सुस्पष्ट रूपमा `azd auth login` लाई AZD कार्यप्रवाहहरूको प्राथमिक मार्गको रूपमा मान्छ, र `az login` लाई वैकल्पिकको रूपमा उल्लेख गरिन्छ जबसम्म Azure CLI कमाण्डहरू प्रत्यक्ष रूपमा प्रयोग हुँदैनन्
- **📚 अध्याय 1 ऑनबोर्डिङ प्रवाह** अब सिक्नेहरूलाई स्थापना, प्रमाणिकरण, र पहिलो परिनियोजन कदमहरू अघि आफ्नो स्थानीय सेटअप मान्यकरण गर्न निर्देशन गर्दछ
- **🛠️ मान्यकर्ता सन्देशहरू** अब AZD-मै सीमित सुरुकर्ताका मार्गका लागि अवरोधक आवश्यकताहरूलाई वैकल्पिक Azure CLI चेतावनीहरूबाट स्पष्ट रूपमा अलग गर्दछ
- **📖 कन्फिगरेसन, समस्या निराकरण, र उदाहरण दस्तावेजहरू** अब अनिवार्य AZD प्रमाणिकरण र वैकल्पिक Azure CLI साइन-इन बीच फरक गर्छ जहाँ पहिले दुवै प्रसंगबिन प्रस्तुत भएका थिए

#### सुधार गरियो
- **📋 बाँकी अंग्रेजी-मूल कमाण्ड सन्दर्भहरू** वर्तमान AZD स्वरूपमा अद्यावधिक गरियो, जस्तै cheat sheet मा `azd config show` र जहाँ Azure Portal अवलोकन मार्गदर्शन चाहिएको थियो त्यहाँ `azd monitor --overview`
- **🧭 अध्याय 1 का सुरुकर्ता दाबीहरू** सबै टेम्पलेट र Azure स्रोतहरूमा सुनिश्चित शून्य-त्रुटि वा रोलब्याक व्यवहारको बारेमा बढी वाच्य नगर्नको लागि नरम गरिएको छ
- **🔎 प्रत्यक्ष CLI मान्यकरण** ले हालको समर्थन सुनिश्चित गर्यो: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, र `azd down --force --purge`

#### अद्यावधिक गरिएका फाइलहरू
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

#### AZD 1.23.12 Validation, Workshop Environment Expansion & AI Model Refresh
**यो संस्करण दस्तावेजीकरणलाई `azd` `1.23.12` विरुद्ध मान्यकरण स्वीप गर्छ, पुराना AZD कमाण्ड उदाहरणहरू अद्यावधिक गर्छ, AI मोडल मार्गदर्शनलाई हालका डिफल्टहरूमा रिफ्रेश गर्छ, र कार्यशाला निर्देशहरूलाई GitHub Codespaces थपेर dev containers र स्थानीय क्लोनहरूलाई पनि समर्थन गर्ने गरी विस्तार गर्छ।**

#### थपियो
- **✅ कोर अध्यायहरू र कार्यशाला दस्तावेजहरूमा मान्यकरण नोट्स** ताकि परीक्षण गरिएको AZD आधाररेखा नयाँ वा पुराना CLI बिल्डहरू प्रयोग गर्दै सिक्नेहरूका लागि स्पष्ट होस्
- **⏱️ लामो समयसम्म चल्ने AI एप परिनियोजनहरूका लागि टाइमआउट मार्गदर्शन** `azd deploy --timeout 1800` प्रयोग गर्दा
- **🔎 एक्सटेन्सन निरीक्षण कदमहरू** AI कार्यप्रवाह दस्तावेजहरूमा `azd extension show azure.ai.agents` सँग
- **🌐 अधिक व्यापक कार्यशाला वातावरण मार्गदर्शन** GitHub Codespaces, dev containers, र स्थानीय क्लोनहरूलाई MkDocs सँग समेट्दै

#### परिवर्तन गरियो
- **📚 अध्याय परिचय READMEs** अब आधारभूत, कन्फिगरेसन, इन्फ्रास्ट्रक्चर, मल्टि-एजेन्ट, प्रि-डिप्लोयमेन्ट, ट्रबलशुटिङ, र प्रोडक्सन सेक्सनहरूमा `azd 1.23.12` विरुद्ध मान्यकरणलाई सुसंगत रूपमा नोट गर्छ
- **🛠️ AZD कमाण्ड सन्दर्भहरू** दस्तावेजभरि वर्तमान स्वरूपमा अद्यावधिक गरियो:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` वा `azd env get-value(s)` प्रसंग अनुसार
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` जहाँ Application Insights अवलोकन चाहिएको हो
- **🧪 Provision preview उदाहरणहरू** हाल समर्थित प्रयोगमा सरल बनाइयो, जस्तै `azd provision --preview` र `azd provision --preview -e production`
- **🧭 कार्यशाला प्रवाह** अद्यावधिक गरियो ताकि सिक्नेहरूले Codespaces, dev container, वा स्थानीय क्लोनमा ल्याब पूरा गर्न सकून्, Codespaces मात्र मान्ने सन्दर्भ हटाइयो
- **🔐 प्रमाणीकरण मार्गदर्शन** अब AZD कार्यप्रवाहहरूको लागि `azd auth login` लाई प्राथमिक तरिका मान्छ, र Azure CLI कमाण्डहरू प्रत्यक्ष प्रयोग गर्दा मात्र `az login` वैकल्पिकको रूपमा राखिन्छ

#### सुधार गरियो
- **🪟 विंडोज इन्स्टल कमाण्डहरू** स्थापना गाइडमा हालको `winget` प्याकेज केसिङमा सामान्यीकरण गरियो
- **🐧 लिनक्स इन्स्टल मार्गदर्शन** वितरण-विशेष अनसमर्थित `azd` प्याकेज म्यानेजर निर्देशनहरू हटाएर आवश्यक अनुसार रिलिज एसेटहरूतर्फ संकेत गर्न सुधार गरियो
- **📦 AI मोडल उदाहरणहरू** पुराना डिफल्टहरू जस्तै `gpt-35-turbo` र `text-embedding-ada-002` बाट हालका उदाहरणहरू जस्तै `gpt-4.1-mini`, `gpt-4.1`, र `text-embedding-3-large` मा रिफ्रेश गरियो
- **📋 परिनियोजन र डायग्नोस्टिक्स स्निपेटहरू** लग, स्क्रिप्ट, र ट्रबलशुटिङ कदमहरूमा हालको वातावरण र स्थिति कमाण्ड प्रयोग गर्न ठीक गरियो
- **⚙️ GitHub Actions मार्गदर्शन** `Azure/setup-azd@v1.0.0` बाट `Azure/setup-azd@v2` मा अद्यावधिक गरियो
- **🤖 MCP/Copilot सहमति मार्गदर्शन** `azd mcp consent` बाट `azd copilot consent list` मा अद्यावधिक गरियो

#### सुधार गरिएको
- **🧠 AI अध्याय मार्गदर्शन** अब preview-संवेदनशील `azd ai` व्यवहार, टेन्यान्ट-विशेष लगइन, हालको एक्सटेन्सन प्रयोग, र अद्यावधिक मोडल परिनियोजन सिफारिसहरू राम्रोसँग व्याख्या गर्छ
- **🧪 कार्यशाला निर्देशहरू** अब बढी वास्तविक संस्करण उदाहरणहरू र हात-ऑन ल्याबहरूको लागि स्पष्ट वातावरण सेटअप भाषा प्रयोग गर्छन्
- **📈 प्रोडक्सन र ट्रबलशुटिङ दस्तावेजहरू** हालको अनुगमन, फ्यालब्याक मोडल, र लागत-टियर उदाहरणसँग राम्रोसँग मेल खान्छन्

#### अद्यावधिक गरिएका फाइलहरू
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

#### AZD AI CLI Commands, Content Validation & Template Expansion
**यो संस्करणले `azd ai`, `azd extension`, र `azd mcp` कमाण्ड कभरेज सबै AI-सम्बन्धी अध्यायहरूमा थप्छ, agents.md मा टुटेका लिङ्क र Deprecated कोड सच्याउँछ, cheat sheet अद्यावधिक गर्छ, र Example Templates सेक्सनलाई मान्य गरिएको विवरण र नयाँ Azure AI AZD टेम्पलेटहरू सहित पुनःनिर्माण गर्छ।**

#### थपियो
- **🤖 AZD AI CLI कभरेज** 7 फाइलहरूमा (पहिलेदेखि मात्र अध्याय 8 मा थियो):
  - `docs/chapter-01-foundation/azd-basics.md` — नयाँ "Extensions and AI Commands" खण्ड जसले `azd extension`, `azd ai agent init`, र `azd mcp` परिचय गराउँछ
  - `docs/chapter-02-ai-development/agents.md` — विकल्प 4: `azd ai agent init` टेम्पलेट बनाम म्यानिफेस्ट दृष्टिकोणको तुलना तालिकासहित
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" र "Agent-First Deployment" उपखण्डहरू
  - `docs/chapter-05-multi-agent/README.md` — क्विक स्टार्टले अब टेम्पलेट र म्यानिफेस्ट-आधारित दुबै परिनियोजन पथहरू देखाउँछ
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy सेक्सनले अब `azd ai agent init` विकल्प समावेश गर्दछ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" उपखण्ड
  - `resources/cheat-sheet.md` — नयाँ "AI & Extensions Commands" सेक्सन `azd extension`, `azd ai agent init`, `azd mcp`, र `azd infra generate` सँग
- **📦 नयाँ AZD AI उदाहरण टेम्पलेटहरू** `microsoft-foundry-integration.md` मा:
  - **azure-search-openai-demo-csharp** — .NET RAG chat Blazor WebAssembly, Semantic Kernel, र भ्वाइस च्याट समर्थनसहित
  - **azure-search-openai-demo-java** — Langchain4J प्रयोग गर्ने Java RAG chat जसले ACA/AKS परिनियोजन विकल्पहरू समर्थन गर्छ
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, र Prompty प्रयोग गर्ने मल्टि-एजेन्ट क्रिएटिभ लेखन एप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB प्रयोग गरेर सर्वरलेस RAG र Ollama स्थानीय विकास समर्थनसहित
  - **chat-with-your-data-solution-accelerator** — प्रशासन पोर्टल, Teams एकीकरण, र PostgreSQL/Cosmos DB विकल्पहरूसहित एन्त्रप्राइ즈 RAG एक्सेलेरेटर
  - **azure-ai-travel-agents** — मल्टि-एजेन्ट MCP अर्गेस्ट्रेसन सन्दर्भ एप जसमा .NET, Python, Java, र TypeScript मा सर्भरहरू छन्
  - **azd-ai-starter** — न्यूनतम Azure AI इन्फ्रास्ट्रक्चर Bicep स्टार्टर टेम्पलेट
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### सुधार गरियो
- **🔗 agents.md नेभिगेसन**: Previous/Next लिङ्कहरू अब Chapter 2 README को पाठ्यक्रम क्रममा मेल खान्छन् (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md टुटेका लिङ्कहरू**: `production-ai-practices.md` लाई `../chapter-08-production/production-ai-practices.md` मा ठीक गरियो (3 occurrences)
- **📦 agents.md deprecated कोड**: `opencensus` लाई `azure-monitor-opentelemetry` + OpenTelemetry SDK बाट प्रतिस्थापित गरियो
- **🐛 agents.md अमान्य API**: `max_tokens` लाई `create_agent()` बाट `create_run()` मा `max_completion_tokens` को रूपमा सारियो
- **🔢 agents.md टोकन गणना**: मोटामोटा `len//4` अनुमानलाई `tiktoken.encoding_for_model()` प्रयोग गरेर बदलियो
- **azure-search-openai-demo**: सेवाहरूलाई "Cognitive Search + App Service" बाट "Azure AI Search + Azure Container Apps" मा सुधार गरियो (अक्टुबर 2024 बाट डिफल्ट होस्ट परिवर्तन)
- **contoso-chat**: विवरणलाई Azure AI Foundry + Prompty सन्दर्भमा अद्यावधिक गरियो, जसले रिपोको वास्तविक शीर्षक र टेक स्ट्याकसँग मेल खान्छ

#### हटाइएको
- **ai-document-processing**: गैर-कार्यशील टेम्पलेट सन्दर्भ हटाइएको (रिपो सार्वजनिक रूपमा AZD टेम्पलेटको रूपमा पहुँचयोग्य छैन)

#### सुधार गरिएको
- **📝 agents.md अभ्यासहरू**: Exercise 1 अब अपेक्षित आउटपुट र `azd monitor` चरण देखाउँछ; Exercise 2 मा पूर्ण `FunctionTool` दर्ता कोड समावेश गरिएको छ; Exercise 3 अस्पष्ट मार्गदर्शनलाई ठोस `prepdocs.py` कमाण्डहरूले बदलिएको छ
- **📚 agents.md स्रोतहरू**: दस्तावेज लिङ्कहरू हालका Azure AI Agent Service डकुमेन्टेसन र क्विकस्टार्टमा अद्यावधिक गरियो
- **📋 agents.md Next Steps तालिका**: पूरा अध्याय कभरको लागि AI Workshop Lab लिंक थपियो

#### अद्यावधिक गरिएका फाइलहरू
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### पाठ्यक्रम नेभिगेशन सुधार
**यो संस्करणले README.md अध्याय नेभिगेशनलाई एक उन्नत तालिका ढाँचाको साथ सुधार गर्दछ।**

#### परिवर्तन
- **पाठ्यक्रम नक्सा तालिका**: प्रत्यक्ष पाठ लिङ्कहरू, अवधि अनुमान, र जटिलता रेटिङहरू सहित सुधार गरिएको
- **फोल्डर क्लिनअप**: अनावश्यक पुराना फोल्डरहरू हटाइयो (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **लिङ्क प्रमाणीकरण**: Course Map तालिकामा रहेका सबै 21+ आन्तरिक लिङ्कहरू प्रमाणित गरियो

### [v3.16.0] - 2026-02-05

#### उत्पादन नाम अद्यावधिक
**यो संस्करणले उत्पादन सन्दर्भहरू हालको Microsoft ब्राण्डिङ अनुसार अद्यावधिक गर्दछ।**

#### परिवर्तन
- **Microsoft Foundry → Microsoft Foundry**: सबै सन्दर्भहरू अनुवाद नभएका फाईलहरूमा अद्यावधिक गरियो
- **Azure AI Agent Service → Foundry Agents**: सेवा नाम हालको ब्राण्डिङ प्रतिबिम्बित गर्न अद्यावधिक गरियो

#### अद्यावधिक फाइलहरू
- `README.md` - मुख्य पाठ्यक्रम ल्यान्डिङ पृष्ठ
- `changelog.md` - संस्करण इतिहास
- `course-outline.md` - पाठ्यक्रम संरचना
- `docs/chapter-02-ai-development/agents.md` - AI एजेन्ट गाइड
- `examples/README.md` - उदाहरण दस्तावेज
- `workshop/README.md` - कार्यशाला ल्यान्डिङ पृष्ठ
- `workshop/docs/index.md` - कार्यशाला सूची
- `workshop/docs/instructions/*.md` - सबै कार्यशाला निर्देशन फाइलहरू

---

### [v3.15.0] - 2026-02-05

#### प्रमुख रिपोजिटरी पुनःसंरचनाः अध्याय-आधारित फोल्डर नामहरू
**यस संस्करणले प्रष्ट नेभिगेसनका लागि दस्तावेजहरू समर्पित अध्याय फोल्डरहरूमा पुनर्संरचित गरेको छ।**

#### फोल्डर नाम परिवर्तनहरू
पुराना फोल्डरहरू अध्याय-संख्यामा नाम भएका फोल्डरहरूसँग बदलिएका छन्:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### फाइल माइग्रेशन
| फाइल | बाट | तिर |
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
  - सिकाइ उद्देश्यहरू र अवधि
  - विवरण सहितको पाठ तालिका
  - द्रुत सुरु आदेशहरू
  - अन्य अध्यायहरूमा नेभिगेसन

#### परिवर्तन
- **🔗 सबै आन्तरिक लिङ्कहरू अद्यावधिक गरियो**: दस्तावेजका सबै फाइलहरूमा 78+ पथहरू अद्यावधिक गरियो
- **🗺️ मुख्य README.md**: नयाँ अध्याय संरचनासहित Course Map अद्यावधिक गरियो
- **📝 examples/README.md**: अध्याय फोल्डरहरूसँग क्रस-रेफरेन्सहरू अद्यावधिक गरियो

#### हटाइयो
- पुरानो फोल्डर संरचना हटाइयो (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रिपोजिटरी पुनर्संरचना: अध्याय नेभिगेसन
**यस संस्करणले अध्याय नेभिगेसन README फाइलहरू थप्यो (v3.15.0 द्वारा प्रतिस्थापित)।**

---

### [v3.13.0] - 2026-02-05

#### नयाँ AI एजेन्ट मार्गदर्शिका
**यस संस्करणले Azure Developer CLI प्रयोग गरी AI एजेन्टहरू डिप्लोय गर्न व्यापक मार्गदर्शिका थप्छ।**

#### थपियो
- **🤖 docs/microsoft-foundry/agents.md**: समग्र मार्गदर्शन समावेश गर्दछ:
  - AI एजेन्टहरू के हुन् र तिनीहरू च्याटबटहरूबाट कसरी फरक छन्
  - तीन द्रुत-स्टार्ट एजेन्ट टेम्पलेटहरू (Foundry Agents, Prompty, RAG)
  - एजेन्ट आर्किटेक्चर ढाँचाहरू (एकल एजेन्ट, RAG, बहु-एजेन्ट)
  - उपकरण कन्फिगरेसन र अनुकूलन
  - निगरानी र मेट्रिक्स ट्र्याकिङ
  - लागतका विचार र अनुकूलन
  - सामान्य समस्या निवारण परिदृश्यहरू
  - सफलताको मापदण्डसहित तीन व्यवहारिक अभ्यासहरू

#### सामग्री संरचना
- **परिचय**: शुरुवातीहरूको लागि एजेन्ट अवधारणाहरू
- **द्रुत सुरु**: `azd init --template get-started-with-ai-agents` संग एजेन्टहरू डिप्लोय गर्नुहोस्
- **आर्किटेक्चर ढाँचाहरू**: एजेन्ट ढाँचाहरूको दृश्यात्मक डायाग्रामहरू
- **कन्फिगरेसन**: उपकरण सेटअप र वातावरण भेरिएबलहरू
- **निगरानी**: Application Insights एकीकरण
- **अभ्यासहरू**: प्रगतिशील व्यवहारिक सिकाइ (हरेक 20-45 मिनेट)

---

### [v3.12.0] - 2026-02-05

#### DevContainer वातावरण अद्यावधिक
**यस संस्करणले AZD सिकाइ अनुभवको लागि आधुनिक उपकरणहरू र राम्रो पूर्वनिर्धारणहरूसहित विकास कन्टेनर कन्फिगरेसन अद्यावधिक गर्दछ।**

#### परिवर्तन
- **🐳 बेस इमेज**: `python:3.12-bullseye` बाट `python:3.12-bookworm` मा अद्यावधिक गरियो (नवीनतम Debian स्थिर)
- **📛 कन्टेनर नाम**: स्पष्टताका लागि "Python 3" बाट "AZD for Beginners" मा नाम परिवर्तन गरियो

#### थपियो
- **🔧 नयाँ Dev Container सुविधाहरू**:
  - `azure-cli` Bicep समर्थन सक्षम गरिएको
  - `node:20` (AZD टेम्पलेटहरूको लागि LTS संस्करण)
  - `github-cli` टेम्पलेट व्यवस्थापनका लागि
  - `docker-in-docker` कन्टेनर एप डिप्लोयमेन्टहरूको लागि

- **🔌 पोर्ट फर्वार्डिङ**: सामान्य विकासका लागि पूर्व-कन्फिगर गरिएको पोर्टहरू:
  - 8000 (MkDocs पूर्वावलोकन)
  - 3000 (वेब एप्स)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 नयाँ VS Code विस्तारहरू**:
  - `ms-python.vscode-pylance` - उन्नत Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - Bicep भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure स्रोत व्यवस्थापन
  - `yzhang.markdown-all-in-one` - Markdown सम्पादन
  - `DavidAnson.vscode-markdownlint` - Markdown लिन्टिङ
  - `bierner.markdown-mermaid` - Mermaid डायाग्राम समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml का लागि)
  - `eamodio.gitlens` - Git भिजुअलाइजेसन
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS Code सेटिङहरू**: Python इन्टरप्रेटर, फर्म्याट अन सेभ, र whitespace ट्रिमिङका लागि पूर्वनिर्धारित सेटिङहरू थपियो

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify प्लगइन थपियो
  - कोड गुणस्तरका लागि pre-commit थपियो
  - Azure SDK प्याकेजहरू थपियो (azure-identity, azure-mgmt-resource)

#### समाधान गरियो
- **पोस्ट-क्रिएट कमाण्ड**: अब कन्टेनर सुरु हुँदा AZD र Azure CLI स्थापना प्रमाणित गर्छ

---

### [v3.11.0] - 2026-02-05

#### शुरुवाती-अनुकूल README पुनरावलोकन
**यस संस्करणले README.md लाई शुरुवातीहरूको लागि धेरै पहुँचयोग्य बनाउँछ र AI विकासकर्ताहरूका लागि आवश्यक स्रोतहरू थप्दछ।**

#### थपियो
- **🆚 Azure CLI vs AZD तुलना**: कुन उपकरण कहिले प्रयोग गर्ने भन्ने स्पष्ट व्याख्या व्यावहारिक उदाहरणहरूसँग
- **🌟 Awesome AZD लिङ्कहरू**: समुदाय टेम्पलेट ग्यालरी र योगदान स्रोतहरूमा प्रत्यक्ष लिङ्कहरू:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तैनाथ गर्न तयार टेम्पलेटहरू
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदाय योगदान
- **🎯 छिटो सुरु मार्गदर्शिका**: सरल 3-चरणीय सुरु गर्ने खण्ड (Install → Login → Deploy)
- **📊 अनुभव-आधारित नेभिगेसन तालिका**: विकासकर्ता अनुभवको आधारमा कहाँबाट सुरु गर्ने स्पष्ट मार्गदर्शन

#### परिवर्तन
- **README संरचना**: क्रमिक प्रकटीकरणको लागि पुन:व्यवस्थित - मुख्य जानकारी पहिले
- **परिचय खण्ड**: पूर्ण शुरुवातीहरूका लागि "The Magic of `azd up`" व्याख्या गर्न पुनर्लेखन गरिएको
- **दोहोरो सामग्री हटाइयो**: दोहोरिएको समस्या निवारण खण्ड हटाइयो
- **समस्या निवारण कमाण्डहरू**: `azd logs` सन्दर्भलाई मान्य `azd monitor --logs` प्रयोग गर्न ठीक गरियो

#### समाधान गरियो
- **🔐 प्रमाणीकरण कमाण्डहरू**: `azd auth login` र `azd auth logout` cheat-sheet.md मा थपियो
- **अवैध कमाण्ड सन्दर्भहरू**: README समस्या निवारण खण्डबाट बाँकी रहेका `azd logs` हटाइयो

#### नोटहरू
- **क्षेत्र**: परिवर्तनहरू मुख्य README.md र resources/cheat-sheet.md मा लागू गरियो
- **लक्षित दर्शक**: सुधारहरू विशेष रूपमा AZD मा नयाँ विकासकर्ताहरूलाई लक्षित

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI कमाण्ड शुद्धता अद्यावधिक
**यस संस्करणले दस्तावेजहरूभर गैर-अवस्थित AZD कमाण्डहरू सच्याउँछ, जसले सबै कोड उदाहरणहरू वैध Azure Developer CLI सिन्ट्याक्स प्रयोग गर्न सुनिश्चित गर्छ।**

#### समाधान गरियो
- **🔧 अस्तित्वहीन AZD कमाण्डहरू हटाइयो**: अवैध कमाण्डहरूको व्यापक अडिट र सुधार:
  - `azd logs` (अस्तित्वमा छैन) → `azd monitor --logs` वा Azure CLI विकल्पहरूसँग प्रतिस्थापित
  - `azd service` सबकमाण्डहरू (अस्तित्वमा छैनन्) → `azd show` र Azure CLI सँग प्रतिस्थापित
  - `azd infra import/export/validate` (अस्तित्वमा छैनन्) → हटाइयो वा वैध विकल्पहरूसँग प्रतिस्थापित
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` झण्डाहरू (अस्तित्वमा छैनन्) → हटाइयो
  - `azd provision --what-if/--rollback` झण्डाहरू (अस्तित्वमा छैनन्) → `--preview` प्रयोगमा अद्यावधिक गरियो
  - `azd config validate` (अस्तित्वमा छैन) → `azd config list` सँग प्रतिस्थापित
  - `azd info`, `azd history`, `azd metrics` (अस्तित्वमा छैनन्) → हटाइयो

- **📚 कमाण्ड सुधारसहित अद्यावधिक गरिएका फाइलहरू**:
  - `resources/cheat-sheet.md`: कमाण्ड सन्दर्भको ठूलो सुधार
  - `docs/deployment/deployment-guide.md`: रोलब्याक र डिप्लोयमेन्ट रणनीतिहरू ठीक गरियो
  - `docs/troubleshooting/debugging.md`: लग विश्लेषण खण्डहरू सुधारियो
  - `docs/troubleshooting/common-issues.md`: समस्या निवारण कमाण्डहरू अद्यावधिक गरियो
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिङ खण्ड सुधारियो
  - `docs/getting-started/azd-basics.md`: निगरानी कमाण्डहरू सुधारियो
  - `docs/getting-started/first-project.md`: निगरानी र डिबगिङ उदाहरणहरू अद्यावधिक गरियो
  - `docs/getting-started/installation.md`: हेल्प र भर्सन उदाहरणहरू ठीक गरियो
  - `docs/pre-deployment/application-insights.md`: लग हेर्ने कमाण्डहरू सुधारियो
  - `docs/pre-deployment/coordination-patterns.md`: एजेन्ट डिबगिङ कमाण्डहरू सुधारियो

- **📝 भर्सन सन्दर्भ अद्यावधिक गरिएको**: 
  - `docs/getting-started/installation.md`: हार्डकोड गरिएको `1.5.0` भर्सनलाई सामान्य `1.x.x` मा परिवर्तन गरियो र रिलिजहरूमा लिंक थपियो

#### परिवर्तन
- **रोलब्याक रणनीतिहरू**: AZD सँग नेटिभ रोलब्याक नहुँदा Git-आधारित रोलब्याक प्रयोग गर्न दस्तावेज अद्यावधिक गरियो
- **लग हेर्ने**: `azd logs` सन्दर्भहरूलाई `azd monitor --logs`, `azd monitor --live`, र Azure CLI कमाण्डहरूसँग प्रतिस्थापित गरियो
- **प्रदर्शन खण्ड**: अस्तित्वमा नभएका parallel/incremental deployment झण्डाहरू हटाइयो, वैध विकल्पहरू प्रदान गरियो

#### प्राविधिक विवरणहरू
- **वैध AZD कमाण्डहरू**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **वैध azd monitor झण्डाहरू**: `--live`, `--logs`, `--overview`
- **हटाइएका सुविधाहरू**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### नोटहरू
- **पुष्टि**: कमाण्डहरू Azure Developer CLI v1.23.x सँग मिलाएर प्रमाणित गरियो

---

### [v3.9.0] - 2026-02-05

#### कार्यशाला समाप्ति र दस्तावेज गुणस्तर अद्यावधिक
**यस संस्करणले अन्तरक्रियात्मक कार्यशाला मोड्युलहरू पूरा गर्छ, सबै भंग भएका दस्तावेज लिङ्कहरू ठीक गर्छ, र Microsoft AZD प्रयोग गर्ने AI विकासकर्ताहरूका लागि समग्र सामग्री गुणस्तर सुधारछ।**

#### थपियो
- **📝 CONTRIBUTING.md**: नयाँ योगदान निर्देशिका दस्तावेज जसमा:
  - समस्याहरू रिपोर्ट गर्ने र परिवर्तन प्रस्ताव गर्ने स्पष्ट निर्देशहरू
  - नयाँ सामग्रीका लागि दस्तावेज मानकहरू
  - कोड उदाहरण मार्गनिर्देशन र कमिट मेसेज परम्पराहरू
  - समुदाय संलग्नता सम्बन्धी जानकारी

#### सम्पन्न
- **🎯 Workshop Module 7 (Wrap-up)**: Wrap-up मोड्युल पूर्ण रूपमा सम्पन्न गरिएको:
  - कार्यशाला उपलब्धिहरूको व्यापक सारांश
  - AZD, टेम्प्लेटहरू, र Microsoft Foundry समेट्ने मुख्य अवधारणाहरू
  - सिकाइ यात्रा जारी राख्ने सिफारिसहरू
  - कठिनाइ रेटिङ सहित कार्यशाला चुनौती अभ्यासहरू
  - समुदाय प्रतिक्रिया र समर्थन लिंकहरू

- **📚 Workshop Module 3 (Deconstruct)**: सिकाइ उद्देश्यहरू अद्यावधिक गरियो:
  - GitHub Copilot सँग MCP सर्भरहरू सक्रिय गर्ने मार्गदर्शन
  - AZD टेम्प्लेट फोल्डर संरचनाको बुझाइ
  - Infrastructure-as-code (Bicep) संगठन शैलीहरू
  - ह्यान्ड्स-ऑन ल्याब निर्देशनहरू

- **🔧 Workshop Module 6 (Teardown)**: पूरा गरिएको:
  - स्रोत सरसफाइ र लागत व्यवस्थापन उद्देश्यहरू
  - सुरक्षित इन्फ्रास्ट्रक्चर डि-प्रोभिजनिङका लागि `azd down` प्रयोग
  - सॉफ्ट-डिलिट गरिएको cognitive services को पुन:प्राप्ति मार्गदर्शन
  - GitHub Copilot तथा Azure Portal का लागि बोनस अन्वेषण प्रवाहहरू

#### Fixed
- **🔗 Broken Link Fixes**: 15+ भित्री दस्तावेजीकरण लिंकहरू मर्मत गरियो:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md तर्फका पाथहरू फिक्स गरियो
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md र production-ai-practices.md का पाथहरू सच्याइयो
  - `docs/getting-started/first-project.md`: अवस्थित नभएको cicd-integration.md लाई deployment-guide.md ले प्रतिस्थापन गरियो
  - `examples/retail-scenario.md`: FAQ र troubleshooting गाइडका पाथहरू फिक्स गरियो
  - `examples/container-app/microservices/README.md`: कोर्स होम र deployment guide का पाथहरू सच्याइयो
  - `resources/faq.md` र `resources/glossary.md`: AI अध्याय सन्दर्भहरू अपडेट गरियो
  - `course-outline.md`: instructor guide र AI workshop lab सन्दर्भहरू फिक्स गरियो

- **📅 Workshop Status Banner**: "Under Construction" बाट सक्रिय कार्यशाला स्थितिमा परिवर्तन गरी February 2026 मिति अद्यावधिक गरियो

- **🔗 Workshop Navigation**: workshop README.md भित्रका भाँचिएका नेभिगेशन लिंकहरू जुन lab-1-azd-basics फोल्डरमा नहाँदै थिए तिनीहरू फिक्स गरियो

#### Changed
- **Workshop Presentation**: "under construction" चेतावनी हटाइयो, कार्यशाला अब पुरा र प्रयोगका लागि तयार छ
- **Navigation Consistency**: सुनिश्चित गरियो कि सबै कार्यशाला मोड्युलहरूमा सहि अन्त-मोड्युल नेभिगेशन छ
- **Learning Path References**: अध्याय क्रस-रेफरेन्सहरू microsoft-foundry सही पाथहरू प्रयोग गर्ने गरी अपडेट गरियो

#### Validated
- ✅ सबै अंग्रेजी मार्कडाउन फाइलहरूमा मान्य भित्री लिंकहरू छन्
- ✅ Workshop modules 0-7 सिकाइ उद्देश्यहरू सहित पूर्ण छन्
- ✅ अध्याय र मोड्युलहरू बीच नेभिगेशन सहि रूपमा काम गर्छ
- ✅ सामग्री Microsoft AZD प्रयोग गर्ने AI विकासकर्ताहरूका लागि उपयुक्त छ
- ✅ आरम्भिक-स्तरमैत्री भाषा र संरचना सम्पूर्ण दस्तावेजमा कायम गरिएको छ
- ✅ CONTRIBUTING.md ले समुदाय योगदानकर्ताहरूका लागि स्पष्ट मार्गनिर्देशन प्रदान गर्छ

#### Technical Implementation
- **Link Validation**: Automated PowerShell स्क्रिप्टले सबै .md भित्री लिंकहरू प्रमाणित गर्‍यो
- **Content Audit**: कार्यशालाको पूर्णता र आरम्भिक उपयुक्तता म्यानुअल रूपमा समीक्षा गरियो
- **Navigation System**: अध्याय र मोड्युल नेभिगेशन ढाँचाहरू सुसंगत रूपमा लागू गरियो

#### Notes
- **Scope**: परिवर्तनहरू केवल अंग्रेजी दस्तावेजीकरणमा मात्र लागू भएका छन्
- **Translations**: यस संस्करणमा अनुवाद फोल्डरहरू अद्यावधिक गरिएको छैन (स्वचालित अनुवाद पछि समिकरण हुनेछ)
- **Workshop Duration**: पूर्ण कार्यशालाले 3-4 घण्टाको ह्यान्ड्स-ऑन सिकाइ प्रदान गर्दछ

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**यस संस्करणले Application Insights एकीकरण, प्रमाणीकरण ढाँचाहरू, र उत्पादन तैनाथीकरणहरूको लागि बहु-एजेन्ट समन्वयमा व्यापक A-ग्रेड पाठहरू थपेको छ।**

#### Added
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-केन्द्रित तैनाथीकरण स्वत: प्राविजनिङसँग
  - Application Insights + Log Analytics का लागि पूर्ण Bicep टेम्प्लेटहरू
  - अनुकूल टेलीमेट्री सहित काम गर्ने Python अनुप्रयोगहरू (1,200+ लाइन)
  - AI/LLM निगरानी ढाँचाहरू (Microsoft Foundry Models टोकन/लागत ट्र्याकिङ)
  - 6 Mermaid आरेखहरू (वास्तुकला, वितरित ट्रेसिङ, टेलीमेट्री प्रवाह)
  - 3 ह्यान्ड्स-ऑन अभ्यास (अलर्टहरू, ड्यासबोर्डहरू, AI निगरानी)
  - Kusto प्रश्न उदाहरणहरू र लागत अनुकूलन रणनीतिहरू
  - लाइव मेट्रिक्स स्ट्रिमिङ र वास्तविक-समय डिबगिङ
  - उत्पादन-तयारी ढाँचाहरूसँग 40-50 मिनेट सिकाइ समय

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 प्रमाणीकरण ढाँचाहरू (connection strings, Key Vault, managed identity)
  - सुरक्षित तैनाथीकरणका लागि पूर्ण Bicep इन्फ्रास्ट्रक्चर टेम्प्लेटहरू
  - Azure SDK एकीकरण सहित Node.js एप्लिकेसन कोड
  - 3 पूर्ण अभ्यासहरू (managed identity सक्षम गर्ने, user-assigned identity, Key Vault rotation)
  - सुरक्षा सर्वोत्तम अभ्यासहरू र RBAC कन्फिगरेसनहरू
  - ट्रबलशुटिङ गाइड र लागत विश्लेषण
  - उत्पादन-तयारी पासवर्डलेस प्रमाणीकरण ढाँचाहरू

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 समन्वय ढाँचाहरू (sequential, parallel, hierarchical, event-driven, consensus)
  - पूर्ण orchestrator सेवा कार्यान्वयन (Python/Flask, 1,500+ लाइन)
  - 3 विशिष्ट एजेन्ट कार्यान्वयनहरू (Research, Writer, Editor)
  - message queuing का लागि Service Bus एकीकरण
  - वितरित प्रणालीहरूको लागि Cosmos DB स्टेट म्यानेजमेन्ट
  - एजेन्ट अन्तरक्रियाहरू देखाउने 6 Mermaid आरेखहरू
  - 3 उन्नत अभ्यास (timeout ह्यान्डलिङ, retry logic, circuit breaker)
  - लागत ब्रेकडाउन ($240-565/month) र अनुकूलन रणनीतिहरू
  - निगरानीका लागि Application Insights एकीकरण

#### Enhanced
- **Pre-deployment Chapter**: अब व्यापक निगरानी र समन्वय ढाँचाहरू समावेश गरिएको छ
- **Getting Started Chapter**: व्यवसायिक प्रमाणीकरण ढाँचाहरूले समृद्ध पारिएको छ
- **Production Readiness**: सुरक्षा देखि अव्जरभबिलिटीसम्म पूर्ण कवरेज
- **Course Outline**: अध्याय 3 र 6 मा नयाँ पाठहरू सन्दर्भ गर्ने गरी अपडेट गरिएको

#### Changed
- **Learning Progression**: कोर्समा सुरक्षा र निगरानीको राम्रो एकीकरण
- **Documentation Quality**: नयाँ पाठहरूमा सुसंगत A-ग्रेड मानकहरू (95-97%)
- **Production Patterns**: एन्त्रप्राइज तैनाथीकरणका लागि अन्त-देखि-अन्त कवरेज

#### Improved
- **Developer Experience**: विकासदेखि उत्पादन निगरानीसम्म स्पष्ट मार्ग
- **Security Standards**: प्रमाणीकरण र सिक्रेट्स म्यानेजमेन्टका व्यवसायिक ढाँचाहरू
- **Observability**: AZD सँग पूर्ण Application Insights एकीकरण
- **AI Workloads**: Microsoft Foundry Models र बहु-एजेन्ट प्रणालीहरूको लागि विशेष निगरानी

#### Validated
- ✅ सबै पाठहरूले पूर्ण काम गर्ने कोड समावेश गर्छन् (स्निपेट मात्र होइन)
- ✅ भिजुअल सिकाइका लागि Mermaid आरेखहरू (3 पाठमा जम्मा 19)
- ✅ मान्यताको चरणहरू सहित ह्यान्ड्स-ऑन अभ्यासहरू (जम्मा 9)
- ✅ उत्पादन-तयार Bicep टेम्प्लेटहरू `azd up` मार्फत तैनाथ गर्न योग्य
- ✅ लागत विश्लेषण र अनुकूलन रणनीतिहरू
- ✅ ट्रबलशुटिङ गाइडहरू र सर्वोत्तम अभ्यासहरू
- ✅ प्रमाणिकरण कमाण्डहरूसँग ज्ञान जाँच बिन्दुहरू

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - व्यापक निगरानी गाइड
- **docs/getting-started/authsecurity.md**: - व्यवसायिक सुरक्षा ढाँचाहरू
- **docs/pre-deployment/coordination-patterns.md**: - उन्नत बहु-एजेन्ट आर्किटेक्चरहरू
- **Overall New Content**: - सुसंगत उच्च-गुणस्तर मानकहरू

#### Technical Implementation
- **Application Insights**: Log Analytics + अनुकूल टेलीमेट्री + वितरित ट्रेसिङ
- **Authentication**: Managed Identity + Key Vault + RBAC ढाँचाहरू
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: लाइव मेट्रिक्स + Kusto प्रश्नहरू + अलर्टहरू + ड्यासबोर्डहरू
- **Cost Management**: स्याम्पलिङ रणनीतिहरू, रिटेन्शन नीतिहरू, बजेट नियन्त्रण

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**यस संस्करणले रिपोजिटरी भरि दस्तावेजीकरण गुणस्तर सुधार गरेको छ र gpt-4.1 च्याट इन्टरफेस सहित पूर्ण Microsoft Foundry Models डिप्लोयमेन्ट उदाहरण थपेको छ।**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Microsoft Foundry Models इन्फ्रास्ट्रक्चरको पूर्ण सेटअप (gpt-4.1 model deployment)
  - संवाद इतिहाससहित Python command-line च्याट इन्टरफेस
  - सुरक्षित API किज् भण्डारणका लागि Key Vault एकीकरण
  - टोकन प्रयोग ट्र्याकिङ र लागत अनुमान
  - रेट लिमिटिङ र एरर ह्यान्डलिङ
  - 35-45 मिनेट तैनाथीकरण मार्गदर्शन सहित व्यापक README
  - 11 उत्पादन-तयार फाइलहरू (Bicep टेम्प्लेटहरू, Python app, कन्फिगरेसन)
- **📚 Documentation Exercises**: कन्फिगरेसन गाइडमा ह्यान्ड्स-ऑन अभ्यासहरू थपियो:
  - Exercise 1: बहु-पर्यावरण कन्फिगरेसन (15 मिनेट)
  - Exercise 2: सिक्रेट म्यानेजमेन्ट अभ्यास (10 मिनेट)
  - स्पष्ट सफलता मापदण्ड र प्रमाणिकरण चरणहरू
- **✅ Deployment Verification**: deployment guide मा प्रमाणिकरण सेक्सन थपियो:
  - हेल्थ चेक प्रक्रियाहरू
  - सफलता मापदण्ड चेकलिस्ट
  - सबै तैनाथीकरण कमाण्डहरूको अपेक्षित आउटपुटहरू
  - छिटो ट्रबलशुटिङ संदर्भ

#### Enhanced
- **examples/README.md**: A-ग्रेड गुणस्तरमा अद्यावधिक (93%):
  - azure-openai-chat लाई सबै सम्बन्धित सेक्सनमा थपियो
  - स्थानीय उदाहरण गणना 3 बाट 4 मा अपडेट गरियो
  - AI Application Examples तालिकामा थपियो
  - Intermediate Users का लागि Quick Start मा समावेश गरियो
  - Microsoft Foundry Templates सेक्सनमा समावेश
  - Comparison Matrix र प्रविधि पत्ता लगाउने सेक्सनहरू अपडेट गरियो
- **Documentation Quality**: B+ (87%) → A- (92%) सम्म सुधार:
  - आवश्यक कमाण्ड उदाहरणहरूमा अपेक्षित आउटपुटहरू थपियो
  - कन्फिगरेसन परिवर्तनहरूको लागि प्रमाणिकरण चरणहरू समावेश गरियो
  - व्यवहारिक अभ्यासहरूसँग ह्यान्ड्स-ऑन सिकाइ बलियो बनाइयो

#### Changed
- **Learning Progression**: मध्यम स्तरका सिक्नेहरूका लागि AI उदाहरणहरूको राम्रो एकीकरण
- **Documentation Structure**: स्पष्ट परिणाम सहित अधिक कार्यान्वयनयोग्य अभ्यासहरू
- **Verification Process**: प्रमुख कार्यप्रवाहहरूमा स्पष्ट सफलता मापदण्ड थपियो

#### Improved
- **Developer Experience**: Microsoft Foundry Models डिप्लोयमेन्ट अब 35-45 मिनेटमा सम्पन्न हुन्छ (कठिन विकल्पहरूको तुलनामा 60-90 भन्दा कम)
- **Cost Transparency**: Microsoft Foundry Models उदाहरणका लागि स्पष्ट लागत अनुमान ($50-200/month)
- **Learning Path**: AI विकासकर्ताहरूका लागि azure-openai-chat सँग स्पष्ट प्रवेश बिन्दु
- **Documentation Standards**: अपेक्षित आउटपुट र प्रमाणिकरण चरणहरू सुसंगत

#### Validated
- ✅ Microsoft Foundry Models उदाहरण `azd up` सँग पूर्ण रूपमा कार्यरत
- ✅ सबै 11 कार्यान्वयन फाइलहरू सिन्ट्याक्टिक रूपमा सहि
- ✅ README निर्देशनहरू वास्तविक तैनाथीकरण अनुभवसँग मेल खान्छन्
- ✅ दस्तावेजीकरण लिंकहरू 8+ स्थानमा अपडेट गरियो
- ✅ Examples सूचीले 4 स्थानीय उदाहरणहरू सहि रूपमा प्रतिबिम्बित गर्छ
- ✅ तालिकाहरूमा कुनै दोहोरो बाह्य लिंक छैन
- ✅ सबै नेभिगेशन सन्दर्भहरू सहि

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps ढाँचा
- **Security**: Managed Identity तयार, Key Vault मा सिक्रेट्स
- **Monitoring**: Application Insights एकीकरण
- **Cost Management**: टोकन ट्र्याकिङ र प्रयोग अनुकूलन
- **Deployment**: सम्पूर्ण सेटअपका लागि एकल `azd up` कमाण्ड

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**यस संस्करणले Azure Developer CLI (AZD) प्रयोग गरेर उत्पादन-तयार कन्टेनर एप्लिकेसन तैनाथीकरण उदाहरणहरू व्यापक रूपमा थपेको छ, पूरै दस्तावेजीकरण र सिकाइ मार्गमा एकीकरण सहित।**

#### Added
- **🚀 Container App Examples**: नयाँ स्थानीय उदाहरणहरू `examples/container-app/` मा:
  - [Master Guide](examples/container-app/README.md): कन्टेनराइज्ड तैनाथीकरणहरूको पूर्ण अवलोकन, क्विक स्टार्ट, उत्पादन, र उन्नत ढाँचाहरू
  - [Simple Flask API](../../examples/container-app/simple-flask-api): आरम्भिक-मैत्री REST API जसमा scale-to-zero, health probes, निगरानी, र ट्रबलशुटिङ समावेश
  - [Microservices Architecture](../../examples/container-app/microservices): उत्पादन-तयार बहु-सेवा तैनाथीकरण (API Gateway, Product, Order, User, Notification), असिंक्रोनस मेसेजिङ, Service Bus, Cosmos DB, Azure SQL, वितरित ट्रेसिङ, ब्लू-ग्रीन/क्यानेरी तैनाथीकरण
- **Best Practices**: सुरक्षा, निगरानी, लागत अनुकूलन, र CI/CD मार्गदर्शन कन्टेनरवर्कलोडहरूको लागि
- **Code Samples**: पूरा `azure.yaml`, Bicep टेम्प्लेटहरू, र बहु-भाषी सेवा कार्यान्वयनहरू (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: एन्ड-टु-एन्ड टेस्ट परिदृश्यहरू, निगरानी कमाण्डहरू, ट्रबलशुटिङ मार्गदर्शन

#### Changed
- **README.md**: “Local Examples - Container Applications” अन्तर्गत नयाँ container app उदाहरणहरू प्रदर्शन र लिंक गर्न अपडेट गरियो
- **examples/README.md**: container app उदाहरणहरू उच्चारण गर्न, तुलना तालिका प्रविष्टिहरू थप्न, र प्रविधि/वास्तुकला सन्दर्भहरू अपडेट गर्न बदलिए
- **Course Outline & Study Guide**: सम्बन्धित अध्यायहरूमा नयाँ container app उदाहरणहरू र तैनाथीकरण ढाँचाहरू सन्दर्भ गर्न अपडेट गरियो

#### Validated
- ✅ सबै नयाँ उदाहरणहरू `azd up` संग तैनाथ गर्न मिल्ने र सर्वोत्तम अभ्यासहरू अनुसरण गर्ने गरी सत्यापित
- ✅ दस्तावेजीकरण क्रस-लिंकहरू र नेभिगेशन अपडेट गरियो
- ✅ उदाहरणहरूले आरम्भिक देखि उन्नत परिदृश्यहरू कभर गर्छन्, उत्पादन माइक्रोसर्भिसहरूसहित

#### Notes
- **Scope**: अंग्रेजी दस्तावेजीकरण र उदाहरणहरू मात्र
- **Next Steps**: भविष्यका रिलिजमा थप उन्नत कन्टेनर ढाँचाहरू र CI/CD स्वचालन विस्तार गर्ने

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**यस संस्करणले सम्पूर्ण अंग्रेजी दस्तावेजीकरणभरि "Microsoft Foundry" नामको व्यापक ब्रान्ड परिवर्तन कार्यान्वयन गरेको छ।**

#### Changed
- **🔄 Product Name Update**: "Microsoft Foundry" मा पूर्ण रीब्राण्डिङ
  - `docs/` फोल्डरमा अंग्रेजी दस्तावेजीकरणभरि सबै सन्दर्भहरू अद्यावधिक गरियो
  - फोल्डर पुन:नामकरण: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - फाइलको नाम परिवर्तन गरियो: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - कुल: 7 डकुमेन्टेसन फाइलहरूमा जम्मा 23 सामग्री संदर्भहरू अपडेट गरियो

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` लाई `docs/microsoft-foundry/` मा नाम परिवर्तन गरियो
  - नयाँ फोल्डर संरचनालाई प्रतिबिम्बित गर्न सबै क्रस-रेफरेन्सहरू अपडेट गरियो
  - सबै डकुमेन्टेसनमा नेभिगेसन लिङ्कहरू प्रमाणित गरियो

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - सबै आन्तरिक लिङ्कहरू नयाँ फाइलनामलाई सन्दर्भ गर्न अपडेट गरियो

#### अपडेट गरिएका फाइलहरू
- **अध्याय डकुमेन्टेसन** (7 फाइलहरू):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 नेभिगेसन लिङ्क अपडेटहरू
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 उत्पादन नाम सन्दर्भहरू अपडेट गरियो
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पहिलेबाटै Microsoft Foundry प्रयोगमा रहेको (पछिल्ला अपडेटहरूबाट)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 सन्दर्भहरू अपडेट गरियो (अवलोकन, समुदायको प्रतिक्रिया, डकुमेन्टेसन)
  - `docs/getting-started/azd-basics.md` - 4 क्रस-रेफरेन्स लिङ्क अपडेटहरू
  - `docs/getting-started/first-project.md` - 2 अध्याय नेभिगेसन लिङ्क अपडेटहरू
  - `docs/getting-started/installation.md` - 2 अर्को अध्यायका लिङ्कहरू अपडेट गरियो
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 सन्दर्भहरू अपडेट गरियो (नेभिगेसन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - 1 नेभिगेसन लिङ्क अपडेट गरियो
  - `docs/troubleshooting/debugging.md` - 1 नेभिगेसन लिङ्क अपडेट गरियो

- **कोर्स संरचना फाइलहरू** (2 फाइलहरू):
  - `README.md` - 17 सन्दर्भहरू अपडेट गरियो (कोर्स अवलोकन, अध्याय शीर्षकहरू, टेम्पलेट सेक्सन, समुदाय अन्तर्दृष्टि)
  - `course-outline.md` - 14 सन्दर्भहरू अपडेट गरियो (अवलोकन, सिकाइ उद्देश्यहरू, अध्याय स्रोतहरू)

#### प्रमाणित
- ✅ अंग्रेजी डकुमेन्टेसनमा `ai-foundry` फोल्डर पथका कुनै अवशेष छैनन्
- ✅ अंग्रेजी डकुमेन्टेसनमा "Microsoft Foundry" उत्पादन नामका कुनै अवशेष छैनन्
- ✅ नयाँ फोल्डर संरचनासँग सबै नेभिगेसन लिङ्कहरू कार्यशील छन्
- ✅ फाइल र फोल्डर नाम परिवर्तन सफलतापूर्वक पूरा गरियो
- ✅ अध्यायहरूबीचको क्रस-रेफरेन्सहरू प्रमाणित गरियो

#### नोटहरू
- **परिधि**: परिवर्तनहरू केवल `docs/` फोल्डरमा रहेको अंग्रेजी डकुमेन्टेसनमा लागू गरियो
- **अनुवादहरू**: यस संस्करणमा अनुवाद फोल्डरहरू (`translations/`) अपडेट गरिएका छैनन्
- **कार्यशाला**: कार्यशाला सामग्रीहरू (`workshop/`) यस संस्करणमा अपडेट गरिएका छैनन्
- **उदाहरणहरू**: उदाहरण फाइलहरूले अझै पुरानो नामकरणलाई सन्दर्भ गर्न सक्छन् (भविष्यको अपडेटमा सम्बोधन गरिनेछ)
- **बाह्य लिङ्कहरू**: बाह्य URL हरू र GitHub रेपो सन्दर्भहरू अपरिवर्तित छन्

#### योगदानकर्ताहरूका लागि माइग्रेशन मार्गदर्शिका
यदि तपाईंसँग स्थानीय ब्रान्चहरू वा पुरानो संरचनालाई सन्दर्भ गर्ने डकुमेन्टेसन छ भने:
1. फोल्डर सन्दर्भहरू अपडेट गर्नुहोस्: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फाइल सन्दर्भहरू अपडेट गर्नुहोस्: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पादन नाम परिवर्तन गर्नुहोस्: "Microsoft Foundry" → "Microsoft Foundry"
4. सबै आन्तरिक डकुमेन्टेसन लिङ्कहरू अझै काम गर्छन् कि भनेर प्रमाणित गर्नुहोस्

---

### [v3.4.0] - 2025-10-24

#### पूर्वाधार पूर्वावलोकन र प्रमाणीकरण सुधारहरू
**यस संस्करणले नयाँ Azure Developer CLI पूर्वावलोकन सुविधाको लागि व्यापक समर्थन परिचय गराउँछ र कार्यशाला प्रयोगकर्ताको अनुभव सुधार्छ।**

#### थप
- **🧪 azd provision --preview Feature Documentation**: नयाँ पूर्वाधार पूर्वावलोकन क्षमताको व्यापक कभर
  - चिट शीटमा कमाण्ड सन्दर्भ र प्रयोग उदाहरणहरू
  - प्राविजनिङ गाइडमा प्रयोगका केसहरू र लाभहरूसहित विस्तृत एकीकरण
  - सुरक्षित डिप्लोयमेन्ट प्रमाणीकरणका लागि प्रि-फ्लाइट जाँच एकीकरण
  - सुरक्षालाई प्राथमिकतामा राखेर डिप्लोयमेन्ट अभ्यासहरूसहितको सुरु गर्न मार्गदर्शक अपडेटहरू
- **🚧 Workshop Status Banner**: कार्यशाला विकास स्थिति जनाउने व्यावसायिक HTML ब्यानर
  - स्पष्ट प्रयोगकर्ता संवादका लागि ग्रेडियन्ट डिजाइन र निर्माण संकेतकहरू
  - पारदर्शिताका लागि अन्तिम अद्यावधिक समयस्ट्याम्प
  - सबै उपकरण प्रकारका लागि मोबाइल-रेस्पोन्सिभ डिजाइन

#### सुधारिएको
- **पूर्वाधार सुरक्षा**: डिप्लोयमेन्ट डकुमेन्टेसनभरि पूर्वावलोकन कार्यक्षमता एकीकृत गरियो
- **प्रि-डिप्लोयमेन्ट प्रमाणीकरण**: स्वचालित स्क्रिप्टहरूले अब पूर्वावलोकन परीक्षण समावेश गर्दछन्
- **डेभलपर वर्कफ्लो**: उत्कृष्ट अभ्यासको रूपमा पूर्वावलोकन समावेश गरेर कमाण्ड अनुक्रमहरू अपडेट गरियो
- **कार्यशाला अनुभव**: सामग्री विकास स्थितिहरू सम्बन्धी स्पष्ट अपेक्षाहरू सेट गरियो

#### परिवर्तनहरू
- **डिप्लोयमेन्ट उत्तम अभ्यासहरू**: पूर्वावलोकन-प्रथम वर्कफ्लो अब सिफारिस गरिएको दृष्टिकोण भयो
- **डकुमेन्टेसन प्रवाह**: सिकाइ प्रक्रियामा पूर्वाधार प्रमाणीकरणलाई अघि सारियो
- **कार्यशाला प्रस्तुतीकरण**: विकास समयरेखा सहित व्यावसायिक स्थिति संवाद

#### सुधार
- **सुरक्षा-प्रथम दृष्टिकोण**: डिप्लोयमेन्ट अघि पूर्वावलोकन मार्फत पूर्वाधार परिवर्तनहरू प्रमाणित गर्न सकिने भयो
- **दलीय सहकार्य**: पूर्वावलोकन नतिजाहरू समीक्षा र अनुमोदनका लागि साझा गर्न सकिन्छ
- **लागत अवेयरनेस**: प्राविजनिङ अघि स्रोतहरूको लागतको राम्रो बुझाइ
- **जोखिम न्यूनीकरण**: पूर्व प्रमाणीकरणमार्फत डिप्लोयमेन्ट असफलताहरू घटाइयो

#### प्राविधिक कार्यान्वयन
- **बहु-डकुमेन्ट एकीकरण**: पूर्वावलोकन सुविधा 4 प्रमुख फाइलहरूमा दस्तावेजित गरिएको
- **कमाण्ड ढाँचा**: डकुमेन्टेसनभरि सुसंगत सिन्ट्याक्स र उदाहरणहरू
- **श्रेष्ठ अभ्यास एकीकरण**: प्रमाणीकरण वर्कफ्लो र स्क्रिप्टहरूमा पूर्वावलोकन समावेश
- **दृश्य संकेतकहरू**: नयाँ सुविधाको खोजीयोग्यतालाई बढाउन स्पष्ट NEW फीचर मार्किङ

#### कार्यशाला पूर्वाधार
- **स्थिति संवाद**: ग्रेडियन्ट स्टाइलिंग सहित व्यावसायिक HTML ब्यानर
- **प्रयोगकर्ता अनुभव**: विकास स्थिति स्पष्ट भएपछि भ्रम घट्छ
- **व्यावसायिक प्रस्तुतीकरण**: अपेक्षाहरू सेट गर्दै रिपोजिटरीको विश्वासनीयता कायम राख्छ
- **समयरेखा पारदर्शिता**: जिम्मेवारी सुनिश्चित गर्न अक्टोबर 2025 अन्तिम अद्यावधिक टाइमस्ट्याम्प

### [v3.3.0] - 2025-09-24

#### सुधारिएको कार्यशाला सामग्री र अन्तरक्रियात्मक सिकाइ अनुभव
**यस संस्करणले ब्राउजर-आधारित अन्तरक्रियात्मक मार्गदर्शकहरू र संरचित सिकाइ पथहरू सहित व्यापक कार्यशाला सामग्रीहरू प्रस्तुत गर्दछ।**

#### थप
- **🎥 Interactive Workshop Guide**: MkDocs पूर्वावलोकन क्षमतासहित ब्राउजर-आधारित कार्यशाला अनुभव
- **📝 Structured Workshop Instructions**: पत्ता लगाउने देखि अनुकूलनसम्मको 7-स्टेप मार्गदर्शित सिकाइ पथ
  - 0-Introduction: कार्यशाला अवलोकन र सेटअप
  - 1-Select-AI-Template: टेम्पलेट पत्ता लगाउने र छनोट गर्ने प्रक्रिया
  - 2-Validate-AI-Template: डिप्लोयमेन्ट र प्रमाणीकरण प्रक्रियाहरू
  - 3-Deconstruct-AI-Template: टेम्पलेट आर्किटेक्चर बुझ्ने
  - 4-Configure-AI-Template: कन्फिगरेसन र अनुकूलन
  - 5-Customize-AI-Template: उन्नत संशोधन र पुनरावृत्ति
  - 6-Teardown-Infrastructure: क्लीनअप र स्रोत व्यवस्थापन
  - 7-Wrap-up: संक्षेप र अर्को कदमहरू
- **🛠️ Workshop Tooling**: बेहतर सिकाइ अनुभवको लागि Material थिमसहित MkDocs कन्फिगरेसन
- **🎯 Hands-On Learning Path**: 3-स्टेप विधि (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: सहज विकास वातावरण सेटअप

#### सुधारिएको
- **AI Workshop Lab**: 2-3 घण्टे संरचित सिकाइ अनुभवसहित विस्तार
- **कार्यशाला डकुमेन्टेसन**: नेभिगेसन र दृश्य सहायता सहित व्यावसायिक प्रस्तुतीकरण
- **सिकाइ क्रम**: टेम्पलेट छनोटदेखि उत्पादन डिप्लोयमेन्टसम्म स्पष्ट चरण-दर-चरण मार्गदर्शन
- **डेभलपर अनुभव**: समेकित उपकरणहरूद्वारा स्ट्रिमलाइन्ड विकास वर्कफ्लो

#### सुधार
- **पहुँचयोग्यता**: सर्च, कपी कार्यक्षमता, र थिम ट्गग्लसहित ब्राउजर-आधारित इन्टरफेस
- **आफ्नै गतिमा सिकाइ**: फरक सिक्ने गतिहरूलाई समायोज्य लचिलो कार्यशाला संरचना
- **व्यावहारिक अनुप्रयोग**: वास्तविक संसारका AI टेम्पलेट डिप्लोयमेन्ट परिदृश्यहरू
- **समुदाय एकीकरण**: कार्यशाला समर्थन र सहकार्यका लागि Discord एकीकरण

#### कार्यशाला सुविधाहरू
- **निहित सर्च**: छिटो कुञ्जीशब्द र पाठ खोज
- **कोड ब्लकहरू कपी गर्नुहोस्**: सबै कोड उदाहरणहरूको लागि hover-to-copy कार्यक्षमता
- **थिम ट्गग्ल**: फरक प्राथमिकताका लागि डार्क/लाइट मोड समर्थन
- **दृश्य सम्पत्ति**: बुझाइ बढाउनका लागि स्क्रीनशट र डायाग्रामहरू
- **सहायता एकीकरण**: समुदाय समर्थनका लागि प्रत्यक्ष Discord पहुँच

### [v3.2.0] - 2025-09-17

#### प्रमुख नेभिगेसन पुनर्संरचना र अध्याय-आधारित सिकाइ प्रणाली
**यस संस्करणले सम्पूर्ण रिपोजिटरीमा सुधारिएको नेभिगेसन सहित व्यापक अध्याय-आधारित सिकाइ संरचना प्रस्तुत गर्दछ।**

#### थप
- **📚 अध्याय-आधारित सिकाइ प्रणाली**: सम्पूर्ण कोर्सलाई 8 प्रगतिशील सिकाइ अध्यायहरूमा पुनर्संरचित गरियो
  - अध्याय 1: आधार र छिटो सुरु (⭐ - 30-45 मिनेट)
  - अध्याय 2: AI-First Development (⭐⭐ - 1-2 घण्टा)
  - अध्याय 3: कन्फिगरेसन र प्रमाणीकरण (⭐⭐ - 45-60 मिनेट)
  - अध्याय 4: इन्फ्रास्ट्रक्चर एज कोड र डिप्लोयमेन्ट (⭐⭐⭐ - 1-1.5 घण्टा)
  - अध्याय 5: बहु-एजेन्ट AI समाधानहरू (⭐⭐⭐⭐ - 2-3 घण्टा)
  - अध्याय 6: प्रि-डिप्लोयमेन्ट प्रमाणीकरण र योजना (⭐⭐ - 1 घण्टा)
  - अध्याय 7: ट्रबलशुटिङ र डिबगिङ (⭐⭐ - 1-1.5 घण्टा)
  - अध्याय 8: उत्पादन र एन्त्रप्राइज ढाँचाहरू (⭐⭐⭐⭐ - 2-3 घण्टा)
- **📚 समग्र नेभिगेसन प्रणाली**: सबै डकुमेन्टेसनमा सुसंगत नेभिगेसन हेडर र फुटर
- **🎯 प्रोग्रेस ट्र्याकिङ**: कोर्स पूरा गर्ने चेकलिस्ट र सिकाइ प्रमाणीकरण प्रणाली
- **🗺️ सिकाइ पथ मार्गदर्शन**: फरक अनुभव स्तर र लक्ष्यका लागि स्पष्ट प्रवेश बिन्दुहरू
- **🔗 क्रस-रेफरेन्स नेभिगेसन**: सम्बन्धित अध्यायहरू र प्रेरेक्विजाइटहरू स्पष्ट रूपमा लिङ्क गरिएको

#### सुधारिएको
- **README संरचना**: अध्याय-आधारित संगठन सहित संरचित सिकाइ प्लेटफर्ममा रूपान्तरण
- **डकुमेन्टेसन नेभिगेसन**: प्रत्येक पृष्ठमा अब अध्याय सन्दर्भ र प्रगति मार्गदर्शन समावेश
- **टेम्पलेट संगठन**: उदाहरणहरू र टेम्पलेटहरू उपयुक्त सिकाइ अध्यायसँग म्याप गरिएको
- **स्रोत एकीकरण**: चिट शीट, FAQs, र अध्ययन गाइडहरू सम्बन्धित अध्यायहरूसँग जोडिएका
- **कार्यशाला एकीकरण**: हात-देखि-हात प्रयोगशालाहरू बहु अध्याय सिकाइ उद्देश्यहरूसँग म्याप भएका

#### परिवर्तनहरू
- **सिकाइ प्रगति**: रेखीय डकुमेन्टेसनबाट लचिलो अध्याय-आधारित सिकाइमा सारियो
- **कन्फिगरेसन स्थान**: राम्रो सिकाइ प्रवाहका लागि कन्फिगरेसन गाइडलाई अध्याय 3 मा सारियो
- **AI सामग्री एकीकरण**: सिकाइ यात्राभरि AI-विशेष सामग्रीको राम्रो समेकन
- **उत्पादन सामग्री**: एन्त्रप्राइज सिक्नेहरूको लागि उन्नत ढाँचाहरू अध्याय 8 मा समाहित

#### सुधार
- **प्रयोगकर्ता अनुभव**: स्पष्ट नेभिगेसन ब्रेडक्रम्ब्स र अध्याय प्रगति संकेतकहरू
- **पहुँचयोग्यता**: सजिलो कोर्स यात्रा को लागी सुसंगत नेभिगेसन ढाँचा
- **व्यावसायिक प्रस्तुतीकरण**: शैक्षिक तथा कर्पोरेट तालिमका लागि उपयुक्त विश्वविद्यालय शैली कोर्स संरचना
- **सिकाइ दक्षता**: सुधारिएको संगठनद्वारा सम्बन्धित सामग्री फेला पार्ने समय घटाइएको

#### प्राविधिक कार्यान्वयन
- **नेभिगेसन हेडरहरू**: 40+ डकुमेन्टेसन फाइलहरूमा मानकीकृत अध्याय नेभिगेसन
- **फुटर नेभिगेसन**: सुसंगत प्रगति मार्गदर्शन र अध्याय पूरा गर्ने संकेतकहरू
- **क्रस-लिंकिङ**: सम्बन्धित अवधारणाहरू जडान गर्ने व्यापक आन्तरिक लिङ्किङ प्रणाली
- **अध्याय म्यापिङ**: टेम्पलेट र उदाहरणहरू स्पष्ट रूपमा सिकाइ उद्देश्यहरूसँग सम्बन्धित

#### अध्ययन गाइड सुधार
- **📚 समग्र सिकाइ उद्देश्यहरू**: 8-अध्याय प्रणालीसँग मिलेर अध्ययन गाइड पुनर्संरचित
- **🎯 अध्याय-आधारित मूल्याङ्कन**: प्रत्येक अध्यायमा विशिष्ट सिकाइ उद्देश्य र व्यावहारिक अभ्यासहरू
- **📋 प्रगति ट्र्याकिङ**: नापिने नतिजा र पूरा गर्ने चेकलिस्ट सहित साप्ताहिक सिकाइ तालिका
- **❓ मूल्याङ्कन प्रश्नहरू**: प्रत्येक अध्यायका लागि ज्ञान प्रमाणीकरण प्रश्नहरू र व्यावसायिक नतिजाहरू
- **🛠️ व्यावहारिक अभ्यासहरू**: वास्तविक डिप्लोयमेन्ट परिदृश्यहरूसँग हात-देखि-हात गतिविधिहरू
- **📊 सीप प्रगति**: आधारभूत अवधारणाहरूबाट एन्त्रप्राइज ढाँचाहरू सम्म स्पष्ट प्रगति
- **🎓 प्रमाणन फ्रेमवर्क**: व्यावसायिक विकास परिणाम र समुदाय मान्यता प्रणाली
- **⏱️ तालिका व्यवस्थापन**: माइलस्टोन प्रमाणीकरण सहित संरचित 10-साता सिकाइ योजना

### [v3.1.0] - 2025-09-17

#### सुधारिएको बहु-एजेन्ट AI समाधानहरू
**यस संस्करणले रिटेल बहु-एजेन्ट समाधानमा एजेन्ट नामकरण र डकुमेन्टेसन सुधार गर्दछ।**

#### परिवर्तनहरू
- **बहु-एजेन्ट शब्दावली**: स्पष्ट बुझाइका लागि "Cora agent" लाई "Customer agent" ले प्रतिस्थापित गरियो
- **एजेन्ट आर्किटेक्चर**: निरन्तर "Customer agent" नामकरण प्रयोग गर्न सबै डकुमेन्टेसन, ARM टेम्पलेटहरू, र कोड उदाहरणहरू अपडेट गरियो
- **कन्फिगरेसन उदाहरणहरू**: अपडेट गरिएको नामकरण संयोजनसहित आधुनिकीकृत एजेन्ट कन्फिगरेसन ढाँचाहरू
- **डकुमेन्टेसन निरन्तरता**: सबै सन्दर्भहरू व्यावसायिक, वर्णनात्मक एजेन्ट नामहरू प्रयोग गर्छन्

#### सुधारिएको
- **ARM Template Package**: Customer agent सन्दर्भहरूसहित retail-multiagent-arm-template अपडेट गरियो
- **आर्किटेक्चर डायाग्रामहरू**: अपडेट गरिएको एजेन्ट नामकरणसहित Mermaid डायाग्रामहरू रिफ्रेस गरियो
- **कोड उदाहरणहरू**: Python क्लासहरू र कार्यान्वयन उदाहरणहरू अब CustomerAgent नाम प्रयोग गर्दछन्
- **Environment Variables**: सबै डिप्लोयमेन्ट स्क्रिप्टहरू CUSTOMER_AGENT_NAME कनभेन्सन प्रयोग गर्ने गरी अपडेट गरियो

#### सुधार
- **डेभलपर अनुभव**: डकुमेन्टेसनमा स्पष्ट एजेन्ट भूमिका र जिम्मेवारीहरू
- **उत्पादन तत्परता**: एन्त्रप्राइज नामकरण कनभेन्सनसँग राम्रो समायोजन
- **सिकाइ सामग्री**: शैक्षिक उद्देश्यका लागि थप सहज एजेन्ट नामकरण
- **टेम्पलेट उपयोगिता**: एजेन्ट कार्य र डिप्लोयमेन्ट ढाँचाहरू बुझ्न सजिलो

#### प्राविधिक विवरण
- Mermaid आर्किटेक्चर डायाग्रामहरू CustomerAgent सन्दर्भहरूसहित अपडेट गरियो
- Python उदाहरणहरूमा CoraAgent क्लास नामहरू CustomerAgent सँग प्रतिस्थापित गरियो
- ARM टेम्पलेट JSON कन्फिगरेसनहरू "customer" एजेन्ट प्रकार प्रयोग गर्न संशोधित गरियो
- वातावरण चरहरू CORA_AGENT_* बाट CUSTOMER_AGENT_* ढाँचामा अपडेट गरियो
- सबै डिप्लोयमेन्ट कमाण्ड र कन्टेनर कन्फिगरेसनहरू रिफ्रेस गरियो

### [v3.0.0] - 2025-09-12

#### ठूला परिवर्तनहरू - AI डेभलपर केन्द्रित र Microsoft Foundry एकीकरण
**यस संस्करणले रिपोजिटरीलाई AI-केन्द्रित पूर्ण सिकाइ स्रोतमा रूपान्तरण गर्दछ र Microsoft Foundry एकीकरण समावेश गर्दछ।**

#### थप
- **🤖 AI-First Learning Path**: AI डेभलपर र इन्जिनियरहरूलाई प्राथमिकता दिने पूर्ण पुनर्संरचना
- **Microsoft Foundry Integration Guide**: AZD लाई Microsoft Foundry सेवासँग जडान गर्ने समग्र डकुमेन्टेसन
- **AI Model Deployment Patterns**: मोडेल चयन, कन्फिगरेसन, र उत्पादन डिप्लोयमेन्ट रणनीतिहरू समेट्ने विस्तृत गाइड
- **AI Workshop Lab**: 2-3 घण्टा व्यावहारिक कार्यशाला जुन AI अनुप्रयोगहरूलाई AZD-डिप्लोययोग्य समाधानमा रूपान्तरण गर्नका लागि
- **Production AI Best Practices**: स्केलिङ, मोनिटरिङ, र AI वर्कलोडहरूलाई सुरक्षा गर्ने एंटरप्राइज-तयार ढाँचाहरू
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services, र AI डिप्लोयमेन्ट समस्याहरूका लागि व्यापक ट्रबलशुटिङ
- **AI Template Gallery**: जटिलता रेटिङसहित Microsoft Foundry टेम्पलेटहरूको विशेष संग्रह
- **Workshop Materials**: व्यावहारिक ल्याबहरू र सन्दर्भ सामग्रीहरूसहित पूर्ण कार्यशाला संरचना

#### सुधारिएको
- **README Structure**: AI-डेभलपर-केन्द्रित जसमा Microsoft Foundry Discord बाट 45% समुदाय रुचिको डेटा समावेश
- **Learning Paths**: विद्यार्थी र DevOps इन्जिनियरहरूका परम्परागत मार्गहरूसँगसाथै समर्पित AI डेभलपर यात्रा
- **Template Recommendations**: azure-search-openai-demo, contoso-chat, र openai-chat-app-quickstart समावेश गरी प्रमुख AI टेम्पलेटहरू
- **Community Integration**: AI-विशेष च्यानल र छलफलहरूसहित सुदृढ Discord समुदाय समर्थन

#### सुरक्षा र उत्पादन फोकस
- **Managed Identity Patterns**: AI-विशेष प्रमाणीकरण र सुरक्षा कन्फिगरेसनहरू
- **Cost Optimization**: AI वर्कलोडहरूको लागि टोकन उपयोग ट्र्याकिङ र बजेट नियन्त्रणहरू
- **Multi-Region Deployment**: विश्वव्यापी AI अनुप्रयोग डिप्लोयमेन्टका रणनीतिहरू
- **Performance Monitoring**: AI-विशेष मेट्रिक्स र Application Insights एकीकरण

#### दस्तावेज गुणस्तर
- **Linear Course Structure**: शुरुवातीदेखि उन्नत AI डिप्लोयमेन्ट ढाँचासम्मको तर्कसंगत प्रगति
- **Validated URLs**: सबै बाह्य रिपोजिटरी लिंकहरू प्रमाणित र पहुँचयोग्य
- **Complete Reference**: सबै आन्तरिक दस्तावेज लिंकहरू प्रमाणित र कार्यशील
- **Production Ready**: वास्तविक-विश्व उदाहरणहरूसहित एंटरप्राइज डिप्लोयमेन्ट ढाँचाहरू

### [v2.0.0] - 2025-09-09

#### प्रमुख परिवर्तनहरू - रिपोजिटरी संरचना पुनर्संरचना र व्यावसायिक सुधार
**यो संस्करणले रिपोजिटरी संरचना र सामग्री प्रस्तुतीकरणमा महत्वपूर्ण समग्र परिमार्जन प्रतिनिधित्व गर्दछ।**

#### थपियो
- **Structured Learning Framework**: सबै दस्तावेज पृष्ठहरूले अब Introduction, Learning Goals, र Learning Outcomes खण्डहरू समावेश गर्छन्
- **Navigation System**: मार्गदर्शनकर्ता सिकाइ प्रगति को लागि सबै दस्तावेजहरूमा Previous/Next पाठ लिंकहरू थपियो
- **Study Guide**: सिकाइ लक्ष्यहरू, अभ्यास अभ्यासहरू, र मूल्याङ्कन सामग्रीहरूको साथ व्यापक study-guide.md
- **Professional Presentation**: पहुँचयोग्यता सुधार र व्यावसायिक देखिनको लागि सबै इमोजी आइकनहरू हटाइयो
- **Enhanced Content Structure**: सिकाइ सामग्रीहरूको संगठन र प्रवाहमा सुधार

#### परिवर्तन गरिएको
- **Documentation Format**: सबै दस्तावेजलाई सुसंगत सिकाइ-केन्द्रित संरचनासँग मानकीकृत गरियो
- **Navigation Flow**: सबै सिकाइ सामग्रीहरूमा तर्कसंगत प्रगति लागू गरियो
- **Content Presentation**: स्पष्ट, व्यावसायिक ढाँचाका लागि सजावटी तत्वहरू हटाइयो
- **Link Structure**: नयाँ नेभिगेसन प्रणाली समर्थन गर्न सबै आन्तरिक लिंकहरू अपडेट गरियो

#### सुधार गरियो
- **Accessibility**: स्क्रिन रिडर अनुकूलताको लागि इमोजी निर्भरतालाई हटाइयो
- **Professional Appearance**: एंटरप्राइज सिकाइको लागि उपयुक्त सफा, शैक्षिक-शैली प्रस्तुति
- **Learning Experience**: प्रत्येक पाठका लागि स्पष्ट उद्देश्य र नतिजासहित संरचित अभिगमन
- **Content Organization**: सम्बन्धित विषयबीच राम्रो तर्कसंगत प्रवाह र सम्बन्ध

### [v1.0.0] - 2025-09-09

#### प्रारम्भिक रिलिज - व्यापक AZD सिकाइ रिपोजिटरी

#### थपियो
- **Core Documentation Structure**
  - पूर्ण getting-started गाइड श्रृंखला
  - व्यापक डिप्लोयमेन्ट र प्रोभिजनिङ दस्तावेजहरू
  - विस्तृत ट्रबलशुटिङ स्रोतहरू र डिबगिङ गाइडहरू
  - पूर्व-डिप्लोयमेन्ट प्रमाणिकरण उपकरणहरू र प्रक्रियाहरू

- **Getting Started Module**
  - AZD आधारभूत: मूल अवधारणाहरू र शब्दावली
  - Installation Guide: प्लेटफर्म-विशिष्ट सेटअप निर्देशनहरू
  - Configuration Guide: वातावरण सेटअप र प्रमाणीकरण
  - First Project Tutorial: चरण-दर-चरण व्यावहारिक सिकाइ

- **Deployment and Provisioning Module**
  - Deployment Guide: पूर्ण वर्कफ्लो दस्तावेजीकरण
  - Provisioning Guide: Bicep संग Infrastructure as Code
  - उत्पादन डिप्लोयमेन्टहरूको लागि उत्तम अभ्यासहरू
  - बहु-सेवा आर्किटेक्चर ढाँचाहरू

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure स्रोत उपलब्धता प्रमाणिकरण
  - SKU Selection: व्यापक सेवा टियर मार्गदर्शन
  - Pre-flight Checks: स्वचालित प्रमाणिकरण स्क्रिप्टहरू (PowerShell र Bash)
  - लागत अनुमान र बजेट योजना उपकरणहरू

- **Troubleshooting Module**
  - Common Issues: साधारण रूपमा देखा पर्ने समस्या र समाधानहरू
  - Debugging Guide: प्रणालीगत ट्रबलशुटिङ मेथडोलोजीहरू
  - उन्नत डायग्नोस्टिक प्रविधिहरू र उपकरणहरू
  - प्रदर्शन निगरानी र अनुकूलन

- **Resources and References**
  - Command Cheat Sheet: आवश्यक कमाण्डहरूको छिटो सन्दर्भ
  - Glossary: व्यापक शब्दावली र संक्षेपाक्षर परिभाषाहरू
  - FAQ: साधारण प्रश्नहरूका विस्तृत उत्तरहरू
  - बाह्य स्रोत लिंकहरू र समुदाय सम्बन्धहरू

- **Examples and Templates**
  - सादा वेब अनुप्रयोग उदाहरण
  - स्टाटिक वेबसाइट डिप्लोयमेन्ट टेम्पलेट
  - कन्टेनर अनुप्रयोग कन्फिगरेसन
  - डेटाबेस एकीकरण ढाँचाहरू
  - माइक्रोसर्भिस आर्किटेक्चर उदाहरणहरू
  - सर्भरलेस फङ्क्शन कार्यान्वयनहरू

#### विशेषताहरू
- **Multi-Platform Support**: Windows, macOS, र Linux का लागि स्थापना र कन्फिगरेसन गाइडहरू
- **Multiple Skill Levels**: विद्यार्थीदेखि व्यावसायिक डेभलपरहरूसम्मका लागि डिजाइन गरिएको सामग्री
- **Practical Focus**: व्यावहारिक उदाहरणहरू र वास्तविक-विश्व परिदृश्यहरू
- **Comprehensive Coverage**: आधारभूत अवधारणाहरूदेखि उन्नत एंटरप्राइज ढाँचासम्म
- **Security-First Approach**: सुरक्षा सर्वोत्कृष्ट अभ्यासहरू समग्रमा समावेश गरिएका
- **Cost Optimization**: लागत-प्रभावकारी डिप्लोयमेन्ट र स्रोत व्यवस्थापनका लागि मार्गदर्शन

#### दस्तावेज गुणस्तर
- **Detailed Code Examples**: व्यावहारिक, परीक्षण गरिएको कोड नमूनाहरू
- **Step-by-Step Instructions**: स्पष्ट, कार्यान्वयनयोग्य मार्गदर्शन
- **Comprehensive Error Handling**: साधारण समस्याहरूको लागि ट्रबलशुटिङ
- **Best Practices Integration**: उद्योग मापदण्डहरू र सिफारिसहरू
- **Version Compatibility**: नविनतम Azure सेवाहरू र azd सुविधाहरू संग अद्यावधिक

## भविष्य योजना गरिएका सुधारहरू

### Version 3.1.0 (Planned)
#### AI प्लेटफर्म विस्तार
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, र कस्टम मोडेलहरूको लागि एकीकरण ढाँचाहरू
- **AI Agent Frameworks**: LangChain, Semantic Kernel, र AutoGen डिप्लोयमेन्टहरूका लागि टेम्पलेटहरू
- **Advanced RAG Patterns**: Azure AI Search बाहेकका भेक्टर डाटाबेस विकल्पहरू (Pinecone, Weaviate, आदि)
- **AI Observability**: मोडेल प्रदर्शन, टोकन प्रयोग, र प्रतिक्रिया गुणस्तरको लागि सुदृढ निगरानी

#### डेभलपर अनुभव
- **VS Code Extension**: एकीकृत AZD + Microsoft Foundry विकास अनुभव
- **GitHub Copilot Integration**: AI-ले सहयोग गरिने AZD टेम्पलेट निर्माण
- **Interactive Tutorials**: AI परिदृश्यहरूको लागि स्वचालित प्रमाणिकरणसहित व्यावहारिक कोडिङ अभ्यासहरू
- **Video Content**: AI डिप्लोयमेन्टहरूमा केन्द्रित दृश्य शिक्षार्थीहरूका लागि पूरक भिडियो ट्युटोरियलहरू

### Version 4.0.0 (Planned)
#### एंटरप्राइज AI ढाँचाहरू
- **Governance Framework**: AI मोडेल गभर्नन्स, अनुपालन, र अडिट ट्रेलहरू
- **Multi-Tenant AI**: अलग-थलग AI सेवाहरूमार्फत धेरै ग्राहकहरूलाई सेवा प्रदान गर्ने ढाँचाहरू
- **Edge AI Deployment**: Azure IoT Edge र कन्टेनर इन्स्टेन्सहरूसँग एकीकरण
- **Hybrid Cloud AI**: AI वर्कलोडहरूको लागि मल्टि-क्लाउड र हाइब्रिड डिप्लोयमेन्ट ढाँचाहरू

#### उन्नत सुविधाहरू
- **AI Pipeline Automation**: Azure Machine Learning पाइपलाइनहरूसँग MLOps एकीकरण
- **Advanced Security**: Zero-trust ढाँचाहरू, निजी endpoints, र उन्नत थ्रेट सुरक्षा
- **Performance Optimization**: उच्च-थ्रूपुट AI अनुप्रयोगहरूको लागि उन्नत ट्युनिङ र स्केलिङ रणनीतिहरू
- **Global Distribution**: AI अनुप्रयोगहरूको लागि कन्टेन्ट डेलिभरी र एdge क्यासिङ ढाँचाहरू

### Version 3.0.0 (Planned) - Superseded by Current Release
#### प्रस्तावित थपहरू - अब v3.0.0 मा लागू गरियो
- ✅ **AI-Focused Content**: व्यापक Microsoft Foundry एकीकरण (सम्पूर्ण)
- ✅ **Interactive Tutorials**: व्यावहारिक AI कार्यशाला ल्याब (सम्पूर्ण)
- ✅ **Advanced Security Module**: AI-विशेष सुरक्षा ढाँचाहरू (सम्पूर्ण)
- ✅ **Performance Optimization**: AI वर्कलोड ट्युनिङ रणनीतिहरू (सम्पूर्ण)

### Version 2.1.0 (Planned) - आंशिक रूपमा v3.0.0 मा लागू भयो
#### साना सुधारहरू - केही हालको रिलिजमा पूरा
- ✅ **Additional Examples**: AI-केन्द्रित डिप्लोयमेन्ट परिदृश्यहरू (सम्पूर्ण)
- ✅ **Extended FAQ**: AI-विशेष प्रश्नहरू र ट्रबलशुटिङ (सम्पूर्ण)
- **Tool Integration**: IDE र सम्पादक एकीकरण गाइडहरूमा सुधार
- ✅ **Monitoring Expansion**: AI-विशेष निगरानी र अलर्टिङ ढाँचाहरू (सम्पूर्ण)

#### अझै आगामी रिलिजका लागि योजना गरिएको
- **Mobile-Friendly Documentation**: मोबाइल सिकाइका लागि उत्तरदायी डिजाइन
- **Offline Access**: डाउनलोड गर्न मिल्ने दस्तावेज प्याकेजहरू
- **Enhanced IDE Integration**: AZD + AI वर्कफ्लोहरूको लागि VS Code विस्तार
- **Community Dashboard**: वास्तविक-समय समुदाय मेट्रिक्स र योगदान ट्र्याकिङ

## Changelog मा योगदान

### परिवर्तन रिपोर्ट गर्ने तरिका
जब यस रिपोजिटरीमा योगदान गर्दा, कृपया सुनिश्चित गर्नुहोस् कि चेंजलॉग प्रविष्टिहरूमा समावेश छन्:

1. **Version Number**: semantic versioning (major.minor.patch) अनुसरण गर्दै
2. **Date**: रिलिज वा अपडेट मिति YYYY-MM-DD ढाँचामा
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: के परिवर्तन भयो भन्ने संक्षेप विवरण
5. **Impact Assessment**: परिवर्तनहरूले विद्यमान प्रयोगकर्तामा कसरी प्रभाव पार्छ

### परिवर्तन वर्गहरू

#### थपिएको
- नयाँ सुविधाहरू, दस्तावेज खण्डहरू, वा क्षमता
- नयाँ उदाहरणहरू, टेम्पलेटहरू, वा सिकाइ स्रोतहरू
- थप उपकरणहरू, स्क्रिप्टहरू, वा युटिलिटीज

#### परिवर्तन गरिएको
- अवस्थित कार्यक्षमता वा दस्तावेजमा संशोधन
- स्पष्टता वा सटीकता सुधार गर्नका लागि अद्यावधिक
- सामग्री वा संगठनको पुनर्संरचना

#### अप्रचलित
- फेसिङ आउट गरिँदै गरेका सुविधा वा तरिकाहरू
- हटाउने तालिकामा रहेका दस्तावेज खण्डहरू
- जसका लागि राम्रो विकल्पहरू भएका विधिहरू

#### हटाइएको
- अब प्रासंगिक नभएका सुविधा, दस्तावेज, वा उदाहरणहरू
- पुरानो जानकारी वा अप्रचलित तरिकाहरू
- अनावश्यक वा एकत्रित सामग्री

#### ठीक गरियो
- दस्तावेज वा कोडमा त्रुटिहरूको सुधार
- रिपोर्ट गरिएका समस्याहरू वा त्रुटिहरूको समाधान
- सटीकता वा कार्यक्षमतामा सुधार

#### सुरक्षा
- सुरक्षा सम्बन्धी सुधार वा फिक्सहरू
- सुरक्षा सर्वोत्कृष्ट अभ्यासहरूको अद्यावधिक
- सुरक्षा भल्नरेबिलिटीहरूको समाधान

### सेम्यान्टिक भर्सनिङ मार्गदर्शन

#### मुख्य संस्करण (X.0.0)
- प्रयोगकर्ताले कदम चाल्नुपर्ने ब्रेकिङ परिवर्तनहरू
- सामग्री वा संगठनको महत्वपूर्ण पुनर्संरचना
- जसले मूल दृष्टिकोण वा कार्यविधिलाई परिवर्तन गर्छ

#### सानो संस्करण (X.Y.0)
- नयाँ सुविधाहरू वा सामग्री थप
- पूर्व-अनुकूलता कायम राख्ने सुधारहरू
- थप उदाहरणहरू, उपकरणहरू, वा स्रोतहरू

#### पैच संस्करण (X.Y.Z)
- बग फिक्स र सुधारहरू
- अवस्थित सामग्रीमा साना सुधारहरू
- स्पष्टिकरण र साना सुधारहरू

## समुदाय प्रतिक्रिया र सुझावहरू

हामी यस सिकाइ स्रोत सुधार गर्न सक्रिय रूपमा समुदायको प्रतिक्रिया प्रोत्साहित गर्दछौं:

### प्रतिक्रिया कसरी दिनुहोस्
- **GitHub Issues**: समस्याहरू रिपोर्ट गर्नुहोस् वा सुधारहरू सुझाव दिनुहोस् (AI-विशेष मुद्दाहरू स्वागत छ)
- **Discord Discussions**: विचारहरू साझा गर्नुहोस् र Microsoft Foundry समुदायसँग संलग्न हुनुहोस्
- **Pull Requests**: सामग्रीमा सिधा सुधारहरू योगदान गर्नुहोस्, विशेष गरी AI टेम्पलेट र गाइडहरू
- **Microsoft Foundry Discord**: AZD + AI छलफलहरूको लागि #Azure च्यानलमा सहभागी हुनुहोस्
- **Community Forums**: व्यापक Azure डेभलपर छलफलहरूमा भाग लिनुहोस्

### प्रतिक्रिया वर्गहरू
- **AI Content Accuracy**: AI सेवा एकीकरण र डिप्लोयमेन्ट जानकारीमा सुधारहरू
- **Learning Experience**: AI डेभलपर सिकाइ प्रवाह सुधारका लागि सुझावहरू
- **Missing AI Content**: अतिरिक्त AI टेम्पलेट, ढाँचा, वा उदाहरणहरूको अनुरोधहरू
- **Accessibility**: विविध सिकाइ आवश्यकताका लागि सुधार
- **AI Tool Integration**: राम्रो AI विकास वर्कफ्लो एकीकरणका लागि सुझावहरू
- **Production AI Patterns**: एंटरप्राइज AI डिप्लोयमेन्ट ढाँचाका अनुरोधहरू

### प्रतिक्रिया प्रतिबद्धता
- **Issue Response**: रिपोर्ट गरिएका समस्याहरूका लागि ४८ घन्टाभित्र
- **Feature Requests**: एक हप्ताभित्र मूल्याङ्कन
- **Community Contributions**: एक हप्ताभित्र समीक्षा
- **Security Issues**: तात्कालिक प्राथमिकता र तीव्र गरिएको प्रतिक्रिया

## मर्मत तालिका

### नियमित अपडेटहरू
- **Monthly Reviews**: सामग्री सटीकता र लिंक प्रमाणिकरण
- **Quarterly Updates**: प्रमुख सामग्री थप र सुधारहरू
- **Semi-Annual Reviews**: व्यापक पुनर्संरचना र सुधार
- **Annual Releases**: महत्वपूर्ण सुधारहरू सहित प्रमुख संस्करण अद्यावधिकहरू

### निगरानी र गुणस्तर सुनिश्चितता
- **Automated Testing**: कोड उदाहरण र लिंकहरूको नियमित प्रमाणिकरण
- **Community Feedback Integration**: प्रयोगकर्ता सुझावहरूको नियमित समावेश
- **Technology Updates**: नविनतम Azure सेवाहरू र azd रिलिजहरूसँग सिङ्गत
- **Accessibility Audits**: समावेशी डिजाइन सिद्धान्तहरूको लागि नियमित समीक्षा

## संस्करण समर्थन नीति

### हालको संस्करण समर्थन
- **Latest Major Version**: नियमित अपडेटहरू सहित पूर्ण समर्थन
- **Previous Major Version**: १२ महिनाका लागि सुरक्षा अपडेट र महत्त्वपूर्ण फिक्सहरू
- **Legacy Versions**: केवल समुदाय समर्थन, कुनै आधिकारिक अद्यावधिक छैन

### माइग्रेशन मार्गदर्शन
जब प्रमुख संस्करणहरू जारी गरिन्छ, हामी प्रदान गर्छौं:
- **Migration Guides**: चरण-दर-चरण संक्रमण निर्देशनहरू
- **Compatibility Notes**: ब्रेकिङ परिवर्तनहरूका बारेमा विवरण
- **Tool Support**: माइग्रेशनमा सहयोग गर्नका लागि स्क्रिप्टहरू वा युटिलिटीज
- **Community Support**: माइग्रेशन प्रश्नहरूका लागि समर्पित फोरमहरू

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [Study Guide](resources/study-guide.md)
- **अर्को पाठ**: फर्किनुहोस् [Main README](README.md)

**Stay Updated**: नयाँ रिलीजहरू र सिकाइ सामग्रीहरूमा महत्वपूर्ण अद्यावधिकहरूको सूचनाका लागि यस रिपोजिटरीलाई निगरानी गर्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->