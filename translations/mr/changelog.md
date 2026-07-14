# चेंजलॉग - AZD फॉर बिगिनर्स

## परिचय

हा चेंजलॉग AZD फॉर बिगिनर्स रेपॉझिटरीतील सर्व उल्लेखनीय बदल, अद्यतने आणि सुधारणा दस्तऐवजीकृत करतो. आम्ही सेमॅंटिक व्हर्जनिंग तत्त्वांचे अनुसरण करतो आणि वापरकर्त्यांना व्हर्जन दरम्यान काय बदलले आहे हे समजून घेण्यास मदत करण्यासाठी हा लॉग राखतो.

## शिकण्याचे उद्दिष्टे

हा चेंजलॉग पुनरावलोकन करून, आपण:
- नवीन वैशिष्ट्ये आणि सामग्री जोडण्याबद्दल माहिती मिळवा
- विद्यमान दस्तऐवजीकरणात झालेल्या सुधारणा समजून घ्या
- अचूकता सुनिश्चित करण्यासाठी बग दुरुस्ती आणि सुधारणा ट्रॅक करा
- शिकण्याच्या साहित्याचा काळानुसार विकास पाहा

## शिकण्याचे परिणाम

चेंजलॉग नोंदी पाहिल्यानंतर, आपण सक्षम असाल:
- शिकण्यासाठी उपलब्ध नवीन सामग्री आणि संसाधने ओळखणे
- कोणत्या विभागात सुधारणा किंवा अद्यतने झाली आहेत हे समजून घेणे
- सध्याच्या साहित्यावर आधारित आपला शिकण्याचा मार्ग आखणे
- भविष्यातील सुधारण्यासाठी अभिप्राय आणि सूचना देणे

## आवृत्ती इतिहास

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 रिफ्रेश: आवृत्ती नूतनीकरण अद्यतन
**ही आवृत्ती `azd` `1.27.1` (जुलै 2026, नवीनतम स्थिर आवृत्ती) आणि चालू प्रीव्ह्यू AI एजंट विस्तार `azure.ai.agents` `1.0.0-beta.5` विरुद्ध अभ्यासक्रमाची पुनर्प्रमाणपत्र करते, ज्यामुळे 1.26.0, 1.27.0, आणि 1.27.1 रीलिझनंतर प्रत्येक "validated against" बॅनर अद्ययावत केला जातो.**

#### बदललेले
- **✅ प्रमाणीकरण बेसलाईन अद्यावत** `azd 1.25.6` (जून 2026) पासून `azd 1.27.1` (जुलै 2026) पर्यंत मूळ README, सर्व प्रकरणांच्या README फायली, प्रकरण 1 चा dev-container धडा (पिन केलेल्या आवृत्तीच्या उदाहरणांसह), प्रकरण 4 कस्टम-टेम्प्लेट्स धडा, प्रकरण 5 मल्टि-एजंट धडा, आणि कार्यशाळा दस्तऐवजांमध्ये
- **🤖 प्रकरण 2 बेसलाईन रिफ्रेश** `azd 1.23.12` (मार्च 2026) पासून `azd 1.27.1` पर्यंत `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, आणि `microsoft-foundry-integration.md` मध्ये; प्रमाणीकरण-नोट तारखा 2026-07-13 वर अद्ययावत
- **🧩 AI एजंट विस्तार वाढविला** प्रकरण 2 च्या README आणि `agents.md` मध्ये `azure.ai.agents` चे `0.1.40-preview`/`0.1.18-preview` पासून चालू `1.0.0-beta.5` रीलिझवर
- **🧪 कार्यशाळा प्रमाणीकरण उदाहरण** (`azd version` आउटपुट) `1.27.1` वर अद्ययावत

#### संबंधित azd रीलिझसंबंधी नोट्स (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions वर Flex Consumption साठी Go समर्थन, `azd config sub-filter` टेनंट-विशिष्ट सदस्यता फिल्टर्स, स्व-संग्रहीत विस्तार बंडल्स (`azd x pack --bundle`), आणि `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** `azure.yaml` मध्ये Azure AI Foundry प्रकल्प/एजंट्स थेट मॉडेल करणे (Bicep-शिवाय/Terraform-शिवाय इनिट), App Service साठी कंटेनर तैनाती समर्थन (`host: appservice` + `language: docker`), `azd extension` आदेशांसाठी थेट `-s/--source`, आणि `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install` साठी `--no-dependencies` फ्लॅग, डीप्रिकेटेड मॉडेल्स कॅटलॉग/कोटा विनंत्यांपासून डीफॉल्टने वगळले, आणि अनेक बग दुरुस्त्या

#### अद्ययावत फायली
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

#### बिगिनर गॅप-फिल #2: टेम्प्लेट लेखकता, देव कंटेनर्स, पुलुमी, Azure DevOps, सेवा प्रिन्सिपल आणि इतर
**ही आवृत्ती azd-coverage विश्लेषणाद्वारे उघडलेल्या उर्वरित मध्यम स्तरातील गॅप्स बंद करतो: आपले स्वतःचे टेम्प्लेट कसे लिहायचे आणि प्रकाशित करायचे, पुनरुत्पादनीय देव-कंटेनर/Codespaces वातावरण, पुलुमी इन्फ्रास्ट्रक्चर प्रदाता, Azure DevOps CI/CD मार्गक्रमण, सेवा-प्रिन्सिपल प्रमाणीकरण, होस्ट-निवड मार्गदर्शन (AKS/Spring Apps), `azd restore`/`azd package` स्पष्टीकरणे, हुक त्रुटी हाताळणी, आणि टीम/सामायिक वातावरण प्रथांचा आढावा.**

#### जोडलेले
- **🧱 नवीन प्रकरण 4 धडा** `docs/chapter-04-infrastructure/custom-templates.md` — आपले स्वतःचे azd टेम्प्लेट लिहिणे: आवश्यक संरचना (`azure.yaml`, `infra/`, `src/`), `metadata.template` क्षेत्र, `uniqueString()` रिसोर्स टोकन आणि `azd-env-name` टॅगसह इन्फ्रास्ट्रक्चरचे पॅरामेटरायझेशन, स्थानिक `azd init --template <local-path>` वापरून चाचणी, GitHub वर प्रकाशित करणे, आणि Awesome AZD गॅलरीमध्ये सादर करणे
- **📦 नवीन प्रकरण 1 धडा** `docs/chapter-01-foundation/dev-containers.md` — देव कंटेनर्स आणि GitHub Codespaces सह पुनरुत्पादनीय azd वातावरण: अधिकृत `ghcr.io/azure/azure-dev/azd` वैशिष्ट्यांसह किमान `.devcontainer/devcontainer.json`, भाषानिहाय वैशिष्ट्ये, कंटेनर होस्टसाठी `docker-in-docker`, आणि रिमोट साइन-इनसाठी `azd auth login --use-device-code`
- **🧩 पुलुमी सह azd** विभाग `docs/chapter-04-infrastructure/provisioning.md` मध्ये — `infra.provider: pulumi`, पुलुमी फोल्डर लेआउट, स्टॅक्स जो azd पर्यावरणांशी जोडलेले आहेत, आवश्यक आउटपुट/टॅगिंग, आणि ओळखीचा `azd up` / `azd down` वर्कफ्लो
- **🎯 होस्ट-निवड मार्गदर्शन** `docs/chapter-04-infrastructure/provisioning.md` मध्ये — सुरुवातीसाठी सोपी तुलना `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, आणि `springapp` यांची, आणि AKS किंवा Azure Spring Apps कधी निवडायचे याबाबत मार्गदर्शन
- **🛠️ Azure DevOps CI/CD मार्गक्रमण** `docs/chapter-08-production/production-ai-practices.md` मध्ये — `azd pipeline config --provider azdo`, workload identity federation (OIDC) सह सेवा कनेक्शन, तयार झालेला `azure-dev.yml`, आणि वेरिएबल-ग्रुप सेटअप
- **🔑 सेवा प्रिन्सिपल (पॅटर्न 4)** `docs/chapter-03-configuration/authsecurity.md` मध्ये जोडले — `az ad sp create-for-rbac`, क्लायंट सिक्रेटसह नॉन-इंटरऍक्टिव `azd auth login` विरुद्ध फेडरेटेड/OIDC क्रेडेन्शियल्स, वापरण्याची वेळ, आणि सुरक्षित क्रेडेन्शियल स्टोरेज
- **🪝 हुक त्रुटी हाताळणी** उपविभाग `docs/chapter-04-infrastructure/deployment-guide.md` मध्ये — exit कोड आणि `set -e`, `continueOnError`, `azd hooks run` सह हुक निष्पादन चाचणी, OS-विशिष्ट शेल्स, आणि `--debug`
- **👥 टीम / सामायिक वातावरण** विभाग `docs/chapter-03-configuration/configuration.md` मध्ये — `.azure/` मध्ये काय असते, gitignore काय करायचे, प्रति-विकासक वातावरण, `azd env list`/`select`, आणि CI/CD मध्ये वातावरण मूल्ये प्रदान करणे
- **🧰 `azd restore` आणि विस्तृत `azd package`** स्पष्टीकरणे `resources/cheat-sheet.md` मध्ये — अवलंबने पुनर्स्थापित करणे आणि तैनाती न करता तैनात करण्यायोग्य आर्टिफॅक्ट तयार करणे

#### बदललेले
- **🧭 प्रकरण 4 धडे तक्ता** नवीन "आपले स्वतःचे टेम्प्लेट लिहिणे" धडा (धडा 3) समाविष्ट करण्यासाठी अद्यतनित
- **🧭 प्रकरण 1 धडे तक्ता** नवीन "देव कंटेनर्स आणि Codespaces" धडा (धडा 5) समाविष्ट करण्यासाठी अद्यतनित; `bring-your-own-app.md` आणि `dev-containers.md` दरम्यान नेव्हिगेशन फूटर जोडले

### [v3.21.0] - 2026-06-16

#### बिगिनर गॅप-फिल: हाताळणी मल्टि-एजंट धडा, "आपले स्वतःचे अ‍ॅप" आणा, Terraform, आणि CI/CD मार्गक्रमण
**ही आवृत्ती पूर्ण बिगिनर्स गाइडसाठी सर्वात मोठे गॅप्स बंद करते दोन नवे हस्तक्षेप धडे जोडून (एक तैनात करण्यायोग्य मल्टि-एजंट मार्गक्रमण आणि एक विद्यमान अ‍ॅपमध्ये azd जोडणे), बिगिनर-फ्रेंडली हुक्स परिचय, Terraform-with-azd विभाग, GitHub Actions पाइपलाइन मार्गक्रमण, नवीन प्रीव्ह्यू विस्तारांसाठी स्पष्टीकरण, आणि स्पष्ट तैनाती-चाचणी यादी.**

#### जोडलेले
- **🤝 नवीन प्रकरण 5 धडा** `docs/chapter-05-multi-agent/multi-agent-basics.md` — पूर्णपणे हँड-ऑन, तैनात करण्यायोग्य दोन-एजंट मार्गक्रमण (ऑर्चेस्ट्रेटर + विशेषज्ञ) वास्तविक टेम्प्लेट (`contoso-creative-writer`) वापरून; मल्टि-एजंट कधी वापरायचा, `azd up` वर्कफ्लो, तैनात केलेल्या संसाधनांचे समजणे, क्रॉस-एजंट ट्रेसिंग, सानुकूलन, आणि स्वच्छता
- **📦 नवीन प्रकरण 1 धडा** `docs/chapter-01-foundation/bring-your-own-app.md` — विद्यमान प्रोजेक्टमध्ये azd कसे जोडायचे `azd init` सह ("सध्याच्या निर्देशिकेत कोड वापरा"), `azure.yaml` आणि `infra/` समजून घेणे, `azd infra generate`, होस्ट शोधणे, आणि `azd up` सह तैनात करणे
- **🌐 Terraform सह azd** विभाग `docs/chapter-04-infrastructure/provisioning.md` मध्ये — `infra.provider: terraform` कॉन्फिग, `.tf` फोल्डर योजना, आवश्यक `AZURE_*` आउटपुट आणि `azd-env-name` टॅगिंग, आणि समान `azd up` / `azd down` वर्कफ्लो (टीप जिथे Terraform समर्थन सांगितले गेले पण फक्त Bicep दाखवला गेला)
- **⚙️ टप्याटप्याने GitHub Actions मार्गक्रमण** `docs/chapter-08-production/production-ai-practices.md` मध्ये — GitHub रेपो पासून स्वयंचलित तैनातीपर्यंत: `azd pipeline config`, OIDC फेडरेटेड क्रेडेन्शियल्स (कोणतीही साठवलेली गुपिते नाहीत), तयार केलेला `azure-dev.yml`, आणि गुपित-आणि-चल मार्गदर्शन
- **🪝 बिगिनर "हुक्स नवखे?" परिचय** `docs/chapter-04-infrastructure/deployment-guide.md` मध्ये — हुक म्हणजे काय, हुक-स्टेज तक्ता, एक लहान प्रथम हुक, आणि `azd hooks run` सह हुक्स हाताळणी
- **✅ "आपली तैनात प्रक्रिया तपासा" यादी** `docs/chapter-01-foundation/first-project.md` च्या पावल्यानुसार 5 मध्ये जोडली — स्मोक चाचणी, हेल्थ एंडपॉईंट तपासणी, आणि स्पष्ट यश निकष
- **🧩 नवीन प्रीव्ह्यू विस्तारांसाठी स्पष्टीकरण** `azure.ai.skills` आणि `azure.ai.connections` (ते काय आहेत आणि ते कधी वापरायचे) `docs/chapter-08-production/production-ai-practices.md` मध्ये

#### बदललेले
- **🧭 प्रकरण 5 धडे तक्ता** सुधारित: `multi-agent-basics.md` आता धडा 1 आहे (एकमेव पूर्णपणे हँड-ऑन धडा), प्रामाणिक लेबलसह की धडा 2 प्रकरण 6 मध्ये आहे आणि रिटेल घटना आर्किटेक्चर ब्लूप्रिंट आहे, एक आदेशाने चालणारा टेम्प्लेट नाही
- **🧭 प्रकरण 1 धडे तक्ता** आता नवीन "आपले स्वतःचे अ‍ॅप आणा" धडा (धडा 4) समाविष्ट आहे
- **🔗 नेव्हिगेशन फूटर** अद्ययावत: `first-project.md` आता पुढे `bring-your-own-app.md` ला लिंक करते

#### दुरुस्त केलेले
- **🧱 "आक्षेपार्ह पण गहाळ" Terraform गॅप बंद केला** — कोर्स पूर्वी Terraform समर्थन उल्लेख करत असे पण तो दाखवलेला नव्हता
- **🔀 भ्रामक प्रकरण 5 क्रॉस-लिंक्स दुरुस्त केले** जे पूर्ण मल्टि-एजंट अमलात असल्याचे सूचित करत होते पण फक्त आर्किटेक्चर ब्लूप्रिंट होता

#### अद्ययावत फायली
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(नवीन)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(नवीन)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 रिफ्रेश, पूर्ण एजंट लाइफसायकल आदेश आणि Aspire रिब्रांड

**या आवृत्तीमध्ये कोर्सची `azd` `1.25.6` (जून 2026) आणि `azure.ai.agents` `0.1.40-preview` विस्ताराविरुद्ध पुन्हा पडताळणी केली आहे, AI मार्गदर्शन "एजंट तयार करा" पासून संपूर्ण एजंट जीवनचक्रावर (चाचणी → मूल्यांकन → सुधारणा → तपासणी → हटवा) विस्तृत केले आहे, नवीन `azure.ai.skills` आणि `azure.ai.connections` प्रिव्ह्यू विस्तार प्रकट केले आहेत, आणि ".NET Aspire" → "Aspire" उत्पादन पुनर्नामांकन सूचित केले आहे.**

#### जोडले
- **🔁 सुरुवातीसाठी आणि AI अभियंत्यांसाठी संपूर्ण एजंट जीवनचक्र कव्हरेज** दस्तऐवजांमध्ये:
  - `docs/chapter-01-foundation/azd-basics.md` — जीवनचक्र सारणी (स्कॅफोल्ड → चाचणी → मोजमाप → सुधारणा → तपासणी → स्वच्छता) विस्तार व AI आदेश विभागात जोडली
  - `docs/chapter-08-production/production-ai-practices.md` — नवीन "एजंट जीवनचक्र व्यवस्थापन" विभाग ज्यामध्ये `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, आणि `delete --force` चा समावेश आहे
  - `resources/cheat-sheet.md` — AI एजंट आदेशांचा विस्तार करून `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, आणि `delete --force` जोडले
- **🧩 नवीन प्रिव्ह्यू विस्तारांची नोंद**: `azure.ai.skills` (पुन्हा वापरता येणाऱ्या एजंट कौशल्ये) आणि `azure.ai.connections` (Foundry कनेक्शन्स) विस्तार सारणी आणि चीट शीटमध्ये जोडले
- **⏱️ प्रतिसाद वेळ मार्गदर्शन** — `azd ai agent invoke` उदाहरणे आता पूर्ण विलंब आणि पहिल्या बाईटपर्यंतचा वेळ छापते असं नमूद करतात
- **📌 आवृत्ती बॅनर** मुख्य README मध्ये जो शिकाऱ्यांना `azd version` आणि `azd upgrade` कडे निर्देशित करतो

#### बदलले
- **✅ पडताळणी आधार रेषा अद्ययावत** केली आहे `azd 1.23.12` (मार्च 2026) पासून `azd 1.25.6` (जून 2026) पर्यंत सर्व अध्यायांच्या README आणि कार्यशाळा दस्तऐवजांमध्ये
- **🤖 अध्याय 2 विस्तार नोट** अद्ययावत केली आहे `azure.ai.agents` `0.1.18-preview` पासून `0.1.40-preview` पर्यंत
- **🧪 कार्यशाळा पडताळणी उदाहरण** (`azd version` आउटपुट) अद्ययावत करून `1.25.6` केले
- **🧭 README "आज azd मध्ये काय नवीन?"** नूतनीकरण करून संपूर्ण एजंट जीवनचक्र, नवीन AI विस्तार आणि नुकतेच सुधारलेले कार्यक्षमतेचे बग निवारण (`azd init` पुनरावृत्तीक्षम, `azd auth login` जुना टोकन साफसफाई, `azd tool` प्रथम-चालू सूचना) हाइलाइट केले
- **📖 अध्याय 2 agents.md (पर्याय 4)** आता शिकाऱ्यांना `azd up` पर्याय न थांबता पोस्ट-तैनाती जीवनचक्र आदेशांकडे निर्देशित करते

#### दुरुस्त केले
- **🏷️ उत्पादन नावनिर्देशन** — Aspire रिब्रँड नोट (".NET Aspire" आता फक्त "Aspire") जोडली गेली; azd चा Aspire समर्थन अपरिवर्तित आहे
- **🔎 थेट प्रकाशन पडताळणी** Azure Developer CLI प्रकाशन फीडवर पुष्टी केली: स्थिर CLI `1.25.6` (2026-06-12) आणि `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### अद्ययावत फाइल्स
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

#### सुरुवातीसाठी ओनबोर्डिंग स्पष्टिकरण, सेटअप पडताळणी आणि अंतिम AZD आदेश स्वच्छता
**ही आवृत्ती AZD 1.23 पडताळणी स्विपनंतर सुरुवातीसाठी लक्ष केंद्रीत दस्तऐवजीकरण चालवते: हे AZD-प्रथम प्रमाणीकरण मार्गदर्शन स्पष्ट करते, स्थानिक सेटअप पडताळणी स्क्रिप्ट्स जोडते, लाइव्ह AZD CLI विरुद्ध प्रमुख आदेश पडताळते, आणि चेंजलॉग व्यतिरिक्त शेवटचे जास्त काळापूर्वीचे इंग्रजी-स्रोत आदेश संदर्भ काढून टाकते.**

#### जोडले
- **🧪 सुरुवातीचा सेटअप पडताळणी स्क्रिप्ट्स** `validate-setup.ps1` आणि `validate-setup.sh` सह जेणेकरून शिकारी अध्याय 1 सुरू करण्यापूर्वी आवश्यक टूल्सची पुष्टी करू शकतील
- **✅ पूर्वसूचना सेटअप पडताळणी पावले** मुख्य README आणि अध्याय 1 README मध्ये जेणेकरून `azd up` करण्यापूर्वी गहाळ असलेल्या पूर्वआवश्यकता पकडल्या जातील

#### बदलले
- **🔐 सुरुवातीचा प्रमाणीकरण मार्गदर्शन** आता सातत्याने `azd auth login` ला AZD वर्कफ्लोजसाठी प्राथमिक मार्ग मानते, तर `az login` वैकल्पिक म्हणून नोंदवले आहे जोपर्यंत Azure CLI आदेश थेट वापरले जात नाहीत
- **📚 अध्याय 1 ओनबोर्डिंग प्रवाह** आता शिकाऱ्यांना इंस्टॉलेशन, प्रमाणीकरण आणि प्रथम तैनाती पावले सुरू करण्यापूर्वी स्थानिक सेटअप पडताळण्यासाठी सांगते
- **🛠️ Validator संदेशभाषण** आता स्पष्टपणे ब्लॉकिंग आवश्यकता आणि वैकल्पिक Azure CLI चेतावणी AZD-केवळ सुरुवात मार्गासाठी स्वतंत्र करते
- **📖 कॉन्फिगरेशन, तुडवणी निवारण, आणि उदाहरण दस्तऐवज** आता आवश्यक AZD प्रमाणीकरण आणि वैकल्पिक Azure CLI साइन-इन यामध्ये फरक करतात जिथे दोन्ही पूर्वी संदर्भाशिवाय दिले गेले होते

#### दुरुस्त केले
- **📋 उरलेले इंग्रजी-स्रोत आदेश संदर्भ** सध्याच्या AZD रूपात अपडेट केले, त्यात चीट शीटमधील `azd config show` आणि Azure Portal आढावा मार्गदर्शनासाठी `azd monitor --overview` समाविष्ट आहे
- **🧭 सुरुवातीच्या दाव्यांमध्ये अध्याय 1** सर्व टेम्प्लेट्स आणि Azure संसाधनांमध्ये शून्य-त्रुटी किंवा रोलबॅक वागणूक हमी देण्यातून सौम्य केले
- **🔎 थेट CLI पडताळणी** सिद्ध केली सध्याचा समर्थन `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, आणि `azd down --force --purge` साठी

#### अद्ययावत फाइल्स
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

#### AZD 1.23.12 पडताळणी, कार्यशाळा पर्यावरण विस्तार आणि AI मॉडेल नूतनीकरण
**ही आवृत्ती `azd` `1.23.12` विरुद्ध दस्तऐवज पडताळणी करते, जुने AZD आदेश उदाहरणे अद्यतनित करते, AI मॉडेल मार्गदर्शन यथासमयी सुधारित करते आणि कार्यशाळा सूचना GitHub Codespaces व्यतिरिक्त dev कंटेनर आणि स्थानिक क्लोनसाठी देखील विस्तृत करते.**

#### जोडले
- **✅ मुख्य अध्याय आणि कार्यशाळा दस्तऐवजांमध्ये पडताळणी नोट्स** नवीन किंवा जुनी CLI बिल्ड वापरणाऱ्या शिकाऱ्यांसाठी AZD पडताळणी आधार स्पष्ट करण्यासाठी
- **⏱️ तैनातीची वेळ मर्यादा मार्गदर्शन** दीर्घकालीन AI अनुप्रयोग तैनातीसाठी `azd deploy --timeout 1800` वापरून
- **🔎 विस्तार तपासणी पावले** AI कार्यप्रवाह दस्तऐवजांमध्ये `azd extension show azure.ai.agents` सह
- **🌐 विस्तृत कार्यशाळा पर्यावरण मार्गदर्शन** GitHub Codespaces, dev कंटेनर, आणि स्थानिक क्लोनसह MkDocs वापरून कव्हर केले

#### बदलले
- **📚 अध्याय परिचय README** आता सातत्याने `azd 1.23.12` विरुद्ध पडताळणी नोंदवतात आधार, कॉन्फिगरेशन, इन्फ्रास्ट्रक्चर, मल्टी-एजंट, प्री-डिप्लॉयमेंट, तुडवणी निवारण, आणि उत्पादन विभागांमध्ये
- **🛠️ AZD आदेश संदर्भ** आता दस्तऐवजांमध्ये अद्ययावत:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` किंवा `azd env get-value(s)` संदर्भानुसार
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` जिथे Application Insights आढावा अपेक्षित आहे
- **🧪 प्रिव्ह्यूची उदाहरणे** साधी केली चालू स्वरूपात जेसे `azd provision --preview` आणि `azd provision --preview -e production`
- **🧭 कार्यशाळा प्रवाह** अद्ययावत, जेणेकरून शिकारी Codespaces, dev कंटेनर, किंवा स्थानिक क्लोनमध्ये प्रयोगशाळा पूर्ण करू शकतील Codespaces-चाललेले गृहीत न धरता
- **🔐 प्रमाणीकरण मार्गदर्शन** आता `azd auth login` ला प्राधान्य देते AZD वर्कफ्लोजसाठी, तर `az login` वैकल्पिक ठेवते जेव्हा Azure CLI आदेश थेट वापरतात

#### दुरुस्त केले
- **🪟 Windows इंस्टॉलेशन आदेश** इन्स्टॉलेशन मार्गदर्शिकेत सध्याच्या `winget` पॅकेज केसिंगनुसार साधे केले
- **🐧 Linux इंस्टॉलेशन मार्गदर्शन** `azd` पॅकेज मॅनेजरसाठी नाकारलेली डिस्ट्रीविशिष्ट सूचना टाळल्या, त्याऐवजी योग्य ठिकाणी प्रकाशन साधनांकडे निर्देशले
- **📦 AI मॉडेल उदाहरणे** जुन्या डीफॉल्ट्सपासून जसे `gpt-35-turbo` आणि `text-embedding-ada-002` ते सध्याच्या उदाहरणांपर्यंत `gpt-4.1-mini`, `gpt-4.1`, आणि `text-embedding-3-large`
- **📋 तैनाती आणि निदान स्निपेट्स** लॉग्स, स्क्रिप्ट्स, आणि तुडवणी निवारण पावले सध्याच्या पर्यावरण आणि स्थिती आदेशांसह दुरुस्त केले
- **⚙️ GitHub Actions मार्गदर्शन** `Azure/setup-azd@v1.0.0` पासून `Azure/setup-azd@v2` मध्ये अद्ययावत केले
- **🤖 MCP/Copilot संमती मार्गदर्शन** `azd mcp consent` कडून `azd copilot consent list` मध्ये अद्ययावत 

#### सुधारित
- **🧠 AI अध्याय मार्गदर्शन** आता अधिक चांगल्या प्रकारे प्रिव्ह्यू-संवेदनशील `azd ai` वर्तन, टेनंट-विशिष्ट लॉगिन, सध्याचा विस्तार वापर, आणि मॉडेल तैनात करण्याच्या शिफारसी स्पष्ट करते
- **🧪 कार्यशाळा सूचना** आता अधिक वास्तविक आवृत्ती उदाहरणे आणि स्पष्ट पर्यावरण सेटअप भाषा वापरते हाताळणी प्रयोगशाळांसाठी
- **📈 उत्पादन आणि तुडवणी निवारण दस्तऐवज** आता सध्याच्या मॉनिटरिंग, फॉलबॅक मॉडेल, आणि खर्च-टियर उदाहरणांशी जास्त जुळते

#### अद्ययावत फाइल्स
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

#### AZD AI CLI आदेश, सामग्री पडताळणी आणि टेम्प्लेट विस्तार
**ही आवृत्ती सर्व AI-आधारित अध्यायांमध्ये `azd ai`, `azd extension`, आणि `azd mcp` आदेश कव्हरेज जोडते, agents.md मध्ये तुटलेले दुवे आणि जुने कोड दुरुस्त करते, चीट शीट अपडेट करते, आणि उदाहरण टेम्प्लेट विभागाचा संपूर्णपणे पुनर्रचना करते Validate descrition आणि नवीन Azure AI AZD टेम्प्लेटसह.**

#### जोडले
- **🤖 AZD AI CLI कव्हरेज** सात फाइल्समध्ये (पूर्वी केवळ अध्याय 8 मध्ये):
  - `docs/chapter-01-foundation/azd-basics.md` — नवीन "विस्तार आणि AI आदेश" विभाग ज्यात `azd extension`, `azd ai agent init`, आणि `azd mcp` समाविष्ट आहेत
  - `docs/chapter-02-ai-development/agents.md` — पर्याय 4: तुलना सारणीसह `azd ai agent init` (टेम्प्लेट विरुद्ध मॅनिफेस्ट पध्दत)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Foundry साठी AZD विस्तार" आणि "एजंट-प्रथम तैनाती" उपविभाग

  - `docs/chapter-05-multi-agent/README.md` — क्विक स्टार्ट आता टेम्प्लेट आणि मॅनिफेस्ट-आधारित डिप्लॉयमेंट पथ दोन्ही दाखवतो
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — डिप्लॉय सेक्शन आता `azd ai agent init` पर्याय समाविष्ट करतो
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "डायग्नोस्टिक्ससाठी AZD AI विस्तार कमांड्स" उपविभाग
  - `resources/cheat-sheet.md` — नवीन "AI & एक्सटेंशन्स कमांड्स" विभाग `azd extension`, `azd ai agent init`, `azd mcp`, आणि `azd infra generate` सह
- **📦 नवीन AZD AI उदाहरण टेम्प्लेट्स** `microsoft-foundry-integration.md` मध्ये:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, आणि व्हॉइस चॅट सपोर्टसह .NET RAG चॅट
  - **azure-search-openai-demo-java** — Langchain4J वापरून Java RAG चॅट, ACA/AKS डिप्लॉयमेंट पर्यायांसह
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, आणि Prompty वापरून मल्टी-एजंट क्रिएटिव्ह लेखन अॅप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB वापरून सर्व्हरलेस RAG, Ollama लोकल डेव्ह सपोर्टसह
  - **chat-with-your-data-solution-accelerator** — एंटरप्राइझ RAG अॅक्सेलरेटर, अॅडमिन पोर्टल, Teams एकत्रीकरण, आणि PostgreSQL/Cosmos DB पर्यायांसह
  - **azure-ai-travel-agents** — .NET, Python, Java, आणि TypeScript सध्या सर्व्हरांसह मल्टी-एजंट MCP ऑर्केस्ट्रेशन संदर्भ अॅप
  - **azd-ai-starter** — मिनिमल Azure AI इन्फ्रास्ट्रक्चर बिसेप स्टार्टर टेम्प्लेट
  - **🔗 उत्कृष्ट AZD AI गॅलरी लिंक** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ टेम्प्लेट्स) संदर्भ

#### दुरुस्त केले
- **🔗 agents.md नेव्हिगेशन**: मागील/पुढील लिंक आता Chapter 2 README लेसन क्रमाशी जुळतात (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md तुटलेले दुवे**: `production-ai-practices.md` ची दुरुस्ती `../chapter-08-production/production-ai-practices.md` (3 वेळा)
- **📦 agents.md जुना कोड**: `opencensus` ची जागा `azure-monitor-opentelemetry` + OpenTelemetry SDK ने घेतली
- **🐛 agents.md अवैध API**: `max_tokens` `create_agent()` कडून `create_run()` कडे `max_completion_tokens` म्हणून हलवलं
- **🔢 agents.md टोकन मोजणी**: साधा `len//4` अंदाज `tiktoken.encoding_for_model()` ने बदलला
- **azure-search-openai-demo**: सेवा "Cognitive Search + App Service" मधून "Azure AI Search + Azure Container Apps" मध्ये सुधारित केल्या (डिफॉल्ट होस्ट ऑक्टोबर 2024 पासून बदलला)
- **contoso-chat**: वर्णनात Azure AI Foundry + Prompty चा संदर्भ देऊन, रिपोच्या वास्तविक शीर्षक आणि टेक स्टॅकशी जुळवले

#### काढले
- **ai-document-processing**: कार्यरत नसलेल्या टेम्प्लेट संदर्भ काढून टाकले (रिपो AZD टेम्प्लेट म्हणून सार्वजनिक नाही)

#### सुधारित
- **📝 agents.md सराव**: सराव 1 आता अपेक्षित आउटपुट आणि `azd monitor` स्टेप दाखवतो; सराव 2 मध्ये पूर्ण `FunctionTool` नोंदणी कोड; सराव 3 मध्ये अस्पष्ट मार्गदर्शनाऐवजी ठोस `prepdocs.py` कमांड्स दिल्या
- **📚 agents.md संसाधने**: Azure AI Agent Service दस्तऐवज आणि क्विकस्टार्टसाठी दुवे अद्ययावत
- **📋 agents.md पुढील पावले टेबल**: पूर्ण अध्याय कव्हरेजसाठी AI वर्कशॉप लॅब लिंक जोडली

#### फाइल्स अद्ययावत
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### कोर्स नेव्हिगेशन सुधारणा
**ही आवृत्ती README.md च्या अध्याय नेव्हिगेशनमध्ये सुधारणा करते, एक सुधारित टेबल फॉरमॅटसह.**

#### बदलले
- **कोर्स नकाशा टेबल**: थेट लेसन दुवे, कालावधी अंदाज, आणि कॉम्लेक्सिटी रेटिंग्जसह सुधारित
- **फोल्डर क्लीनअप**: गरजेच्या जुने फोल्डर्स (deployment/, getting-started/, pre-deployment/, troubleshooting/) काढले
- **लिंक पडताळणी**: कोर्स नकाशा तक्त्याच्या 21+ आंतरिक दुव्यांची पुष्टी केली

### [v3.16.0] - 2026-02-05

#### उत्पादन नाव अद्यतने
**ही आवृत्ती सध्याच्या मायक्रोसॉफ्ट ब्रँडिंगनुसार उत्पादन संदर्भ अद्यतनित करते.**

#### बदलले
- **Microsoft Foundry → Microsoft Foundry**: सर्व संदर्भ अनुवाद नसलेल्या फाइल्समध्ये अद्ययावत केले
- **Azure AI Agent Service → Foundry Agents**: सेवा नाव सध्याच्या ब्रँडिंगनुसार अद्ययावत

#### फाइल्स अद्ययावत
- `README.md` - मुख्य कोर्स लँडिंग पृष्ठ
- `changelog.md` - आवृत्ती इतिहास
- `course-outline.md` - कोर्स रचना
- `docs/chapter-02-ai-development/agents.md` - AI एजंट्स मार्गदर्शक
- `examples/README.md` - उदाहरणे दस्तऐवज
- `workshop/README.md` - वर्कशॉप लँडिंग पृष्ठ
- `workshop/docs/index.md` - वर्कशॉप निर्देशिका
- `workshop/docs/instructions/*.md` - सर्व वर्कशॉप सूचनाफाइल्स

---

### [v3.15.0] - 2026-02-05

#### प्रमुख रिपॉझिटरी पुनर्संरचना: अध्याय आधारित फोल्डर नावे
**ही आवृत्ती दस्तऐवजीकरणाला वेगळ्या अध्याय फोल्डर्समध्ये विभागते, ज्यामुळे नेव्हिगेशन अधिक स्पष्ट होते.**

#### फोल्डर पुनर्नामांकन
जुने फोल्डर्स अध्याय क्रमांक असलेल्या फोल्डर्सनी बदलले गेले आहेत:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- नवीन फोल्डर जोडला: `docs/chapter-05-multi-agent/`

#### फाइल स्थलांतरे
| फाइल | कुठून | कुठे |
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
| सर्व pre-deployment फाइल्स | pre-deployment/ | chapter-06-pre-deployment/ |
| सर्व troubleshooting फाइल्स | troubleshooting/ | chapter-07-troubleshooting/ |

#### जोडले
- **📚 अध्याय README फाइल्स**: प्रत्येक अध्याय फोल्डरमध्ये README.md तयार केले ज्यामध्ये:
  - शिकण्याची उद्दिष्टे आणि कालावधी
  - लेसन टेबल वर्णनांसह
  - क्विक स्टार्ट कमांड्स
  - इतर अध्यायांकडे नेव्हिगेशन

#### बदलले
- **🔗 सर्व आंतरिक दुवे अद्यतनित**: 78+ मार्ग सर्व दस्तऐवजीकरण फाइल्समध्ये अद्यतनित
- **🗺️ मुख्य README.md**: नवीन अध्याय रचनेसह कोर्स नकाशा अद्ययावत
- **📝 examples/README.md**: अध्याय फोल्डर्ससाठी क्रॉस रेफरन्स अद्यतनित

#### काढले
- जुने फोल्डर रचना (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रिपॉझिटरी पुनर्संरचना: अध्याय नेव्हिगेशन
**ही आवृत्ती अध्याय नेव्हिगेशन README फाइल्स जोडते (v3.15.0 ने अधिलेखित).**

---

### [v3.13.0] - 2026-02-05

#### नवीन AI एजंट्स मार्गदर्शक
**ही आवृत्ती Azure Developer CLI सह AI एजंट्स डिप्लॉय करण्यासाठी व्यापक मार्गदर्शक जोडते.**

#### जोडले
- **🤖 docs/microsoft-foundry/agents.md**: पूर्ण मार्गदर्शक ज्यात समाविष्ट:
  - AI एजंट्स काय आहेत आणि ते चॅटबॉट्सपासून कसे वेगळे आहेत
  - तीन क्विक-स्टार्ट एजंट टेम्प्लेट्स (Foundry Agents, Prompty, RAG)
  - एजंट आर्किटेक्चर पॅटर्न्स (सिंगल एजंट, RAG, मल्टी-एजंट)
  - टूल कॉन्फिगरेशन आणि सानुकूलन
  - मॉनिटरिंग आणि मेट्रिक्स ट्रॅकिंग
  - खर्च विचार आणि ऑप्टिमायझेशन
  - सामान्य समस्या निवारण परिस्थिती
  - तीन प्रॅक्टिकल सराव आणि यशमान निकष

#### सामग्री रचना
- **परिचय**: सुरुवातीसाठी एजंट संकल्पना
- **क्विक स्टार्ट**: `azd init --template get-started-with-ai-agents` सह एजंट डिप्लॉय करा
- **आर्किटेक्चर पॅटर्न्स**: एजंट पॅटर्न्सचे दृश्य आरेख
- **कॉन्फिगरेशन**: टूल सेटअप आणि पर्यावरण चल
- **मॉनिटरिंग**: ऍप्लिकेशन इन्साइट्स एकत्रीकरण
- **सराव**: प्रगत स्वरूपात हँड्स-ऑन शिकणे (प्रत्येक 20-45 मिनिटे)

---

### [v3.12.0] - 2026-02-05

#### देवकंटेनर पर्यावरण अद्यतन
**ही आवृत्ती आधुनिक उपकरणे आणि चांगल्या डीफॉल्टसह विकास कंटेनर कॉन्फिगरेशन अद्यतनित करते, AZD शिकण्याच्या अनुभवासाठी.**

#### बदलले
- **🐳 बेस इमेज**: `python:3.12-bullseye` पासून `python:3.12-bookworm` (नवीनतम डेबियन स्थिर) मध्ये अद्यतनित
- **📛 कंटेनर नाव**: "Python 3" पासून "AZD for Beginners" मध्ये स्पष्टतेसाठी पुनर्नामित

#### जोडले
- **🔧 नवीन देव कंटेनर वैशिष्ट्ये**:
  - `azure-cli` बिसेप समर्थनासह
  - `node:20` (AZD टेम्प्लेटसाठी LTS आवृत्ती)
  - टेम्प्लेट व्यवस्थापनासाठी `github-cli`
  - कंटेनर अॅप डिप्लॉयमेंटसाठी `docker-in-docker`

- **🔌 पोर्ट फॉरवर्डिंग**: सामान्य विकासासाठी पूर्व-कॉन्फिगर केलेले पोर्ट्स:
  - 8000 (MkDocs पूर्वावलोकन)
  - 3000 (वेब अॅप्स)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 नवीन VS कोड एक्सटेंशन्स**:
  - `ms-python.vscode-pylance` - सुधारित Python इन्टेलिसेंस
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - बिसेप भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure संसाधन व्यवस्थापन
  - `yzhang.markdown-all-in-one` - Markdown संपादन
  - `DavidAnson.vscode-markdownlint` - Markdown लिंटिंग
  - `bierner.markdown-mermaid` - Mermaid आकृती समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml साठी)
  - `eamodio.gitlens` - Git दृश्याकृतीकरण
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS Code सेटिंग्ज**: Python व्याख्याता, सेव्हवर फॉर्मॅट, आणि रिकाम्या जागेची सफाई या डिफॉल्ट सेटिंग्ज जोडल्या

- **📦 अद्ययावत requirements-dev.txt**:
  - MkDocs मिनिफाय प्लगइन जोडले
  - कोड गुणवत्ता साठी प्री-कमिट जोडले
  - Azure SDK पॅकेजेस (azure-identity, azure-mgmt-resource) जोडले

#### दुरुस्त केले
- **पोस्ट-क्रिएट कमांड**: कंटेनर सुरू होताच AZD आणि Azure CLI इंस्टॉलेशन तपासणी करतो

---

### [v3.11.0] - 2026-02-05

#### नवशिक्यांसाठी README मोठ्या प्रमाणात सुधारले
**ही आवृत्ती README.md अधिक प्रवेशयोग्य बनवते आणि AI विकसकांसाठी आवश्यक संसाधने जोडते.**

#### जोडले
- **🆚 Azure CLI विरुद्ध AZD तुलना**: प्रत्येक टूल कधी वापरावे हे स्पष्ट उदाहरणांसह
- **🌟 उत्कृष्ट AZD दुवे**: समुदाय टेम्प्लेट गॅलरी आणि योगदान संसाधनांसाठी थेट दुवे:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तैयार टेम्प्लेट्स
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदाय योगदान
- **🎯 क्विक स्टार्ट मार्गदर्शक**: सोपी 3-पायरी सुरूवात विभाग (इंस्टॉल करा → लॉगिन करा → डिप्लॉय करा)
- **📊 अनुभवावर आधारित नेव्हिगेशन टेबल**: विकसक अनुभवानुसार कुठून सुरू करावे याचे स्पष्ट मार्गदर्शन

#### बदलले
- **README रचना**: प्रगत प्रकटीकरणासाठी पुन्हा आयोजित - महत्वाचा माहिती प्रथम
- **परिचय विभाग**: "The Magic of `azd up`" नवशिक्यांसाठी स्पष्टपणे समजावले
- **प्रतिसादात्मक सामग्री काढली**: डुप्लिकेट समस्या निवारण विभाग काढला
- **समस्या निवारण कमांड्स**: `azd logs` संदर्भ योग्य `azd monitor --logs` वापरून दुरुस्त केला

#### दुरुस्त केले

- **🔐 प्रमाणीकरण आदेश**: `azd auth login` आणि `azd auth logout` cheat-sheet.md मध्ये जोडले
- **अवैध आदेश संदर्भ**: README च्या ट्रबलशूटिंग विभागातील उरलेल्या `azd logs` काढले

#### टीप
- **व्याप्ती**: मुख्य README.md आणि resources/cheat-sheet.md मध्ये बदल लागू केले
- **लक्ष्य प्रेक्षक**: AZD मध्ये नवीन असलेल्या विकसकांसाठी सुधारणा विशेषतः केल्या

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI आदेश अचूकता अद्यतन
**हा आवृत्ती संपूर्ण दस्तऐवजीकरणातून अस्तित्वात नसलेल्या AZD आदेशांचे सुधारणा करतो, सर्व कोड उदाहरणे वैध Azure Developer CLI सिंटॅक्स वापरतात याची खात्री करतो.**

#### सुधारित
- **🔧 अस्तित्वात नसलेले AZD आदेश काढून टाकले**: अवैध आदेशांची सर्वसमावेशक तपासणी आणि दुरुस्ती:
  - `azd logs` (अस्तित्वात नाही) → `azd monitor --logs` किंवा Azure CLI पर्यायांनी बदलले
  - `azd service` उपआदेशे (अस्तित्वात नाहीत) → `azd show` आणि Azure CLI ने बदलले
  - `azd infra import/export/validate` (अस्तित्वात नाहीत) → काढले किंवा वैध पर्यायांनी बदलले
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` फ्लॅग्स (अस्तित्वात नाहीत) → काढले
  - `azd provision --what-if/--rollback` फ्लॅग्स (अस्तित्वात नाहीत) → `--preview` वापरले
  - `azd config validate` (अस्तित्वात नाही) → `azd config list` ने बदलले
  - `azd info`, `azd history`, `azd metrics` (अस्तित्वात नाहीत) → काढले

- **📚 आदेश सुधारणा सह फाईल्स अद्यतनित**:
  - `resources/cheat-sheet.md`: आदेश संदर्भ मोठ्या प्रमाणात सुधारित
  - `docs/deployment/deployment-guide.md`: रोलबॅक आणि डिप्लॉयमेंट धोरणे दुरुस्त केली
  - `docs/troubleshooting/debugging.md`: लॉग विश्लेषण विभाग सुधारित
  - `docs/troubleshooting/common-issues.md`: ट्रबलशूटिंग आदेश अद्यतनित केले
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिंग विभाग दुरुस्त केला
  - `docs/getting-started/azd-basics.md`: मॉनिटरिंग आदेश सुधारित
  - `docs/getting-started/first-project.md`: मॉनिटरिंग आणि डिबगिंग उदाहरणे अद्यतनित केली
  - `docs/getting-started/installation.md`: मदत आणि आवृत्ती उदाहरणे दुरुस्त केली
  - `docs/pre-deployment/application-insights.md`: लॉग पाहणी आदेश दुरुस्त केले
  - `docs/pre-deployment/coordination-patterns.md`: एजंट डिबगिंग आदेश दुरुस्त केले

- **📝 आवृत्ती संदर्भ अद्यतनित**: 
  - `docs/getting-started/installation.md`: हार्डकोडेड `1.5.0` आवृत्ती जनरिक `1.x.x` मध्ये बदलली, रिलीजेससाठी लिंक दिली

#### बदलले
- **रोलबॅक धोरणे**: दस्तऐवजात Git-आधारित रोलबॅक वापरण्यासाठी अद्यतनित (AZD मध्ये मूळ रोलबॅक नाही)
- **लॉग पाहणी**: `azd logs` संदर्भ `azd monitor --logs`, `azd monitor --live`, आणि Azure CLI आदेशांनी बदलले
- **कार्यक्षमता विभाग**: अस्तित्वात नसलेल्या समांतर/क्रमबद्ध डिप्लॉयमेंट फ्लॅग्स काढले, वैध पर्याय दिले

#### तांत्रिक तपशील
- **वैध AZD आदेश**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **वैध azd monitor फ्लॅग्स**: `--live`, `--logs`, `--overview`
- **काढलेले वैशिष्ट्ये**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### टीप
- **सत्यापन**: Azure Developer CLI v1.23.x विरुद्ध आदेशांची पडताळणी केली

---

### [v3.9.0] - 2026-02-05

#### कार्यशाळा पूर्णता आणि दस्तऐवज गुणवत्ता अद्यतन
**ही आवृत्ती इंटरॅक्टिव्ह कार्यशाळा मोड्यूल्स पूर्ण करते, सर्व तुटलेले दस्तऐवज दुवे दुरुस्त करते, आणि Microsoft AZD वापरणाऱ्या AI विकसकांसाठी एकूण सामग्री गुणवत्ता सुधारते.**

#### जोडले
- **📝 CONTRIBUTING.md**: नवीन योगदान मार्गदर्शक दस्तऐवज सह:
  - समस्या नोंदविण्यासाठी आणि बदल प्रस्तावित करण्यासाठी स्पष्ट सूचना
  - नवीन सामग्रीसाठी दस्तऐवज मानके
  - कोड उदाहरण मार्गदर्शक आणि कमिट संदेश नियम
  - समुदाय सहभाग माहिती

#### पूर्ण केले
- **🎯 कार्यशाळा मोड्यूल 7 (समारोप)**: पूर्ण समारोप मोड्यूल सह:
  - कार्यशाळेच्या कामगिरीचे सर्वसमावेशक सारांश
  - AZD, साचे आणि Microsoft Foundry वर आधारित प्रमुख संकल्पना विभाग
  - शिकण्याच्या प्रवासाची पुढील शिफारस
  - कार्यशाळा आव्हान व्यायाम सह कठीणतेचे मापन
  - समुदाय अभिप्राय आणि सहाय्य दुवे

- **📚 कार्यशाळा मोड्यूल 3 (उत्खनन)**: अद्यतनित शिक्षण उद्दिष्टे सह:
  - GitHub Copilot MCP सर्व्हर सक्रियता मार्गदर्शन
  - AZD साचा फोल्डर संरचना समजून घेणे
  - इन्फ्रास्ट्रक्चर-एझ-कोड (Bicep) संघटन नमुने
  - हाताळणी प्रयोगशाळा सूचना

- **🔧 कार्यशाळा मोड्यूल 6 (ब्रेक-डाउन)**: पूर्ण केले:
  - संसाधन साफसफाई आणि खर्च नियंत्रण उद्दिष्टे
  - सुरक्षित इन्फ्रास्ट्रक्चर डिप्रॉव्हिजनसाठी `azd down` वापर
  - सौम्य-काढलेले कॉग्निटिव्ह सेवांसाठी पुनर्प्राप्ती मार्गदर्शन
  - GitHub Copilot आणि Azure Portal साठी बोनस शोध प्रॉम्प्ट

#### दुरुस्त केले
- **🔗 तुटलेले दुवे दुरुस्ती**: 15+ तुटलेले अंतर्गत दस्तऐवज दुवे सोडविले:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md चे मार्ग दुरुस्त केले
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md आणि production-ai-practices.md मार्ग दुरुस्त केले
  - `docs/getting-started/first-project.md`: अस्तित्वात नसलेल्या cicd-integration.md ची जागा deployment-guide.md ने घेतली
  - `examples/retail-scenario.md`: FAQ आणि ट्रबलशूटिंग मार्गदर्शकांचे मार्ग दुरुस्त केले
  - `examples/container-app/microservices/README.md`: कोर्स होम आणि डिप्लॉयमेंट मार्गदर्शकांचे मार्ग दुरुस्त केले
  - `resources/faq.md` आणि `resources/glossary.md`: AI अध्याय संदर्भ अद्यतनित केले
  - `course-outline.md`: प्रशिक्षक मार्गदर्शक आणि AI कार्यशाळा प्रयोगशाळा संदर्भ दुरुस्त केले

- **📅 कार्यशाळा स्थिती बॅनर**: "Under Construction" पासून पुढे जाणाऱ्या कार्यशाळा स्थितीशी अद्यतनित, फेब्रुवारी 2026 तारीख सह

- **🔗 कार्यशाळा नौव्हिगेशन**: कार्यशाळा README.md मधील तुटलेले नौव्हिगेशन दुवे दुरुस्त केले जे अस्तित्वात नसलेल्या lab-1-azd-basics फोल्डरकडे निर्देश करत होते

#### बदलले
- **कार्यशाळा सादरीकरण**: "under construction" चेतावणी काढली, कार्यशाळा आता पूर्ण आणि वापरासाठी तयार
- **नौव्हिगेशन सातत्य**: सर्व कार्यशाळा मोड्यूल्समध्ये योग्य अंतर्मोड्यूल नौव्हिगेशनची खात्री केली
- **शिकण्याचा मार्ग संदर्भ**: अध्यायांच्या क्रॉस-रेफरन्समध्ये योग्य microsoft-foundry मार्गांचा वापर केला

#### पडताळणी केली
- ✅ सर्व इंग्रजी Markdown फाईल्समध्ये वैध अंतर्गत दुवे आहेत
- ✅ कार्यशाळा मोड्यूल्स 0-7 पूर्ण, शिक्षण उद्दिष्टांसहित
- ✅ अध्याय आणि मोड्यूल्समधील नौव्हिगेशन योग्यप्रकारे कार्य करते
- ✅ सामग्री Microsoft AZD वापरणाऱ्या AI विकसकांसाठी योग्य
- ✅ सुरुवातीच्या स्तरासाठी सुलभ भाषा आणि रचनात्मकता राखली
- ✅ CONTRIBUTING.md समुदाय योगदानकर्त्यांसाठी स्पष्ट मार्गदर्शन देते

#### तांत्रिक अंमलबजावणी
- **दुवा पडताळणी**: स्वयंचलित PowerShell स्क्रिप्टने सर्व .md अंतर्गत दुवे पडताळले
- **सामग्री तपासणी**: कार्यशाळा पूर्णत्व आणि सुरुवातीस अनुकूलतेचा मॅन्युअल आढावा
- **नौव्हिगेशन प्रणाली**: अध्याय आणि मोड्यूल नौव्हिगेशन नमुन्यांमध्ये सातत्य राखले

#### टीप
- **व्याप्ती**: बदल फक्त इंग्रजी दस्तऐवजांवर लागू
- **भाषांतर**: या आवृत्तीत भाषांतर फोल्डर अद्यतनित नाहीत (स्वयंचलित भाषांतर नंतर समक्रमित होईल)
- **कार्यशाळा कालावधी**: संपूर्ण कार्यशाळा आता 3-4 तासांच्या हाताळणी शिक्षणासाठी उपलब्ध

---

### [v3.8.0] - 2025-11-19

#### प्रगत दस्तऐवजीकरण: मॉनिटरिंग, सुरक्षा, आणि बहु-एजंट नमुने
**ही आवृत्ती Application Insights समाकलन, प्रमाणीकरण नमुने, आणि उत्पादन डिप्लॉयमेंटसाठी बहु-एजंट समन्वयावर व्यापक A-ग्रेड धडे जोडते.**

#### जोडले
- **📊 Application Insights समाकलन धडा**: `docs/pre-deployment/application-insights.md` मध्ये:
  - ऑटोमॅटिक प्राव्हिजनिंगसह AZD-केंद्रित डिप्लॉयमेंट
  - Application Insights + Log Analytics साठी पूर्ण Bicep साचे
  - कस्टम टेलीमेट्रीसह कार्यरत Python अनुप्रयोग (1,200+ ओळी)
  - AI/LLM मॉनिटरिंग नमुने (Microsoft Foundry मॉडेल टोकन/खर्च ट्रॅकिंग)
  - 6 Mermaid आकृती (आर्किटेक्चर, वितरित ट्रेसिंग, टेलीमेट्री प्रवाह)
  - 3 हाताळणी व्यायाम (अलर्ट, डॅशबोर्ड्स, AI मॉनिटरिंग)
  - Kusto क्वेरी उदाहरणे आणि खर्च ऑप्टिमायझेशन धोरणे
  - लाइव्ह मेट्रिक्स स्ट्रीमिंग आणि रिअल-टाइम डिबगिंग
  - 40-50 मिनिटे शिक्षण वेळ, उत्पादन-तयार नमुने

- **🔐 प्रमाणीकरण आणि सुरक्षा नमुने धडा**: `docs/getting-started/authsecurity.md` मध्ये:
  - 3 प्रमाणीकरण नमुने (कनेक्शन स्ट्रिंग्स, Key Vault, मॅनेज्ड ओळख)
  - सुरक्षित डिप्लॉयमेंटसाठी पूर्ण Bicep इन्फ्रास्ट्रक्चर साचे
  - Azure SDK समाकलनासह Node.js अनुप्रयोग कोड
  - 3 पूर्ण व्यायाम (मॅनेज्ड ओळख सक्षम करा, वापरकर्ता-निर्धारित ओळख, Key Vault रोटेशन)
  - सुरक्षा सर्वोत्तम पद्धती आणि RBAC संरचना
  - समस्या सोडविण्याचे मार्गदर्शक आणि खर्च विश्लेषण
  - उत्पादन-तयार पासवर्डलेस प्रमाणीकरण नमुने

- **🤖 बहु-एजंट समन्वय नमुने धडा**: `docs/pre-deployment/coordination-patterns.md` मध्ये:
  - 5 समन्वय नमुने (क्रमिक, समांतर, अनुक्रमिक, घटना-चालित, संमती)
  - पूर्ण ऑर्केस्ट्रेटर सेवा अंमलबजावणी (Python/Flask, 1,500+ ओळी)
  - 3 विशेषज्ञ एजंट अंमलबजावण्या (संशोधन, लेखक, संपादक)
  - मेसेज कतारसाठी सेवा बस समाकलन
  - वितरित प्रणालींसाठी Cosmos DB स्थिती व्यवस्थापन
  - एजंट संवाद दर्शविणारे 6 Mermaid आकृती
  - 3 प्रगत व्यायाम (टाइमआउट हाताळणी, पुनःप्रयत्न लॉजिक, सर्किट ब्रेकर)
  - खर्च तपशील ($240-565/महिना) आणि ऑप्टिमायझेशन धोरणे
  - मॉनिटरिंगसाठी Application Insights समाकलन

#### सुधारित
- **पूर्व-प्रवेशन अध्याय**: आता व्यापक मॉनिटरिंग आणि समन्वय नमुने समाविष्ट
- **प्रारंभिक अध्याय**: व्यावसायिक प्रमाणीकरण नमुन्यांसह सुधारित
- **उत्पादन तयारी**: सुरक्षा पासून निरीक्षण पर्यंत पूर्ण कव्हरेज
- **कोर्स रूपरेषा**: अध्याय 3 आणि 6 मध्ये नवीन धडे संदर्भित करण्यासाठी अद्यतनित

#### बदलले
- **शिकण्याची प्रगती**: संपूर्ण अभ्यासक्रमात सुरक्षा आणि मॉनिटरिंगचे उत्तम समाकलन
- **दस्तऐवज गुणवत्ता**: नवीन धड्यांमध्ये सातत्यपूर्ण A-ग्रेड मानके (95-97%)
- **उत्पादन नमुने**: एंटरप्राइझ डिप्लॉयमेंटसाठी संपूर्ण अंत-टू-अंत कव्हरेज

#### सुधारित
- **विकसक अनुभव**: विकासापासून उत्पादन मॉनिटरिंगपर्यंत स्पष्ट मार्ग
- **सुरक्षा मानके**: प्रमाणीकरण आणि गुपित व्यवस्थापनासाठी व्यावसायिक नमुने
- **निरीक्षण**: AZD सह पूर्ण Application Insights समाकलन
- **AI वर्कलोड्स**: Microsoft Foundry मॉडेल्स आणि बहु-एजंट प्रणालींसाठी विशेष मॉनिटरिंग

#### पडताळणी केली
- ✅ सर्व धड्यांमध्ये पूर्ण कार्यरत कोड (स्निपेट्स नाही)
- ✅ दृश्य शिक्षणासाठी Mermaid आकृती (3 धड्यांमध्ये 19 एकूण)
- ✅ पडताळणी चरणांसह हाताळणी व्यायाम (एकूण 9)
- ✅ `azd up` द्वारा डिप्लॉय करणारे उत्पादन-तयार Bicep साचे
- ✅ खर्च विश्लेषण आणि ऑप्टिमायझेशन धोरणे
- ✅ समस्या सोडविण्याचे मार्गदर्शक आणि सर्वोत्तम पद्धती
- ✅ पडताळणी आदेशांसह ज्ञान तपासणी स्थाने

#### दस्तऐवज ग्रेडिंग निकाल
- **docs/pre-deployment/application-insights.md**: - व्यापक मॉनिटरिंग मार्गदर्शक
- **docs/getting-started/authsecurity.md**: - व्यावसायिक सुरक्षा नमुने
- **docs/pre-deployment/coordination-patterns.md**: - प्रगत बहु-एजंट आर्किटेक्चर्स
- **एकूण नवीन सामग्री**: - सातत्यपूर्ण उच्च-गुणवत्तेची मापदंडे

#### तांत्रिक अंमलबजावणी
- **Application Insights**: Log Analytics + सानुकूल टेलीमेट्री + वितरित ट्रेसिंग
- **प्रमाणीकरण**: मॅनेज्ड ओळख + Key Vault + RBAC नमुने
- **बहु-एजंट**: सेवा बस + Cosmos DB + कंटेनर अ‍ॅप्स + ऑर्केस्ट्रेशन
- **मॉनिटरिंग**: लाइव्ह मेट्रिक्स + Kusto क्वेरीज + अलर्ट्स + डॅशबोर्ड्स
- **खर्च व्यवस्थापन**: सॅम्पलिंग धोरणे, रिटेंशन पॉलिसी, बजेट नियंत्रण

### [v3.7.0] - 2025-11-19

#### दस्तऐवज गुणवत्ता सुधारणा आणि नवीन Microsoft Foundry Models उदाहरण
**ही आवृत्ती संपूर्ण रेपॉझिटरीतील दस्तऐवज गुणवत्ता सुधारते आणि gpt-4.1 चॅट इंटरफेससह Microsoft Foundry Models चा संपूर्ण डिप्लॉयमेंट उदाहरण जोडते.**

#### जोडले
- **🤖 Microsoft Foundry Models चॅट उदाहरण**: पूर्ण gpt-4.1 डिप्लॉयमेंट, `examples/azure-openai-chat/` मध्ये कार्यरत अंमलबजावणीसह:
  - पूर्ण Microsoft Foundry Models इन्फ्रास्ट्रक्चर (gpt-4.1 मॉडेल डिप्लॉयमेंट)
  - संभाषण इतिहासासह Python कमांड-लाइन चॅट इंटरफेस
  - सुरक्षित API की साठवणीसाठी Key Vault समाकलन
  - टोकन वापर ट्रॅकिंग आणि खर्च अंदाज
  - दर मर्यादा आणि त्रुटी हाताळणी
  - 35-45 मिनिटांच्या डिप्लॉयमेंट मार्गदर्शकाशी संपूर्ण README
  - 11 उत्पादन-तयार फाईल्स (Bicep साचे, Python अॅप, संरचना)
- **📚 दस्तऐवज व्यायाम**: संरचना मार्गदर्शकात हाताळणी व्यायाम जोडले:
  - व्यायाम 1: बहु-परिसर संरचना (15 मिनिटे)
  - व्यायाम 2: गुपित व्यवस्थापन सराव (10 मिनिटे)
  - स्पष्ट यश निकष आणि पडताळणी पावले
- **✅ डिप्लॉयमेंट पडताळणी**: डिप्लॉयमेंट मार्गदर्शकात पडताळणी विभाग जोडले:
  - आरोग्य तपासणी प्रक्रिया
  - यश निकष सूचिपत्रिका
  - सर्व डिप्लॉयमेंट आदेशांसाठी अपेक्षित आउटपुट
  - त्वरीत संदर्भ ट्रबलशूटिंग

#### सुधारित
- **examples/README.md**: A-ग्रेड गुणवत्ता (93%) पर्यंत अद्यतनित:
  - सर्व संबंधित विभागांमध्ये azure-openai-chat जोडले
  - स्थानिक उदाहरण संख्या 3 वरून 4 वर अद्यतनित
  - AI अनुप्रयोग उदाहरणे टेबलमध्ये जोडले
  - मध्यम स्तर वापरकर्त्यांसाठी क्विक स्टार्टमध्ये समाकलित
  - Microsoft Foundry टेम्पलेट्स विभागात समाविष्ट
  - तुलना मॅट्रिक्स आणि तंत्रज्ञान शोध विभाग अद्यतनित
- **दस्तऐवज गुणवत्ता**: docs फोल्डरमध्ये B+ (87%) → A- (92%) सुधारित

  - महत्त्वाच्या कमांड उदाहरणांसाठी अपेक्षित आउटपुट जोडले
  - कॉन्फिगरेशन बदलांसाठी पडताळणी पावले समाविष्ट केले
  - व्यावहारिक सरावासह प्रत्यक्ष शिकण्याचा अनुभव सुधारला

#### बदललेले
- **शिक्षण प्रगती**: मध्यम स्तराच्या शिकणाऱ्यांसाठी AI उदाहरणांची चांगली समाकलन
- **दस्तऐवजीकरण रचना**: स्पष्ट परिणामांसह अधिक कृतीक्षम व्यायाम
- **पडताळणी प्रक्रिया**: मुख्य वर्कफ्लोमध्ये स्पष्ट यश निकष जोडले

#### सुधारित
- **विकसक अनुभव**: Microsoft Foundry Models चा तैनाती कालावधी आता 35-45 मिनिटे (कठिण पर्यायांसाठी 60-90 पेक्षा कमी)
- **खर्च पारदर्शकता**: Microsoft Foundry Models उदाहरणासाठी स्पष्ट खर्च अंदाज ($50-200/महिना)
- **शिकण्याचा मार्ग**: AI विकसकांसाठी azure-openai-chat सह स्पष्ट प्रवेश बिंदू
- **दस्तऐवजीकरण मानके**: सुसंगत अपेक्षित आउटपुट आणि पडताळणी पावले

#### पडताळलेले
- ✅ Microsoft Foundry Models उदाहरण `azd up` सह पूर्णपणे कार्यान्वित
- ✅ सर्व 11 अंमलबजावणी फायली व्याकरणानुसार बरोबर
- ✅ README सूचना वास्तविक तैनाती अनुभवाशी जुळतात
- ✅ 8+ ठिकाणी दस्तऐवजीकरण दुवे अद्ययावत
- ✅ उदाहरण सूचीमध्ये 4 स्थानिक उदाहरणे अचूकपणे प्रतिबिंबित होतात
- ✅ तक्त्यांमध्ये कोणतेही पुनरावृत्ती बाह्य दुवे नाहीत
- ✅ सर्व नेव्हिगेशन संदर्भ बरोबर आहेत

#### तांत्रिक अंमलबजावणी
- **Microsoft Foundry Models आर्किटेक्चर**: gpt-4.1 + Key Vault + Container Apps नमुना
- **सुरक्षा**: व्यवस्थापित ओळख तयार, Key Vault मधील रहस्ये
- **मोनिटरिंग**: Application Insights समाकलन
- **खर्च व्यवस्थापन**: टोकन ट्रॅकिंग आणि वापर ऑप्टिमायझेशन
- **तैनाती**: संपूर्ण सेटअपसाठी एकाच `azd up` कमांड

### [v3.6.0] - 2025-11-19

#### मुख्य अद्यतन: कंटेनर ऍप तैनाती उदाहरणे
**हा आवृत्ती Azure Developer CLI (AZD) वापरून व्यापक, उत्पादन-तयार कंटेनर अनुप्रयोग तैनाती उदाहरणे, पूर्ण दस्तऐवजीकरण आणि शिकण्याच्या मार्गात समाकलन सादर करते.**

#### जोडलेले
- **🚀 कंटेनर ऍप उदाहरणे**: `examples/container-app/` मध्ये नवीन स्थानिक उदाहरणे:
  - [मास्टर मार्गदर्शक](examples/container-app/README.md): कंटेनरयुक्त तैनातींचे पूर्ण आढावा, जलद प्रारंभ, उत्पादन आणि प्रगत नमुने
  - [सिंपल फ्लास्क API](../../examples/container-app/simple-flask-api): नवीनांसाठी सुलभ REST API ज्यात शून्यावर प्रमाण कमी करणे, आरोग्य तपासणी, मॉनिटरिंग, आणि समस्या निवारण आहे
  - [मायक्रोसर्व्हिस आर्किटेक्चर](../../examples/container-app/microservices): उत्पादन-तयार बहु-सेवा तैनाती (API गेटवे, उत्पादन, आदेश, वापरकर्ता, सूचनाकर्ता), असिंक्रोनस मेसेजिंग, सेवा बस, कॉसमॉस DB, Azure SQL, वितरीत ट्रेसिंग, निळा-हिरवा/कॅनेरी तैनाती
- **सर्वोत्तम पद्धती**: कंटेनरयुक्त वर्कलोडसाठी सुरक्षा, मोनिटरिंग, खर्च ऑप्टिमायझेशन, आणि CI/CD मार्गदर्शन
- **कोड नमुने**: पूर्ण `azure.yaml`, बिसेप टेम्प्लेट्स, आणि बहुभाषिक सेवा अंमलबजावणी (Python, Node.js, C#, Go)
- **चाचणी आणि समस्या निवारण**: एंड-टू-एंड चाचणी परिस्थिती, मॉनिटरिंग कमांड्स, समस्या निवारण मार्गदर्शन

#### बदललेले
- **README.md**: "स्थानिक उदाहरणे - कंटेनर अनुप्रयोग" अंतर्गत नवीन कंटेनर ऍप उदाहरणांसाठी अद्यतनित आणि दुवा जोडले
- **examples/README.md**: कंटेनर ऍप उदाहरणे हायलाइट करण्यासाठी, तुलना मॅट्रिक्स नोंदी जोडण्यासाठी, आणि तंत्रज्ञान/आर्किटेक्चर संदर्भ अद्यतनित केले
- **कोर्स आऊटलाइन & अभ्यास मार्गदर्शक**: संबंधित अध्यायांमध्ये नवीन कंटेनर ऍप उदाहरणे आणि तैनाती नमुन्यांचा संदर्भ देण्यासाठी अद्यतनित

#### पडताळलेले
- ✅ सर्व नवीन उदाहरणे `azd up` सह तैनात करण्यायोग्य आणि सर्वोत्तम पद्धतींना अनुसरून
- ✅ दस्तऐवजीकरण क्रॉस-लिंक्स आणि नेव्हिगेशन अद्ययावत
- ✅ उदाहरणे सुरुवातीपासून प्रगत परिस्थितींपर्यंत, उत्पादन मायक्रोसर्व्हिसेससह व्यापलेली

#### नोंदी
- **व्याप्ती**: फक्त इंग्रजी दस्तऐवजीकरण आणि उदाहरणे
- **पुढील पावले**: भविष्यातील आवृत्त्यांमध्ये अधिक प्रगत कंटेनर नमुने आणि CI/CD ऑटोमेशनचा विस्तार

### [v3.5.0] - 2025-11-19

#### उत्पादनाचे रीब्रँडिंग: Microsoft Foundry
**ही आवृत्ती सर्व इंग्रजी दस्तऐवजीकरणामध्ये "Microsoft Foundry" कडून "Microsoft Foundry" कडे व्यापक उत्पादन नाव बदल राबवते, जे Microsoft चे अधिकृत रीब्रँडिंग प्रतिबिंबित करते.**

#### बदललेले
- **🔄 उत्पादन नाव अद्यतन**: "Microsoft Foundry" कडून "Microsoft Foundry" कडे पूर्ण रीब्रँडिंग
  - `docs/` फोल्डरमधील सर्व संदर्भ अद्यतनित केले
  - फोल्डर नाव बदलले: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - फाइल नाव बदलले: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - एकूण: 7 दस्तऐवजीकरण फायलींमध्ये 23 संदर्भ अद्ययावत

- **📁 फोल्डर संरचना बदल**:
  - `docs/ai-foundry/` चे नाव बदलून `docs/microsoft-foundry/` केले
  - नवीन फोल्डर संरचनेनुसार सर्व क्रॉस-संदर्भ अद्यतनित
  - नेव्हिगेशन दुवे सर्व दस्तऐवजीकरणांमध्ये पडताळले

- **📄 फाइल पुनर्नामकरणे**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - सर्व अंतर्गत दुवे नवीन फाइल नावाचा संदर्भ देण्यासाठी अद्यतनित केले

#### अद्यतनित फाइल्स
- **अध्याय दस्तऐवजीकरण** (7 फाइल्स):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 नेव्हिगेशन लिंक अद्यतनित
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 उत्पादन नाव संदर्भ अद्यतनित
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पूर्वीच Microsoft Foundry वापरत आहे
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 संदर्भ अद्यतनित (आढावा, समुदाय अभिप्राय, दस्तऐवज)
  - `docs/getting-started/azd-basics.md` - 4 क्रॉस-संदर्भ लिंक अद्यतनित
  - `docs/getting-started/first-project.md` - 2 अध्याय नेव्हिगेशन लिंक अद्यतनित
  - `docs/getting-started/installation.md` - 2 पुढील अध्याय लिंक अद्यतनित
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 संदर्भ अद्यतनित (नेव्हिगेशन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - 1 नेव्हिगेशन लिंक अद्यतनित
  - `docs/troubleshooting/debugging.md` - 1 नेव्हिगेशन लिंक अद्यतनित

- **कोर्स संरचना फाइल्स** (2 फाइल्स):
  - `README.md` - 17 संदर्भ अद्यतनित (कोर्स आढावा, अध्याय शीर्षके, टेम्प्लेट विभाग, समुदाय सूचना)
  - `course-outline.md` - 14 संदर्भ अद्यतनित (आढावा, शिक्षण उद्दिष्टे, अध्याय साधने)

#### पडताळलेले
- ✅ इंग्रजी दस्तऐवजीकरणात "ai-foundry" फोल्डर पथ संदर्भ विसरलात नाहीत
- ✅ इंग्रजी दस्तऐवजीकरणातील "Microsoft Foundry" उत्पादन नाव संदर्भ विसरलात नाहीत
- ✅ नवीन फोल्डर संरचनेसह सर्व नेव्हिगेशन दुवे कार्यरत
- ✅ फाइल आणि फोल्डर पुनर्नामकरणे यशस्वीपणे पूर्ण
- ✅ अध्यायांमधील क्रॉस-संदर्भ पडताळले

#### नोंदी
- **व्याप्ती**: बदल फक्त `docs/` फोल्डरमधील इंग्रजी दस्तऐवजीकरणासाठी लागू
- **अनुवादित फोल्डर**: या आवृत्तीत `translations/` फोल्डर्स अद्यतनित केलेले नाहीत
- **कार्यशाळा**: या आवृत्तीत कार्यशाळेची सामग्री (`workshop/`) अद्यतनित केलेली नाही
- **उदाहरणे**: उदाहरण फाइल्समध्ये अजूनही वारसागत नावे असू शकतात (पुढील अद्यतनात हाताळले जाणार)
- **बाह्य दुवे**: बाह्य URL आणि GitHub रेपॉजिटरी संदर्भ राहतील बदल न करता

#### योगदानकर्त्यांसाठी स्थलांतर मार्गदर्शक
आपल्याकडे स्थानिक शाखा किंवा जुनी संरचना संदर्भित दस्तऐवज असल्यास:
1. फोल्डर संदर्भ अद्यतनित करा: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फाइल संदर्भ अद्यतनित करा: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पादन नाव बदला: "Microsoft Foundry" → "Microsoft Foundry"
4. सर्व अंतर्गत दस्तऐवजीकरण दुवे अद्याप कार्यरत आहेत याची खात्री करा

---

### [v3.4.0] - 2025-10-24

#### इन्फ्रास्ट्रक्चर प्रिव्ह्यू आणि पडताळणी सुधारणा
**ही आवृत्ती नवीन Azure Developer CLI प्रिव्ह्यू फिचरसाठी व्यापक समर्थन आणते आणि कार्यशाळेतील वापरकर्ता अनुभव सुधारते.**

#### जोडलेले
- **🧪 azd provision --preview फिचर दस्तऐवजीकरण**: नवीन इन्फ्रास्ट्रक्चर प्रिव्ह्यू क्षमता यांचा सविस्तर आढावा
  - कमांड संदर्भ आणि चिट शीटमधील वापर उदाहरणे
  - प्रावधान मार्गदर्शनात वापर प्रकरणे आणि फायदे समाविष्ट
  - सुरक्षित तैनाती पडताळणीसाठी प्री-फ्लाइट चेक समाकलन
  - सुरक्षेवर प्रथम आधारित तैनाती पद्धतींसह सुरूवात मार्गदर्शक अद्यतनित
- **🚧 कार्यशाळा स्टेटस बॅनर**: कार्यशाळा विकास स्थिती दर्शविणारा व्यावसायिक HTML बॅनर
  - स्पष्ट वापरकर्ता संवादासाठी ग्रेडियंट डिझाइन आणि बांधकाम निर्देशक
  - पारदर्शकतेसाठी अंतिम अद्यतन टाईमस्टॅम्प
  - सर्व डिव्हाइस प्रकारांसाठी मोबाइल प्रतिसादात्मक डिझाइन

#### सुधारित
- **इन्फ्रास्ट्रक्चर सुरक्षा**: सर्व तैनाती दस्तऐवजीकरणात प्रिव्ह्यू कार्यक्षमतेचे समाकलन
- **प्री-तैनाती पडताळणी**: स्वयंचलित स्क्रिप्ट्स आता इन्फ्रास्ट्रक्चर प्रिव्ह्यू चाचणी समाविष्ट करतात
- **विकसक वर्कफ्लो**: सर्वोत्तम पद्धत म्हणून प्रिव्ह्यूसह कमांड अनुक्रम अद्यतनित
- **कार्यशाळा अनुभव**: वापरकर्त्यांसाठी सामग्री विकास स्थितीबाबत स्पष्ट अपेक्षा

#### बदललेले
- **तैनाती सर्वोत्तम पद्धती**: प्रिव्ह्यू-प्रथम वर्कफ्लो आता शिफारस केलेली पद्धत
- **दस्तऐवजीकरण प्रवाह**: शिकण्याच्या प्रक्रियेत इन्फ्रास्ट्रक्चर पडताळणी लवकर स्थानांतरित
- **कार्यशाळा सादरीकरण**: व्यावसायिक स्थिती संवाद स्पष्ट विकास वेळापत्रकांसह

#### सुधारित
- **सुरक्षा-प्रथम दृष्टीकोन**: आता तैनातीपूर्वी इन्फ्रास्ट्रक्चर बदल पडताळले जाऊ शकतात
- **संघ सहकार्य**: पुनरावलोकन आणि मंजुरीसाठी प्रिव्ह्यू परिणाम सामायिक करता येतात
- **खर्च जागरूकता**: प्रावधानापूर्वी संसाधन खर्चाचे चांगले समज
- **जोखमीचा मर्यादित करणे**: आगाऊ पडताळणीद्वारे तैनाती अपयश कमी केले

#### तांत्रिक अंमलबजावणी
- **बहु-दस्तऐवज समाकलन**: प्रिव्ह्यू फिचर 4 मुख्य फायलींमध्ये दस्तऐवज केलेले
- **कमांड नमुने**: दस्तऐवजीकरणभर सुसंगत वाक्यरचना आणि उदाहरणे
- **सर्वोत्तम पद्धत समाकलन**: पडताळणी वर्कफ्लो आणि स्क्रिप्ट्समध्ये प्रिव्ह्यूचा समावेश
- **दृश्य निर्देशक**: नव्या फिचरचा स्पष्ट मार्किंग शोधण्यायोग्य करण्यासाठी

#### कार्यशाळा इन्फ्रास्ट्रक्चर
- **स्थिती संवाद**: ग्रेडियंट शैलीसह व्यावसायिक HTML बॅनर
- **वापरकर्ता अनुभव**: स्पष्ट विकास स्थिती गोंधळ टाळते
- **व्यावसायिक सादरीकरण**: संग्रह विश्वसनीयता राखते आणि अपेक्षा सेट करते
- **वेळापत्रक पारदर्शकता**: ऑक्टोबर 2025 अंतिम अद्यतन टाईमस्टॅम्प जबाबदारीसाठी

### [v3.3.0] - 2025-09-24

#### सुधारित कार्यशाळा साहित्य आणि संवादात्मक शिकण्याचा अनुभव
**ही आवृत्ती ब्राउझर-आधारित संवादात्मक मार्गदर्शक आणि संरचित शिकण्याच्या मार्गांसह व्यापक कार्यशाळा साहित्य सादर करते.**

#### जोडलेले
- **🎥 संवादात्मक कार्यशाळा मार्गदर्शक**: MkDocs प्रिव्ह्यू क्षमता असलेला ब्राउझर-आधारित कार्यशाळा अनुभव
- **📝 संरचित कार्यशाळा सूचना**: शोधापासून सानुकूलनापर्यंत 7-पायरी मार्गदर्शित शिकण्याचा मार्ग
  - 0-परिचय: कार्यशाळा आढावा आणि सेटअप
  - 1-AI-टेम्प्लेट निवडा: टेम्प्लेट शोध आणि निवड प्रक्रिया
  - 2-AI-टेम्प्लेट पडताळा: तैनात आणि पडताळणी प्रक्रिया
  - 3-AI-टेम्प्लेट विघटन: टेम्प्लेट आर्किटेक्चर समजून घेणे
  - 4-AI-टेम्प्लेट कॉन्फिगर करा: कॉन्फिगरेशन आणि सानुकूलन
  - 5-AI-टेम्प्लेट सानुकूल करा: प्रगत बदल आणि पुनरावृत्ती
  - 6-इन्फ्रास्ट्रक्चर हटवा: साफसफाई आणि संसाधन व्यवस्थापन
  - 7-समारोप: सारांश आणि पुढील पावले
- **🛠️ कार्यशाळा टूलिंग**: सुधारित शिकण्याच्या अनुभवासाठी Material थीमसह MkDocs कॉन्फिगरेशन
- **🎯 प्रत्यक्ष शिकण्याचा मार्ग**: 3-पायरी पद्धती (शोध → तैनात → सानुकूलन)
- **📱 GitHub Codespaces एकत्रीकरण**: निर्बाध विकास पर्यावरण सेटअप

#### सुधारित
- **AI कार्यशाळा प्रयोगशाळा**: व्यापक 2-3 तासांच्या संरचित शिकण्याच्या अनुभवाने वाढवलेले
- **कार्यशाळा दस्तऐवजीकरण**: नेव्हिगेशन आणि दृश्य मदतीसह व्यावसायिक सादरीकरण
- **शिक्षण प्रगती**: टेम्प्लेट निवडपासून उत्पादन तैनातीपर्यंत स्पष्ट पायऱ्या
- **विकसक अनुभव**: एकत्रित टूलिंगमुळे सुव्यवस्थित विकास वर्कफ्लोज

#### सुधारित
- **प्रवेशयोग्यता**: शोध, कॉपी फंक्शन आणि थीम टॉगलसह ब्राउझर-आधारित इंटरफेस
- **स्वयं-गतीने शिकणे**: भिन्न शिक्षण गतींसाठी लवचिक कार्यशाळा रचना
- **व्यावहारिक अनुप्रयोग**: वास्तविक जगातील AI टेम्प्लेट तैनाती परिस्थिती
- **समुदाय समाकलन**: कार्यशाळा समर्थन आणि सहकार्यासाठी Discord समाकलन

#### कार्यशाळा वैशिष्ट्ये
- **इनबिल्ट शोध**: जलद कीवर्ड आणि धडा शोध
- **कोड ब्लॉक्स कॉपी करा**: सर्व कोड उदाहरणांसाठी hover-to-copy कार्यक्षमता
- **थीम टॉगल**: वेगवेगळ्या प्राधान्यानुसार डार्क/लाइट मोड समर्थन
- **दृश्य सामग्री**: सुधारित समजण्यासाठी स्क्रीनशॉट्स आणि आकृत्या
- **मदत समाकलन**: समुदाय समर्थनासाठी थेट Discord प्रवेश

### [v3.2.0] - 2025-09-17

#### प्रमुख नेव्हिगेशन पुनर्रचना आणि अध्यायाधारित शिक्षण प्रणाली
**ही आवृत्ती संपूर्ण संग्रहासाठी विस्तृत अध्यायाधारित शिकण्याची रचना आणि सुधारित नेव्हिगेशन सादर करते.**

#### जोडलेले
- **📚 अध्यायाधारित शिकण्याची प्रणाली**: 8 पायरीच्या प्रगत शिकण्याच्या अध्यायांमध्ये संपूर्ण कोर्स पुनर्रचित
  - अध्याय 1: मूलतत्त्वे आणि जलद प्रारंभ (⭐ - 30-45 मिनिटे)
  - अध्याय 2: AI-प्रथम विकास (⭐⭐ - 1-2 तास)
  - अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण (⭐⭐ - 45-60 मिनिटे)
  - अध्याय 4: कोड प्रमाणे इन्फ्रास्ट्रक्चर आणि तैनाती (⭐⭐⭐ - 1-1.5 तास)
  - अध्याय 5: बहु-एजंट AI सोल्यूशन्स (⭐⭐⭐⭐ - 2-3 तास)
  - अध्याय 6: प्री-तैनाती पडताळणी आणि नियोजन (⭐⭐ - 1 तास)
  - अध्याय 7: समस्या निवारण आणि डीबगिंग (⭐⭐ - 1-1.5 तास)
  - अध्याय 8: उत्पादन आणि एंटरप्राइझ नमुने (⭐⭐⭐⭐ - 2-3 तास)
- **📚 व्यापक नेव्हिगेशन प्रणाली**: सर्व दस्तऐवजीकरणांमध्ये सुसंगत नेव्हिगेशन हेडर आणि फूटर
- **🎯 प्रगती ट्रॅकिंग**: कोर्स पूर्णता तपासणी यादी आणि शिकण्याचे पडताळणी प्रणाली
- **🗺️ शिकण्याचा मार्गदर्शन**: भिन्न अनुभव पातळ्या आणि उद्दिष्टांसाठी स्पष्ट प्रवेश बिंदू
- **🔗 क्रॉस-रेफरन्स नेव्हिगेशन**: संबंधित अध्याय आणि पूर्वअट स्पष्टपणे लिंक केलेल्या

#### सुधारित
- **README रचना**: अध्यायाधारित संघटनेसह संरचित शिकण्याच्या प्लॅटफॉर्ममध्ये रूपांतरित
- **दस्तऐवजीकरण नेव्हिगेशन**: प्रत्येक पृष्ठ आता अध्याय संदर्भ आणि प्रगती मार्गदर्शन समाविष्ट करते
- **टेम्प्लेट संघटना**: योग्य शिकण्याच्या अध्यायांमध्ये उदाहरणे आणि टेम्प्लेट नकाशामधून मॅप केलेले

- **संसाधने समाकलन**: संबंधित प्रकरणांसह चिटशीट्स, FAQ आणि अभ्यास मार्गदर्शक
- **कार्यशाळा समाकलन**: अनेक प्रकरणांच्या शिकण्याच्या उद्दिष्टांसाठी हाताने करता येणारी प्रयोगशाळा

#### बदललेले
- **शिकण्याची प्रगती**: रेषीय दस्तऐवजापासून लवचिक प्रकरणांवर आधारित शिक्षणाकडे स्थलांतरित
- **कॉन्फिगरेशन स्थान**: चांगल्या शिकण्याच्या प्रवाहासाठी कॉन्फिगरेशन मार्गदर्शकाला प्रकरण 3 मध्ये पुनर्स्थित केले
- **AI सामग्री समाकलन**: संपूर्ण शिक्षण प्रवासात AI-विशिष्ट सामग्रीचे अधिक चांगले समाकलन
- **उत्पादन सामग्री**: प्रकरण 8 मध्ये एंटरप्राइझ शिकणाऱ्यांसाठी प्रगत नमुने एकत्रित केले

#### सुधारित
- **वापरकर्ता अनुभव**: स्पष्ट नेव्हिगेशन ब्रेडक्रंब आणि प्रकरण प्रगती निर्देशांक
- **प्रवेशयोग्यता**: सोप्या कोर्स नेव्हिगेशनसाठी सुसंगत नेव्हिगेशन नमुने
- **व्यावसायिक सादरीकरण**: शैक्षणिक व कॉर्पोरेट प्रशिक्षणासाठी विद्यापीठ-शैलीचा कोर्स स्ट्रक्चर
- **शिकण्याची कार्यक्षमता**: सुधारित संघटनाद्वारे संबंधित सामग्री शोधण्याचा वेळ कमी केला

#### तांत्रिक अंमलबजावणी
- **नेव्हिगेशन हेडर**: 40+ दस्तऐवज फाइल्समध्ये प्रकरण नेव्हिगेशनचे मानकीकरण
- **पादलेखन नेव्हिगेशन**: सुसंगत प्रगती मार्गदर्शन आणि प्रकरण पूर्णता निर्देशांक
- **क्रॉस-लिंकिंग**: संबंधित संकल्पनांना जोडणारी व्यापक आंतरिक लिंकिंग प्रणाली
- **प्रकरण नकाशा**: शिकण्याच्या उद्दिष्टांसह स्पष्टपणे संबंधित साच्यांचे उदाहरणे

#### अभ्यास मार्गदर्शक सुधारणा
- **📚 व्यापक शिकण्याचे उद्दिष्ट**: 8-प्रकरण प्रणालीशी जुळवून घेतलेला पुनर्रचित अभ्यास मार्गदर्शक
- **🎯 प्रकरण-आधारित मूल्यांकन**: प्रत्येक प्रकरणात विशिष्ट शिकण्याचे उद्दिष्ट व व्यावहारिक सराव
- **📋 प्रगती ट्रॅकिंग**: मापनक्षम परिणामांसह साप्ताहिक शिकण्याचे वेळापत्रक व पूर्णतेची तपासणी यादी
- **❓ मूल्यांकन प्रश्न**: व्यावसायिक परिणामांसाठी प्रत्येक प्रकरणासाठी ज्ञान पडताळणी प्रश्न
- **🛠️ व्यावहारिक सराव**: प्रत्यक्ष तैनाती प्रकरणे व समस्यांवरील हाताळणी क्रियाकलाप
- **📊 कौशल्य प्रगती**: मूलभूत संकल्पनांपासून एंटरप्राइझ नमुन्यांपर्यंत स्पष्ट प्रगती, करिअर विकासावर लक्ष
- **🎓 प्रमाणीकरण चौकट**: व्यावसायिक विकास परिणाम व समुदाय मान्यता प्रणाली
- **⏱️ कालमर्यादा व्यवस्थापन**: टप्पा पडताळणीसह संरचित 10 आठवडे शिकण्याची योजना

### [v3.1.0] - 2025-09-17

#### सुधारित बहु-एजंट AI सोल्युशन्स
**हा आवृत्ती बहु-एजंट रिटेल सोल्युशनला एजंट नामांकन व सुधारित दस्तऐवजीकरणाने सुधारित करते.**

#### बदललेले
- **बहु-एजंट टर्मिनोलॉजी**: "Cora agent" ऐवजी "Customer agent" हे संपूर्ण रिटेल बहु-एजंट सोल्युशनमध्ये वापरले, अधिक स्पष्टतेसाठी
- **एजंट आर्किटेक्चर**: सर्व दस्तऐवज, ARM टेम्पलेट्स, व कोड उदाहरणे यांना सुसंगत "Customer agent" नावाने अद्यतनित केले
- **कॉन्फिगरेशन उदाहरणे**: एजंट कॉन्फिगरेशन नमुने अद्ययावत नामकरण परंपरांसह आधुनिक केले
- **दस्तऐवज सुसंगतता**: सर्व संदर्भ व्यावसायिक, वर्णनात्मक एजंट नावे वापरतात याची खात्री केली

#### सुधारित
- **ARM टेम्पलेट पॅकेज**: रिटेल-मल्टीएजंट-आर्म-टेम्पलेट Customer agent संदर्भासह अद्यतनित
- **आर्किटेक्चर आकृत्या**: मरमेड आकृत्या अद्यतनित एजंट नामांकनासह ताज्या केल्या
- **कोड उदाहरणे**: Python वर्ग व अंमलबजावणी उदाहरणांमध्ये CustomerAgent नावाने वापर
- **पर्यावरण चल**: सर्व तैनाती स्क्रिप्ट्स CUSTOMER_AGENT_NAME परंपरांसाठी अद्यतनित

#### सुधारित
- **डेव्हलपर अनुभव**: दस्तऐवजात एजंट भूमिका व जबाबदाऱ्या अधिक स्पष्ट केल्या
- **उत्पादन Readiness**: एंटरप्राइझ नामकरण परंपरांसह चांगले संरेखन केले
- **शिकण्याची सामग्री**: शैक्षणिक हेतूसाठी अधिक सहजतेने समजणारी एजंट नावे
- **साचा वापरक्षमता**: एजंट कार्ये व तैनाती नमुन्यांचे सोपे समजणे

#### तांत्रिक तपशील
- CustomerAgent संदर्भांसह मरमेड आर्किटेक्चर आकृत्या अद्यतनित
- Python उदाहरणांमध्ये CoraAgent वर्ग नावे CustomerAgent ने बदलली
- ARM टेम्पलेट JSON कॉन्फिगरेशनमध्ये "customer" एजंट प्रकार वापरला
- पर्यावरण चल CORA_AGENT_* पासून CUSTOMER_AGENT_* नमुन्यांमध्ये अद्यतनित
- सर्व तैनाती आदेश व कंटेनर सेटिंग्ज ताज्या केल्या

### [v3.0.0] - 2025-09-12

#### मुख्य बदल - AI डेव्हलपर फोकस व Microsoft Foundry समाकलन
**ही आवृत्ती Microsoft Foundry समाकलनासह AI-केंद्रित व्यापक शिक्षण संसाधनात रेपॉजिटरी बदलेली आहे.**

#### जोडले
- **🤖 AI-प्रथम शिकण्याचा मार्ग**: AI डेव्हलपर व अभियंत्यांना प्राधान्य देऊन पूर्णपणे पुनर्रचित
- **Microsoft Foundry समाकलन मार्गदर्शक**: AZD आणि Microsoft Foundry सेवा कनेक्ट करण्यासाठी विस्तृत दस्तऐवज
- **AI मॉडेल तैनाती नमुने**: मॉडेल निवड, कॉन्फिगरेशन व उत्पादन तैनाती धोरणांचे सविस्तर मार्गदर्शन
- **AI कार्यशाळा प्रयोगशाळा**: AI अनुप्रयोग AZD-तैनात करण्यासाठी 2-3 तासांच्या हस्तांतरित कार्यशाळा
- **उत्पादन AI सर्वोत्तम पद्धती**: AI वर्कलोडच्या प्रमाण वाढवणे, निरीक्षण व सुरक्षिततेसाठी एंटरप्राइझ तयार नमुने
- **AI-विशिष्ट समस्या निवारण मार्गदर्शक**: Microsoft Foundry मॉडेल्स, कॉग्निटिव्ह सेवा व AI तैनाती समस्या निवारणासाठी व्यापक मार्गदर्शक
- **AI साचा संच**: Microsoft Foundry साच्यांच्या वैशिष्ट्यीकृत संग्रहासह जटिलता रेटिंग
- **कार्यशाळा साहित्य**: हाताळणी माझ्रे आणि संदर्भ साहित्यासह पूर्ण कार्यशाळा रचना

#### सुधारित
- **README रचना**: AI-डेव्हलपर केंद्रित, Microsoft Foundry Discord मधील 45% समुदाय स्वारस्य डेटा असलेले
- **शिकण्याचे मार्ग**: पारंपरिक विद्यार्थ्यां व DevOps अभियंत्यांसोबत समर्पित AI डेव्हलपर प्रवास
- **साचा शिफारसी**: azure-search-openai-demo, contoso-chat, आणि openai-chat-app-quickstart यासह वैशिष्ट्यीकृत AI साचे
- **समुदाय समाकलन**: AI-विशिष्ट चॅनेल व चर्चांसह Discord समुदाय समर्थन वाढविले

#### सुरक्षा व उत्पादन फोकस
- **व्यवस्थापित ओळख नमुने**: AI-विशिष्ट प्रमाणीकरण आणि सुरक्षा कॉन्फिगरेशन
- **खर्च ऑप्टिमायझेशन**: टोकन वापर ट्रॅकिंग व बजेट नियंत्रण AI वर्कलोडसाठी
- **बहु-प्रदेश तैनाती**: जागतिक AI अनुप्रयोग तैनाती धोरणे
- **कार्यक्षमता निरीक्षण**: AI-विशिष्ट मेट्रिक्स व Application Insights समाकलन

#### दस्तऐवज गुणवत्ता
- **रेषीय कोर्स रचना**: प्रसंगी ते प्रगत AI तैनाती नमुन्यांपर्यंत तार्किक प्रगती
- **सत्यापित URL**: सर्व बाह्य रेपॉजिटरी दुवे पडताळलेले व प्रवेशयोग्य
- **पूर्ण संदर्भ**: सर्व आंतरिक दस्तऐवज दुवे पडताळलेले व कार्यरत
- **उत्पादनासाठी तयार**: वास्तविक उदाहरणांसह एंटरप्राइझ तैनाती नमुने

### [v2.0.0] - 2025-09-09

#### मुख्य बदल - रेपॉजिटरी पुनर्रचना व व्यावसायिक सुधारणा
**ही आवृत्ती रेपॉजिटरी संरचना व सामग्री सादरीकरणातील महत्वाचा बदल दर्शवते.**

#### जोडले
- **संरचित शिक्षण चौकट**: सर्व दस्तऐवज पृष्ठांमध्ये परिचय, शिकण्याचे उद्दिष्टे, व शिकण्याचे निकाल विभाग समाविष्ट
- **नेव्हिगेशन प्रणाली**: सर्व दस्तऐवजांमध्ये मार्गदर्शित शिकण्याच्या प्रगतीसाठी मागील/पुढील धडा दुवे जोडले
- **अभ्यास मार्गदर्शक**: शिकण्याचे उद्दिष्टे, अभ्यास सराव, व मूल्यमापन साहित्यासह सर्वसमावेशक study-guide.md
- **व्यावसायिक सादरीकरण**: सुधारित प्रवेशयोग्यतेसाठी सर्व इमोजी चिन्हे काढली
- **सामग्री रचना सुधारित**: शिकण्याच्या सामग्रीचे संघटन व प्रवाह सुधरले

#### बदललेले
- **दस्तऐवज फॉर्मॅट**: सर्व दस्तऐवजांना सुसंगत शिकण्यावर केंद्रित रचनेत रूपांतरित
- **नेव्हिगेशन प्रवाह**: सर्व शिकण्याच्या सामग्रीत तार्किक प्रगती लागू केली
- **सामग्री सादरीकरण**: स्पष्ट व्यावसायिक स्वरूपासाठी सजावटीचे घटक काढले
- **दुवा रचना**: नवीन नेव्हिगेशन प्रणालीला समर्थन देण्यासाठी सर्व आंतरिक दुवे अद्यतनित

#### सुधारित
- **प्रवेशयोग्यता**: स्क्रीन रीडरसाठी सुधारित अनुकूलतेसाठी इमोजी अवलंबित्वे काढली
- **व्यावसायिक देखावा**: एंटरप्राइझ शिक्षणासाठी स्वच्छ, अकादमिक-शैलीचे सादरीकरण
- **शिकण्याचा अनुभव**: प्रत्येक धड्यात स्पष्ट उद्दिष्टे व निष्कर्षांसह संरचित दृष्टिकोन
- **सामग्री सांघिकरण**: संबंधित विषयांमधील चांगला तार्किक प्रवाह व कनेक्शन

### [v1.0.0] - 2025-09-09

#### प्रारंभिक प्रकाशन - सर्वसमावेशक AZD शिकण्याचे रेपॉजिटरी

#### जोडले
- **मुख्य दस्तऐवज रचना**
  - पूर्ण गेटिंग-स्टार्टेड मार्गदर्शक मालिका
  - व्यापक तैनाती व पुरवठा दस्तऐवजीकरण
  - सविस्तर समस्या निराकरण संसाधने व डीबगिंग मार्गदर्शक
  - पूर्व-तैनाती पडताळणी साधने व प्रक्रिया

- **गेटिंग स्टार्टेड मॉड्यूल**
  - AZD मूलभूत तत्त्वे व टर्मिनोलॉजी
  - इन्स्टॉलेशन मार्गदर्शक: प्लॅटफॉर्म-विशिष्ट सेटअप सूचना
  - कॉन्फिगरेशन मार्गदर्शक: पर्यावरण सेटअप व प्रमाणीकरण
  - प्रथम प्रोजेक्ट ट्यूटोरियल: टप्प्याटप्प्याने हाताळणी शिक्षण

- **तैनाती व पुरवठा मॉड्यूल**
  - तैनाती मार्गदर्शक: संपूर्ण कार्यप्रवाह दस्तऐवजीकरण
  - पुरवठा मार्गदर्शक: बायसेपसह इन्फ्रास्ट्रक्चर एज कॉड
  - उत्पादन तैनातीसाठी सर्वोत्तम पद्धती
  - बहु-सेवा आर्किटेक्चर नमुने

- **पूर्व-तैनाती पडताळणी मॉड्यूल**
  - क्षमता नियोजन: Azure संसाधन उपलब्धतेची पडताळणी
  - SKU निवड: व्यापक सेवा स्तर मार्गदर्शन
  - प्री-फ्लाइट तपासणी: स्वयंचलित पडताळणी स्क्रिप्ट्स (PowerShell आणि Bash)
  - खर्च अंदाज व बजेट नियोजन साधने

- **समस्या निवारण मॉड्यूल**
  - सामान्य समस्या: वारंवार आलेल्या समस्या व त्यांचे उपाय
  - डीबगिंग मार्गदर्शक: पद्धतशीर समस्या निवारण पद्धती
  - प्रगत निदान तंत्रे व साधने
  - कार्यक्षमता निरीक्षण व ऑप्टिमायझेशन

- **संसाधने व संदर्भ**
  - कमांड चिट शीट: आवश्यक आदेशांसाठी जलद संदर्भ
  - शब्दसंग्रह: संपूर्ण टर्मिनोलॉजी व संक्षेपार्थ परिभाषा
  - FAQ: सामान्य प्रश्नांची सविस्तर उत्तरे
  - बाह्य संसाधन दुवे व समुदाय संपर्क

- **उदाहरणे व साचे**
  - सोपा वेब ऍप्लिकेशन उदाहरण
  - स्थिर वेबसाइट तैनाती साचा
  - कंटेनर ऍप्लिकेशन कॉन्फिगरेशन
  - डेटाबेस समाकलन नमुने
  - मायक्रोसर्व्हिसेस आर्किटेक्चर उदाहरणे
  - सर्व्हरलेस फंक्शन अंमलबजावणी

#### वैशिष्ट्ये
- **बहु-प्लॅटफॉर्म समर्थन**: Windows, macOS, आणि Linux साठी इन्स्टॉलेशन व कॉन्फिगरेशन मार्गदर्शक
- **अनेक कौशल्य स्तर**: विद्यार्थी ते व्यावसायिक डेव्हलपरपर्यंतच्या सामग्रीसाठी डिझाइन
- **व्यावहारिक लक्ष**: हाताळणी उदाहरणे व वास्तविक प्रकरणे
- **व्यापक कव्हरेज**: मूलभूत संकल्पनांपासून प्रगत एंटरप्राइझ नमुन्यांपर्यंत
- **सुरक्षा-प्रथम दृष्टीकोन**: संपूर्णपणे एकत्रित सुरक्षा सर्वोत्तम पद्धती
- **खर्च ऑप्टिमायझेशन**: किफायतशीर तैनाती व संसाधन व्यवस्थापनासाठी मार्गदर्शन

#### दस्तऐवज गुणवत्ता
- **सविस्तर कोड उदाहरणे**: व्यावहारिक, तपासलेली कोड नमुने
- **टप्प्याटप्प्याने सूचना**: स्पष्ट, कृतीक्षम मार्गदर्शन
- **व्यापक त्रुटी हाताळणी**: सामान्य समस्यांसाठी समस्या निवारण
- **सर्वोत्तम पद्धती समाकलन**: उद्योग मानके व शिफारसी
- **आवृत्ती सुसंगतता**: नवीनतम Azure सेवा व azd वैशिष्ट्यांसह अद्ययावत

## नियोजित भविष्य सुधारणां

### आवृत्ती 3.1.0 (नियोजित)
#### AI प्लॅटफॉर्म विस्तार
- **बहु-मॉडेल समर्थन**: Hugging Face, Azure Machine Learning, आणि सानुकूल मॉडेल्ससाठी समाकलन नमुने
- **AI एजंट फ्रेमवर्क्स**: LangChain, Semantic Kernel, व AutoGen तैनातींसाठी साचे
- **प्रगत RAG नमुने**: Azure AI Search पेक्षा पुढे वेक्टर डेटाबेस पर्याय (Pinecone, Weaviate इ.)
- **AI निरीक्षणक्षमता**: मॉडेल कार्यप्रदर्शन, टोकन वापर, व प्रतिसाद गुणवत्ता याचे सुधारित निरीक्षण

#### डेव्हलपर अनुभव
- **VS कोड विस्तार**: एकत्रित AZD + Microsoft Foundry विकास अनुभव
- **GitHub Copilot समाकलन**: AI-समर्थित AZD साचा निर्मिती
- **परस्पर संवादात्मक ट्यूटोरियल्स**: स्वयंचलित पडताळणीसह AI परिस्थितीसाठी हाताळणी कोडिंग सराव
- **व्हिडिओ सामग्री**: दृष्टीकोनावर लक्ष केंद्रित करणाऱ्या AI तैनातीसाठी पूरक व्हिडिओ ट्यूटोरियल्स

### आवृत्ती 4.0.0 (नियोजित)
#### एंटरप्राइझ AI नमुने
- **शासन चौकट**: AI मॉडेल शासन, अनुपालन, व ऑडिट ट्रेल्स
- **बहु-टेनेट AI**: स्वतंत्र AI सेवा देण्यासाठी अनेक ग्राहकांसाठी नमुने
- **एज AI तैनाती**: Azure IoT Edge व कंटेनर उदाहरणांशी समाकलन
- **हायब्रिड क्लाउड AI**: AI वर्कलोडसाठी बहु-क्लाउड व हायब्रिड तैनाती नमुने

#### प्रगत वैशिष्ट्ये
- **AI पाइपलाइन स्वयंचलन**: Azure Machine Learning पाइपलाइनसह MLOps समाकलन
- **प्रगत सुरक्षा**: झिरो-ट्रस्ट नमुने, खाजगी अंतिम बिंदू, व प्रगत धमकी संरक्षण
- **कार्यक्षमता ऑप्टिमायझेशन**: उच्च-थ्रूपुट AI अनुप्रयोगांसाठी प्रगत ट्यूनिंग व प्रमाणवाढ धोरणे
- **जागतिक वितरण**: सामग्री वितरण व एज कॅशिंग नमुने AI अनुप्रयोगांसाठी

### आवृत्ती 3.0.0 (नियोजित) - सद्य प्रकाशनाने पर्यायातून काढलेले
#### प्रस्तावित जोडणी - आता v3.0.0 मध्ये अमलात आणलेली
- ✅ **AI-केंद्रित सामग्री**: Microsoft Foundry समाकलनासह (पूर्ण झाले)
- ✅ **परस्पर संवादात्मक ट्यूटोरियल्स**: हाताळणी AI कार्यशाळा प्रयोगशाळा (पूर्ण झाले)
- ✅ **प्रगत सुरक्षा मॉड्यूल**: AI-विशिष्ट सुरक्षा नमुने (पूर्ण झाले)
- ✅ **कार्यक्षमता ऑप्टिमायझेशन**: AI वर्कलोड ट्यूनिंग धोरणे (पूर्ण झाले)

### आवृत्ती 2.1.0 (नियोजित) - भागतः v3.0.0 मध्ये अमलात आणलेली
#### लहान सुधारणा - काही सद्य आवृत्तीत पूर्ण झालेल्या
- ✅ **अतिरिक्त उदाहरणे**: AI-केंद्रित तैनाती प्रकरणे (पूर्ण झाले)
- ✅ **विस्तृत FAQ**: AI-विशिष्ट प्रश्न व समस्या निवारण (पूर्ण झाले)
- **साधन समाकलन**: सुधारित IDE व संपादक समाकलन मार्गदर्शक
- ✅ **निरीक्षण विस्तार**: AI-विशिष्ट निरीक्षण व सूचना नमुने (पूर्ण झाले)

#### भविष्य प्रकाशनाकडे अद्याप नियोजित
- **मोबाइल-फ्रेंडली दस्तऐवज**: मोबाइल शिकण्यासाठी प्रतिसादात्मक डिझाइन
- **ऑफलाइन प्रवेश**: डाउनलोड करता येण्याजोगे दस्तऐवज पॅकेजेस
- **सुधारित IDE एकत्रीकरण**: AZD + AI वर्कफ्लोसाठी VS कोड विस्तार
- **समुदाय डॅशबोर्ड**: रियल-टाइम समुदाय मेट्रिक्स व योगदान ट्रॅकिंग

## चेंजलॉगमध्ये योगदान देणे

### बदलांचे अहवाल देणे
या रेपॉजिटरीमध्ये योगदान देताना, कृपया चेंजलॉग नोंदींमध्ये खालील बाबी समाविष्ट करा:

1. **आवृत्ती क्रमांक**: सेमॅंटिक आवृत्तीकरण (मुख्य.कमी.पॅच) नुसार
2. **दिनांक**: प्रकाशन किंवा अद्यतन दिनांक YYYY-MM-DD स्वरूपात
3. **श्रेणी**: जोडलेले, बदललेले, वापरात नाही, काढून टाकलेले, दुरुस्ती, सुरक्षा
4. **स्पष्ट वर्णन**: काय बदलले ते संक्षिप्त वर्णन
5. **परिणाम मूल्यांकन**: बदलामुळे विद्यमान वापरकर्त्यांवर कसा परिणाम होतो

### बदल वर्गीकरण

#### जोडलेले
- नवीन वैशिष्ट्ये, दस्तऐवज विभाग, किंवा क्षमता
- नवीन उदाहरणे, साचे, किंवा शिकण्याचे संसाधने
- अतिरिक्त साधने, स्क्रिप्ट्स, किंवा उपयुक्तता

#### बदललेले
- विद्यमान कार्यक्षमता किंवा दस्तऐवजीकरणात बदल
- स्पष्टता किंवा अचूकता सुधारण्यासाठी अद्यतने
- सामग्री किंवा संघटनेचे पुनर्रचना

#### वापरात नाही
- स्थिरीकरण किंवा टाळले जाणारे वैशिष्ट्ये किंवा पद्धती
- काढून टाकण्यासाठी निर्धारित दस्तऐवज विभाग
- चांगले पर्याय असलेले उपाय

#### काढलेले
- आधीचे महत्व नसलेली वैशिष्ट्ये, दस्तऐवज, किंवा उदाहरणे
- जुनी माहिती किंवा वापरात नसलेले उपाय
- पुनरावृत्ती किंवा एकत्रित सामग्री

#### दुरुस्ती
- दस्तऐवज किंवा कोडमधील चुका सुधारणा
- अहवाल दिलेल्या समस्यांचे निराकरण
- अचूकता किंवा कार्यक्षमता सुधारणा


#### सुरक्षा
- सुरक्षा-संबंधित सुधारणा किंवा दुरुस्त्या
- सुरक्षा सर्वोत्तम पद्धतींमध्ये अद्यतने
- सुरक्षा कमजोर्या यांचे निराकरण

### समांतिक आवृत्ती मार्गदर्शक तत्त्वे

#### प्रमुख आवृत्ती (X.0.0)
- ब्रेकिंग बदल जे वापरकर्त्याच्या कृतीची गरज असते
- साहित्य किंवा संघटनाचा महत्त्वाचा पुनर्रचना
- असे बदल जे मूलभूत दृष्टिकोन किंवा पद्धती बदलतात

#### लघु आवृत्ती (X.Y.0)
- नवीन वैशिष्ट्ये किंवा सामग्री वाढवणे
- मागील अनुकूलतेसह सुधारणा
- अतिरिक्त उदाहरणे, साधने, किंवा स्रोत

#### पॅच आवृत्ती (X.Y.Z)
- बग दुरुस्त्या व सुधारणा
- विद्यमान सामग्रीत लहान सुधारणा
- स्पष्टीकरणे व सूक्ष्म सुधारणा

## समुदाय अभिप्राय आणि सूचना

आम्ही या शिक्षण स्रोताला सुधारण्यासाठी सक्रियपणे समुदाय अभिप्रायास प्रोत्साहित करतो:

### अभिप्राय कसा द्यावा
- **GitHub Issues**: समस्या नोंदवा किंवा सुधारणा सुचवा (AI-संबंधित समस्या स्वागतार्ह आहेत)
- **Discord Discussions**: कल्पना शेअर करा आणि Microsoft Foundry समुदायात सहभाग घ्या
- **Pull Requests**: विशेषतः AI टेम्प्लेट्स आणि मार्गदर्शकांसाठी सामग्रीत थेट सुधारणा करा
- **Microsoft Foundry Discord**: AZD + AI चर्चांसाठी #Azure चॅनेलमध्ये सहभागी व्हा
- **Community Forums**: व्यापक Azure विकासक चर्चा मध्ये सहभागी व्हा

### अभिप्राय वर्गीकरण
- **AI सामग्री अचूकता**: AI सेवा समाकलन आणि तैनाती माहितीतील दुरुस्ती
- **शिक्षण अनुभव**: सुधारित AI विकासक शिक्षण प्रवाहासाठी सूचना
- **गहाळ AI सामग्री**: अतिरिक्त AI टेम्प्लेट्स, पॅटर्न्स किंवा उदाहरणे यासाठी विनंत्या
- **порт उपलब्धता**: विविध शिक्षण गरजांसाठी सुधारणा
- **AI साधन समाकलन**: AI विकास कार्यप्रवाह समाकलनासाठी सुचना
- **उत्पादन AI पॅटर्न्स**: एंटरप्राइज AI तैनाती पॅटर्न विनंत्या

### प्रतिसाद बांधिलकी
- **समस्या प्रतिसाद**: नोंदवलेल्या समस्यांसाठी 48 तासांत
- **वैशिष्ट्य विनंत्या**: एक आठवड्यात मूल्यमापन
- **समुदाय योगदान**: एक आठवड्यात पुनरावलोकन
- **सुरक्षा समस्या**: तात्काळ प्राधान्याने वेगाने प्रतिसाद

## देखभाल वेळापत्रक

### नियमित अद्यतने
- **मासिक पुनरावलोकने**: सामग्री अचूकता व दुवे सत्यापन
- **त्रैमासिक अद्यतने**: महत्त्वाच्या सामग्री वाढ व सुधारणा
- **अर्धवार्षिक पुनरावलोकने**: सर्वसमावेशक पुनर्रचना व सुधारणा
- **वार्षिक प्रकाशने**: महत्त्वाच्या आवृत्ती अद्यतनांसह मोठी सुधारणा

### निरीक्षण व गुणवत्ता हमी
- **स्वयंचलित चाचण्या**: कोड उदाहरणे व दुव्यांचे नियमित सत्यापन
- **समुदाय अभिप्राय समाकलन**: वापरकर्ता सूचना नियमितपणे समाविष्ट करणे
- **तंत्रज्ञान अद्यतने**: नवीनतम Azure सेवा व azd प्रकाशनांसह संरेखण
- **प्रवेशयोग्यता ऑडिट**: सर्वसमावेशक डिझाइन तत्त्वांसाठी नियमित पुनरावलोकन

## आवृत्ती समर्थन धोरण

### सध्याचा आवृत्ती समर्थन
- **अलीकडील प्रमुख आवृत्ती**: पूर्ण समर्थन व नियमित अद्यतने
- **मागील प्रमुख आवृत्ती**: सुरक्षा अद्यतने व महत्त्वाच्या दुरुस्त्यांसाठी 12 महिने
- **वारसा आवृत्त्या**: फक्त समुदाय समर्थन, अधिकृत अद्यतने नाहीत

### स्थलांतरण मार्गदर्शन
जेव्हा प्रमुख आवृत्त्या प्रकाशित केल्या जातात, तेव्हा आम्ही पुरवतो:
- **स्थानांतरण मार्गदर्शक**: टप्प्याटप्प्याने संक्रमण सूचना
- **सुसंगतता टीपा**: ब्रेकिंग बदलांच्या तपशीलांसह
- **साधन समर्थन**: स्थलांतरणासाठी मदत करणारे स्क्रिप्ट किंवा उपयुक्तता
- **समुदाय समर्थन**: स्थलांतरण प्रश्नांसाठी समर्पित मंच

---

**नेव्हिगेशन**
- **मागील धडा**: [अभ्यास मार्गदर्शक](resources/study-guide.md)
- **पुढील धडा**: [मुख्य README](README.md) कडे परत जा

**नवीनतम राहा**: नवीन प्रकाशने व महत्त्वाच्या शिक्षण संसाधन अद्यतनांचे नोटीफिकेशन मिळवण्यासाठी या रेपॉजिटरीवर लक्ष ठेवा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->