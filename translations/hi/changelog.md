# Changelog - AZD For Beginners

## Introduction

यह चेंजलॉग AZD For Beginners रिपॉज़िटरी में सभी महत्वपूर्ण परिवर्तन, अपडेट और सुधारों का ब्यौरा देता है। हम सैमान्टिक वर्शनिंग सिद्धांतों का पालन करते हैं और उपयोगकर्ताओं को यह समझने में मदद करने के लिए इस लॉग को बनाए रखते हैं कि संस्करणों के बीच क्या बदल गया है।

## Learning Goals

इस चेंजलॉग की समीक्षा करके, आप:
- नए फीचर्स और सामग्री के जोड़ के बारे में सूचित रहेंगे
- मौजूदा दस्तावेज़ीकरण में किए गए सुधारों को समझ पाएंगे
- सटीकता सुनिश्चित करने के लिए बग फिक्स और सुधारों को ट्रैक करेंगे
- समय के साथ सीखने की सामग्री के विकास का पालन करेंगे

## Learning Outcomes

चेंजलॉग प्रविष्टियों की समीक्षा के बाद, आप सक्षम होंगे:
- सीखने के लिए उपलब्ध नई सामग्री और संसाधनों की पहचान करने में
- समझने में कि किन खंडों को अपडेट या बेहतर किया गया है
- सबसे वर्तमान सामग्री के आधार पर अपना सीखने का मार्ग योजना बनाना
- भविष्य के सुधारों के लिए फीडबैक और सुझाव देना

## Version History

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**यह संस्करण azd-coverage विश्लेषण द्वारा surfaced बचे हुए intermediate गैप्स को बंद करता है: अपने स्वयं के टेम्पलेट को कैसे author और प्रकाशित करें, पुनरुत्पाद्य dev-container/Codespaces वातावरण, Pulumi इंफ्रास्ट्रक्चर प्रदाता, एक Azure DevOps CI/CD वॉकथ्रू, सर्विस-प्रिंसिपल प्रमाणीकरण, होस्ट-चयन मार्गदर्शन (AKS/Spring Apps), `azd restore`/`azd package` व्याख्याएँ, हुक त्रुटि-हैंडलिंग, और टीम/साझा-पर्यावरण प्रथाएँ।**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — अपना azd टेम्पलेट तैयार करना: आवश्यक संरचना (`azure.yaml`, `infra/`, `src/`), `metadata.template` फ़ील्ड, `uniqueString()` रिसोर्स टोकन और `azd-env-name` टैग के साथ इंफ्रास्ट्रक्चर का पैरामीटराइजेशन, लोकली टेस्ट करना `azd init --template <local-path>` के साथ, GitHub पर प्रकाशित करना, और Awesome AZD गैलरी में सबमिट करना
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — Dev Containers और GitHub Codespaces के साथ पुनरुत्पाद्य azd वातावरण: एक न्यूनतम `.devcontainer/devcontainer.json` जो आधिकारिक `ghcr.io/azure/azure-dev/azd` फीचर का उपयोग करता है, भाषा-विशिष्ट फीचर्स, कंटेनर होस्ट्स के लिए `docker-in-docker`, और रिमोट साइन-इन के लिए `azd auth login --use-device-code`
- **🧩 Pulumi with azd** section in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi फ़ोल्डर लेआउट, स्टैक्स को azd वातावरणों के साथ मैप करना, आवश्यक आउटपुट/टैगिंग, और समान `azd up` / `azd down` वर्कफ़्लो
- **🎯 Host-selection guidance** in `docs/chapter-04-infrastructure/provisioning.md` — शुरुआत के अनुकूल तुलना `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, और `springapp` के बीच, और कब AKS या Azure Spring Apps चुनना चाहिए पर मार्गदर्शन
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, workload identity federation (OIDC) के साथ सर्विस कनेक्शन, जनरेट किया गया `azure-dev.yml`, और variable-group सेटअप
- **🔑 Service Principals (Pattern 4)** added to `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, non-interactive `azd auth login` क्लाइंट सीक्रेट बनाम federated/OIDC क्रेडेंशियल, कब उपयोग करें, और सुरक्षित क्रेडेंशियल स्टोरेज
- **🪝 Hook error-handling** subsection in `docs/chapter-04-infrastructure/deployment-guide.md` — exit कोड और `set -e`, `continueOnError`, `azd hooks run` के साथ हुक्स को अलग-अलग करके टेस्ट करना, OS-विशिष्ट शेल्स, और `--debug`
- **👥 Team / shared environments** section in `docs/chapter-03-configuration/configuration.md` — `.azure/` में क्या रहता है, क्या gitignore करना चाहिए, प्रति-विकासकर्ता वातावरण, `azd env list`/`select`, और CI/CD में पर्यावरण मान प्रदान करना
- **🧰 `azd restore` and expanded `azd package`** explanations in `resources/cheat-sheet.md` — निर्भरताओं को पुनर्स्थापित करना और डिप्लॉय किए बिना एक डिप्लॉयबल आर्टीफ़ैक्ट बनाना

#### Changed
- **🧭 Chapter 4 lessons table** updated to include the new "Authoring Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to include the new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers wired between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**यह संस्करण एक पूर्ण beginners' गाइड के लिए सबसे बड़े गैप्स को बंद करता है путем दो नए हैंड्स-ऑन लेसन्स (एक डिप्लॉय करने योग्य मल्टी-एजेंट वॉकथ्रू और एक मौजूदा ऐप में azd जोड़ना), एक शुरुआत के अनुकूल हुक्स परिचय, azd के साथ Terraform अनुभाग, चरण-दर-चरण GitHub Actions पाइपलाइन वॉकथ्रू, नए प्रीव्यू एक्सटेंशन्स के लिए एक explainer, और एक स्पष्ट deployment-verification चेकलिस्ट जोड़कर।**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — एक पूर्ण हैंड्स-ऑन, डिप्लॉय करने योग्य दो-एजेंट वॉकथ्रू (orchestrator + specialists) एक वास्तविक टेम्पलेट (`contoso-creative-writer`) का उपयोग करते हुए, कब मल्टी-एजेंट का उपयोग करना चाहिए, `azd up` वर्कफ़्लो, डिप्लॉय किए गए संसाधनों को समझना, क्रॉस-एजेंट ट्रेसिंग, अनुकूलन, और क्लीनअप कवर करता है
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — `azd init` के साथ मौजूदा प्रोजेक्ट में azd कैसे जोड़ें ("use code in the current directory"), `azure.yaml` और `infra/` को समझना, `azd infra generate`, होस्ट डिटेक्शन, और `azd up` के साथ डिप्लॉय करना
- **🌐 Terraform with azd** section added to `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` कॉन्फ़िग, `.tf` फ़ोल्डर लेआउट, आवश्यक `AZURE_*` आउटपुट और `azd-env-name` टैगिंग, और समान `azd up` / `azd down` वर्कफ़्लो (उस गैप को बंद करता है जहाँ Terraform सपोर्ट का दावा किया गया था पर केवल Bicep दिखाया गया था)
- **⚙️ Step-by-step GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — GitHub रिपो से ऑटोमेटेड डिप्लॉयस तक: `azd pipeline config`, OIDC federated क्रेडेंशियल (कोई स्टोर्ड सीक्रेट नहीं), जनरेट किया गया `azure-dev.yml`, और सीक्रेट्स वर्सेस वेरिएबल्स मार्गदर्शन
- **🪝 Beginner "New to hooks?" introduction** in `docs/chapter-04-infrastructure/deployment-guide.md` — हुक क्या है, हुक-स्टेज तालिका, एक न्यूनतम पहला हुक, और `azd hooks run` के साथ हुक्स को मैन्युअली चलाना
- **✅ "Verify Your Deployment" checklist** added to Step 5 of `docs/chapter-01-foundation/first-project.md` — स्मोक टेस्ट, health-endpoint चेक, और स्पष्ट सफलता मानदंड
- **🧩 Explainer for new preview extensions** `azure.ai.skills` and `azure.ai.connections` (वे क्या हैं और कब इन तक पहुंचना चाहिए) in `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Chapter 5 lessons table** corrected: `multi-agent-basics.md` is now Lesson 1 (the only fully hands-on lesson), with honest labeling that Lesson 2 lives in Chapter 6 and the Retail scenario is an architecture blueprint, not a one-command template
- **🧭 Chapter 1 lessons table** now includes the new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** updated: `first-project.md` now links forward to `bring-your-own-app.md`

#### Fixed
- **🧱 Closed the "claimed but missing" Terraform gap** — the course previously referenced Terraform support without showing it
- **🔀 Corrected misleading Chapter 5 cross-links** that implied a full multi-agent implementation existed when only an architecture blueprint did

#### Files Updated
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
**यह संस्करण पाठ्यक्रम को `azd` `1.25.6` (जून 2026) और `azure.ai.agents` `0.1.40-preview` एक्सटेंशन के खिलाफ पुनःमान्य करता है, AI मार्गदर्शन को "एक एजेंट scaffold करें" से विस्तारित कर पूरा एजेंट लाइफसाइकल (test → evaluate → optimize → inspect → delete) कवर करता है, नए `azure.ai.skills` और `azure.ai.connections` प्रीव्यू एक्सटेंशन्स को surface करता है, और ".NET Aspire" → "Aspire" उत्पाद रिब्रांड का उल्लेख करता है।**

#### Added
- **🔁 Full agent lifecycle coverage** for beginners and AI engineers across the docs:
  - `docs/chapter-01-foundation/azd-basics.md` — लाइफसाइकल तालिका (scaffold → test → measure → improve → inspect → clean up) Extensions and AI Commands सेक्शन में जोड़ी गई
  - `docs/chapter-08-production/production-ai-practices.md` — "Managing the Agent Lifecycle" नया सेक्शन जो `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, और `delete --force` को कवर करता है
  - `resources/cheat-sheet.md` — विस्तारित AI Agent Commands जिसमें `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, और `delete --force` शामिल हैं
- **🧩 New preview extensions** documented: `azure.ai.skills` (reusable agent skills) and `azure.ai.connections` (Foundry connections) added to the extensions table and cheat sheet
- **⏱️ Response-timing guidance** — `azd ai agent invoke` उदाहरण अब नोट करते हैं कि यह कुल लैटेंसी और time-to-first-byte प्रिंट करता है
- **📌 Version banner** in the root README pointing learners at `azd version` and `azd upgrade`

#### Changed
- **✅ Validation baseline updated** from `azd 1.23.12` (March 2026) to `azd 1.25.6` (June 2026) across all chapter READMEs and the workshop docs
- **🤖 Chapter 2 extension note** updated from `azure.ai.agents` `0.1.18-preview` to `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) updated to `1.25.6`
- **🧭 README "What's New in azd Today"** refreshed to highlight the end-to-end agent lifecycle, new AI extensions, and recent quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** now points learners to the post-deploy lifecycle commands rather than stopping at `azd up`

#### Fixed
- **🏷️ Product naming** — Aspire रिब्रांड नोट जोड़ा गया (".NET Aspire" अब सिर्फ "Aspire" है); azd का Aspire सपोर्ट अपरिवर्तित है
- **🔎 Live release validation** confirmed against the Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) and `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Files Updated
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
#### Beginner Onboarding Clarification, Setup Validation & Final AZD Command Cleanup
**यह संस्करण AZD 1.23 सत्यापन स्वेप के बाद एक शुरुआती-केंद्रित प्रलेखन पास करता है: यह AZD-पहला प्रमाणीकरण मार्गदर्शन स्पष्ट करता है, स्थानीय सेटअप सत्यापन स्क्रिप्ट जोड़ता है, लाइव AZD CLI के खिलाफ प्रमुख कमांड्स सत्यापित करता है, और चेंजलॉग के बाहर अंग्रेज़ी-स्रोत वाले पुराने कमांड संदर्भों को हटा देता है।**

#### Added
- **🧪 Beginner setup validation scripts** with `validate-setup.ps1` and `validate-setup.sh` so learners can confirm required tools before starting Chapter 1
- **✅ Upfront setup validation steps** in the root README and Chapter 1 README so missing prerequisites are caught before `azd up`

#### Changed
- **🔐 Beginner authentication guidance** now consistently treats `azd auth login` as the primary path for AZD workflows, with `az login` called out as optional unless Azure CLI commands are used directly
- **📚 Chapter 1 onboarding flow** now points learners to validate their local setup before installation, authentication, and first deployment steps
- **🛠️ Validator messaging** now clearly separates blocking requirements from optional Azure CLI warnings for the AZD-only beginner path
- **📖 Configuration, troubleshooting, and example docs** now distinguish between required AZD authentication and optional Azure CLI sign-in where both were previously presented without context

#### Fixed
- **📋 Remaining English-source command references** updated to current AZD forms, including `azd config show` in the cheat sheet and `azd monitor --overview` where Azure Portal overview guidance was intended
- **🧭 Beginner claims in Chapter 1** softened to avoid overpromising guaranteed zero-error or rollback behavior across all templates and Azure resources
- **🔎 Live CLI validation** confirmed current support for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, and `azd down --force --purge`

#### Files Updated
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
**यह संस्करण `azd` `1.23.12` के खिलाफ प्रलेखन सत्यापन स्वेप करता है, पुराने AZD कमांड उदाहरणों को अपडेट करता है, AI मॉडल मार्गदर्शन को वर्तमान डिफ़ॉल्ट्स तक रिफ्रेश करता है, और कार्यशाला निर्देशों को GitHub Codespaces के अलावा dev कंटेनरों और लोकल क्लोन के लिए भी विस्तारित करता है।**

#### Added
- **✅ Validation notes across core chapters and workshop docs** to make the tested AZD baseline explicit for learners using newer or older CLI builds
- **⏱️ Deployment timeout guidance** for long-running AI app deployments using `azd deploy --timeout 1800`
- **🔎 Extension inspection steps** with `azd extension show azure.ai.agents` in AI workflow docs
- **🌐 Broader workshop environment guidance** covering GitHub Codespaces, dev containers, and local clones with MkDocs

#### Changed
- **📚 Chapter intro READMEs** now consistently note validation against `azd 1.23.12` across foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, and production sections
- **🛠️ AZD command references** updated to current forms across the docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` or `azd env get-value(s)` depending on context
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` where Application Insights overview is intended
- **🧪 Provision preview examples** simplified to current supported usage such as `azd provision --preview` and `azd provision --preview -e production`
- **🧭 Workshop flow** updated so learners can complete the labs in Codespaces, a dev container, or a local clone instead of assuming Codespaces-only execution
- **🔐 Authentication guidance** now prefers `azd auth login` for AZD workflows, with `az login` positioned as optional when Azure CLI commands are used directly

#### Fixed
- **🪟 Windows install commands** normalized to current `winget` package casing in the installation guide
- **🐧 Linux install guidance** corrected to avoid unsupported distro-specific `azd` package manager instructions and instead point to release assets where appropriate
- **📦 AI model examples** refreshed from older defaults like `gpt-35-turbo` and `text-embedding-ada-002` to current examples such as `gpt-4.1-mini`, `gpt-4.1`, and `text-embedding-3-large`
- **📋 Deployment and diagnostics snippets** corrected to use current environment and status commands in logs, scripts, and troubleshooting steps
- **⚙️ GitHub Actions guidance** updated from `Azure/setup-azd@v1.0.0` to `Azure/setup-azd@v2`
- **🤖 MCP/Copilot consent guidance** updated from `azd mcp consent` to `azd copilot consent list`

#### Improved
- **🧠 AI chapter guidance** now better explains preview-sensitive `azd ai` behavior, tenant-specific login, current extension usage, and updated model deployment recommendations
- **🧪 Workshop instructions** now use more realistic version examples and clearer environment setup language for hands-on labs
- **📈 Production and troubleshooting docs** now align better with current monitoring, fallback model, and cost-tier examples

#### Files Updated
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
**यह संस्करण सभी AI-संबंधित अध्यायों में `azd ai`, `azd extension`, और `azd mcp` कमांड कवरेज जोड़ता है, agents.md में टूटे हुए लिंक और अप्रचलित कोड को ठीक करता है, चीट शीट अपडेट करता है, और Example Templates सेक्शन का ओवरहाल करता है जिसमें सत्यापित विवरण और नए Azure AI AZD टेम्प्लेट शामिल हैं।**

#### Added
- **🤖 AZD AI CLI coverage** across 7 files (previously only in Chapter 8):
  - `docs/chapter-01-foundation/azd-basics.md` — New "Extensions and AI Commands" section introducing `azd extension`, `azd ai agent init`, and `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4: `azd ai agent init` with comparison table (template vs manifest approach)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" and "Agent-First Deployment" subsections
  - `docs/chapter-05-multi-agent/README.md` — Quick Start now shows both template and manifest-based deployment paths
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy section now includes `azd ai agent init` option
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" subsection
  - `resources/cheat-sheet.md` — New "AI & Extensions Commands" section with `azd extension`, `azd ai agent init`, `azd mcp`, and `azd infra generate`
- **📦 New AZD AI example templates** in `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat with Blazor WebAssembly, Semantic Kernel, and voice chat support
  - **azure-search-openai-demo-java** — Java RAG chat using Langchain4J with ACA/AKS deployment options
  - **contoso-creative-writer** — Multi-agent creative writing app using Azure AI Agent Service, Bing Grounding, and Prompty
  - **serverless-chat-langchainjs** — Serverless RAG using Azure Functions + LangChain.js + Cosmos DB with Ollama local dev support
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator with admin portal, Teams integration, and PostgreSQL/Cosmos DB options
  - **azure-ai-travel-agents** — Multi-agent MCP orchestration reference app with servers in .NET, Python, Java, and TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastructure Bicep starter template
  - **🔗 Awesome AZD AI Gallery link** — Reference to the [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 agents.md navigation**: Previous/Next links now match Chapter 2 README lesson order (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md broken links**: `production-ai-practices.md` corrected to `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 agents.md deprecated code**: Replaced `opencensus` with `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md invalid API**: Moved `max_tokens` from `create_agent()` to `create_run()` as `max_completion_tokens`
- **🔢 agents.md token counting**: Replaced rough `len//4` estimate with `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrected services from "Cognitive Search + App Service" to "Azure AI Search + Azure Container Apps" (default host changed Oct 2024)
- **contoso-chat**: Updated description to reference Azure AI Foundry + Prompty, matching the repo's actual title and tech stack

#### Removed
- **ai-document-processing**: Removed non-functional template reference (repo not publicly accessible as an AZD template)

#### Improved
- **📝 agents.md exercises**: Exercise 1 now shows expected output and `azd monitor` step; Exercise 2 includes full `FunctionTool` registration code; Exercise 3 replaces vague guidance with concrete `prepdocs.py` commands
- **📚 agents.md resources**: Updated documentation links to current Azure AI Agent Service docs and quickstart
- **📋 agents.md Next Steps table**: Added AI Workshop Lab link for complete chapter coverage

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Course Navigation Enhancement
**This संस्करण README.md अध्याय नेविगेशन को एक बेहतर तालिका प्रारूप के साथ सुधारता है।**

#### Changed
- **Course Map Table**: सीधे लेसन लिंक्स, अवधि के अनुमान, और जटिलता रेटिंग के साथ बेहतर किया गया
- **Folder Cleanup**: पुराने अनावश्यक फ़ोल्डर्स हटाए गए (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Course Map तालिका में सभी 21+ आंतरिक लिंक सत्यापित

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**यह संस्करण उत्पाद संदर्भों को वर्तमान Microsoft ब्रांडिंग के अनुसार अपडेट करता है।**

#### Changed
- **Microsoft Foundry → Microsoft Foundry**: सभी संदर्भ अनुवाद-नॉनफ़ाइलों में अपडेट किए गए
- **Azure AI Agent Service → Foundry Agents**: सेवा का नाम वर्तमान ब्रांडिंग को दर्शाने के लिए अपडेट किया गया

#### Files Updated
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**यह संस्करण दस्तावेज़ों को स्पष्ट नेविगेशन के लिए समर्पित अध्याय फ़ोल्डरों में पुनर्गठित करता है।**

#### Folder Renames
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### File Migrations
| फ़ाइल | से | को |
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

#### Added
- **📚 Chapter README files**: प्रत्येक अध्याय फ़ोल्डर में README.md बनाया गया जिसमें:
  - सीखने के उद्देश्य और अवधि
  - विवरणों के साथ पाठ तालिका
  - क्विक स्टार्ट कमांड्स
  - अन्य अध्यायों के लिए नेविगेशन

#### Changed
- **🔗 Updated all internal links**: 78+ पाथ्स सभी दस्तावेज़ फ़ाइलों में अपडेट किए गए
- **🗺️ Main README.md**: नया चैप्टर स्ट्रक्चर के साथ Course Map अपडेट किया गया
- **📝 examples/README.md**: चैप्टर फ़ोल्डरों के क्रॉस-रेफरेंस अपडेट किए गए

#### Removed
- पुराने फ़ोल्डर स्ट्रक्चर हटाए गए (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**यह संस्करण चैप्टर नेविगेशन README फाइलें जोड़ता है (v3.15.0 द्वारा अप्रचलित)।**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**यह संस्करण Azure Developer CLI के साथ AI एजेंट्स को तैनात करने के लिए एक व्यापक गाइड जोड़ता है।**

#### Added
- **🤖 docs/microsoft-foundry/agents.md**: पूर्ण गाइड जिसमें शामिल हैं:
  - AI एजेंट क्या हैं और वे चैटबॉट्स से कैसे भिन्न हैं
  - तीन क्विक-स्टार्ट एजेंट टेम्पलेट्स (Foundry Agents, Prompty, RAG)
  - एजेंट आर्किटेक्चर पैटर्न (सिंगल एजेंट, RAG, मल्टी-एजेंट)
  - टूल कॉन्फ़िगरेशन और अनुकूलन
  - मॉनिटरिंग और मीट्रिक्स ट्रैकिंग
  - लागत विचार और अनुकूलन
  - सामान्य ट्रबलशूटिंग परिदृश्य
  - तीन हैंड्स-ऑन व्यायाम सफलतापूर्वक पूरा करने के मानदंडों के साथ

#### Content Structure
- **Introduction**: शुरुआती लोगों के लिए एजेंट अवधारणाएँ
- **Quick Start**: `azd init --template get-started-with-ai-agents` के साथ एजेंट तैनात करें
- **Architecture Patterns**: एजेंट पैटर्न के दृश्य आरेख
- **Configuration**: टूल सेटअप और एनवायरनमेंट वेरिएबल्स
- **Monitoring**: Application Insights एकीकरण
- **Exercises**: प्रगतिशील हैंड्स-ऑन लर्निंग (प्रत्येक 20-45 मिनट)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**यह संस्करण विकास कंटेनर कॉन्फ़िगरेशन को आधुनिक टूल्स और बेहतर डिफ़ॉल्ट्स के साथ अपडेट करता है ताकि AZD सीखने का अनुभव बेहतर हो।**

#### Changed
- **🐳 Base Image**: `python:3.12-bullseye` से `python:3.12-bookworm` (नवीनतम Debian स्थिर) में अपडेट किया गया
- **📛 Container Name**: स्पष्टता के लिए "Python 3" से "AZD for Beginners" में नाम बदल दिया गया

#### Added
- **🔧 New Dev Container Features**:
  - `azure-cli` के साथ Bicep सपोर्ट सक्षम
  - `node:20` (AZD टेम्पलेट्स के लिए LTS संस्करण)
  - `github-cli` टेम्पलेट प्रबंधन के लिए
  - `docker-in-docker` कंटेनर ऐप तैनाती के लिए

- **🔌 Port Forwarding**: सामान्य विकास के लिए प्री-कॉन्फ़िगर किए गए पोर्ट्स:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - उन्नत Python IntelliSense
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

- **⚙️ VS Code Settings**: Python इंटरप्रेटर, सेव पर फॉर्मेट करने और व्हाइटस्पेस ट्रिमिंग के लिए डिफ़ॉल्ट सेटिंग्स जोड़ी गईं

- **📦 Updated requirements-dev.txt**:
  - MkDocs minify प्लगइन जोड़ा गया
  - कोड गुणवत्ता के लिए pre-commit जोड़ा गया
  - Azure SDK पैकेजेज़ जोड़े गए (azure-identity, azure-mgmt-resource)

#### Fixed
- **Post-Create Command**: अब कंटेनर स्टार्ट पर AZD और Azure CLI इंस्टॉलेशन को सत्यापित करता है

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**यह संस्करण README.md को शुरुआती लोगों के लिए अधिक सुलभ बनाता है और AI डेवलपर्स के लिए आवश्यक संसाधन जोड़ता है।**

#### Added
- **🆚 Azure CLI vs AZD Comparison**: प्रत्येक टूल का उपयोग कब करना चाहिए इसका स्पष्ट विवरण व्यावहारिक उदाहरणों के साथ
- **🌟 Awesome AZD Links**: समुदाय टेम्पलेट गैलरी और योगदान संसाधनों के सीधे लिंक:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तैनात करने के लिए तैयार टेम्पलेट्स
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदाय योगदान
- **🎯 Quick Start Guide**: सरलीकृत 3-स्टेप गेटिंग स्टार्ट सेक्शन (Install → Login → Deploy)
- **📊 Experience-Based Navigation Table**: डेवलपर के अनुभव के आधार पर कहां से शुरू करें इसका स्पष्ट मार्गदर्शन

#### Changed
- **README Structure**: प्रगतिशील डिस्क्लोज़र के लिए पुनर्गठित - प्रमुख जानकारी पहले
- **Introduction Section**: पूर्ण शुरुआती लोगों के लिए "The Magic of `azd up`" को समझाने के लिए पुनर्लेखन किया गया
- **Removed Duplicate Content**: डुप्लिकेट ट्रबलशूटिंग सेक्शन हटाया गया
- **Troubleshooting Commands**: `azd logs` संदर्भ को मान्य `azd monitor --logs` का उपयोग करने के लिए ठीक किया गया

#### Fixed
- **🔐 Authentication Commands**: cheat-sheet.md में `azd auth login` और `azd auth logout` जोड़े गए
- **Invalid Command References**: README ट्रबलशूटिंग सेक्शन से शेष `azd logs` हटाए गए

#### Notes
- **Scope**: परिवर्तन मुख्य README.md और resources/cheat-sheet.md पर लागू किए गए
- **Target Audience**: सुधार विशेष रूप से AZD के नए डेवलपर्स के लिए लक्षित हैं

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**यह संस्करण दस्तावेज़ में मौजूद गैर-मौजूद AZD कमांड्स को सही करता है, यह सुनिश्चित करते हुए कि सभी कोड उदाहरण वैध Azure Developer CLI सिंटैक्स का उपयोग करें।**

#### Fixed
- **🔧 Non-Existent AZD Commands Removed**: अमान्य कमांड्स का व्यापक ऑडिट और सुधार:
  - `azd logs` (doesn't exist) → `azd monitor --logs` या Azure CLI विकल्पों से बदला गया
  - `azd service` subcommands (don't exist) → `azd show` और Azure CLI से बदला गया
  - `azd infra import/export/validate` (don't exist) → हटाया गया या वैध विकल्पों से बदला गया
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → हटाए गए
  - `azd provision --what-if/--rollback` flags (don't exist) → `--preview` का उपयोग करने के लिए अपडेट किया गया
  - `azd config validate` (doesn't exist) → `azd config list` से बदला गया
  - `azd info`, `azd history`, `azd metrics` (don't exist) → हटाए गए

- **📚 Files Updated with Command Corrections**:
  - `resources/cheat-sheet.md`: कमांड रेफ़रेंस का प्रमुख ओवरहॉल
  - `docs/deployment/deployment-guide.md`: रोलबैक और तैनाती रणनीतियों को ठीक किया गया
  - `docs/troubleshooting/debugging.md`: लॉग विश्लेषण अनुभाग ठीक किए गए
  - `docs/troubleshooting/common-issues.md`: ट्रबलशूटिंग कमांड्स अपडेट किए गए
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिंग सेक्शन ठीक किया गया
  - `docs/getting-started/azd-basics.md`: मॉनिटरिंग कमांड्स सही किए गए
  - `docs/getting-started/first-project.md`: मॉनिटरिंग और डिबगिंग उदाहरण अपडेट किए गए
  - `docs/getting-started/installation.md`: हेल्प और वर्शन उदाहरण ठीक किए गए
  - `docs/pre-deployment/application-insights.md`: लॉग देखने के कमांड्स सही किए गए
  - `docs/pre-deployment/coordination-patterns.md`: एजेंट डिबगिंग कमांड्स ठीक किए गए

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: हार्डकोडेड `1.5.0` वर्शन को सामान्य `1.x.x` में बदला गया और रिलीज़ लिंक जोड़ा गया

#### Changed
- **Rollback Strategies**: दस्तावेज़ को Git-आधारित रोलबैक का उपयोग करने के लिए अपडेट किया गया (AZD में नेटिव रोलबैक नहीं है)
- **Log Viewing**: `azd logs` संदर्भों को `azd monitor --logs`, `azd monitor --live`, और Azure CLI कमांड्स से बदला गया
- **Performance Section**: गैर-मौजूद समानांतर/आकस्मिक तैनाती फ्लैग्स हटाए गए, वैध विकल्प प्रदान किए गए

#### Technical Details
- **Valid AZD Commands**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valid azd monitor Flags**: `--live`, `--logs`, `--overview`
- **Removed Features**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Verification**: कमांड्स Azure Developer CLI v1.23.x के खिलाफ सत्यापित किए गए

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**यह संस्करण इंटरैक्टिव वर्कशॉप मॉड्यूल को पूरा करता है, सभी टूटे हुए दस्तावेज़ लिंक ठीक करता है, और Microsoft AZD उपयोग करने वाले AI डेवलपर्स के लिए समग्र सामग्री की गुणवत्ता में सुधार करता है।**

#### Added
- **📝 CONTRIBUTING.md**: नए योगदान दिशानिर्देश दस्तावेज़ के साथ:
  - समस्याओं की रिपोर्ट करने और परिवर्तन प्रस्तावित करने के लिए स्पष्ट निर्देश
  - नई सामग्री के लिए दस्तावेज़ मानक
  - कोड उदाहरण दिशानिर्देश और कमिट संदेश कन्वेंशन्स
  - समुदाय सहभागिता जानकारी

#### पूरा हुआ
- **🎯 Workshop Module 7 (Wrap-up)**: पूरी तरह पूरा किया गया समापन मॉड्यूल जिसमें:
  - वर्कशॉप उपलब्धियों का व्यापक सारांश
  - AZD, टेम्पलेट्स, और Microsoft Foundry को कवर करने वाला मुख्य सिद्धांत अनुभाग
  - सीखने की यात्रा जारी रखने के लिए अनुशंसाएँ
  - कठिनाई रेटिंग के साथ वर्कशॉप चुनौती अभ्यास
  - समुदाय प्रतिक्रिया और समर्थन लिंक्स

- **📚 Workshop Module 3 (Deconstruct)**: अद्यतन किए गए.learning objectives के साथ:
  - GitHub Copilot और MCP सर्वरों के साथ सक्रियकरण मार्गदर्शन
  - AZD टेम्पलेट फ़ोल्डर संरचना की समझ
  - Infrastructure-as-code (Bicep) संगठन पैटर्न
  - प्रायोगिक लैब निर्देश

- **🔧 Workshop Module 6 (Teardown)**: पूरा किया गया जिसमें:
  - संसाधन क्लीनअप और लागत प्रबंधन उद्देश्य
  - `azd down` का उपयोग सुरक्षित इन्फ्रास्ट्रक्चर डीप्रोविजनिंग के लिए
  - सॉफ्ट-डिलीट की गई cognitive सेवाओं की पुनर्प्राप्ति मार्गदर्शिका
  - GitHub Copilot और Azure Portal के लिए बोनस एक्सप्लोरेशन संकेत

#### ठीक किए गए
- **🔗 Broken Link Fixes**: 15+ टूटे हुए आंतरिक दस्तावेज़ी लिंक हल किए गए:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md के पथ ठीक किए गए
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md और production-ai-practices.md के पथ सही किए गए
  - `docs/getting-started/first-project.md`: गैर-मौजूद cicd-integration.md को deployment-guide.md से बदला गया
  - `examples/retail-scenario.md`: FAQ और ट्रबलशूटिंग गाइड के पथ सही किए गए
  - `examples/container-app/microservices/README.md`: पाठ्यक्रम होम और डिप्लॉयमेंट गाइड के पथ सही किए गए
  - `resources/faq.md` और `resources/glossary.md`: AI चैप्टर संदर्भ अपडेट किए गए
  - `course-outline.md`: instructor guide और AI वर्कशॉप लैब संदर्भ ठीक किए गए

- **📅 Workshop Status Banner**: "Under Construction" से सक्रिय वर्कशॉप स्थिति में अपडेट किया गया, फरवरी 2026 की तारीख के साथ

- **🔗 Workshop Navigation**: workshop README.md में टूटे हुए नेविगेशन लिंक ठीक किए गए जो non-existent lab-1-azd-basics फ़ोल्डर की ओर इशारा कर रहे थे

#### परिवर्तित
- **Workshop Presentation**: "under construction" चेतावनी हटा दी गई, वर्कशॉप अब पूरा हुआ और उपयोग के लिए तैयार है
- **Navigation Consistency**: सुनिश्चित किया गया कि सभी वर्कशॉप मॉड्यूलों में उपयुक्त इंटर-मॉड्यूल नेविगेशन हो
- **Learning Path References**: अध्याय क्रॉस-रेफ़रेंस अपडेट किए गए ताकि सही microsoft-foundry पथों का उपयोग हो

#### सत्यापित
- ✅ सभी अंग्रेज़ी Markdown फ़ाइलों के आंतरिक लिंक वैध हैं
- ✅ वर्कशॉप मॉड्यूल 0-7 सीखने के उद्देश्यों के साथ पूरे हैं
- ✅ अध्यायों और मॉड्यूलों के बीच नेविगेशन सही ढंग से कार्य करता है
- ✅ सामग्री AI डेवलपर्स के लिए Microsoft AZD के साथ उपयुक्त है
- ✅ शुरुआत करने वाले के अनुकूल भाषा और संरचना बनाए रखी गई है
- ✅ CONTRIBUTING.md सामुदायिक योगदानकर्ताओं के लिए स्पष्ट मार्गदर्शन प्रदान करता है

#### तकनीकी कार्यान्वयन
- **Link Validation**: स्वचालित PowerShell स्क्रिप्ट ने सभी .md आंतरिक लिंक सत्यापित किए
- **Content Audit**: वर्कशॉप की पूर्णता और शुरुआत सूटेबिलिटी का मैन्युअल समीक्षा
- **Navigation System**: अध्याय और मॉड्यूल नेविगेशन पैटर्न एकसार लागू किए गए

#### नोट्स
- **Scope**: परिवर्तन केवल अंग्रेज़ी दस्तावेज़ों पर लागू किए गए
- **Translations**: अनुवाद फ़ोल्डर इस संस्करण में अद्यतन नहीं हुए (स्वचालित अनुवाद बाद में सिंक करेगा)
- **Workshop Duration**: पूरा वर्कशॉप अब 3-4 घंटे का प्रायोगिक सीखने का समय प्रदान करता है

---

### [v3.8.0] - 2025-11-19

#### उन्नत दस्तावेज़ीकरण: निगरानी, सुरक्षा, और मल्टी-एजेंट पैटर्न
**यह संस्करण Application Insights एकीकरण, प्रमाणीकरण पैटर्न और उत्पादन तैनाती के लिए मल्टी-एजेंट समन्वय पर व्यापक A-ग्रेड पाठ जोड़ता है।**

#### जोड़ा गया
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - AZD-केंद्रित तैनाती के साथ स्वचालित प्रोविजनिंग
  - Application Insights + Log Analytics के लिए पूर्ण Bicep टेम्पलेट
  - कस्टम टेलीमेट्री के साथ कार्यरत Python एप्लिकेशन (1,200+ पंक्तियाँ)
  - AI/LLM निगरानी पैटर्न (Microsoft Foundry Models टोकन/लागत ट्रैकिंग)
  - 6 Mermaid आरेख (आर्किटेक्चर, वितरित ट्रेसिंग, टेलीमेट्री फ्लो)
  - 3 व्यावहारिक अभ्यास (अलर्ट, डैशबोर्ड, AI मॉनिटरिंग)
  - Kusto क्वेरी उदाहरण और लागत अनुकूलन रणनीतियाँ
  - लाइव मेट्रिक्स स्ट्रीमिंग और रीयल-टाइम डिबगिंग
  - उत्पादन-तैयार पैटर्न के साथ 40-50 मिनट का सीखने का समय

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 प्रमाणीकरण पैटर्न (connection strings, Key Vault, managed identity)
  - सुरक्षित तैनाती के लिए पूर्ण Bicep इन्फ्रास्ट्रक्चर टेम्पलेट
  - Azure SDK एकीकरण के साथ Node.js एप्लिकेशन कोड
  - 3 पूर्ण अभ्यास (managed identity सक्षम करना, user-assigned identity, Key Vault रोटेशन)
  - सुरक्षा सर्वोत्तम प्रथाएँ और RBAC कॉन्फ़िगरेशन
  - ट्रबलशूटिंग गाइड और लागत विश्लेषण
  - उत्पादन-तैयार पासवर्डलेस प्रमाणीकरण पैटर्न

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 समन्वय पैटर्न (क्रमिक, समानांतर, पदानुक्रम, इवेंट-ड्रिवन, कंसेंसस)
  - पूर्ण ऑर्केस्ट्रेटर सेवा कार्यान्वयन (Python/Flask, 1,500+ पंक्तियाँ)
  - 3 विशिष्ट एजेंट कार्यान्वयन (Research, Writer, Editor)
  - मैसेज क्यूइंग के लिए Service Bus एकीकरण
  - वितरित सिस्टम के लिए Cosmos DB स्टेट प्रबंधन
  - 6 Mermaid आरेख जो एजेंट इंटरैक्शन दिखाते हैं
  - 3 उन्नत अभ्यास (timeout हैंडलिंग, retry लॉजिक, सर्किट ब्रेकर)
  - लागत विभाजन ($240-565/month) और अनुकूलन रणनीतियाँ
  - मॉनिटरिंग के लिए Application Insights एकीकरण

#### संवर्धित
- **Pre-deployment Chapter**: अब व्यापक निगरानी और समन्वय पैटर्न शामिल हैं
- **Getting Started Chapter**: पेशेवर प्रमाणीकरण पैटर्न के साथ संवर्धित
- **Production Readiness**: सुरक्षा से ऑब्ज़ rvability तक पूर्ण कवरेज
- **Course Outline**: अध्याय 3 और 6 में नए पाठों का संदर्भ जोड़ने के लिए अद्यतन

#### परिवर्तित
- **Learning Progression**: कोर्स भर में सुरक्षा और निगरानी का बेहतर एकीकरण
- **Documentation Quality**: नए पाठों में सुसंगत A-ग्रेड मानक (95-97%)
- **Production Patterns**: एंटरप्राइज तैनातियों के लिए एंड-टू-एंड कवरेज

#### बेहतर
- **Developer Experience**: विकास से उत्पादन मॉनिटरिंग तक स्पष्ट मार्ग
- **Security Standards**: प्रमाणीकरण और सीक्रेट्स प्रबंधन के लिए पेशेवर पैटर्न
- **Observability**: AZD के साथ पूर्ण Application Insights एकीकरण
- **AI Workloads**: Microsoft Foundry Models और मल्टी-एजेंट सिस्टम के लिए विशेष निगरानी

#### सत्यापित
- ✅ सभी पाठों में पूर्ण कार्यरत कोड शामिल हैं (स्निपेट्स नहीं)
- ✅ विज़ुअल लर्निंग के लिए Mermaid आरेख (कुल 19 तीनों पाठों में)
- ✅ सत्यापन चरणों के साथ व्यावहारिक अभ्यास (कुल 9)
- ✅ `azd up` के माध्यम से तैनात करने योग्य उत्पादन-तैयार Bicep टेम्पलेट
- ✅ लागत विश्लेषण और अनुकूलन रणनीतियाँ
- ✅ ट्रबलशूटिंग गाइड और सर्वोत्तम प्रथाएँ
- ✅ सत्यापन कमांड के साथ ज्ञान चेकपॉइंट

#### दस्तावेज़ों का ग्रेडिंग परिणाम
- **docs/pre-deployment/application-insights.md**: - व्यापक मॉनिटरिंग गाइड
- **docs/getting-started/authsecurity.md**: - पेशेवर सुरक्षा पैटर्न
- **docs/pre-deployment/coordination-patterns.md**: - उन्नत मल्टी-एजेंट आर्किटेक्चर
- **Overall New Content**: - सुसंगत उच्च-गुणवत्ता मानक

#### तकनीकी कार्यान्वयन
- **Application Insights**: Log Analytics + कस्टम टेलीमेट्री + वितरित ट्रेसिंग
- **Authentication**: Managed Identity + Key Vault + RBAC पैटर्न
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ऑर्केस्ट्रेशन
- **Monitoring**: लाइव मेट्रिक्स + Kusto क्वेरी + अलर्ट + डैशबोर्ड
- **Cost Management**: सैंपलिंग रणनीतियाँ, रिटेंशन नीतियाँ, बजट नियंत्रण

### [v3.7.0] - 2025-11-19

#### दस्तावेज़ गुणवत्ता सुधार और नया Microsoft Foundry Models उदाहरण
**यह संस्करण रेपो में दस्तावेज़ गुणवत्ता को बढ़ाता है और gpt-4.1 चैट इंटरफ़ेस के साथ एक पूर्ण Microsoft Foundry Models तैनाती उदाहरण जोड़ता है।**

#### जोड़ा गया
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Complete Microsoft Foundry Models इन्फ्रास्ट्रक्चर (gpt-4.1 मॉडल तैनाती)
  - वार्तालाप इतिहास के साथ Python कमांड-लाइन चैट इंटरफ़ेस
  - सुरक्षित API कुंजी भंडारण के लिए Key Vault एकीकरण
  - टोकन उपयोग ट्रैकिंग और लागत अनुमान
  - रेट लिमिटिंग और त्रुटि हैंडलिंग
  - 35-45 मिनट की तैनाती गाइड के साथ व्यापक README
  - 11 उत्पादन-तैयार फाइलें (Bicep टेम्पलेट्स, Python ऐप, कॉन्फ़िगरेशन)
- **📚 Documentation Exercises**: कन्फ़िगरेशन गाइड में व्यावहारिक अभ्यास जोड़े गए:
  - अभ्यास 1: मल्टी-एनवायरनमेंट कन्फ़िगरेशन (15 मिनट)
  - अभ्यास 2: सीक्रेट प्रबंधन अभ्यास (10 मिनट)
  - स्पष्ट सफलता मानदंड और सत्यापन चरण
- **✅ Deployment Verification**: डिप्लॉयमेंट गाइड में सत्यापन अनुभाग जोड़ा गया:
  - हेल्थ चेक प्रक्रियाएँ
  - सफलता मानदंड चेकलिस्ट
  - सभी डिप्लॉयमेंट कमांड्स के लिए अपेक्षित आउटपुट
  - ट्रबलशूटिंग त्वरित संदर्भ

#### संवर्धित
- **examples/README.md**: A-ग्रेड गुणवत्ता (93%) के लिए अपडेट किया गया:
  - azure-openai-chat को सभी संबंधित अनुभागों में जोड़ा गया
  - स्थानीय उदाहरणों की संख्या 3 से 4 में अपडेट की गई
  - AI Application Examples तालिका में जोड़ा गया
  - Intermediate Users के लिए Quick Start में एकीकृत
  - Microsoft Foundry Templates सेक्शन में जोड़ा गया
  - तुलना मैट्रिक्स और तकनीकी खोज अनुभाग अपडेट किए गए
- **Documentation Quality**: B+ (87%) → A- (92%) तक सुधार:
  - महत्वपूर्ण कमांड उदाहरणों के लिए अपेक्षित आउटपुट जोड़ा गया
  - कन्फ़िगरेशन परिवर्तनों के लिए सत्यापन चरण शामिल किए गए
  - व्यावहारिक अभ्यास के साथ हैंड्स-ऑन सीखने को संवर्धित किया गया

#### परिवर्तित
- **Learning Progression**: मध्यवर्ती शिक्षार्थियों के लिए AI उदाहरणों का बेहतर एकीकरण
- **Documentation Structure**: अधिक क्रियात्मक अभ्यास स्पष्ट परिणामों के साथ
- **Verification Process**: प्रमुख वर्कफ़्लो में स्पष्ट सफलता मानदंड जोड़े गए

#### बेहतर
- **Developer Experience**: Microsoft Foundry Models तैनाती अब 35-45 मिनट लेती है (जटिल विकल्पों के लिए 60-90 के मुकाबले)
- **Cost Transparency**: Microsoft Foundry Models उदाहरण के लिए स्पष्ट लागत अनुमान ($50-200/month)
- **Learning Path**: AI डेवलपर्स के लिए azure-openai-chat के साथ स्पष्ट एंट्री पॉइंट
- **Documentation Standards**: सुसंगत अपेक्षित आउटपुट और सत्यापन चरण

#### सत्यापित
- ✅ Microsoft Foundry Models उदाहरण `azd up` के साथ पूरी तरह कार्यरत
- ✅ सभी 11 इम्प्लीमेंटेशन फाइल्स सिन्टैक्टिक रूप से सही
- ✅ README निर्देश वास्तविक तैनाती अनुभव से मेल खाते हैं
- ✅ दस्तावेज़ लिंक 8+ स्थानों पर अपडेट किए गए
- ✅ उदाहरण सूचकांक 4 स्थानीय उदाहरणों को सही ढंग से दर्शाता है
- ✅ तालिकाओं में कोई डुप्लिकेट बाहरी लिंक नहीं
- ✅ सभी नेविगेशन संदर्भ सही

#### तकनीकी कार्यान्वयन
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps पैटर्न
- **Security**: Managed Identity तैयार, सीक्रेट्स Key Vault में
- **Monitoring**: Application Insights एकीकरण
- **Cost Management**: टोकन ट्रैकिंग और उपयोग अनुकूलन
- **Deployment**: पूर्ण सेटअप के लिए एकल `azd up` कमांड

### [v3.6.0] - 2025-11-19

#### बड़ा अपडेट: कंटेनर ऐप तैनाती उदाहरण
**यह संस्करण Azure Developer CLI (AZD) का उपयोग करके व्यापक, उत्पादन-तैयार कंटेनर एप्लिकेशन तैनाती उदाहरण प्रस्तुत करता है, पूर्ण दस्तावेज़ और लर्निंग पाथ में एकीकरण के साथ।**

#### जोड़ा गया
- **🚀 Container App Examples**: नए स्थानीय उदाहरण `examples/container-app/` में:
  - [Master Guide](examples/container-app/README.md): कंटेनराइज्ड तैनातियों का पूर्ण ओवरव्यू, क्विक स्टार्ट, उत्पादन और उन्नत पैटर्न
  - [Simple Flask API](../../examples/container-app/simple-flask-api): शुरुआत करने के लिए अनुकूल REST API जिसमें scale-to-zero, health probes, मॉनिटरिंग, और ट्रबलशूटिंग शामिल है
  - [Microservices Architecture](../../examples/container-app/microservices): उत्पादन-तैयार मल्टी-सर्विस तैनाती (API Gateway, Product, Order, User, Notification), असिंक्रोनस मैसेजिंग, Service Bus, Cosmos DB, Azure SQL, वितरित ट्रेसिंग, ब्लू-ग्रीन/कॅनरी डिप्लॉयमेंट
- **Best Practices**: कंटेनरयुक्त कार्यभार के लिए सुरक्षा, मॉनिटरिंग, लागत अनुकूलन, और CI/CD मार्गदर्शन
- **Code Samples**: पूर्ण `azure.yaml`, Bicep टेम्पलेट्स, और बहु-भाषा सर्विस इम्प्लीमेंटेशन (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: एंड-टू-एंड टेस्ट परिदृश्य, मॉनिटरिंग कमांड, ट्रबलशूटिंग मार्गदर्शन

#### परिवर्तित
- **README.md**: "Local Examples - Container Applications" के अंतर्गत नए कंटेनर ऐप उदाहरणों को फीचर और लिंक करने के लिए अपडेट किया गया
- **examples/README.md**: कंटेनर ऐप उदाहरणों को उजागर करने, तुलना मैट्रिक्स एंट्री जोड़ने, और तकनीक/आर्किटेक्चर संदर्भ अपडेट करने के लिए संशोधित
- **Course Outline & Study Guide**: संबंधित अध्यायों में नए कंटेनर ऐप उदाहरणों और तैनाती पैटर्न का संदर्भ जोड़ने के लिए अपडेट

#### सत्यापित
- ✅ सभी नए उदाहरण `azd up` के साथ तैनात करने योग्य हैं और सर्वोत्तम प्रथाओं का पालन करते हैं
- ✅ दस्तावेज़ क्रॉस-लिंक्स और नेविगेशन अपडेट किए गए
- ✅ उदाहरण शुरुआती से उन्नत परिदृश्यों को कवर करते हैं, जिसमें उत्पादन माइक्रोसर्विसेस भी शामिल हैं

#### नोट्स
- **Scope**: अंग्रेज़ी दस्तावेज़ और उदाहरण केवल
- **Next Steps**: भविष्य के रिलीज़ में अतिरिक्त उन्नत कंटेनर पैटर्न और CI/CD ऑटोमेशन के साथ विस्तार

### [v3.5.0] - 2025-11-19

#### उत्पाद रीब्रांडिंग: Microsoft Foundry
**यह संस्करण अंग्रेज़ी दस्तावेज़ों में "Microsoft Foundry" के रूप में व्यापक उत्पाद नाम परिवर्तन को लागू करता है।**

#### परिवर्तित
- **🔄 Product Name Update**: "Microsoft Foundry" के लिए पूर्ण रीब्रांडिंग
  - अंग्रेज़ी दस्तावेज़ में `docs/` फ़ोल्डर में सभी संदर्भ अपडेट किए गए
  - फ़ोल्डर का नाम बदला गया: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - फाइल का नाम बदला गया: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - कुल: 23 सामग्री संदर्भ 7 दस्तावेज़ फ़ाइलों में अपडेट किए गए

- **📁 फ़ोल्डर संरचना में बदलाव**:
  - `docs/ai-foundry/` को `docs/microsoft-foundry/` के रूप में नाम बदल दिया गया
  - सभी क्रॉस-रेफ़रेन्स को नए फ़ोल्डर संरचना को दर्शाने के लिए अपडेट किया गया
  - नेविगेशन लिंक सभी दस्तावेज़ों में सत्यापित किए गए

- **📄 फ़ाइल नाम बदलना**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - सभी आंतरिक लिंक नए फ़ाइल नाम को संदर्भित करने के लिए अपडेट किए गए

#### अपडेट की गई फ़ाइलें
- **अध्याय दस्तावेज़ीकरण** (7 फ़ाइलें):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 नेविगेशन लिंक अपडेट
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 उत्पाद नाम संदर्भ अपडेट किए गए
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पहले से ही Microsoft Foundry का उपयोग कर रहा है (पिछले अपडेट से)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 संदर्भ अपडेट किए गए (ओवरव्यू, समुदाय प्रतिक्रिया, दस्तावेज़ीकरण)
  - `docs/getting-started/azd-basics.md` - 4 क्रॉस-रेफ़रेंस लिंक अपडेट
  - `docs/getting-started/first-project.md` - 2 अध्याय नेविगेशन लिंक अपडेट
  - `docs/getting-started/installation.md` - 2 अगला अध्याय लिंक अपडेट
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 संदर्भ अपडेट किए गए (नेविगेशन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - 1 नेविगेशन लिंक अपडेट
  - `docs/troubleshooting/debugging.md` - 1 नेविगेशन लिंक अपडेट

- **कोर्स संरचना फ़ाइलें** (2 फ़ाइलें):
  - `README.md` - 17 संदर्भ अपडेट किए गए (कोर्स ओवरव्यू, अध्याय शीर्षक, टेम्पलेट अनुभाग, समुदाय की अंतर्दृष्टियाँ)
  - `course-outline.md` - 14 संदर्भ अपडेट किए गए (ओवरव्यू, सीखने के उद्देश्य, अध्याय संसाधन)

#### सत्यापित
- ✅ अंग्रेज़ी दस्तावेज़ों में "ai-foundry" फ़ोल्डर पाथ के कोई शेष संदर्भ नहीं हैं
- ✅ अंग्रेज़ी दस्तावेज़ों में "Microsoft Foundry" उत्पाद नाम के कोई शेष संदर्भ नहीं हैं
- ✅ नई फ़ोल्डर संरचना के साथ सभी नेविगेशन लिंक कार्यशील हैं
- ✅ फ़ाइल और फ़ोल्डर नाम बदलने की प्रक्रिया सफलतापूर्वक पूरी हुई
- ✅ अध्यायों के बीच क्रॉस-रेफ़रेंस सत्यापित किए गए

#### नोट्स
- **Scope**: परिवर्तन केवल `docs/` फ़ोल्डर में अंग्रेज़ी दस्तावेज़ों पर लागू किए गए
- **Translations**: अनुवाद फ़ोल्डर्स (`translations/`) इस संस्करण में अपडेट नहीं किए गए
- **Workshop**: कार्यशाला सामग्री (`workshop/`) इस संस्करण में अपडेट नहीं की गई
- **Examples**: उदाहरण फ़ाइलें अभी भी लेगसी नामकरण का संदर्भ दे सकती हैं (भविष्य के अपडेट में संबोधित किया जाएगा)
- **External Links**: बाहरी URL और GitHub रिपॉज़िटरी संदर्भ अपरिवर्तित बने रहे

#### योगदानकर्ताओं के लिए माइग्रेशन गाइड
यदि आपकी लोकल ब्रांच या दस्तावेज़ पुराने स्ट्रक्चर का संदर्भ ले रही है:
1. फ़ोल्डर संदर्भ अपडेट करें: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फ़ाइल संदर्भ अपडेट करें: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पाद नाम बदलें: "Microsoft Foundry" → "Microsoft Foundry"
4. सत्यापित करें कि सभी आंतरिक दस्तावेज़ लिंक अभी भी कार्य कर रहे हैं

---

### [v3.4.0] - 2025-10-24

#### इंफ्रास्ट्रक्चर प्रीव्यू और सत्यापन संवर्द्धन
**यह संस्करण नए Azure Developer CLI प्रीव्यू फीचर के लिए व्यापक समर्थन प्रस्तुत करता है और कार्यशाला उपयोगकर्ता अनुभव को बेहतर बनाता है।**

#### जोड़ा गया
- **🧪 azd provision --preview Feature Documentation**: नए इंफ्रास्ट्रक्चर प्रीव्यू क्षमता का व्यापक कवरेज
  - कमांड संदर्भ और उपयोग उदाहरण चीट शीट में
  - प्राविज़निंग गाइड में उपयोग मामलों और लाभों के साथ विस्तृत एकीकरण
  - सुरक्षित डिप्लॉयमेंट सत्यापन के लिए प्री-फ़्लाइट चेक एकीकरण
  - सुरक्षा-प्रथम डिप्लॉयमेंट प्रथाओं के साथ गेटिंग स्टार्टेड गाइड अपडेट
- **🚧 Workshop Status Banner**: कार्यशाला विकास स्थिति को सूचित करने वाला प्रोफेशनल HTML बैनर
  - स्पष्ट उपयोगकर्ता संचार के लिए कंस्ट्रक्शन संकेतों के साथ ग्रेडिएंट डिज़ाइन
  - पारदर्शिता के लिए अंतिम अपडेट टाइमस्टैम्प
  - सभी डिवाइस प्रकारों के लिए मोबाइल-उत्तरदायी डिज़ाइन

#### संवर्धित
- **Infrastructure Safety**: प्रीव्यू कार्यक्षमता को पूरे डिप्लॉयमेंट दस्तावेज़ में एकीकृत किया गया
- **Pre-deployment Validation**: स्वचालित स्क्रिप्ट अब इंफ्रास्ट्रक्चर प्रीव्यू परीक्षण शामिल करती हैं
- **Developer Workflow**: प्रीव्यू को सर्वश्रेष्ठ अभ्यास के रूप में शामिल करने के लिए कमांड अनुक्रम अपडेट किए गए
- **Workshop Experience**: उपयोगकर्ताओं के लिए सामग्री विकास स्थिति के बारे में स्पष्ट अपेक्षाएँ सेट की गईं

#### परिवर्तित
- **Deployment Best Practices**: अब प्रीव्यू-फर्स्ट वर्कफ़्लो की सिफारिश की जाती है
- **Documentation Flow**: सीखने की प्रक्रिया में इंफ्रास्ट्रक्चर सत्यापन को पहले स्थान पर लाया गया
- **Workshop Presentation**: स्पष्ट विकास समयरेखा के साथ प्रोफेशनल स्थिति संचार

#### सुधारित
- **Safety-First Approach**: अब डिप्लॉयमेंट से पहले इंफ्रास्ट्रक्चर परिवर्तनों को सत्यापित किया जा सकता है
- **Team Collaboration**: प्रीव्यू परिणाम समीक्षा और अनुमोदन के लिए साझा किए जा सकते हैं
- **Cost Awareness**: प्राविज़न से पहले संसाधन लागत की बेहतर समझ
- **Risk Mitigation**: अग्रिम सत्यापन के माध्यम से डिप्लॉयमेंट विफलताओं में कमी

#### तकनीकी कार्यान्वयन
- **Multi-document Integration**: प्रीव्यू फीचर को 4 प्रमुख फ़ाइलों में दस्तावेज़ीकृत किया गया
- **Command Patterns**: दस्तावेज़ीकरण में सुसंगत सिंटैक्स और उदाहरण
- **Best Practice Integration**: प्रीव्यू को सत्यापन वर्कफ़्लो और स्क्रिप्ट में शामिल किया गया
- **Visual Indicators**: खोजयोग्यता के लिए स्पष्ट NEW फीचर मार्किंग

#### वर्कशॉप इन्फ्रास्ट्रक्चर
- **Status Communication**: ग्रेडिएंट स्टाइलिंग के साथ प्रोफेशनल HTML बैनर
- **User Experience**: स्पष्ट विकास स्थिति भ्रम को रोकती है
- **Professional Presentation**: अपेक्षाएँ सेट करते हुए रिपॉज़िटरी की विश्वसनीयता बनाए रखता है
- **Timeline Transparency**: जवाबदेही के लिए October 2025 अंतिम अपडेट टाइमस्टैम्प

### [v3.3.0] - 2025-09-24

#### संवर्धित वर्कशॉप सामग्री और इंटरैक्टिव सीखने का अनुभव
**यह संस्करण ब्राउज़र-आधारित इंटरैक्टिव गाइड और संरचित लर्निंग पाथ के साथ व्यापक वर्कशॉप सामग्री प्रस्तुत करता है।**

#### जोड़ा गया
- **🎥 Interactive Workshop Guide**: MkDocs प्रीव्यू क्षमताओं के साथ ब्राउज़र-आधारित वर्कशॉप अनुभव
- **📝 Structured Workshop Instructions**: डिस्कवरी से कस्टमाइज़ेशन तक 7-स्टेप गाइडेड लर्निंग पाथ
  - 0-Introduction: कार्यशाला का अवलोकन और सेटअप
  - 1-Select-AI-Template: टेम्पलेट खोज और चयन प्रक्रिया
  - 2-Validate-AI-Template: डिप्लॉयमेंट और सत्यापन प्रक्रियाएँ
  - 3-Deconstruct-AI-Template: टेम्पलेट आर्किटेक्चर को समझना
  - 4-Configure-AI-Template: कॉन्फ़िगरेशन और अनुकूलन
  - 5-Customize-AI-Template: उन्नत संशोधन और पुनरावृत्तियाँ
  - 6-Teardown-Infrastructure: क्लीनअप और संसाधन प्रबंधन
  - 7-Wrap-up: सारांश और आगे के कदम
- **🛠️ Workshop Tooling**: बेहतर सीखने के अनुभव के लिए Material थीम के साथ MkDocs कॉन्फ़िगरेशन
- **🎯 Hands-On Learning Path**: 3-स्टेप कार्यप्रणाली (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: सहज विकास वातावरण सेटअप

#### संवर्धित
- **AI Workshop Lab**: 2-3 घंटे के संरचित लर्निंग अनुभव के साथ विस्तारित
- **Workshop Documentation**: नेविगेशन और विज़ुअल सहायता के साथ प्रोफेशनल प्रस्तुति
- **Learning Progression**: टेम्पलेट चयन से प्रोडक्शन डिप्लॉयमेंट तक स्पष्ट चरण-दर-चरण मार्गदर्शन
- **Developer Experience**: सुव्यवस्थित विकास वर्कफ़्लो के लिए एकीकृत टूलिंग

#### सुधारित
- **Accessibility**: खोज, कॉपी फ़ंक्शन और थीम टॉगल के साथ ब्राउज़र-आधारित इंटरफ़ेस
- **Self-Paced Learning**: विभिन्न सीखने की गति को समायोजित करने के लिए लचीला वर्कशॉप ढांचा
- **Practical Application**: वास्तविक दुनिया के AI टेम्पलेट डिप्लॉयमेंट परिदृश्य
- **Community Integration**: वर्कशॉप समर्थन और सहयोग के लिए Discord एकीकरण

#### वर्कशॉप सुविधाएँ
- **Built-in Search**: त्वरित कीवर्ड और पाठ्यक्रम खोज
- **Copy Code Blocks**: सभी कोड उदाहरणों के लिए होवर-टू-कॉपी फ़ंक्शनलिटी
- **Theme Toggle**: विभिन्न प्राथमिकताओं के लिए डार्क/लाइट मोड समर्थन
- **Visual Assets**: बेहतर समझ के लिए स्क्रीनशॉट और डायग्राम
- **Help Integration**: समुदाय समर्थन के लिए सीधे Discord पहुँच

### [v3.2.0] - 2025-09-17

#### प्रमुख नेविगेशन पुनर्गठन और अध्याय-आधारित लर्निंग सिस्टम
**यह संस्करण एक व्यापक अध्याय-आधारित लर्निंग संरचना और पूरे रिपॉज़िटरी में उन्नत नेविगेशन पेश करता है।**

#### जोड़ा गया
- **📚 अध्याय-आधारित लर्निंग सिस्टम**: पूरे कोर्स को 8 प्रोग्रेसिव लर्निंग अध्यायों में पुनर्संरचित किया गया
  - अध्याय 1: बुनियाद और त्वरित प्रारंभ (⭐ - 30-45 मिनट)
  - अध्याय 2: AI-प्रथम विकास (⭐⭐ - 1-2 घंटे)
  - अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण (⭐⭐ - 45-60 मिनट)
  - अध्याय 4: इन्फ्रास्ट्रक्चर एज कोड और डिप्लॉयमेंट (⭐⭐⭐ - 1-1.5 घंटे)
  - अध्याय 5: मल्टी-एजेंट AI समाधान (⭐⭐⭐⭐ - 2-3 घंटे)
  - अध्याय 6: प्री-डिप्लॉयमेंट सत्यापन और योजना (⭐⭐ - 1 घंटा)
  - अध्याय 7: ट्रबलशूटिंग और डिबगिंग (⭐⭐ - 1-1.5 घंटे)
  - अध्याय 8: प्रोडक्शन और एंटरप्राइज़ पैटर्न (⭐⭐⭐⭐ - 2-3 घंटे)
- **📚 व्यापक नेविगेशन सिस्टम**: सभी दस्तावेज़ों में सुसंगत नेविगेशन हेडर और फुटर
- **🎯 प्रोग्रेस ट्रैकिंग**: कोर्स पूरा करने की चेकलिस्ट और लर्निंग सत्यापन प्रणाली
- **🗺️ लर्निंग पाथ मार्गदर्शन**: विभिन्न अनुभव स्तरों और लक्ष्यों के लिए स्पष्ट प्रवेश बिंदु
- **🔗 क्रॉस-रेफ़रेंस नेविगेशन**: संबंधित अध्याय और पूर्वापेक्षाएँ स्पष्ट रूप से जुड़ी हुई

#### संवर्धित
- **README संरचना**: अध्याय-आधारित संगठन के साथ एक संरचित लर्निंग प्लेटफ़ॉर्म में रूपांतरित
- **दस्तावेज़ीकरण नेविगेशन**: अब हर पृष्ठ में अध्याय संदर्भ और प्रगति मार्गदर्शन शामिल है
- **टेम्पलेट संगठन**: उदाहरण और टेम्पलेट उपयुक्त अध्यायों के साथ मैप किए गए
- **संसाधन एकीकरण**: चीट शीट, FAQs, और स्टडी गाइड संबंधित अध्यायों से जुड़े हुए
- **वर्कशॉप एकीकरण**: हैंड्स-ऑन लैब्स कई अध्याय लर्निंग उद्देश्यों के साथ मैप किए गए

#### परिवर्तित
- **लर्निंग प्रोग्रेशन**: रैखिक दस्तावेज़ीकरण से लचीले अध्याय-आधारित लर्निंग में प्रगति
- **कॉन्फ़िगरेशन प्लेसमेंट**: बेहतर लर्निंग फ्लो के लिए कॉन्फ़िगरेशन गाइड को अध्याय 3 में स्थानांतरित किया गया
- **AI सामग्री एकीकरण**: सीखने की यात्रा में AI-विशिष्ट सामग्री का बेहतर समेकन
- **प्रोडक्शन सामग्री**: एंटरप्राइज़ लर्नर्स के लिए उन्नत पैटर्न अध्याय 8 में समेकित किए गए

#### सुधारित
- **User Experience**: स्पष्ट नेविगेशन ब्रेडक्रंब और अध्याय प्रगति संकेतक
- **Accessibility**: आसान कोर्स नेविगेशन के लिए सुसंगत नेविगेशन पैटर्न
- **Professional Presentation**: अकादमिक और कॉर्पोरेट प्रशिक्षण के लिए विश्वविद्यालय-शैली कोर्स संरचना
- **Learning Efficiency**: बेहतर संगठन के माध्यम से प्रासंगिक सामग्री खोजने का समय घटा

#### तकनीकी कार्यान्वयन
- **Navigation Headers**: 40+ दस्तावेज़ फ़ाइलों में मानकीकृत अध्याय नेविगेशन
- **Footer Navigation**: सुसंगत प्रगति मार्गदर्शन और अध्याय पूर्णता संकेतक
- **Cross-Linking**: संबंधित अवधारणाओं को जोड़ने वाली व्यापक आंतरिक लिंकिंग प्रणाली
- **Chapter Mapping**: टेम्पलेट और उदाहरणों को स्पष्ट रूप से लर्निंग उद्देश्यों से जोड़ना

#### स्टडी गाइड संवर्धन
- **📚 व्यापक लर्निंग उद्देश्य**: स्टडी गाइड को 8-अध्याय प्रणाली के अनुरूप पुनर्गठित किया गया
- **🎯 अध्याय-आधारित मूल्यांकन**: प्रत्येक अध्याय में विशिष्ट लर्निंग उद्देश्य और व्यावहारिक अभ्यास शामिल हैं
- **📋 प्रोग्रेस ट्रैकिंग**: मापनीय परिणाम और पूर्णता चेकलिस्ट के साथ साप्ताहिक लर्निंग शेड्यूल
- **❓ आकलन प्रश्न**: प्रत्येक अध्याय के लिए ज्ञान सत्यापन प्रश्न पेशेवर परिणामों के साथ
- **🛠️ व्यावहारिक अभ्यास**: वास्तविक डिप्लॉयमेंट परिदृश्यों के साथ हैंड्स-ऑन गतिविधियाँ और ट्रबलशूटिंग
- **📊 कौशल प्रोग्रेशन**: बुनियादी अवधारणाओं से एंटरप्राइज़ पैटर्न तक स्पष्ट उन्नति और करियर विकास पर ध्यान
- **🎓 प्रमाणन ढांचा**: पेशेवर विकास परिणाम और समुदाय मान्यता प्रणाली
- **⏱️ टाइमलाइन प्रबंधन**: माइलस्टोन सत्यापन के साथ संरचित 10-सप्ताह लर्निंग प्लान

### [v3.1.0] - 2025-09-17

#### संवर्धित मल्टी-एजेंट AI समाधान
**यह संस्करण बेहतर एजेंट नामकरण और उन्नत दस्तावेज़ीकरण के साथ रिटेल मल्टी-एजेंट समाधान में सुधार करता है।**

#### परिवर्तित
- **Multi-Agent Terminology**: रिटेल मल्टी-एजेंट समाधान में स्पष्ट समझ के लिए "Cora agent" को "Customer agent" से प्रतिस्थापित किया गया
- **Agent Architecture**: सभी दस्तावेज़, ARM टेम्पलेट, और कोड उदाहरणों में संगत "Customer agent" नामकरण अपडेट किया गया
- **Configuration Examples**: अद्यतित नामकरण कन्वेंशनों के साथ एजेंट कॉन्फ़िगरेशन पैटर्न आधुनिकीकृत किए गए
- **Documentation Consistency**: सुनिश्चित किया गया कि सभी संदर्भ व्यावसायिक, वर्णनात्मक एजेंट नामों का उपयोग करें

#### संवर्धित
- **ARM Template Package**: Customer agent संदर्भों के साथ retail-multiagent-arm-template अपडेट किया गया
- **Architecture Diagrams**: अपडेटेड एजेंट नामकरण के साथ Mermaid डायग्राम ताज़ा किए गए
- **Code Examples**: Python क्लास और इम्प्लीमेंटेशन उदाहरण अब CustomerAgent नामकरण प्रयोग करते हैं
- **Environment Variables**: सभी डिप्लॉयमेंट स्क्रिप्ट को CUSTOMER_AGENT_NAME कन्वेंशन का उपयोग करने के लिए अपडेट किया गया

#### सुधारित
- **Developer Experience**: दस्तावेज़ीकरण में स्पष्ट एजेंट भूमिकाएँ और जिम्मेदारियाँ
- **Production Readiness**: एंटरप्राइज़ नामकरण कन्वेंशनों के साथ बेहतर संरेखण
- **Learning Materials**: शैक्षिक उद्देश्यों के लिए और अधिक सहज एजेंट नामकरण
- **Template Usability**: एजेंट फ़ंक्शंस और डिप्लॉयमेंट पैटर्न की सरल समझ

#### तकनीकी विवरण
- CustomerAgent संदर्भों के साथ Mermaid आर्किटेक्चर डायग्राम अपडेट किए गए
- Python उदाहरणों में CoraAgent क्लास नामों को CustomerAgent में बदला गया
- ARM टेम्पलेट JSON कॉन्फ़िगरेशन में "customer" एजेंट प्रकार का उपयोग करने के लिए संशोधन
- पर्यावरण चर CORA_AGENT_* से CUSTOMER_AGENT_* पैटर्न में अपडेट किए गए
- सभी डिप्लॉयमेंट कमांड और कंटेनर कॉन्फ़िगरेशन ताज़ा किए गए

### [v3.0.0] - 2025-09-12

#### बड़े परिवर्तन - AI डेवलपर फोकस और Microsoft Foundry एकीकरण
**यह संस्करण रिपॉज़िटरी को एक व्यापक AI-केंद्रित लर्निंग संसाधन में परिवर्तित करता है जिसमें Microsoft Foundry एकीकरण शामिल है।**

#### जोड़ा गया
- **🤖 AI-First Learning Path**: AI डेवलपर्स और इंजीनियर्स को प्राथमिकता देने वाली पूर्ण पुनर्रचना
- **Microsoft Foundry Integration Guide**: AZD को Microsoft Foundry सेवाओं से कनेक्ट करने के लिए व्यापक दस्तावेज़ीकरण
- **AI Model Deployment Patterns**: मॉडल चयन, कॉन्फ़िगरेशन, और प्रोडक्शन डिप्लॉयमेंट रणनीतियों को कवर करने वाला विस्तृत मार्गदर्शक
- **AI Workshop Lab**: 2-3 घंटे का हाथों-पर-हाथ कार्यशाला जो AI एप्लिकेशन को AZD-डिप्लॉय करने योग्य समाधानों में बदलने के लिए है
- **Production AI Best Practices**: AI वर्कलोड्स के स्केलिंग, मॉनिटरिंग, और सुरक्षा के लिए एंटरप्राइज़-तैयार पैटर्न
- **AI-Specific Troubleshooting Guide**: Microsoft Foundry Models, Cognitive Services, और AI डिप्लॉयमेंट समस्याओं के लिए व्यापक ट्रबलशूटिंग
- **AI Template Gallery**: Microsoft Foundry टेम्पलेट्स का प्रदर्शित संग्रह जटिलता रेटिंग के साथ
- **Workshop Materials**: हाथों-पर-हाथ लैब और संदर्भ सामग्री के साथ पूर्ण कार्यशाला संरचना

#### उन्नत
- **README Structure**: AI-डेवलपर केंद्रित जिसमें Microsoft Foundry Discord से 45% समुदाय दिलचस्पी डेटा शामिल है
- **Learning Paths**: छात्रों और DevOps इंजीनियर्स के पारंपरिक मार्गों के साथ समर्पित AI डेवलपर यात्रा
- **Template Recommendations**: प्रदर्शित AI टेम्पलेट्स जिनमें azure-search-openai-demo, contoso-chat, और openai-chat-app-quickstart शामिल हैं
- **Community Integration**: AI-विशेष चैनलों और चर्चाओं के साथ विस्तारित Discord समुदाय समर्थन

#### सुरक्षा और प्रोडक्शन फोकस
- **Managed Identity Patterns**: AI-विशिष्ट प्रमाणीकरण और सुरक्षा कॉन्फ़िगरेशन
- **Cost Optimization**: AI वर्कलोड्स के लिए टोकन उपयोग ट्रैकिंग और बजट नियंत्रण
- **Multi-Region Deployment**: वैश्विक AI एप्लिकेशन तैनाती के रणनीतियाँ
- **Performance Monitoring**: AI-विशिष्ट मेट्रिक्स और Application Insights एकीकरण

#### दस्तावेज़ीकरण गुणवत्ता
- **Linear Course Structure**: शुरुआती से उन्नत AI तैनाती पैटर्न तक तार्किक प्रगति
- **Validated URLs**: सभी बाहरी रिपोजिटरी लिंक सत्यापित और सुलभ
- **Complete Reference**: सभी आंतरिक दस्तावेज़ीकरण लिंक सत्यापित और क्रियाशील
- **Production Ready**: वास्तविक दुनिया के उदाहरणों के साथ एंटरप्राइज़ तैनाती पैटर्न

### [v2.0.0] - 2025-09-09

#### प्रमुख परिवर्तन - रिपोजिटरी पुनर्संरचना और पेशेवर उन्नयन
**यह संस्करण रिपोजिटरी संरचना और सामग्री प्रस्तुति का एक महत्वपूर्ण ओवरहाल दर्शाता है।**

#### जोड़ा गया
- **Structured Learning Framework**: अब सभी दस्तावेज़ीकरण पृष्ठों में परिचय, लर्निंग लक्ष्य, और लर्निंग आउटपुट सेक्शन शामिल हैं
- **Navigation System**: मार्गदर्शित लर्निंग प्रगति के लिए सभी दस्तावेज़ीकरण में Previous/Next लेसन लिंक जोड़े गए
- **Study Guide**: लर्निंग उद्देश्यों, अभ्यास के अभ्यास, और मूल्यांकन सामग्री के साथ comprehensive study-guide.md
- **Professional Presentation**: बेहतर पहुँच और पेशेवर दिखावट के लिए सभी इमोजी आइकन हटाए गए
- **Enhanced Content Structure**: लर्निंग सामग्री के संगठन और प्रवाह में सुधार

#### बदला गया
- **Documentation Format**: सभी दस्तावेज़ीकरण को मानकीकृत लर्निंग-फ़ोकस्ड संरचना के साथ रूपांतरित किया गया
- **Navigation Flow**: सभी लर्निंग सामग्री में तार्किक प्रगति लागू की गई
- **Content Presentation**: स्पष्ट, पेशेवर स्वरूपण के पक्ष में सजावटी तत्व हटाए गए
- **Link Structure**: नए नेविगेशन सिस्टम का समर्थन करने के लिए सभी आंतरिक लिंक अपडेट किए गए

#### सुधारा गया
- **Accessibility**: बेहतर स्क्रीन रीडर संगतता के लिए इमोजी निर्भरताएँ हटाई गईं
- **Professional Appearance**: एंटरप्राइज़ लर्निंग के लिए उपयुक्त साफ़, एकेडेमिक-शैली प्रस्तुति
- **Learning Experience**: प्रत्येक पाठ के लिए स्पष्ट उद्देश्यों और आउटपुट के साथ संरचित दृष्टिकोण
- **Content Organization**: संबंधित विषयों के बीच बेहतर तार्किक प्रवाह और संबंध

### [v1.0.0] - 2025-09-09

#### प्रारंभिक रिलीज - व्यापक AZD लर्निंग रिपोजिटरी

#### जोड़ा गया
- **Core Documentation Structure**
  - पूर्ण getting-started गाइड सीरीज़
  - व्यापक डिप्लॉयमेंट और प्रोविज़निंग दस्तावेज़ीकरण
  - विस्तृत ट्रबलशूटिंग संसाधन और डिबगिंग गाइड
  - प्री-डिप्लॉयमेंट वैलिडेशन टूल्स और प्रक्रियाएँ

- **Getting Started Module**
  - AZD Basics: मुख्य अवधारणाएँ और शब्दावली
  - Installation Guide: प्लेटफ़ॉर्म-विशिष्ट सेटअप निर्देश
  - Configuration Guide: वातावरण सेटअप और प्रमाणीकरण
  - First Project Tutorial: चरण-दर-चरण हाथों-पर-हाथ सीखना

- **Deployment and Provisioning Module**
  - Deployment Guide: पूर्ण वर्कफ़्लो दस्तावेज़ीकरण
  - Provisioning Guide: Bicep के साथ इन्फ्रास्ट्रक्चर ऐज़ कोड
  - प्रोडक्शन डिप्लॉयमेंट के लिए सर्वोत्तम प्रथाएँ
  - मल्टी-सर्विस आर्किटेक्चर पैटर्न

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure संसाधन उपलब्धता सत्यापन
  - SKU Selection: व्यापक सेवा टियर मार्गदर्शन
  - Pre-flight Checks: स्वचालित वैलिडेशन स्क्रिप्ट्स (PowerShell and Bash)
  - लागत अनुमान और बजट योजना उपकरण

- **Troubleshooting Module**
  - आम समस्याएँ: अक्सर आने वाली समस्याएँ और समाधान
  - Debugging Guide: व्यवस्थित ट्रबलशूटिंग पद्धतियाँ
  - उन्नत डायग्नॉस्टिक तकनीकें और टूल्स
  - प्रदर्शन मॉनिटरिंग और अनुकूलन

- **Resources and References**
  - Command Cheat Sheet: आवश्यक कमांड्स के लिए त्वरित संदर्भ
  - Glossary: व्यापक शब्दावली और संक्षिप्ताक्षर परिभाषाएँ
  - FAQ: सामान्य प्रश्नों के विस्तृत उत्तर
  - बाहरी संसाधन लिंक और समुदाय कनेक्शन्स

- **Examples and Templates**
  - सरल वेब एप्लिकेशन उदाहरण
  - स्टैटिक वेबसाइट डिप्लॉयमेंट टेम्पलेट
  - कंटेनर एप्लिकेशन कॉन्फ़िगरेशन
  - डेटाबेस इंटीग्रेशन पैटर्न
  - माइक्रोसर्विसेस आर्किटेक्चर उदाहरण
  - सर्वरलेस फ़ंक्शन इम्प्लीमेंटेशन

#### विशेषताएँ
- **Multi-Platform Support**: Windows, macOS, और Linux के लिए इंस्टॉलेशन और कॉन्फ़िगरेशन गाइड
- **Multiple Skill Levels**: सामग्री छात्रों से पेशेवर डेवलपर्स तक के लिए डिज़ाइन की गई
- **Practical Focus**: हाथों-पर-हाथ उदाहरण और वास्तविक दुनिया के परिदृश्य
- **Comprehensive Coverage**: मूलभूत अवधारणाओं से लेकर उन्नत एंटरप्राइज़ पैटर्न तक
- **Security-First Approach**: समग्र रूप से एकीकृत सुरक्षा सर्वोत्तम प्रथाएँ
- **Cost Optimization**: लागत-कुशल तैनाती और संसाधन प्रबंधन के लिए मार्गदर्शन

#### दस्तावेज़ीकरण गुणवत्ता
- **Detailed Code Examples**: व्यावहारिक, परखा हुआ कोड नमूने
- **Step-by-Step Instructions**: स्पष्ट, क्रियात्मक मार्गदर्शन
- **Comprehensive Error Handling**: सामान्य समस्याओं के लिए ट्रबलशूटिंग
- **Best Practices Integration**: उद्योग मानक और सिफारिशें
- **Version Compatibility**: नवीनतम Azure सेवाओं और azd सुविधाओं के साथ अद्यतित

## नियोजित भविष्य के उन्नयन

### Version 3.1.0 (योजना)
#### AI प्लेटफ़ॉर्म विस्तार
- **Multi-Model Support**: Hugging Face, Azure Machine Learning, और कस्टम मॉडल्स के लिए एकीकरण पैटर्न
- **AI Agent Frameworks**: LangChain, Semantic Kernel, और AutoGen डिप्लॉयमेंट के लिए टेम्पलेट्स
- **Advanced RAG Patterns**: Azure AI Search के परे वेक्टर डेटाबेस विकल्प (Pinecone, Weaviate, आदि)
- **AI Observability**: मॉडल प्रदर्शन, टोकन उपयोग, और प्रतिक्रिया गुणवत्ता के लिए उन्नत मॉनिटरिंग

#### डेवलपर अनुभव
- **VS Code Extension**: एकीकृत AZD + Microsoft Foundry डेवलपमेंट अनुभव
- **GitHub Copilot Integration**: AI-सहायता प्राप्त AZD टेम्पलेट जेनेरेशन
- **Interactive Tutorials**: AI परिदृश्यों के लिए स्वचालित वैलिडेशन के साथ हैंड्स-ऑन कोडिंग अभ्यास
- **Video Content**: AI तैनाती पर ध्यान केंद्रित करने वाले दृश्य शिक्षार्थियों के लिए पूरक वीडियो ट्यूटोरियल

### Version 4.0.0 (योजना)
#### एंटरप्राइज़ AI पैटर्न
- **Governance Framework**: AI मॉडल गवर्नेंस, अनुपालन, और ऑडिट ट्रेल्स
- **Multi-Tenant AI**: पृथक AI सेवाओं के साथ कई ग्राहकों को सेवा प्रदान करने के पैटर्न
- **Edge AI Deployment**: Azure IoT Edge और कंटेनर इंस्टेंस के साथ एकीकरण
- **Hybrid Cloud AI**: AI वर्कलोड्स के लिए मल्टी-क्लाउड और हाइब्रिड तैनाती पैटर्न

#### उन्नत फीचर्स
- **AI Pipeline Automation**: Azure Machine Learning पाइपलाइनों के साथ MLOps एकीकरण
- **Advanced Security**: ज़ीरो-ट्रस्ट पैटर्न, प्राइवेट एंडपॉइंट्स, और उन्नत खतरा सुरक्षा
- **Performance Optimization**: उच्च-थ्रूपुट AI एप्लिकेशन्स के लिए उन्नत ट्यूनिंग और स्केलिंग रणनीतियाँ
- **Global Distribution**: AI एप्लिकेशन्स के लिए कंटेंट डिलीवरी और एज कैशिंग पैटर्न

### Version 3.0.0 (योजना) - वर्तमान रिलीज द्वारा अधिलेखित
#### प्रस्तावित जोड़ - अब v3.0.0 में लागू
- ✅ **AI-Focused Content**: व्यापक Microsoft Foundry एकीकरण (Completed)
- ✅ **Interactive Tutorials**: हैंड्स-ऑन AI वर्कशॉप लैब (Completed)
- ✅ **Advanced Security Module**: AI-विशिष्ट सुरक्षा पैटर्न (Completed)
- ✅ **Performance Optimization**: AI वर्कलोड ट्यूनिंग रणनीतियाँ (Completed)

### Version 2.1.0 (योजना) - आंशिक रूप से v3.0.0 में लागू
#### छोटे उन्नयन - कुछ वर्तमान रिलीज़ में पूर्ण
- ✅ **Additional Examples**: AI-केन्द्रित डिप्लॉयमेंट परिदृश्य (Completed)
- ✅ **Extended FAQ**: AI-विशिष्ट प्रश्न और ट्रबलशूटिंग (Completed)
- **Tool Integration**: बेहतर IDE और एडिटर इंटीग्रेशन गाइड
- ✅ **Monitoring Expansion**: AI-विशिष्ट मॉनिटरिंग और अलर्टिंग पैटर्न (Completed)

#### भविष्य के रिलीज़ के लिए अभी भी योजना में
- **Mobile-Friendly Documentation**: मोबाइल लर्निंग के लिए उत्तरदायी डिज़ाइन
- **Offline Access**: डाउनलोड करने योग्य दस्तावेज़ीकरण पैकेज
- **Enhanced IDE Integration**: AZD + AI वर्कफ़्लो के लिए VS Code एक्सटेंशन
- **Community Dashboard**: रीयल-टाइम समुदाय मेट्रिक्स और योगदान ट्रैकिंग

## चेंजलॉग में योगदान करना

### परिवर्तन रिपोर्ट करना
जब आप इस रिपोजिटरी में योगदान कर रहे हों, कृपया सुनिश्चित करें कि चेंजलॉग प्रविष्टियाँ शामिल हों:

1. **Version Number**: semantic versioning (major.minor.patch) का पालन करते हुए
2. **Date**: रिलीज़ या अपडेट की तारीख YYYY-MM-DD फॉर्मेट में
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: जो बदला उसकी संक्षिप्त व्याख्या
5. **Impact Assessment**: परिवर्तन मौजूदा उपयोगकर्ताओं को कैसे प्रभावित करते हैं

### परिवर्तन श्रेणियाँ

#### Added
- नई विशेषताएँ, दस्तावेज़ीकरण सेक्शन, या क्षमताएँ
- नए उदाहरण, टेम्पलेट, या लर्निंग संसाधन
- अतिरिक्त टूल्स, स्क्रिप्ट्स, या यूटिलिटीज़

#### Changed
- मौजूदा कार्यक्षमता या दस्तावेज़ीकरण में संशोधन
- स्पष्टता या सटीकता में सुधार के अपडेट
- सामग्री या संगठन का पुनर्संरचना

#### Deprecated
- ऐसी विशेषताएँ या दृष्टिकोण जिन्हें चरणबद्ध रूप से हटाया जा रहा है
- दस्तावेज़ीकरण सेक्शन जो हटाने के लिए अनुसूचित हैं
- ऐसे तरीके जिनके बेहतर विकल्प उपलब्ध हैं

#### Removed
- ऐसी विशेषताएँ, दस्तावेज़ीकरण, या उदाहरण जो अब प्रासंगिक नहीं हैं
- पुरानी जानकारी या डिप्रीकेटेड दृष्टिकोण
- अनावश्यक या एकत्रित सामग्री

#### Fixed
- दस्तावेज़ीकरण या कोड में त्रुटियों के सुधार
- रिपोर्ट की गई समस्याओं या समस्याओं का समाधान
- सटीकता या कार्यक्षमता में सुधार

#### Security
- सुरक्षा-संबंधी सुधार या फिक्स
- सुरक्षा सर्वोत्तम प्रथाओं के अपडेट
- सुरक्षा कमजोरियों का समाधान

### सेमांटिक वर्जनिंग गाइडलाइंस

#### Major Version (X.0.0)
- ब्रेकिंग परिवर्तन जो उपयोगकर्ता कार्रवाई की आवश्यकता रखते हैं
- सामग्री या संगठन की महत्वपूर्ण पुनर्संरचना
- परिवर्तन जो मौलिक दृष्टिकोण या पद्धति को बदलते हैं

#### Minor Version (X.Y.0)
- नई विशेषताएँ या सामग्री जोड़
- बैकवर्ड कंपैटिबिलिटी बनाए रखते हुए उन्नयन
- अतिरिक्त उदाहरण, टूल्स, या संसाधन

#### Patch Version (X.Y.Z)
- बग फिक्स और सुधार
- मौजूदा सामग्री में छोटे सुधार
- स्पष्टीकरण और छोटे उन्नयन

## समुदाय प्रतिक्रिया और सुझाव

हम इस लर्निंग रिसोर्स को बेहतर बनाने के लिए समुदाय की प्रतिक्रिया को सक्रिय रूप से प्रोत्साहित करते हैं:

### प्रतिक्रिया कैसे दें
- **GitHub Issues**: समस्याओं की रिपोर्ट करें या सुधार सुझाएँ (AI-विशिष्ट मुद्दे स्वागत योग्य)
- **Discord Discussions**: Microsoft Foundry समुदाय के साथ विचार साझा करें और व्यस्त हों
- **Pull Requests**: सामग्री में प्रत्यक्ष सुधार में योगदान करें, विशेषकर AI टेम्पलेट और गाइड्स
- **Microsoft Foundry Discord**: AZD + AI चर्चाओं के लिए #Azure चैनल में भाग लें
- **Community Forums**: व्यापक Azure डेवलपर चर्चाओं में भाग लें

### प्रतिक्रिया श्रेणियाँ
- **AI Content Accuracy**: AI सेवा एकीकरण और तैनाती जानकारी के सुधार
- **Learning Experience**: बेहतर AI डेवलपर लर्निंग फ़्लो के सुझाव
- **Missing AI Content**: अतिरिक्त AI टेम्पलेट, पैटर्न, या उदाहरणों के अनुरोध
- **Accessibility**: विविध सीखने की आवश्यकताओं के लिए सुधार
- **AI Tool Integration**: बेहतर AI डेवलपमेंट वर्कफ़्लो इंटीग्रेशन के सुझाव
- **Production AI Patterns**: एंटरप्राइज़ AI तैनाती पैटर्न अनुरोध

### प्रतिक्रिया प्रतिबद्धता
- **Issue Response**: रिपोर्ट की गई समस्याओं के लिए 48 घंटों के भीतर
- **Feature Requests**: एक सप्ताह के भीतर मूल्यांकन
- **Community Contributions**: एक सप्ताह के भीतर समीक्षा
- **Security Issues**: तत्काल प्राथमिकता के साथ शीघ्र उत्तर

## मेंटेनेंस शेड्यूल

### नियमित अपडेट
- **Monthly Reviews**: सामग्री सटीकता और लिंक सत्यापन
- **Quarterly Updates**: प्रमुख सामग्री जोड़ और सुधार
- **Semi-Annual Reviews**: व्यापक पुनर्संरचना और उन्नयन
- **Annual Releases**: महत्वपूर्ण सुधारों के साथ प्रमुख संस्करण अपडेट

### मॉनिटरिंग और गुणवत्ता आश्वासन
- **Automated Testing**: कोड उदाहरणों और लिंक का नियमित वैलिडेशन
- **Community Feedback Integration**: उपयोगकर्ता सुझावों का नियमित समावेश
- **Technology Updates**: नवीनतम Azure सेवाओं और azd रिलीज़ के साथ संरेखण
- **Accessibility Audits**: समावेशी डिज़ाइन सिद्धांतों के लिए नियमित समीक्षा

## संस्करण समर्थन नीति

### वर्तमान संस्करण समर्थन
- **Latest Major Version**: नियमित अपडेट के साथ पूर्ण समर्थन
- **Previous Major Version**: 12 महीनों के लिए सुरक्षा अपडेट और महत्वपूर्ण फिक्स
- **Legacy Versions**: केवल समुदाय समर्थन, आधिकारिक अपडेट नहीं

### माइग्रेशन गाइडेंस
जब प्रमुख संस्करण जारी किए जाते हैं, हम प्रदान करते हैं:
- **Migration Guides**: चरण-दर-चरण संक्रमण निर्देश
- **Compatibility Notes**: ब्रेकिंग परिवर्तनों के बारे में विवरण
- **Tool Support**: माइग्रेशन में सहायता के लिए स्क्रिप्ट या यूटिलिटीज़
- **Community Support**: माइग्रेशन प्रश्नों के लिए समर्पित फोरम

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**अपडेट रहें**: नए रिलीज़ और लर्निंग सामग्री में महत्वपूर्ण अपडेट के लिए इस रिपोजिटरी को वॉच करें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->