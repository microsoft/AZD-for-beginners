# चेंजलॉग - AZD फॉर बिगिनर्स

## परिचय

हा चेंजलॉग AZD फॉर बिगिनर्स रिपॉझिटरीतील सर्व महत्त्वाच्या बदल, अद्यतने आणि सुधारणा नमूद करतो. आम्ही सेमॅंटिक व्हर्जनिंग तत्त्वांचे पालन करतो आणि वापरकर्त्यांना आवृत्त्यांमधील काय बदलले आहे हे समजून घेण्यास मदत करण्यासाठी हा लॉग राखतो.

## शिक्षणाचे उद्दिष्टे

हा चेंजलॉग पाहून, तुम्ही:
- नवीन वैशिष्ट्ये आणि सामग्री वाढीबद्दल अद्ययावत राहाल
- विद्यमान दस्तऐवजातील सुधारणा समजून घेता येतील
- बग फिक्सेस आणि दुरुस्त्या ट्रॅक करू शकाल ज्यामुळे अचूकता सुनिश्चित होते
- शिक्षण सामग्रीच्या वेळोवेळी होणाऱ्या विकासावर लक्ष ठेवू शकाल

## शिक्षणाचे निकाल

चेंजलॉग एन्ट्रीज पुनरावलोकन केल्यानंतर, तुम्ही पुढील कामे करू शकाल:
- शिकण्यासाठी उपलब्ध नवीन सामग्री आणि साधने ओळखणे
- कोणत्या विभागांना सुधारले किंवा अपडेट केले गेले आहे ते समजून घेणे
- सध्याच्या सामग्रीच्या आधारावर तुमचा शिक्षणाचा मार्ग आखणे
- भविष्यातील सुधारणा साठी अभिप्राय आणि सूचना देणे

## आवृत्ती इतिहास

### [v3.22.0] - २०२६-०६-१६

#### बिगिनर गॅप-फिल #2: टेम्पलेट लेखक, देव कंटेनर्स, पुलुमी, Azure DevOps, सर्व्हिस प्रिन्सिपल्स, आणि अधिक
**ही आवृत्ती azd-coverage विश्लेषणाद्वारे उघडकीस आलेले उरलेले मध्यवर्ती गॅप बंद करते: आपले स्वतःचे टेम्पलेट कसे लिहावे आणि प्रकाशित करावे, पुनरुत्पादनीय देव-कंटेनर/कोडस्पेस वातावरण, पुलुमी इन्फ्रास्ट्रक्चर प्रदाता, Azure DevOps CI/CD वॉकथ्रू, सर्व्हिस-प्रिन्सिपल प्रमाणीकरण, होस्ट-निवड मार्गदर्शन (AKS/Spring Apps), `azd restore`/`azd package` स्पष्टीकरणे, हुक त्रुटी हाताळणी, आणि टीम/सामायिक वातावरणाच्या पद्धती.**

#### जोडले
- **🧱 नवीन अध्याय 4 धडा** `docs/chapter-04-infrastructure/custom-templates.md` — आपले स्वतःचे azd टेम्पलेट लेखक: आवश्यक संरचना (`azure.yaml`, `infra/`, `src/`), `metadata.template` क्षेत्र, `uniqueString()` रिसोर्स टोकन आणि `azd-env-name` टॅगसह इन्फ्रास्ट्रक्चर पॅरामिटरायझेशन, `azd init --template <local-path>` वापरून स्थानिक चाचणी, GitHub वर प्रकाशन, आणि Awesome AZD गॅलरीला सबमिट करणे
- **📦 नवीन अध्याय 1 धडा** `docs/chapter-01-foundation/dev-containers.md` — देव कंटेनर आणि GitHub Codespaces सह पुनरुत्पादनीय azd वातावरण: अधिकृत `ghcr.io/azure/azure-dev/azd` वैशिष्ट्य वापरणारे किमान `.devcontainer/devcontainer.json`, भाषा-विशिष्ट वैशिष्ट्ये, कंटेनर होस्टसाठी `docker-in-docker`, आणि रिमोट साइन-इनसाठी `azd auth login --use-device-code`
- **🧩 Pulumi सह azd** विभाग `docs/chapter-04-infrastructure/provisioning.md` मध्ये — `infra.provider: pulumi`, पुलुमी फोल्डर लेआउट, azd वातावरणांशी नकाशित स्टॅक्स, आवश्यक आउटपुट्स/टॅगिंग, आणि एकसारखा `azd up` / `azd down` वर्कफ्लो
- **🎯 होस्ट-निवड मार्गदर्शन** `docs/chapter-04-infrastructure/provisioning.md` मध्ये — बिगिनर्ससाठी `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, आणि `springapp` ची तुलना, AKS किंवा Azure Spring Apps कधी निवडायचे याचे मार्गदर्शन
- **🛠️ Azure DevOps CI/CD वॉकथ्रू** `docs/chapter-08-production/production-ai-practices.md` मध्ये — `azd pipeline config --provider azdo`, कार्यभार ओळख फेडरेशन (OIDC) सह सेवा कनेक्शन, तयार `azure-dev.yml`, आणि व्हेरिएबल-ग्रुप सेटअप
- **🔑 सर्व्हिस प्रिन्सिपल्स (पॅटर्न 4)** `docs/chapter-03-configuration/authsecurity.md` मध्ये जोडले — `az ad sp create-for-rbac`, क्लायंट सीक्रेट विरुद्ध फेडरेटेड/OIDC क्रेडेन्शियल्ससह नॉन-इंटरऐक्टिव `azd auth login`, वापर कधी करावा, आणि सुरक्षित क्रेडेन्शियल स्टोरेज
- **🪝 हुक त्रुटी हाताळणी** `docs/chapter-04-infrastructure/deployment-guide.md` मधील उपविभाग — exit कोड्स आणि `set -e`, `continueOnError`, `azd hooks run` सह हुक्सची स्वतंत्र चाचणी, OS-विशिष्ट शेल्स, आणि `--debug`
- **👥 टीम / सामायिक वातावरणे** `docs/chapter-03-configuration/configuration.md` मध्ये विभाग — `.azure/` मध्ये काय राहते, काय gitignore करावे, प्रति-डेव्हलपर वातावरण, `azd env list`/`select`, आणि CI/CD मध्ये वातावरण मूल्याची पुरवठा
- **🧰 `azd restore` आणि विस्तारित `azd package`** स्पष्टीकरणे `resources/cheat-sheet.md` मध्ये — अवलंबित्व पुनर्संचयित करणे आणि तैनात न करता एक तैनातयोग्य आर्टिफॅक्ट तयार करणे

#### बदलले
- **🧭 अध्याय 4 धडे सारणी** अद्यतनित — नवीन "आपले स्वतःचे टेम्पलेट लेखक" धडा (धडा 3) समाविष्ट
- **🧭 अध्याय 1 धडे सारणी** अद्यतनित — नवीन "देव कंटेनर्स & कोडस्पेसेस" धडा (धडा 5) समाविष्ट; `bring-your-own-app.md` आणि `dev-containers.md` यांच्यात नेव्हिगेशन फूटर्स जोडले

### [v3.21.0] - २०२६-०६-१६

#### बिगिनर गॅप-फिल: हँड्स-ऑन मल्टी-एजंट धडा, "ब्रिंग योर ओन अॅप," टेराफॉर्म, आणि CI/CD वॉकथ्रू
**ही आवृत्ती दोन नवीन हँड्स-ऑन धडे (तैनातयोग्य मल्टी-एजंट वॉकथ्रू आणि विद्यमान अॅप मध्ये azd जोडणे), बिगिनर-फ्रेंडली हुक्स परिचय, टेराफॉर्म-सह azd विभाग, GitHub Actions पायपलाईन वॉकथ्रू, नवीन प्रीव्यू एक्सटेंशन्स साठी स्पष्टीकरण, आणि तैनाती-तपासणी सूची यांसह पूर्ण बिगिनर मार्गदर्शकासाठी सर्वात मोठे गॅप बंद करते.**

#### जोडले
- **🤝 नवीन अध्याय 5 धडा** `docs/chapter-05-multi-agent/multi-agent-basics.md` — पूर्णपणे हँड्स-ऑन, तैनातयोग्य दोन एजंट वॉकथ्रू (ऑर्केस्ट्रेटर + स्पेशलिस्ट्स) खऱ्या टेम्पलेटसह (`contoso-creative-writer`), मल्टी-एजंट कधी वापरायचा, `azd up` वर्कफ्लो समजून घेणे, तैनात केलेल्या संसाधनांची समज, एजंट-दरम्यान ट्रेसिंग, सानुकूलन, आणि साफसफाई
- **📦 नवीन अध्याय 1 धडा** `docs/chapter-01-foundation/bring-your-own-app.md` — विद्यमान प्रकल्पात `azd init` वापरून azd कसे जोडायचे ("सध्याच्या डिरेक्टरीतील कोड वापरा"), `azure.yaml` आणि `infra/` चे आकलन, `azd infra generate`, होस्ट डिटेक्शन, आणि `azd up` ने तैनात करणे
- **🌐 टेराफॉर्म सोबत azd** `docs/chapter-04-infrastructure/provisioning.md` मध्ये विभाग — `infra.provider: terraform` कॉन्फिगरेशन, `.tf` फोल्डर लेआउट, आवश्यक `AZURE_*` आउटपुट्स आणि `azd-env-name` टॅगिंग, आणि समान `azd up` / `azd down` वर्कफ्लो (टेराफॉर्म सपोर्ट दावा केला गेला पण फक्त बिसेप दाखवला गेलेला होता तो रिकामा भाग बंद)
- **⚙️ टप्पा-दर-टप्पा GitHub Actions वॉकथ्रू** `docs/chapter-08-production/production-ai-practices.md` मध्ये — GitHub रेपो पासून स्वयंचलित तैनातीपर्यंत: `azd pipeline config`, OIDC फेडरेटेड क्रेडेन्शियल्स (साठवलेले डिफॉल्ट नाहीत), तयार `azure-dev.yml`, आणि रहस्यांविरुद्ध चलन मार्गदर्शन
- **🪝 बिगिनर "हुक्स नवीन आहेत?" परिचय** `docs/chapter-04-infrastructure/deployment-guide.md` मध्ये — हुक म्हणजे काय, हुक-स्टेज सारणी, किमान पहिला हुक, आणि `azd hooks run` सह हुक्स मॅन्युअली चालवणे
- **✅ "तुमची तैनाती तपासा" चेकलिस्ट** `docs/chapter-01-foundation/first-project.md` च्या टप्पा 5 मध्ये जोडले — स्मोक टेस्ट, हेल्थ-एंडपॉइंट तपासणी, आणि स्पष्ट यश निकष
- **🧩 नवीन प्रीव्यू एक्सटेंशन्ससाठी स्पष्टीकरण** `azure.ai.skills` आणि `azure.ai.connections` काय आहेत आणि केव्हा वापरायचे ते `docs/chapter-08-production/production-ai-practices.md` मध्ये

#### बदलले
- **🧭 अध्याय 5 धडे सारणी** सुधारित: `multi-agent-basics.md` आता धडा 1 आहे (एकला एक पूर्ण हँड्स-ऑन धडा), प्रामाणिक लेबलिंग की धडा 2 अध्याय 6 मध्ये आहे आणि रिटेल सीनारिओ हे आर्किटेक्चर ब्लूप्रिंट आहे, एक क्लिक टेम्पलेट नाही
- **🧭 अध्याय 1 धडे सारणी** मध्ये नवीन "ब्रिंग योर ओन अॅप" धडा (धडा 4) समाविष्ट
- **🔗 नेव्हिगेशन फूटर्स** अद्यतनित: `first-project.md` आता पुढच्या `bring-your-own-app.md` कडे लिंक करते

#### दुरुस्त केले
- **🧱 "दावा केला गेला पण हरवलेला" टेराफॉर्म गॅप बंद** — कोर्समध्ये टेराफॉर्म सपोर्ट संदर्भ दिला गेला होता पण ते दाखवले गेले नव्हते
- **🔀 भ्रामक अध्याय 5 क्रॉस-लिंक्स सुधारले** ज्यामुळे पूर्ण मल्टी-एजंट अंमलबजावणी अस्तित्वात असल्याचा उल्लेख झाला होता, जे काही आर्किटेक्चर ब्लूप्रिंट आहे

#### अद्यतनित फाइल्स
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

### [v3.20.0] - २०२६-०६-१६

#### AZD 1.25.6 रिफ्रेश, पूर्ण एजंट जीवनचक्र आज्ञा आणि Aspire रिब्रँडिंग
**ही आवृत्ती `azd` `1.25.6` (जून २०२६) आणि `azure.ai.agents` `0.1.40-preview` एक्सटेंशनसाठी कोर्सची पुनर्मूल्यांकन करते, "एजंट स्कॅफोल्ड करणं" पासून पूर्ण एजंट जीवनचक्राला (चाचणी → मूल्यांकन → सुधारणा → तपासणी → हटवणे) विस्तार देते, नवीन `azure.ai.skills` आणि `azure.ai.connections` प्रीव्यू एक्सटेंशन्स उघडकीस आणते, आणि ".NET Aspire" → "Aspire" उत्पादन रिब्रँड नोंदवते.**

#### जोडले
- **🔁 बिगिनर्स आणि AI इंजिनियर्ससाठी पूर्ण एजंट जीवनचक्र कव्हर:**  
  - `docs/chapter-01-foundation/azd-basics.md` — विस्तार आणि AI आज्ञा विभागात जीवनचक्र सारणी (स्कॅफोल्ड → चाचणी → मोजणी → सुधारणा → तपासणी → साफसफाई) जोडली  
  - `docs/chapter-08-production/production-ai-practices.md` — "एजंट जीवनचक्र व्यवस्थापन" विभाग ज्यात `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, आणि `delete --force` समाविष्ट  
  - `resources/cheat-sheet.md` — विस्तारलेले AI एजंट आज्ञा ज्यात `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, आणि `delete --force`
- **🧩 नवीन प्रीव्यू एक्सटेंशन्स**: `azure.ai.skills` (पुन्हा वापरता येणाऱ्या एजंट कौशल्ये) आणि `azure.ai.connections` (फाउंड्री कनेक्शन्स) विस्तार सारणी आणि चिट-शीटमध्ये जोडले
- **⏱️ प्रतिसाद-वेळ मार्गदर्शन** — `azd ai agent invoke` उदाहरण आता एकूण विलंब आणि पहिल्या बाइटपर्यंतचा वेळ दर्शवते
- **📌 आवृत्ती बॅनर** मूळ README मध्ये ज्यातून शिकणाऱ्यांना `azd version` आणि `azd upgrade` कडे निर्देशित केले जाते

#### बदलले
- **✅ पडताळणी बेसलाइन अद्यतनित** `azd 1.23.12` (मार्च २०२६) पासून `azd 1.25.6` (जून २०२६) पर्यंत सर्व अध्यायांच्या README आणि वर्कशॉप दस्तऐवजांमध्ये
- **🤖 अध्याय 2 एक्सटेंशन नोट** `azure.ai.agents` `0.1.18-preview` पासून `0.1.40-preview` पर्यंत अद्यतनित
- **🧪 वर्कशॉप पडताळणी उदाहरण** (`azd version` आउटपुट) `1.25.6` पर्यंत अद्यतनित
- **🧭 README "आज azd मध्ये काय नवीन"** एजंट जीवनचक्र, नवीन AI एक्सटेंशन्स, आणि अलीकडील जीवनगुणवत्तेतील सुधारणा (`azd init` आयडंपोटेंसी, `azd auth login` स्टेल-टोकन क्लीअरिंग, `azd tool` फर्स्ट-रन प्रॉम्प्ट) हायलाइट करणारा
- **📖 अध्याय 2 agents.md (पर्याय 4)** शिकणाऱ्यांना पोस्ट-तैनात जीवनचक्र आज्ञांकडे निर्देशित करते, `azd up` येथे थांबत नाही

#### दुरुस्त केले
- **🏷️ उत्पादन नावकरण** — Aspire रिब्रँड नोट (".NET Aspire" आता फक्त "Aspire"); azd ची Aspire सह सपोर्ट स्थिर आहे
- **🔎 लाइव्ह रिलीज पडताळणी** Azure Developer CLI रिलीज फीडच्या विरुद्ध पुष्टी: स्थिर CLI `1.25.6` (२०२६-०६-१२) आणि `azure.ai.agents` `0.1.40-preview` (२०२६-०६-१५)

#### अद्यतनित फाइल्स
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

### [v3.19.1] - २०२६-०३-२७
#### नवशिक्या ऑनबोर्डिंग स्पष्टता, सेटअप सत्यापन आणि अंतिम AZD आदेश साफसफाई
**हा आवृत्ती AZD 1.23 सत्यापन स्विपनंतर नवशिक्यांसाठी लक्ष केंद्रित केलेल्या दस्तऐवजीकरणाचा आढावा घालतो: तो AZD-प्रथम प्रमाणीकरण मार्गदर्शन स्पष्ट करतो, स्थानिक सेटअप सत्यापन स्क्रिप्ट्स जोडतो, मुख्य आदेशांना जिवंत AZD CLI विरुद्ध सत्यापित करतो आणि चेंजलॉग बाहेर शिल्लक असलेल्या जुनी इंग्रजी-स्रोत आदेश संदर्भ काढून टाकतो.**

#### जोडले
- **🧪 नवशिक्या सेटअप सत्यापन स्क्रिप्ट्स** `validate-setup.ps1` आणि `validate-setup.sh` सह जेणेकरून शिकणारे अध्याय 1 सुरू करण्यापूर्वी आवश्यक साधने पुष्टी करू शकतील
- **✅ प्रामुख्याने सेटअप सत्यापन टप्पे** मुख्य README आणि अध्याय 1 README मध्ये जेणेकरून `azd up` करण्यापूर्वी गहाळ प्राथमिक अटी पकडल्या जाऊ शकतील

#### बदलले
- **🔐 नवशिक्या प्रमाणीकरण मार्गदर्शन** आता सातत्याने `azd auth login` ला AZD कार्यप्रवाहांसाठी प्राथमिक मार्ग मानण्यास प्राधान्य देते, तर `az login` पर्यायी म्हणून फक्त तेव्हा निर्देशित केले जाते जेव्हा Azure CLI आदेश थेट वापरले जातात
- **📚 अध्याय 1 ऑनबोर्डिंग प्रवाह** आता शिकणाऱ्यांना स्थानिक सेटअप स्थापित करण्यापूर्वी, प्रमाणीकरण आणि पहिल्या डिप्लॉयमेंट टप्प्यांपूर्वी आपला सेटअप सत्यापित करण्याकडे निर्देशित करतो
- **🛠️ सत्यापक संदेश** आता AZD-नवशिक्या मार्गासाठी अवरोधक गरजा आणि पर्यायी Azure CLI चेतावणी वेगळ्या स्पष्टपणे वेगळ्या करतो
- **📖 संरचना, समस्या निवारण आणि उदाहरण दस्तऐवज** आता आवश्यक AZD प्रमाणीकरण आणि पर्यायी Azure CLI साइन-इन यामध्ये फरक दाखवतात जे पूर्वी संदर्भांशिवाय एकत्र सादर केले गेले होते

#### दुरुस्त केले
- **📋 शिल्लक इंग्रजी-स्रोत आदेश संदर्भ** सद्य AZD स्वरूपांमध्ये अद्ययावत केले, ज्यामध्ये 'azd config show' चीट शीटमध्ये आणि `azd monitor --overview` जिथे Azure Portal आढावा मार्गदर्शन हवा होता अशा ठिकाणी समाविष्ट आहे
- **🧭 अध्याय 1 मधील नवशिक्या दावा** सर्व टेम्पलेट्स आणि Azure संसाधनांमध्ये शून्य त्रुटी किंवा रोलबॅक वागणूक गॅरंटी देण्यापासून थोडे सौम्य केले
- **🔎 जिवंत CLI सत्यापन** सध्या समर्थित `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, आणि `azd down --force --purge` सुनिश्चित केले

#### अद्यतनित फायली
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

#### AZD 1.23.12 सत्यापन, कार्यशाळा वातावरण विस्तार आणि AI मॉडेल रीफ्रेश
**ही आवृत्ती `azd` `1.23.12` विरुद्ध दस्तऐवजीकरण सत्यापन स्विप करते, जुने AZD आदेश उदाहरणे अद्ययावत करते, AI मॉडेल मार्गदर्शन विद्यमान डीफॉल्टनुसार रीफ्रेश करते आणि कार्यशाळा सूचना GitHub Codespaces सोबतच dev कंटेनर तसेच स्थानिक क्लोनिंगसाठीही विस्तृत करते.**

#### जोडले
- **✅ मुख्य अध्याय आणि कार्यशाळा दस्तऐवजांमध्ये सत्यापन टीपा** नवीन किंवा जुन्या CLI बिल्ड वापरणाऱ्या शिकणाऱ्यांसाठी तपासलेला AZD बेसलाइन स्पष्ट करण्यासाठी
- **⏱️ दीर्घकालीन AI अनुप्रयोग डिप्लॉयमेंटसाठी वेळ समाप्ती मार्गदर्शन** `azd deploy --timeout 1800` वापरून
- **🔎 विस्तार तपासणी टप्पे** AI कार्यप्रवाह दस्तऐवजांमध्ये `azd extension show azure.ai.agents` सह
- **🌐 विस्तृत कार्यशाळा पर्यावरण मार्गदर्शन** GitHub Codespaces, dev कंटेनर, स्थानिक क्लोनसाठी MkDocs सह

#### बदलले
- **📚 अध्याय परिचय README** आता सातत्याने `azd 1.23.12` विरुद्ध सत्यापन नोंदवतात: फाउंडेशन, संरचना, पूर्व-डिप्लॉयमेंट, समस्या निवारण, उत्पादन विभागांमध्ये
- **🛠️ AZD आदेश संदर्भ** दस्तऐवजांमध्ये विद्यमान रूपांमध्ये अद्यतनित:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` किंवा `azd env get-value(s)` संदर्भानुसार
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` जिथे Application Insights आढावा हवा आहे तिथे
- **🧪 Provision पूर्वावलोकन उदाहरणे** विद्यमान समर्थित वापरासारखी साधी केली गेली जसे की `azd provision --preview` आणि `azd provision --preview -e production`
- **🧭 कार्यशाळा प्रवाह** अद्यतनित जेणेकरून शिकणारे Codespaces, dev कंटेनर किंवा स्थानिक क्लोनमध्ये प्रयोगशाळा पूर्ण करू शकतील
- **🔐 प्रमाणीकरण मार्गदर्शन** आता AZD कार्यप्रवाहांसाठी `azd auth login` प्राधान्य देते, `az login` पर्यायी फक्त Azure CLI आदेश थेट वापरल्यास

#### दुरुस्त केले
- **🪟 विंडोज इंस्टॉल आदेश** स्थापनेच्या मार्गदर्शकांमध्ये सध्याच्या `winget` पॅकेज केसिंगला सामान्यीकृत
- **🐧 लिनक्स इंस्टॉल मार्गदर्शन** अमान्य वितरण-विशिष्ट `azd` पॅकेज मॅनेजर सूचना टाळण्यासाठी सुधारित आणि आवश्यक त्या ठिकाणी प्रकाशन साधनांकडे निर्देशित
- **📦 AI मॉडेल उदाहरणे** जुन्या डीफॉल्ट्स सारखे `gpt-35-turbo` आणि `text-embedding-ada-002` पासून अद्यतनित करून विद्यमान उदाहरणे जसे `gpt-4.1-mini`, `gpt-4.1`, आणि `text-embedding-3-large`
- **📋 डिप्लॉयमेंट आणि निदान कोड तुकडे** विद्यमान पर्यावरण आणि स्थिती आदेश वापरण्यासाठी सुधारित
- **⚙️ GitHub Actions मार्गदर्शन** `Azure/setup-azd@v1.0.0` पासून `Azure/setup-azd@v2` मध्ये अद्यतनित
- **🤖 MCP/Copilot संमती मार्गदर्शन** `azd mcp consent` पासून `azd copilot consent list` मध्ये अद्यतनित

#### सुधारणा
- **🧠 AI अध्याय मार्गदर्शन** आता पूर्वावलोकन-संवेदनशील `azd ai` वर्तन, टेनेन्ट-विशिष्ट लॉगिन, विद्यमान विस्तार वापर आणि अद्यतनित मॉडेल डिप्लॉयमेंट शिफारसी चांगल्या प्रकारे समजावते
- **🧪 कार्यशाळा सूचना** अधिक वास्तविक आवृत्ती उदाहरणे आणि स्पष्ट पर्यावरण सेटअप भाषा वापरते
- **📈 उत्पादन आणि समस्या निवारण दस्तऐवज** विद्यमान देखरेख, फॉलबॅक मॉडेल आणि खर्च स्तर उदाहरणे अधिक अनुरूप

#### अद्यतनित फायली
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

#### AZD AI CLI आदेश, सामग्री सत्यापन आणि टेम्पलेट विस्तार
**ही आवृत्ती सर्व AI-संबंधित अध्यायांमध्ये `azd ai`, `azd extension`, आणि `azd mcp` आदेश समाविष्ट करते, agents.md मधील तुटलेले दुवे आणि अप्रचलित कोड दुरुस्त करते, चीट शीट अद्ययावत करते, आणि Example Templates विभाग अधिकृत वर्णन आणि नवीन Azure AI AZD टेम्पलेट्ससह पुनर्रचने करते.**

#### जोडले
- **🤖 AZD AI CLI कवरेज** 7 फायलींमध्ये (पूर्वी फक्त अध्याय 8 मध्ये):
  - `docs/chapter-01-foundation/azd-basics.md` — नवीन "Extensions and AI Commands" विभाग ज्यात `azd extension`, `azd ai agent init`, आणि `azd mcp` ची ओळख
  - `docs/chapter-02-ai-development/agents.md` — पर्याय 4: `azd ai agent init` सह तुलना सारणी (टेम्पलेट विरुद्ध मॅनिफेस्ट दृष्टिकोन)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" आणि "Agent-First Deployment" उपविभाग
  - `docs/chapter-05-multi-agent/README.md` — जलद प्रारंभ आता दोन्ही टेम्पलेट आणि मॅनिफेस्ट-आधारित डिप्लॉयमेंट मार्ग दाखवतो
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — डिप्लॉय विभागात आता `azd ai agent init` पर्याय समाविष्ट
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" उपविभाग
  - `resources/cheat-sheet.md` — नवीन "AI & Extensions Commands" विभाग ज्यात `azd extension`, `azd ai agent init`, `azd mcp`, आणि `azd infra generate` आहे
- **📦 नवीन AZD AI उदाहरण टेम्पलेट्स** `microsoft-foundry-integration.md` मध्ये:
  - **azure-search-openai-demo-csharp** — Blazor WebAssembly, Semantic Kernel, आणि व्हॉइस चॅट समर्थनासह .NET RAG चॅट
  - **azure-search-openai-demo-java** — Langchain4J वापरून Java RAG चॅट, ACA/AKS डिप्लॉयमेंट पर्यायांसह
  - **contoso-creative-writer** — Azure AI Agent Service, Bing Grounding, आणि Prompty वापरून मल्टी-एजंट क्रिएटिव्ह रायटिंग अॅप
  - **serverless-chat-langchainjs** — Azure Functions + LangChain.js + Cosmos DB सह Ollama स्थानिक डेव्हलपमेंट समर्थनासह सर्व्हरलेस RAG
  - **chat-with-your-data-solution-accelerator** — अ‍ॅडमिन पोर्टल, Teams समाकलन, आणि PostgreSQL/Cosmos DB पर्यायांसह एंटरप्राइझ RAG अ‍ॅक्सेलरेटर
  - **azure-ai-travel-agents** — .NET, Python, Java, आणि TypeScript मध्ये सर्व्हर्ससह मल्टी-एजंट MCP ऑर्केस्ट्रेशन संदर्भ अॅप
  - **azd-ai-starter** — मिनिमल Azure AI इन्फ्रास्ट्रक्चर बिसेप स्टार्टर टेम्पलेट
  - **🔗 Awesome AZD AI Gallery link** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ टेम्पलेट्स) संदर्भ
#### दुरुस्त केले
- **🔗 agents.md नेव्हिगेशन**: मागील/पुढील दुवा आता अध्याय 2 README धड्याच्या क्रमाशी जुळतो (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md तुटलेले दुवे**: `production-ai-practices.md` बरोबर केले `../chapter-08-production/production-ai-practices.md` (3 ठिकाणी)
- **📦 agents.md अप्रचलित कोड**: `opencensus` च्या जागी `azure-monitor-opentelemetry` + OpenTelemetry SDK वापरण्यात आले
- **🐛 agents.md अवैध API**: `max_tokens` `create_agent()` कडून काढून `create_run()` मध्ये `max_completion_tokens` म्हणून हलवले
- **🔢 agents.md टोकन मोजणी**: सुमारे `len//4` अंदाज बदलून `tiktoken.encoding_for_model()` वापरले
- **azure-search-openai-demo**: सेवा "Cognitive Search + App Service" कडून "Azure AI Search + Azure Container Apps" मध्ये सुधारित (ऑक्टोबर 2024 पर्यंत डीफॉल्ट होस्ट बदलला)
- **contoso-chat**: वर्णन अद्ययावत करून Azure AI Foundry + Prompty शी जुळवले, वास्तविक शीर्षक आणि तंत्रज्ञान स्टॅकशी समक्रमित

#### काढले
- **ai-document-processing**: कार्यरत नसलेले टेम्पलेट संदर्भ काढून टाकले (repo सार्वजनिकरित्या AZD टेम्पलेट म्हणून उपलब्ध नाही)

#### सुधारणा
- **📝 agents.md व्यायाम**: व्यायाम 1 मध्ये अपेक्षित आउटपुट आणि `azd monitor` टप्पा; व्यायाम 2 मध्ये संपूर्ण `FunctionTool` नोंदणी कोड; व्यायाम 3 मध्ये अस्पष्ट मार्गदर्शनाऐवजी ठोस `prepdocs.py` आदेश
- **📚 agents.md संसाधने**: दस्तऐवजीकरण दुवे सध्याच्या Azure AI Agent Service दस्तऐवज आणि जलद प्रारंभकडे अद्ययावत
- **📋 agents.md पुढील टप्पे टेबल**: पूर्ण अध्याय कव्हर करण्यासाठी AI Workshop Lab दुवा जोडले

#### अद्यतनित फायली
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
**ही आवृत्ती README.md अध्याय नेव्हिगेशनमध्ये सुधारणा करते आणि सुधारित टेबल स्वरूपासह आहे.**

#### बदललेले
- **कोर्स मॅप टेबल**: थेट धड्यांच्या दुव्यांसह, कालावधीच्या अंदाजांसह, आणि गुंतागुंतीच्या मूल्यांकनांसह सुधारित
- **फोल्डर क्लीनअप**: जुन्या अनावश्यक फोल्डर (deployment/, getting-started/, pre-deployment/, troubleshooting/) काढलेले
- **दुवा पडताळणी**: कोर्स मॅप टेबलमधील 21+ अंतर्गत दुवे तपासले

### [v3.16.0] - 2026-02-05

#### उत्पादन नाव अद्ययावत
**ही आवृत्ती सध्याच्या Microsoft ब्रँडिंगनुसार उत्पादन संदर्भ अद्ययावत करते.**

#### बदललेले
- **Microsoft Foundry → Microsoft Foundry**: सर्व संदर्भ नॉन-ट्रांसलेशन फाइल्समध्ये अद्ययावत
- **Azure AI Agent Service → Foundry Agents**: सेवा नाव सध्याच्या ब्रँडिंगशी जुळवून अद्ययावत

#### फाइल्स अद्ययावत
- `README.md` - मुख्य कोर्स लँडिंग पेज
- `changelog.md` - आवृत्ती इतिहास
- `course-outline.md` - कोर्स संरचना
- `docs/chapter-02-ai-development/agents.md` - AI एजंट्स मार्गदर्शक
- `examples/README.md` - उदाहरणे दस्तऐवज
- `workshop/README.md` - कार्यशाळा लँडिंग पेज
- `workshop/docs/index.md` - कार्यशाळा निर्देशिका
- `workshop/docs/instructions/*.md` - सर्व कार्यशाळा सूचनाफाईल्स

---

### [v3.15.0] - 2026-02-05

#### प्रमुख रेपॉझिटरी पुनर्रचना: अध्याय-आधारित फोल्डर नावे
**ही आवृत्ती नेव्हिगेशन सुस्पष्ट करण्यासाठी दस्तऐवज समर्पित अध्याय फोल्डर्समध्ये विभागते.**

#### फोल्डर नाव बदल
जुने फोल्डर अध्याय-क्रमांकानुसार फोल्डर्सने बदलले:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- नवीन जोडलेले: `docs/chapter-05-multi-agent/`

#### फाइल स्थलांतर
| फाइल | पासून | पर्यंत |
|------|--------|--------|
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

#### जोडलेले
- **📚 अध्याय README फाइल्स**: प्रत्येक अध्याय फोल्डरमध्ये README.md तयार केले ज्यात:
  - शिकण्याचे उद्दिष्ट व कालावधी
  - वर्णनांसहित धडा टेबल
  - जलद प्रारंभ आदेश
  - इतर अध्यायांकडे नेव्हिगेशन

#### बदललेले
- **🔗 सर्व अंतर्गत दुवे अद्ययावत**: सर्व दस्तऐवज फाइल्समध्ये 78+ पथ अद्ययावत
- **🗺️ मुख्य README.md**: नवीन अध्याय संरचनेनुसार कोर्स मॅप अद्ययावत
- **📝 examples/README.md**: अध्याय फोल्डर्सकडे क्रॉस-रेफरेंसेस अद्ययावत

#### काढलेले
- जुनी फोल्डर संरचना (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### रेपॉझिटरी पुनर्रचना: अध्याय नेव्हिगेशन
**ही आवृत्ती अध्याय नेव्हिगेशन README फाइल्स जोडते (v3.15.0 ने अधिलेखित).**

---

### [v3.13.0] - 2026-02-05

#### नवीन AI एजंट्स मार्गदर्शक
**ही आवृत्ती Azure Developer CLI वापरून AI एजंट्सची तैनातीसाठी संपूर्ण मार्गदर्शक जोडते.**

#### जोडलेले
- **🤖 docs/microsoft-foundry/agents.md**: पूर्ण मार्गदर्शक ज्यात समाविष्ट:
  - AI एजंट्स काय आहेत आणि चाटबॉट्सपासून त्यांचा फरक
  - तीन जलद प्रारंभ एजंट टेम्पलेट्स (Foundry Agents, Prompty, RAG)
  - एजंट आर्किटेक्चर नमुने (एकल एजंट, RAG, बहु-एजंट)
  - साधन संरचना आणि सानुकूलन
  - देखरेख व मेट्रिक्स ट्रॅकिंग
  - खर्च विचार व ऑप्टिमायझेशन
  - सामान्य समस्या निवारण परिस्थिती
  - तीन हाताळणी व्यायामांसह यश निकष

#### कंटेंट रचना
- **परिचय**: सुरुवातीच्या एजंट संकल्पना
- **जलद प्रारंभ**: `azd init --template get-started-with-ai-agents` वापरून एजंट तैनात करा
- **आर्किटेक्चर नमुने**: एजंट नमुन्यांचे व्हिज्युअल आकृती
- **संरचना**: साधन सेटअप आणि पर्यावरणीय चल
- **देखरेख**: Application Insights एकत्रीकरण
- **व्यायाम**: प्रगत हाताळणी शिकणे (प्रत्येक 20-45 मिनिटे)

---

### [v3.12.0] - 2026-02-05

#### DevContainer पर्यावरण अद्ययावत
**ही आवृत्ती आधुनिक साधने व चांगल्या डीफॉल्टसह विकास कंटेनर कॉन्फिगरेशन अद्ययावत करते ज्यामुळे AZD शिकण्याचा अनुभव सुधारतो.**

#### बदललेले
- **🐳 बेस इमेज**: `python:3.12-bullseye` वरून `python:3.12-bookworm` (नवीनतम Debian स्थिर) मध्ये बदलेले
- **📛 कंटेनर नाव**: क्लॅरिटीसाठी "Python 3" वरून "AZD for Beginners" मध्ये बदलले

#### जोडलेले
- **🔧 नवीन Dev Container वैशिष्ट्ये**:
  - Bicep समर्थनासह `azure-cli`
  - `node:20` (AZD टेम्पलेट्ससाठी LTS आवृत्ती)
  - टेम्पलेट व्यवस्थापनासाठी `github-cli`
  - कंटेनर अ‍ॅप तैनातीसाठी `docker-in-docker`

- **🔌 पोर्ट फॉरवर्डिंग**: सामान्य विकासासाठी पूर्व-संचयित पोर्ट्स:
  - 8000 (MkDocs प्रिव्ह्यू)
  - 3000 (वेब अ‍ॅप्स)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 नवीन VS Code विस्तार**:
  - `ms-python.vscode-pylance` - सुधारित Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions समर्थन
  - `ms-azuretools.vscode-docker` - Docker समर्थन
  - `ms-azuretools.vscode-bicep` - Bicep भाषा समर्थन
  - `ms-azure-devtools.azure-resource-groups` - Azure संसाधन व्यवस्थापन
  - `yzhang.markdown-all-in-one` - Markdown संपादन
  - `DavidAnson.vscode-markdownlint` - Markdown लिंटिंग
  - `bierner.markdown-mermaid` - Mermaid आकृती समर्थन
  - `redhat.vscode-yaml` - YAML समर्थन (azure.yaml साठी)
  - `eamodio.gitlens` - Git दृश्य रचना
  - `mhutchie.git-graph` - Git इतिहास

- **⚙️ VS Code सेटिंग्ज**: Python इंटरप्रिटर, सेव्हवर फॉर्मॅट करणे आणि व्हाइटस्पेस ट्रिमिंगसाठी डीफॉल्ट सेटिंग्ज जोडल्या

- **📦 requirements-dev.txt अद्ययावत**:
  - MkDocs मिनिफाय प्लगइन जोडले
  - कोड क्वालिटीसाठी pre-commit जोडले
  - Azure SDK पॅकेजेस (azure-identity, azure-mgmt-resource) जोडले

#### दुरुस्त
- **पोस्ट-क्रीएट आदेश**: कंटेनर सुरूवातीला AZD आणि Azure CLI इंस्टॉलेशन तपासतो

---

### [v3.11.0] - 2026-02-05

#### सुरुवातीच्या वापरकर्त्यांसाठी README सुधारणा
**ही आवृत्ती README.md मध्ये मोठ्या प्रमाणावर सुधारणा करते जेणेकरून ते नवीन वापरकर्त्यांसाठी अधिक सहज व वापरण्यास सोपे होईल आणि AI विकासकांसाठी आवश्यक संसाधने जोडते.**

#### जोडलेले
- **🆚 Azure CLI vs AZD तुलना**: कोणते टूल कधी वापरावे याचे स्पष्ट स्पष्टीकरण व्यावहारिक उदाहरणांसह
- **🌟 Awesome AZD दुवे**: समुदायाच्या टेम्पलेट गॅलरी आणि योगदान स्रोतांशी थेट दुवे:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ तैनातीस तयार टेम्पलेट्स
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - समुदाय योगदान
- **🎯 जलद प्रारंभ मार्गदर्शक**: सोपी 3-चरणे सुरूवातीचा विभाग (इंस्टॉल करा → लॉगिन करा → तैनात करा)
- **📊 अनुभव आधारित नेव्हिगेशन टेबल**: विकासकांच्या अनुभवावर आधारित स्पष्ट मार्गदर्शन

#### बदललेले
- **README रचना**: प्रगतीशील प्रकटीकरणासाठी पुनर्रचनेत प्रमुख माहिती प्रथम
- **परिचय विभाग**: "The Magic of `azd up`" पूर्ण नवीनांसाठी स्पष्ट केले
- **डुप्लिकेट सामग्री काढली**: समस्या निवारण विभागातील पुनरावृत्ती काढली
- **समस्या निवारण आदेश**: वैध `azd monitor --logs` वापरून `azd logs` संदर्भ दुरुस्त

#### दुरुस्त
- **🔐 प्रमाणीकरण आदेश**: cheat-sheet.md मध्ये `azd auth login` आणि `azd auth logout` जोडले
- **अवैध आदेश संदर्भ**: README समस्या निवारण विभागातून उरलेले `azd logs` काढले

#### टीप
- **व्याप्ती**: मुख्य README.md आणि resources/cheat-sheet.md मध्ये बदल
- **लक्ष्य प्रेक्षक**: AZD ला नवीन असलेल्या विकासकांसाठी सुधारणा विशेष

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI आदेश अचूकता अद्ययावत
**ही आवृत्ती नको असलेले AZD आदेश संपूर्ण दस्तऐवजामधून काढून टाकते व सर्व कोड उदाहरणे वैध Azure Developer CLI सिंटॅक्स वापरतात याची खात्री करते.**

#### दुरुस्त
- **🔧 अप्रचलित AZD आदेश काढले**: अवैध आदेशांचे व्यापक तपासणी व दुरुस्ती:
  - `azd logs` (नाही) → `azd monitor --logs` किंवा Azure CLI पर्यायांनी बदलले
  - `azd service` उप-आदेश (नाही) → `azd show` आणि Azure CLI वापरले
  - `azd infra import/export/validate` (नाही) → काढले किंवा वैध पर्यायांनी बदलले
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` फ्लॅग्स (नाही) → काढले
  - `azd provision --what-if/--rollback` फ्लॅग्स (नाही) → `--preview` वापरले
  - `azd config validate` (नाही) → `azd config list` ने बदलले
  - `azd info`, `azd history`, `azd metrics` (नाही) → काढले

- **📚 आदेश दुरुस्तींसह फाइल्स अद्ययावत**:
  - `resources/cheat-sheet.md`: आदेश संदर्भाचा प्रमुख सुधारणा
  - `docs/deployment/deployment-guide.md`: रोलबॅक व तैनात धोरणे दुरुस्त
  - `docs/troubleshooting/debugging.md`: लॉग विश्लेषण विभाग दुरुस्त
  - `docs/troubleshooting/common-issues.md`: समस्या निवारण आदेश अद्ययावत
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD डिबगिंग विभाग दुरुस्त
  - `docs/getting-started/azd-basics.md`: देखरेख आदेश दुरुस्त
  - `docs/getting-started/first-project.md`: देखरेख व डिबगिंग उदाहरण अद्ययावत
  - `docs/getting-started/installation.md`: मदत व आवृत्ती उदाहरण दुरुस्त
  - `docs/pre-deployment/application-insights.md`: लॉग पाहण्याचे आदेश दुरुस्त
  - `docs/pre-deployment/coordination-patterns.md`: एजंट डिबगिंग आदेश दुरुस्त

- **📝 आवृत्ती संदर्भ अद्ययावत**: 
  - `docs/getting-started/installation.md`: हार्डकोडेड `1.5.0` आवृत्ती `1.x.x` मध्ये बदलली व रिलीझ लिंक जोडली

#### बदललेले
- **रोलबॅक धोरणे**: Git-आधारित रोलबॅक वापरण्याचे दस्तऐवजात बदल (AZD मध्ये मूळ रोलबॅक नाही)
- **लॉग पाहणी**: `azd logs` संदर्भ `azd monitor --logs`, `azd monitor --live` आणि Azure CLI आदेशांनी बदलले
- **कार्यक्षमता विभाग**: न वापरता येणाऱ्या समानकालिक/क्रमिक तैनात फ्लॅग्स काढले, वैध पर्याय दिले

#### तांत्रिक तपशील
- **वैध AZD आदेश**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **वैध azd monitor फ्लॅग्स**: `--live`, `--logs`, `--overview`
- **काढलेली वैशिष्ट्ये**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### टीप
- **पडताळणी**: आदेश Azure Developer CLI v1.23.x प्रमाणे तपासले

---

### [v3.9.0] - 2026-02-05

#### कार्यशाळा पूर्णता आणि दस्तऐवज गुणवत्ता सुधारणा
**ही आवृत्ती संवादात्मक कार्यशाळा मोड्यूल पूर्ण करते, तुटलेले दस्तऐवज दुवे दुरुस्त करते व Microsoft AZD वापरणाऱ्या AI विकासकांसाठी एकूण सामग्री गुणवत्ता सुधारते.**

#### जोडलेले
- **📝 CONTRIBUTING.md**: नवीन योगदान मार्गदर्शक दस्तऐवज ज्यात:
  - समस्या नोंदविण्याच्या व बदल सुचविण्याच्या स्पष्ट सूचना
  - नवीन सामग्रीसाठी दस्तऐवज मानके
  - कोड उदाहरण मार्गदर्शक तत्त्वे आणि कमिट संदेश संदर्भ नियम
  - समुदाय सहभाग माहिती

#### पूर्ण झाले
- **🎯 कार्यशाळा मॉड्यूल 7 (समारोप)**: पूर्णपणे पूर्ण झालेले समारोप मॉड्यूल सह:
  - कार्यशाळेतील साध्यांची सविस्तर सारांश
  - AZD, टेम्पलेट्स आणि Microsoft Foundry या विषयातील मुख्य संकल्पना भाग
  - शिक्षण प्रवास चालू ठेवण्याच्या शिफारसी
  - कामशाळा आव्हान व्यायाम व कठीणता रेटिंगसह
  - समुदाय अभिप्राय आणि समर्थन दुवे

- **📚 कार्यशाळा मॉड्यूल 3 (विघटन)**: अद्यतनित शिक्षण उद्दिष्टे सह:
  - MCP सर्व्हरांसह GitHub Copilot सक्रिय करण्याच्या मार्गदर्शन
  - AZD टेम्पलेट फोल्डर संरचना समजून घेणे
  - इन्फ्रास्ट्रक्चर-एज-कोड (Bicep) संघटन नमुने
  - हाताने प्रयोगशाळा सूचना

- **🔧 कार्यशाळा मॉड्यूल 6 (विघटन)**: पूर्ण झाले:
  - संसाधन स्वच्छता आणि खर्च व्यवस्थापन उद्दिष्टे
  - सुरक्षित इन्फ्रास्ट्रक्चर डिप्रोव्हिजनिंगसाठी `azd down` वापर
  - सॉफ्ट-डिलीट केलेल्या कॉग्निटिव्ह सेवा पुनर्प्राप्ती मार्गदर्शन
  - GitHub Copilot आणि Azure Portal साठी बोनस अन्वेषण संकेत

#### दुरुस्त झाले
- **🔗 तोडलेले दुवे दुरुस्ती**: १५+ तोडलेले अंतर्गत दस्तऐवज दुवे निश्चित केले:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md च्या मार्गांचे दुरुस्ती
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md आणि production-ai-practices.md मार्ग स्थिर केले
  - `docs/getting-started/first-project.md`: अस्तित्वात नसलेला cicd-integration.md बद्दल deployment-guide.md ने बदलले
  - `examples/retail-scenario.md`: FAQ आणि समस्या निवारण मार्गदर्शक मार्ग दुरुस्त केले
  - `examples/container-app/microservices/README.md`: कोर्स होम आणि डिप्लॉयमेंट गाइड मार्ग स्थिर केले
  - `resources/faq.md` आणि `resources/glossary.md`: AI चॅप्टर संदर्भ अद्ययावत केले
  - `course-outline.md`: प्रशिक्षक मार्गदर्शक आणि AI कार्यशाळा प्रयोगशाळा संदर्भ दुरुस्त केले

- **📅 कार्यशाळा स्थिती बॅनर**: "Under Construction" पासून सक्रिय कार्यशाळा स्थितीसाठी 2026 फेब्रुवारी पर्यंत अद्यतनित केले

- **🔗 कार्यशाळा नेव्हिगेशन**: कार्यशाळा README.md मधील तोडलेले नेव्हिगेशन दुवे दुरुस्त केले जे अस्तित्वात नसलेल्या lab-1-azd-basics फोल्डरकडे निर्देश करत होते

#### बदलले
- **कार्यशाळा सादरीकरण**: "under construction" चेतावणी काढून टाकले, कार्यशाळा पूर्ण झाली आणि वापरासाठी तयार आहे
- **नेव्हिगेशन सुसंगतता**: सर्व कार्यशाळा मॉड्यूल्समध्ये योग्य अंतःमॉड्यूल नेव्हिगेशन सुनिश्चित केले
- **शिक्षण मार्ग संदर्भ**: योग्य microsoft-foundry मार्ग वापरून अध्याय क्रॉस-संदर्भ अद्यतनित केले

#### मान्य झाले
- ✅ सर्व इंग्रजी मार्कडाऊन फाइल्समध्ये वैध अंतर्गत दुवे आहेत
- ✅ कार्यशाळा मॉड्यूल 0-7 शिक्षण उद्दिष्टांसह पूर्ण झाले आहेत
- ✅ अध्याय आणि मॉड्यूल यामधील नेव्हिगेशन योग्य प्रकारे कार्य करते
- ✅ सामग्री Microsoft AZD वापरणाऱ्या AI विकसकांसाठी योग्य आहे
- ✅ सुरुवातीच्या स्तरासाठी योग्य भाषा आणि रचना जपली आहे
- ✅ CONTRIBUTING.md समुदाय योगदानकर्त्यांसाठी स्पष्ट मार्गदर्शन प्रदान करते

#### तांत्रिक अंमलबजावणी
- **दुवा पडताळणी**: सर्व .md अंतर्गत दुव्यांची ऑटोमेटेड पॉवरशेल स्क्रिप्टने पडताळणी केली
- **सामग्री ऑडिट**: कार्यशाळेच्या पूर्णतेची आणि सुरुवातीच्या स्तरासाठी सुसंगततेची मॅन्युअल तपासणी
- **नेव्हिगेशन सिस्टीम**: अध्याय आणि मॉड्यूल नेव्हिगेशनचे सुसंगत नमुने लागू केले

#### नोंदी
- **व्याप्ती**: फक्त इंग्रजी दस्तऐवजावर बदल केले
- **भाषांतर**: या आवृत्तीत भाषांतर फोल्डर्स अद्यतनित नाहीत (ऑटोमेटेड भाषांतर नंतर सिंक होईल)
- **कार्यशाळा कालावधी**: पूर्ण कार्यशाळा आता 3-4 तासांचे हाताने शिकण्याचे शिक्षण प्रदान करते

---

### [v3.8.0] - 2025-11-19

#### प्रगत दस्तऐवजीकरण: मॉनिटरिंग, सुरक्षा आणि मल्टी-एजंट पॅटर्न्स
**ही आवृत्ती अनुप्रयोग अंतर्दृष्टी एकत्रीकरण, प्रमाणीकरण नमुने आणि उत्पादन डिप्लॉयमेंटसाठी मल्टी-एजंट समन्वय यावर संपूर्ण A-ग्रेड धडा जोडते.**

#### जोडले
- **📊 अनुप्रयोग अंतर्दृष्टी एकत्रीकरण धडा**: `docs/pre-deployment/application-insights.md` मध्ये:
  - AZD-केंद्रित डिप्लॉयमेंटसह स्वयंचलित पुरवठा
  - अनुप्रयोग अंतर्दृष्टी + लॉग अ‍ॅनालिटिक्ससाठी पूर्ण Bicep टेम्पलेट्स
  - कस्टम टेलिमेट्रीसह काम करणाऱ्या Python अनुप्रयोगांचे (1200+ ओळी) नमुने
  - AI/LLM मॉनिटरिंग पॅटर्न्स (Microsoft Foundry मॉडेल्स टोकन / खर्च ट्रॅकिंग)
  - 6 Mermaid आकृत्या (आर्किटेक्चर, वितरित ट्रेसिंग, टेलिमेट्री प्रवाह)
  - 3 हाताने व्यायाम (अलर्ट्स, डॅशबोर्ड, AI मॉनिटरिंग)
  - कुस्टो क्वेरी उदाहरणे आणि खर्च ऑप्टिमायझेशन धोरणे
  - थेट मेट्रिक्स स्ट्रीमिंग आणि रिअल-टाइम डिबगिंग
  - 40-50 मिनिटांचे शिक्षण वेळ आणि उत्पादन तयार नमुने

- **🔐 प्रमाणीकरण आणि सुरक्षा पॅटर्न धडा**: `docs/getting-started/authsecurity.md` मध्ये:
  - 3 प्रमाणीकरण नमुने (कनेक्शन स्ट्रिंग्ज, की व्हॉल्ट, मॅनेज्ड ओळख)
  - सुरक्षित डिप्लॉयमेंटसाठी पूर्ण Bicep इन्फ्रास्ट्रक्चर टेम्पलेट्स
  - Azure SDK एकत्रीकरणसह Node.js अनुप्रयोग कोड
  - 3 पूर्ण व्यायाम (मॅनेज्ड ओळख सक्षम करणे, वापरकर्ता-निर्धारित ओळख, की व्हॉल्ट रोटेशन)
  - सुरक्षा सर्वोत्तम पद्धती आणि RBAC कॉन्फिगरेशन
  - समस्या निवारण मार्गदर्शक आणि खर्च विश्लेषण
  - उत्पादन तयार पासवर्डलेस प्रमाणीकरण नमुने

- **🤖 मल्टी-एजंट समन्वय पॅटर्न्स धडा**: `docs/pre-deployment/coordination-patterns.md` मध्ये:
  - 5 समन्वय नमुने (क्रमिक, समांतर, पदानुक्रमित, घटना-चालित, सहमती)
  - संपूर्ण ऑर्केस्ट्रेटर सेवा अमलबजावणी (Python/Flask, 1500+ ओळी)
  - 3 विशेष एजंट अमलबजावण्या (संशोधन, लेखक, संपादक)
  - मेसेज क्यूइंगसाठी सेवा बस एकत्रीकरण
  - वितरित प्रणालीसाठी Cosmos DB स्थिती व्यवस्थापन
  - एजंट परस्पर क्रिया दर्शविणाऱ्या 6 Mermaid आकृत्या
  - 3 प्रगत व्यायाम (टाइमआऊट हाताळणी, पुनःप्रयत्न तर्क, सर्किट ब्रेकर)
  - खर्च विभागणी ($240-565/महिना) ऑप्टिमायझेशन धोरणांसह
  - मॉनिटरिंगसाठी अनुप्रयोग अंतर्दृष्टी एकत्रीकरण

#### सुधारित
- **प्री-डिप्लॉयमेंट अध्याय**: आता संपूर्ण मॉनिटरिंग आणि समन्वय पॅटर्न समाविष्ट
- **शिकण्यास सुरुवात करणारा अध्याय**: व्यावसायिक प्रमाणीकरण नमुनेसह सुधारित
- **उत्पादन तयारी**: सुरक्षा ते निरीक्षणाकडे संपूर्ण कव्हरेज
- **कोर्स चिन्हांकन**: नवीन धडे अध्याय 3 आणि 6 मध्ये संदर्भित

#### बदलले
- **शिकण्याचा प्रगतीक्रम**: कोर्समध्ये सुरक्षा आणि मॉनिटरिंगचे सुधारित एकत्रीकरण
- **दस्तऐवज गुणवत्ता**: नवीन धड्यांमध्ये सातत्यपूर्ण A-ग्रेड मानके (95-97%)
- **उत्पादन नमुने**: एंटरप्राइझ डिप्लॉयमेंटसाठी संपूर्ण झाक

#### सुधारित
- **विकसक अनुभव**: विकासापासून उत्पादन पर्यंत स्पष्ट मार्ग
- **सुरक्षा मानके**: प्रमाणीकरण आणि रहस्य व्यवस्थापनासाठी व्यावसायिक नमुने
- **निरीक्षण**: AZD सह संपूर्ण अनुप्रयोग अंतर्दृष्टी एकत्रीकरण
- **AI कार्यभार**: Microsoft Foundry मॉडेल्स आणि मल्टी-एजंट प्रणालींसाठी विशेष मॉनिटरिंग

#### मान्य केले
- ✅ सर्व धडे पूर्ण काम करणारा कोड समाविष्ट (स्निपेट नाही)
- ✅ दृश्य शिक्षणासाठी Mermaid आकृत्या (एकूण 19 तीन धड्यांमध्ये)
- ✅ सत्यापन स्टेप्ससह हाताने व्यायाम (एकूण 9)
- ✅ उत्पादन तयार Bicep टेम्पलेट्स `azd up` वापरून डिप्लॉय करण्याजोगे
- ✅ खर्च विश्लेषण आणि ऑप्टिमायझेशन धोरणे
- ✅ समस्या निवारण मार्गदर्शक आणि सर्वोत्तम पद्धती
- ✅ ज्ञान तपासणीसाठी सत्यापन आदेश

#### दस्तऐवज श्रेणीकरण निकाल
- **docs/pre-deployment/application-insights.md**: - सविस्तर मॉनिटरिंग मार्गदर्शक
- **docs/getting-started/authsecurity.md**: - व्यावसायिक सुरक्षा नमुने
- **docs/pre-deployment/coordination-patterns.md**: - प्रगत मल्टी-एजंट आर्किटेक्चर
- **एकूण नवीन सामग्री**: - सातत्यपूर्ण उच्च गुणवत्ता मानके

#### तांत्रिक अंमलबजावणी
- **अनुप्रयोग अंतर्दृष्टी**: लॉग अ‍ॅनालिटिक्स + कस्टम टेलिमेट्री + वितरित ट्रेसिंग
- **प्रमाणीकरण**: मॅनेज्ड ओळख + की व्हॉल्ट + RBAC नमुने
- **मल्टी-एजंट**: सेवा बस + Cosmos DB + कंटेनर अ‍ॅप्स + ऑर्केस्ट्रेशन
- **मॉनिटरिंग**: थेट मेट्रिक्स + कुस्टो क्वेरी + अलर्ट्स + डॅशबोर्ड
- **खर्च व्यवस्थापन**: सॅम्पलिंग धोरणे, राखणी धोरणे, बजेट नियंत्रण

### [v3.7.0] - 2025-11-19

#### दस्तऐवज गुणवत्ता सुधारणा आणि नवीन Microsoft Foundry मॉडेल्स उदाहरण
**ही आवृत्ती रेपॉजिटरीतील दस्तऐवजांच्या गुणवत्ता सुधारते आणि gpt-4.1 चॅट इंटरफेससह Microsoft Foundry मॉडेल्सची पूर्ण डिप्लॉयमेंट उदाहरण जोडते.**

#### जोडले
- **🤖 Microsoft Foundry मॉडेल्स चॅट उदाहरण**: पूर्ण gpt-4.1 डिप्लॉयमेंटसह `examples/azure-openai-chat/` मध्ये काम करणारी अंमलबजावणी
  - पूर्ण Microsoft Foundry मॉडेल्स इन्फ्रास्ट्रक्चर (gpt-4.1 मॉडेल डिप्लॉयमेंट)
  - संभाषण इतिहासासह Python कमांड-लाइन चॅट इंटरफेस
  - सुरक्षित API की संग्रहणासाठी की व्हॉल्ट एकत्रीकरण
  - टोकन वापर ट्रॅकिंग आणि खर्च अंदाज
  - दर मर्यादा आणि त्रुटी हाताळणी
  - 35-45 मिनिटांच्या डिप्लॉयमेंट मार्गदर्शकासह सविस्तर README
  - 11 उत्पादन तयार फायली (Bicep टेम्पलेट्स, Python अ‍ॅप, कॉन्फिगरेशन)
- **📚 दस्तऐवज व्यायाम**: कॉन्फिगरेशन मार्गदर्शकात हाताने प्रॅक्टिस व्यायाम जोडले:
  - व्यायाम 1: मल्टी-पर्यावरण कॉन्फिगरेशन (15 मिनिटे)
  - व्यायाम 2: रहस्य व्यवस्थापन सराव (10 मिनिटे)
  - स्पष्ट यश निकष आणि सत्यापन पावले
- **✅ डिप्लॉयमेंट सत्यापन**: डिप्लॉयमेंट मार्गदर्शकात सत्यापन विभाग जोडला:
  - आरोग्य तपासणी प्रक्रिया
  - यश निकष तपासणी यादी
  - सर्व डिप्लॉयमेंट आदेशांसाठी अपेक्षित आउटपुट
  - जलद संदर्भ म्हणून समस्या निवारण

#### सुधारित
- **examples/README.md**: A-ग्रेड गुणवत्ता (93%) मध्ये सुधारित:
  - azure-openai-chat सर्व संबंधित विभागांमध्ये जोडले
  - स्थानिक उदाहरणे संख्या 3 वरून 4 पर्यंत वाढवले
  - AI अनुप्रयोग उदाहरणांच्या तक्त्यात समाविष्ट
  - मध्यम दर्जाच्या वापरकर्त्यांसाठी जलद प्रारंभ मध्ये समाकलित
  - Microsoft Foundry टेम्पलेट्स विभागात समाविष्ट
  - तुलना मॅट्रिक्स आणि तंत्रज्ञान शोध विभाग अद्ययावत केले
- **दस्तऐवज गुणवत्ता**: docs फोल्डरमध्ये B+ (87%) → A- (92%) मध्ये सुधारित:
  - महत्त्वाच्या आदेशाच्या उदाहरणांसाठी अपेक्षित आउटपुट जोडले
  - कॉन्फिगरेशन बदलांसाठी सत्यापन पावले समाविष्ट
  - व्यावहारिक व्यायामांसह हाताने शिकण्याचे अनुभव वाढवले

#### बदलले
- **शिकण्याची प्रगती**: मध्यम स्तराच्या शिकणाऱ्यांसाठी AI उदाहरणांचा अधिक चांगला समावेश
- **दस्तऐवज रचना**: स्पष्ट निकालांसह अधिक क्रियाशील व्यायाम
- **सत्यापन प्रक्रिया**: मुख्य कार्यप्रवाहासाठी स्पष्ट यश निकष जोडले

#### सुधारित
- **विकसक अनुभव**: Microsoft Foundry मॉडेल्सची डिप्लॉयमेंट आता 35-45 मिनिटे घेत आहे (कठीण पर्यायांसाठी 60-90 मिनिटांऐवजी)
- **खर्च पारदर्शकता**: Microsoft Foundry मॉडेल्स उदाहरणासाठी स्पष्ट खर्च अंदाज ($50-200/महिना)
- **शिक्षण मार्ग**: AI विकसकांसाठी azure-openai-chat सह स्पष्ट प्रवेश बिंदू
- **दस्तऐवज मानके**: सातत्यपूर्ण अपेक्षित आउटपुट आणि सत्यापन पावले

#### मान्य झाले
- ✅ Microsoft Foundry मॉडेल्स उदाहरण `azd up` सह पूर्ण कार्यक्षम
- ✅ सर्व 11 अंमलबजावणी फायली व्याकरणदृष्ट्या बरोबर
- ✅ README सूचना प्रत्यक्ष डिप्लॉयमेंट अनुभवाशी जुळतात
- ✅ ८+ ठिकाणी दस्तऐवज दुवे अद्यतनित
- ✅ उदाहरणे सूची अचूकपणे 4 स्थानिक उदाहरणे दर्शविते
- ✅ तक्त्यांमध्ये दुहेरी बाह्य दुवे नाहीत
- ✅ सर्व नेव्हिगेशन संदर्भ बरोबर

#### तांत्रिक अंमलबजावणी
- **Microsoft Foundry मॉडेल्स आर्किटेक्चर**: gpt-4.1 + की व्हॉल्ट + कंटेनर अ‍ॅप्स पॅटर्न
- **सुरक्षा**: मॅनेज्ड ओळख तयार, रहस्य की व्हॉल्टमध्ये
- **मॉनिटरिंग**: अनुप्रयोग अंतर्दृष्टी एकत्रीकरण
- **खर्च व्यवस्थापन**: टोकन ट्रॅकिंग आणि वापर ऑप्टिमायझेशन
- **डिप्लॉयमेंट**: एकच `azd up` आदेश पूर्ण सेटअपसाठी

### [v3.6.0] - 2025-11-19

#### प्रमुख अद्यतन: कंटेनर अ‍ॅप डिप्लॉयमेंट उदाहरणे
**ही आवृत्ती Azure Developer CLI (AZD) वापरून संपूर्ण उत्पादन तयार कंटेनर अ‍ॅप्लिकेशन डिप्लॉयमेंट उदाहरणे सादर करते, संपूर्ण दस्तऐवजीकरण आणि शिक्षण मार्गात समाकलित करून.**

#### जोडले
- **🚀 कंटेनर अ‍ॅप उदाहरणे**: नवीन स्थानिक उदाहरणे `examples/container-app/` मध्ये:
  - [मास्टर मार्गदर्शक](examples/container-app/README.md): कंटेनरयुक्त डिप्लॉयमेंटची पूर्ण माहिती, जलद प्रारंभ, उत्पादन आणि प्रगत नमुने
  - [सिंपल फ्लास्क API](../../examples/container-app/simple-flask-api): शालेय पातळीवरील REST API, स्केल-टू-झिरो, हेल्थ प्रोब्स, मॉनिटरिंग आणि समस्या निवारण
  - [मायक्रोसर्व्हिसेस आर्किटेक्चर](../../examples/container-app/microservices): उत्पादन तयार मल्टी-सेवा डिप्लॉयमेंट (API गेटवे, उत्पादने, ऑर्डर, वापरकर्ता, सूचना), असिंक्रोनस मेसेजिंग, सेवा बस, Cosmos DB, Azure SQL, वितरित ट्रेसिंग, ब्लू-ग्रीन/कॅनरी डिप्लॉयमेंट
- **सर्वोत्तम पद्धती**: कंटेनरयुक्त कार्यभारासाठी सुरक्षा, मॉनिटरिंग, खर्च ऑप्टिमायझेशन, आणि CI/CD मार्गदर्शन
- **कोड नमुने**: पूर्ण `azure.yaml`, Bicep टेम्पलेट्स, आणि बहुभाषिक सेवा अंमलबजावण्या (Python, Node.js, C#, Go)
- **चाचणी व समस्या निवारण**: एंड-टू-एंड चाचणी प्रसंग, मॉनिटरिंग आदेश, समस्या निवारण मार्गदर्शन

#### बदलले
- **README.md**: नवीन कंटेनर अ‍ॅप उदाहरणांचे वैशिष्ट्य आणि दुवे "Local Examples - Container Applications" अंतर्गत अद्यतनित
- **examples/README.md**: कंटेनर अ‍ॅप उदाहरणे हायलाइट करणे, तुलना मॅट्रिक्स नोंदी जोडणे, आणि तंत्रज्ञान / आर्किटेक्चर संदर्भ अद्यतने
- **कोर्स रूपरेषा आणि अभ्यास मार्गदर्शक**: संबंधित अध्यायांमध्ये नवीन कंटेनर अ‍ॅप उदाहरणे आणि डिप्लॉयमेंट नमुने संदर्भित करून अद्यतनित

#### मान्य झाले
- ✅ सर्व नवीन उदाहरणे `azd up` सह डिप्लॉय करण्याजोगी आणि सर्वोत्तम पद्धतींचे पालन करतात
- ✅ दस्तऐवज क्रॉस-लिंक आणि नेव्हिगेशन अद्यतनित
- ✅ उदाहरणे सुरुवातीपासून प्रगत स्तरापर्यंत सर्वसामान्य प्रसंग कव्हर करतात, उत्पादन मायक्रोसर्व्हिसेससह

#### नोंदी
- **व्याप्ती**: फक्त इंग्रजी दस्तऐवज आणि उदाहरणे
- **पुढे काय**: भविष्यात अधिक प्रगत कंटेनर नमुने आणि CI/CD स्वयंचलितीकरण वाढवणे

### [v3.5.0] - 2025-11-19

#### उत्पादन पुनर्डेग्रेडिंग: Microsoft Foundry
**ही आवृत्ती संपूर्ण इंग्रजी दस्तऐवजांमध्ये "Microsoft Foundry" या उत्पादन नावाचे पुनर्ब्रँडिंग अंमलात आणते, हे Microsoft चे अधिकृत पुनर्ब्रँडिंग दर्शविते.**

#### बदलले
- **🔄 उत्पादन नाव अद्यतन**: "Microsoft Foundry" पासून "Microsoft Foundry" पर्यंत संपूर्ण पुनर्ब्रँडिंग
  - `docs/` फोल्डरमधील सर्व इंग्रजी दस्तऐवजांतील संदर्भ अद्यतनित
  - फोल्डरचे नाव बदलले: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - नाव बदललेले फाइल: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - एकूण: ७ दस्तऐवज फाइल्समध्ये २३ संदर्भ अद्ययावत केले गेले

- **📁 फोल्डर रचना बदल**:
  - `docs/ai-foundry/` चे नाव बदलून `docs/microsoft-foundry/` असे केले गेले
  - सर्व क्रॉस-रेफरन्सेस नव्या फोल्डर रचनेनुसार अपडेट केले
  - सर्व दस्तऐवजांमध्ये नेव्हिगेशन लिंक तपासले आणि प्रमाणीकरण केले

- **📄 फाइल नामकरण बदल**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - सर्व अंतर्गत दुवे नव्या फाइल नावावर अद्ययावत केले

#### अद्ययावत फाइल्स
- **अध्याय दस्तऐवज** (७ फाइल्स):
  - `docs/microsoft-foundry/ai-model-deployment.md` - ३ नेव्हिगेशन लिंक अद्ययावत
  - `docs/microsoft-foundry/ai-workshop-lab.md` - ४ उत्पादन नाव संदर्भ अद्ययावत
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - पूर्वीच Microsoft Foundry वापरत आहे
  - `docs/microsoft-foundry/production-ai-practices.md` - ३ संदर्भ अद्ययावत (आढावा, समुदाय अभिप्राय, दस्तऐवज)
  - `docs/getting-started/azd-basics.md` - ४ क्रॉस-रेफरन्स लिंक अद्ययावत
  - `docs/getting-started/first-project.md` - २ अध्याय नेव्हिगेशन लिंक अद्ययावत
  - `docs/getting-started/installation.md` - २ पुढील अध्याय लिंक अद्ययावत
  - `docs/troubleshooting/ai-troubleshooting.md` - ३ संदर्भ अद्ययावत (नेव्हिगेशन, Discord समुदाय)
  - `docs/troubleshooting/common-issues.md` - १ नेव्हिगेशन लिंक अद्ययावत
  - `docs/troubleshooting/debugging.md` - १ नेव्हिगेशन लिंक अद्ययावत

- **कोर्स रचना फाइल्स** (२ फाइल्स):
  - `README.md` - १७ संदर्भ अद्ययावत (कोर्स आढावा, अध्याय शीर्षके, टेम्पलेट विभाग, समुदाय अंतर्दृष्टी)
  - `course-outline.md` - १४ संदर्भ अद्ययावत (आढावा, शिक्षण उद्दिष्टे, अध्याय संसाधने)

#### प्रमाणीकरण
- ✅ इंग्रजी दस्तऐवजात "ai-foundry" फोल्डर पथ संदर्भ शून्य शिल्लक
- ✅ इंग्रजी दस्तऐवजात "Microsoft Foundry" उत्पादन नाव संदर्भ शून्य शिल्लक
- ✅ नवीन फोल्डर रचनेनुसार सर्व नेव्हिगेशन लिंक कार्यरत
- ✅ फाइल आणि फोल्डर नामकरण यशस्वीपणे पूर्ण झाले
- ✅ अध्यायांमधील क्रॉस-रेफरन्सेस प्रमाणित

#### टीप
- **व्याप्ती**: बदल फक्त `docs/` फोल्डर मधील इंग्रजी दस्तऐवजांवर लागू
- **भाषांतर**: या आवृत्तीत भाषांतर फोल्डर (`translations/`) अद्ययावत केले नाहीत
- **कार्यशाळा**: कार्यशाळेच्या साहित्यावर (`workshop/`) या आवृत्तीत बदल झाले नाहीत
- **उदाहरणे**: उदाहरण फाइल्समध्ये अद्याप जुने नाव वापरलेले असू शकते (भविष्यातील अद्ययावतासाठी)
- **बाह्य दुवे**: बाह्य URLs आणि GitHub रेकॉर्ड संदर्भ अपरिवर्तित राहिले आहेत

#### योगदानकर्त्यांसाठी स्थलांतर मार्गदर्शक
जर स्थानिक शाखा किंवा दस्तऐवज जुना रचना संदर्भित करत असतील:
1. फोल्डर संदर्भ अद्ययावत करा: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. फाइल संदर्भ अद्ययावत करा: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. उत्पादन नाव बदला: "Microsoft Foundry" → "Microsoft Foundry"
4. सर्व अंतर्गत दस्तऐवज लिंक अद्ययावत करत कार्यरत ठेवा

---

### [v3.4.0] - 2025-10-24

#### पायाभूत सुविधा प्रिव्ह्यू आणि प्रमाणीकरण सुधारणा
**ही आवृत्ती नवीन Azure Developer CLI प्रिव्ह्यू वैशिष्ट्यासाठी सर्वसमावेशक समर्थन देते आणि कार्यशाळा वापरकर्त्याचा अनुभव सुधारते.**

#### जोडलेले
- **🧪 azd provision --preview वैशिष्ट्य दस्तऐवज**: नवीन पायाभूत सुविधा प्रिव्ह्यू क्षमतांचे सविस्तर कव्हरेज
  - कमांड संदर्भ आणि उपयोग उदाहरणे चीट शीट मध्ये
  - प्राव्हिजनिंग मार्गदर्शिकेमध्ये तपशीलवार समाकलन, वापर केस आणि फायदे
  - सुरक्षित तैनातीसाठी प्री-फ्लाइट तपासणी समाकलन
  - सुरुवातीचे मार्गदर्शक अद्ययावत सुसंगत सुरक्षित तैनाती पद्धतींसह
- **🚧 कार्यशाळा स्थिती बॅनर**: HTML व्यावसायिक बॅनर कार्यशाळेच्या विकास स्थिती दर्शवितो
  - स्पष्ट वापरकर्ता संवादासाठी ग्रेडीयन्ट डिझाइन व बांधकाम निर्देशकांसह
  - पारदर्शकतेसाठी शेवटचा अद्ययावत वेळ
  - सर्व उपकरण प्रकारांसाठी मोबाइल प्रतिसादक्षम डिझाइन

#### सुधारित
- **पायाभूत सुविधा सुरक्षा**: तैनाती दस्तऐवजामध्ये प्रिव्ह्यू फंक्शनॅलिटी एकत्रित केली
- **प्री-तैनाती प्रमाणीकरण**: स्वयंचलित स्क्रिप्ट्स आता पायाभूत सुविधा प्रिव्ह्यू तपासणी समाविष्ट करतात
- **विकासक वर्कफ्लो**: प्रिव्ह्यू सर्वोत्तम पद्धती म्हणून अपडेट केलेले कमांड आदेश
- **कार्यशाळा अनुभव**: सामग्री विकास स्थिती विषयी वापरकर्त्यांसाठी स्पष्ट अपेक्षा

#### बदल
- **तैनाती सर्वोत्तम पद्धती**: प्रिव्ह्यू-प्रथम कार्यप्रवाह शिफारस केलेले दृष्टिकोन
- **दस्तऐवज प्रवाह**: शिकण्याच्या प्रक्रियेत पायाभूत सुविधा प्रमाणीकरण लवकर केलेले
- **कार्यशाळा सादरीकरण**: विकास वेळापत्रकासह व्यावसायिक स्थिती संवाद

#### सुधारित
- **सुरक्षा प्रथम दृष्टिकोन**: पायाभूत सुविधा तैनात करण्यापूर्वी तपासली जाऊ शकते
- **संघ सहकार्य**: चर्चेसाठी प्रिव्ह्यू परिणाम शेअर करता येतील
- **खर्च जाणीव**: प्राव्हिजनिंगपूर्वी संसाधन खर्चाची चांगली समज
- **जोखमी कमी करणे**: आगाऊ प्रमाणीकरणाद्वारे तैनाती अपयश कमी

#### तांत्रिक अंमलबजावणी
- **अनेक-दस्तऐवज समाकलन**: चार मुख्य फाइल्समध्ये प्रिव्ह्यू वैशिष्ट्य दस्तऐवजीत
- **कमांड नमुने**: दस्तऐवजात सातत्यपूर्ण वाक्यरचना आणि उदाहरणे
- **सर्वोत्तम पद्धत समाकलन**: प्रमाणीकरण प्रक्रियेत व स्क्रिप्ट्समध्ये प्रिव्ह्यूचा समावेश
- **दृश्य निर्देशक**: नवीन वैशिष्ट्यासाठी स्पष्ट चिन्हांकन

#### कार्यशाळा पायाभूत सुविधा
- **स्थिती संवाद**: ग्रेडीयंट शैलीतील व्यावसायिक HTML बॅनर
- **वापरकर्ता अनुभव**: विकास स्थिती स्पष्टपणे दर्शविणे भ्रम टाळते
- **व्यावसायिक सादरीकरण**: पठणशाळेची विश्वासार्हता राखून अपेक्षा ठरविते
- **वेळापत्रक पारदर्शकता**: ऑक्टोबर २०२५ अखेरीस अद्यतने दर्शविणारा वेळ

### [v3.3.0] - 2025-09-24

#### सुधारित कार्यशाळा साहित्य आणि संवादात्मक शिक्षण अनुभव
**ही आवृत्ती व्यापक कार्यशाळा साहित्य व ब्राउझर-आधारित संवादात्मक मार्गदर्शक व संरचित शिक्षण मार्ग देतात.**

#### जोडलेले
- **🎥 संवादात्मक कार्यशाळा मार्गदर्शक**: MkDocs प्रिव्ह्यू क्षमता सह ब्राउझर-आधारित कार्यशाळा अनुभव
- **📝 संरचित कार्यशाळा सूचना**: शोधापासून सानुकूलनेपर्यंत ७ टप्पे मार्गदर्शित शिक्षण मार्ग
  - 0-परिचय: कार्यशाळा आढावा व सेटअप
  - 1-AI साचा निवड: साचा शोध व निवड प्रक्रिया
  - 2-AI साचा प्रमाणीकरण: तैनाती व तपासणी प्रक्रिया
  - 3-AI साचा विघटन: साचा वास्तुकला समजून घेणे
  - 4-AI साचा संरचना बदलणे: संरचना व सानुकूलने
  - 5-AI साचा सानुकूलने: प्रगत बदल व पुनरावृत्ती
  - 6-पायाभूत सुविधा टेअरडाउन: साफसफाई व संसाधन व्यवस्थापन
  - 7-सरसकट: सारांश व पुढील पावले
- **🛠️ कार्यशाळा साधने**: सुधारित शिक्षण अनुभवासाठी Material विषयासह MkDocs संरचना
- **🎯 हँड्स-ऑन शिक्षण मार्ग**: ३ टप्पे पद्धतशीर (शोध → तैनाती → सानुकूलने)
- **📱 GitHub Codespaces समाकलन**: सहज विकास वातावरण सेटअप

#### सुधारित
- **AI कार्यशाळा लॅब**: २-३ तासांच्या सविस्तर संरचित शिक्षणासह विस्तारलेले
- **कार्यशाळा दस्तऐवज**: नेव्हिगेशन व दृश्य सहाय्यांसह व्यावसायिक सादरीकरण
- **शिकण्याची प्रगती**: साचा निवडून उत्पादन तैनातीपर्यंत स्पष्ट टप्प्या टप्प्याने मार्गदर्शन
- **विकासक अनुभव**: संघटित साधने वीक विकास वापरासाठी

#### सुधारित
- **सुलभता**: शोध, कॉपी सुविधा, विषय टॉगलसह ब्राउझर-आधारित इंटरफेस
- **स्वतःच्या वेगाने शिक्षण**: भिन्न शिकण्याच्या गतीसाठी लवचिक कार्यशाळा रचना
- **प्रायोगिक अनुप्रयोग**: प्रत्यक्ष AI साचा तैनाती प्रकरणे
- **समुदाय समाकलन**: कार्यशाळा सहाय्यासाठी Discord समाकलन

#### कार्यशाळा वैशिष्ट्ये
- **एंबेडेड शोध**: जलद कीवर्ड व धडा शोध
- **कोड ब्लॉक कॉपी**: सर्व कोड उदाहरणांसाठी होव्हर-टू-कॉपी सुविधा
- **थीम टॉगल**: वेगवेगळ्या पसंतींसाठी डार्क/लाइट मोड समर्थन
- **दृश्य सामग्री**: सुधारित समजण्यासाठी स्क्रीनशॉट व आकृतिबंध
- **सहाय्य समाकलन**: समुदाय सहाय्यासाठी थेट Discord प्रवेश

### [v3.2.0] - 2025-09-17

#### मुख्य नेव्हिगेशन पुनर्रचना आणि अध्यायावर आधारित शिक्षण प्रणाली
**ही आवृत्ती संपूर्ण रिपॉजिटरीमध्ये सुधारित नेव्हिगेशनसह व्यापक अध्यायाधारित शिक्षण रचना सादर करते.**

#### जोडलेले
- **📚 अध्यायाधारित शिक्षण प्रणाली**: संपूर्ण अभ्यासक्रम ८ प्रगत शिकण्याच्या अध्यायांमध्ये पुनर्रचित
  - अध्याय 1: आधार व जलद प्रारंभ (⭐ - ३०-४५ मिनिटे)
  - अध्याय 2: AI-सर्वप्रथम विकास (⭐⭐ - १-२ तास)
  - अध्याय 3: संरचना व प्रमाणीकरण (⭐⭐ - ४५-६० मिनिटे)
  - अध्याय 4: पायाभूत सुविधा कोड म्हणून व तैनाती (⭐⭐⭐ - १-१.५ तास)
  - अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स (⭐⭐⭐⭐ - २-३ तास)
  - अध्याय 6: प्री-तैनाती प्रमाणीकरण व नियोजन (⭐⭐ - १ तास)
  - अध्याय 7: समस्या निवारण व डिबगिंग (⭐⭐ - १-१.५ तास)
  - अध्याय 8: उत्पादन व एंटरप्राइज नमुने (⭐⭐⭐⭐ - २-३ तास)
- **📚 संपूर्ण नेव्हिगेशन प्रणाली**: सर्व दस्तऐवजात सातत्यपूर्ण नेव्हिगेशन हेडर व फूटर
- **🎯 प्रगती ट्रॅकिंग**: कोर्स पूर्णता यादी व शिक्षण तपासणी प्रणाली
- **🗺️ शिक्षण मार्गदर्शन**: विविध अनुभव पातळ्या व उद्दिष्टांसाठी स्पष्ट प्रवेश बिंदू
- **🔗 क्रॉस-रेफरन्स नेव्हिगेशन**: संबंधित अध्याय व आवश्यकतांसाठी स्पष्ट दुवे

#### सुधारित
- **README रचना**: अध्यायाधारित संघटनेसह संरचित शिक्षण प्लॅटफॉर्ममध्ये रूपांतरित
- **दस्तऐवज नेव्हिगेशन**: प्रत्येक पान आता अध्याय संदर्भ व प्रगती मार्गदर्शनासह
- **टेम्पलेट संघटना**: उदाहरणे व टेम्पलेट्स योग्य अध्यायानुसार मॅप केले
- **संसाधन समाकलन**: चिट शीट्स, FAQ व अभ्यास मार्गदर्शके संबंधित अध्यायांशी जोडले
- **कार्यशाळा समाकलन**: हँड्स-ऑन लॅब अनेक अध्याय शिकण्याच्या उद्दिष्टांसोबत मॅप केले

#### बदललेले
- **शिकण्याची प्रगती**: रेषीय दस्तऐवजापासून लवचिक अध्यायाधारित शिक्षणाकडे संक्रमण
- **संरचना स्थान**: चांगल्या शिकण्याच्या प्रवाहासाठी अर्कायवणी मार्गदर्शक अध्याय ३ मध्ये
- **AI सामग्री समाकलन**: शिकण्याच्या प्रवासात AI-विशिष्ट सामग्री अधिक चांगले समाकलित
- **उत्पादन सामग्री**: व्यावसायिक शिक्षार्थ्यांसाठी अध्याय ८ मध्ये प्रगत नमुने एकत्रित

#### सुधारित
- **वापरकर्ता अनुभव**: स्पष्ट नेव्हिगेशन ब्रेडक्रंब्स व अध्याय प्रगती निर्देशक
- **सुलभता**: सोप्या कोर्स अभिगमनासाठी सातत्यपूर्ण नेव्हिगेशन नमुने
- **व्यावसायिक सादरीकरण**: शैक्षणिक व कॉर्पोरेट प्रशिक्षणासाठी विद्यापीठ-शैलीची कोर्स रचना
- **शिकण्याची कार्यक्षमता**: सुधारित संघटनेमुळे संबंधित सामग्री शोधण्याचा वेळ कमी

#### तांत्रिक अंमलबजावणी
- **नेव्हिगेशन हेडर**: ४०+ दस्तऐवज फाइल्समध्ये प्रमाणित अध्याय नेव्हिगेशन
- **फूटर नेव्हिगेशन**: सातत्यपूर्ण प्रगती मार्गदर्शन व अध्याय पूर्णता निर्देशक
- **क्रॉस-लिंकिंग**: संबंधित संकल्पना जोडणाऱ्या फाईट्समधील अंतर्गत लिंकिंग प्रणाली
- **अध्याय मॅपिंग**: टेम्पलेट्स व उदाहरणे शिकण्याच्या उद्दिष्टांशी स्पष्ट जोडलेली

#### अभ्यास मार्गदर्शक सुधारणा
- **📚 संपूर्ण शिकण्याची उद्दिष्टे**: ८-अध्याय प्रणालीशी सूट करून पुनर्रचित अभ्यास मार्गदर्शक
- **🎯 अध्यायाधारित मूल्यांकन**: प्रत्येक अध्यायात विशिष्ट शिक्षण उद्दिष्टे व व्यावहारिक सराव
- **📋 प्रगती ट्रॅकिंग**: मोजता येणाऱ्या निकाल व पूर्णता तपासणी यादीसह साप्ताहिक शिक्षण वेळापत्रक
- **❓ मूल्यांकन प्रश्न**: प्रत्येक अध्यायासाठी ज्ञान प्रमाणीकरण प्रश्न व व्यावसायिक परिणाम
- **🛠️ व्यावहारिक सराव**: खऱ्या तैनाती प्रकरणे व समस्या निवारणांसह हँड्स-ऑन क्रियाकलाप
- **📊 कौशल्य प्रगती**: मूलभूत संकल्पनांपासून एंटरप्राइज नमुन्यांपर्यंत स्पष्ट प्रगती व करिअर विकास केंद्रित
- **🎓 प्रमाणपत्र फ्रेमवर्क**: व्यावसायिक विकास परिणाम व समुदाय मान्यता प्रणाली
- **⏱️ वेळापत्रक व्यवस्थापन**: टप्प्याटप्प्याने १० आठवड्यांचे संरचित शिक्षण नियोजन व टप्पे प्रमाणीकरण

### [v3.1.0] - 2025-09-17

#### सुधारित मल्टी-एजंट AI सोल्यूशन्स
**ही आवृत्ती मल्टी-एजंट रिटेल सोल्यूशन मध्ये एजंट नावांमध्ये सुधारणा व दस्तऐवजाला सुधारित करते.**

#### बदललेले
- **मल्टी-एजंट संज्ञा**: "Cora एजंट" चे नाव संपूर्ण रिटेल मल्टी-एजंट सोल्यूशन मध्ये "Customer एजंट" ने बदलले स्पष्ट समजासाठी
- **एजंट आर्किटेक्चर**: सर्व दस्तऐवज, ARM टेम्पलेट्स व कोड उदाहरणे सातत्यपूर्ण "Customer एजंट" नाव वापरण्यासाठी अपडेट
- **संरचना उदाहरणे**: नाव बदलांसह एजंट संरचना नमुने आधुनिक केले
- **दस्तऐवज सुसंगतता**: सर्व संदर्भ व्यावसायिक, वर्णनात्मक एजंट नावांसह सुनिश्चित

#### सुधारित
- **ARM टेम्पलेट पॅकेज**: Customer एजंट संदर्भांसह retail-multiagent-arm-template अद्ययावत
- **आर्किटेक्चर आकृत्या**: नव्या एजंट नावांसह Mermaid आकृत्या सुधारित
- **कोड उदाहरणे**: Python वर्ग व अंमलबजावणी उदाहरणे आता CustomerAgent नाव वापरतात
- **पर्यावरणीय चल**: सर्व तैनाती स्क्रिप्ट CUSTOMER_AGENT_NAME पॅटर्न वापरण्यासाठी अद्ययावत

#### सुधारित
- **विकासक अनुभव**: दस्तऐवजात एजंट भूमिका आणि जबाबदाऱ्या स्पष्ट
- **उत्पादन तयारपणा**: एंटरप्राइज नावकरण पद्धतींसह अधिक सुसंगत
- **शिकण्याची सामग्री**: शैक्षणिक उद्दिष्टांसाठी अधिक समजण्यास सोपे एजंट नावे
- **टेम्पलेट वापरिता सुलभता**: एजंट कार्ये व तैनाती नमुन्यांची सुलभ समज

#### तांत्रिक तपशील
- CustomerAgent संदर्भांसह Mermaid आर्किटेक्चर आकृत्या अद्ययावत
- Python उदाहरणांमध्ये CoraAgent वर्ग नावे CustomerAgent ने बदलली
- ARM टेम्पलेट JSON संरचना "customer" एजंट प्रकार वापरूने बदलली
- पर्यावरणीय चल CORA_AGENT_* पासून CUSTOMER_AGENT_* पॅटर्नवर अद्ययावत
- सर्व तैनाती आदेश व कंटेनर संरचना सुधारित

### [v3.0.0] - 2025-09-12

#### मुख्य बदल - AI विकासक केंद्रित आणि Microsoft Foundry समाकलन
**ही आवृत्ती रिपॉजिटरीला AI-केंद्रित व्यापक शिक्षण स्त्रोत आणि Microsoft Foundry समाकलनासह रूपांतरित करते.**

#### जोडलेले
- **🤖 AI-सर्वप्रथम शिक्षण मार्ग**: AI विकासक व अभियंत्यांना प्राधान्य देऊन पुनर्रचना
- **Microsoft Foundry समाकलन मार्गदर्शक**: AZD सह Microsoft Foundry सेवा जोडण्यासाठी सविस्तर दस्तऐवज
- **AI मॉडेल तैनाती नमुने**: मॉडेल निवड, संरचना व उत्पादन तैनाती धोरणे यावर सविस्तर मार्गदर्शक
- **एआय कार्यशाळा लॅब**: एआय अनुप्रयोगांना AZD-डिप्लॉयबल सोल्यूशन्समध्ये रूपांतर करण्यासाठी 2-3 तासांची प्रायोगिक कार्यशाळा  
- **प्रॉडक्शन एआय सर्वोत्तम पद्धती**: एआय वर्कलोड्सच्या स्केलिंग, मॉनिटरिंग आणि सुरक्षिततेसाठी एंटरप्राइझ-तयार नमुने  
- **एआय-विशिष्ट त्रुटी निवारण मार्गदर्शक**: Microsoft Foundry मॉडेल्स, Cognitive Services, आणि एआय डिप्लॉयमेंट समस्यांसाठी सविस्तर त्रुटी निवारण  
- **एआय टेम्प्लेट गॅलरी**: Microsoft Foundry टेम्प्लेट्सचा वैशिष्ट्यीकृत संग्रह ज्यात गुंतागुंत रेटिंग्स आहेत  
- **कार्यशाळा साहित्य**: प्रायोगिक लॅब्स आणि संदर्भ साहित्यांसह पूर्ण कार्यशाळा रचना  

#### सुधारित  
- **README रचना**: एआय विकसक केंद्रित, Microsoft Foundry Discord मधील 45% समुदायातील रस डेटा सहित  
- **शिकण्याचे मार्ग**: पारंपरिक मार्गांसह समर्पित एआय विकसक प्रवास, विद्यार्थ्यांसाठी आणि DevOps अभियंत्यांसाठी  
- **टेम्प्लेट शिफारसी**: azure-search-openai-demo, contoso-chat, आणि openai-chat-app-quickstart यांसह वैशिष्ट्यीकृत एआय टेम्प्लेट्स  
- **समुदाय समाकलन**: एआय-विशिष्ट चॅनेल्स आणि चर्चांसह सुधारित Discord समुदाय समर्थन  

#### सुरक्षितता आणि प्रॉडक्शनवर लक्ष  
- **व्यवस्थित ओळख नमुने**: एआय-विशिष्ट प्रमाणीकरण आणि सुरक्षा संरचना  
- **खर्च ऑप्टिमायझेशन**: एआय वर्कलोडसाठी टोकन वापर ट्रॅकिंग आणि बजेट नियंत्रण  
- **बहु-प्रदेशीय डिप्लॉयमेंट**: जागतिक एआय अनुप्रयोग डिप्लॉयमेंटसाठी धोरणे  
- **कार्यक्षमता मॉनिटरिंग**: एआय-विशिष्ट मेट्रिक्स आणि Application Insights समाकलन  

#### दस्तऐवजीकरण गुणवत्ता  
- **रेकामी कोर्स रचना**: प्राथमिक ते प्रगत एआय डिप्लॉयमेंट नमुन्यांसाठी तार्किक प्रगती  
- **मान्यताप्राप्त URLs**: सर्व बाह्य रिपॉझिटरी लिंक तपासलेले आणि उपलब्ध  
- **पूर्ण संदर्भ**: सर्व अंतर्गत दस्तऐवजीकरण लिंक्स प्रमाणीकृत आणि कार्यरत  
- **प्रॉडक्शन रेडी**: प्रामाणिक एंटरप्राइझ डिप्लॉयमेंट नमुने खऱ्या विश्वातील उदाहरणांसह  

### [v2.0.0] - 2025-09-09  

#### मुख्य बदल - रिपॉझिटरी पुनर्रचना आणि व्यावसायिक सुधारणा  
**हा आवृत्ती रिपॉझिटरी रचना आणि सामग्री सादरीकरणाचा मोठा फेरफार दर्शवितो.**  

#### जोडले  
- **रचनात्मक शिक्षण फ्रेमवर्क**: सर्व दस्तऐवजीकरण पृष्ठांमध्ये परिचय, शिकण्याचे उद्दिष्ट आणि शिकण्याचे निकाल विभागांचा समावेश  
- **नेव्हिगेशन प्रणाली**: मार्गदर्शित शिक्षण प्रगतीसाठी सर्व दस्तऐवजीकरणांत मागील/पुढील धडा लिंक जोडले  
- **अभ्यास मार्गदर्शक**: शिकण्याचे उद्दिष्ट, सराव व्यायाम, आणि मूल्यांकन साहित्यासह अभ्यास-मार्गदर्शक.md  
- **व्यावसायिक सादरीकरण**: सुधारित प्रवेशयोग्यता आणि व्यावसायिक रूपासाठी सर्व इमोजी चिन्ह काढले  
- **सुधारित सामग्री रचना**: शिक्षण साहित्यांचे उत्तम आयोजन आणि प्रवाह  

#### बदलले  
- **दस्तऐवजीकरण स्वरूप**: सर्व दस्तऐवजीकरणाचे एकसंध, शिकण्याकेंद्रित मानकीकरण  
- **नेव्हिगेशन प्रवाह**: सर्व शिकणाऱ्या सामग्रीमध्ये तार्किक प्रगती लागू केली  
- **सामग्री सादरीकरण**: स्पष्ट, व्यावसायिक स्वरूपासाठी सजावटीच्या घटकांची जागा साफ केली  
- **लिंक रचना**: नवीन नेव्हिगेशन प्रणालीस समर्थन देण्यासाठी सर्व अंतर्गत लिंक अद्यतनित केल्या  

#### सुधारित  
- **प्रवेशयोग्यता**: स्क्रीन रीडरसाठी चांगली सुसंगतता यासाठी इमोजी अवलंबित्व काढले  
- **व्यावसायिक दिसणं**: शैक्षणिक शैलीतील स्वच्छ सादरीकरण, एंटरप्राइझ शिक्षणासाठी योग्य  
- **शिकण्याचा अनुभव**: प्रत्येक धड्याचे स्पष्ट उद्दिष्ट आणि निकालांसह रचनाबद्ध दृष्टिकोन  
- **सामग्रीचे आयोजन**: संबंधित विषयांमधील उत्तम तार्किक प्रवाह आणि संपर्क  

### [v1.0.0] - 2025-09-09  

#### प्रारंभिक प्रकाशन - संपूर्ण AZD शिकण्याचे रिपॉझिटरी  

#### जोडले  
- **मुख्य दस्तऐवजीकरण रचना**  
  - पूर्ण गेटिंग-स्टार्टेड मार्गदर्शक सिरीज  
  - विस्तृत डिप्लॉयमेंट आणि प्रोव्हिज़निंग दस्तऐवजीकरण  
  - सविस्तर त्रुटी निवारण साधने आणि डीबगिंग मार्गदर्शक  
  - प्री-डिप्लॉयमेंट पडताळणी उपकरणे आणि प्रक्रिया  

- **गेटिंग स्टार्टेड मॉड्युल**  
  - AZD मूलभूत तत्त्वे आणि संज्ञा  
  - इंस्टॉलेशन मार्गदर्शक: प्लॅटफॉर्म-विशिष्ट सेटअप सूचना  
  - कॉन्फिगरेशन मार्गदर्शक: पर्यावरण सेटअप आणि प्रमाणीकरण  
  - प्रथम प्रोजेक्ट ट्यूटोरियल: टप्प्याटप्प्याने प्रायोगिक शिकणं  

- **डिप्लॉयमेंट आणि प्रोव्हिज़निंग मॉड्युल**  
  - डिप्लॉयमेंट मार्गदर्शक: संपूर्ण वर्कफ्लो दस्तऐवजीकरण  
  - प्रोव्हिज़निंग मार्गदर्शक: Bicep वापरून Infrastructure as Code  
  - प्रॉडक्शन डिप्लॉयमेंटसाठी सर्वोत्तम पद्धती  
  - बहु-सेवा आर्किटेक्चर नमुने  

- **प्री-डिप्लॉयमेंट पडताळणी मॉड्युल**  
  - क्षमता नियोजन: Azure संसाधन उपलब्धता पडताळणी  
  - SKU निवड: सविस्तर सेवा टियर मार्गदर्शन  
  - प्री-फ्लाइट तपासणी: स्वयंचलित पडताळणी स्क्रिप्ट्स (PowerShell आणि Bash)  
  - खर्च अनुमान आणि बजेट नियोजन साधने  

- **त्रुटी निवारण मॉड्युल**  
  - सामान्य समस्या: वारंवार येणाऱ्या समस्या आणि उपाय  
  - डीबगिंग मार्गदर्शक: पद्धतशीर त्रुटी निवारण पद्धती  
  - प्रगत निदान तंत्र आणि साधने  
  - कार्यक्षमता मॉनिटरिंग आणि ऑप्टिमायझेशन  

- **संसाधने आणि संदर्भ**  
  - कमांड चीट शीट: आवश्यक कमांडसाठी जलद संदर्भ  
  - शब्दसंग्रह: संपूर्ण संज्ञा आणि संक्षेप व्याख्या  
  - FAQ: सामान्य प्रश्नांसाठी सविस्तर उत्तर  
  - बाह्य संसाधन लिंक आणि समुदाय संपर्क  

- **उदाहरणे आणि टेम्प्लेट्स**  
  - सोपी वेब अॅप्लिकेशन उदाहरण  
  - स्थिर वेबसाइट डिप्लॉयमेंट टेम्प्लेट  
  - कंटेनर अॅप्लिकेशन कॉन्फिगरेशन  
  - डेटाबेस समाकलन नमुने  
  - मायक्रोसर्व्हिसेस आर्किटेक्चर उदाहरणे  
  - सर्व्हरलेस फंक्शन अंमलबजावणी  

#### वैशिष्ट्ये  
- **बहु-प्लॅटफॉर्म समर्थन**: Windows, macOS, Linux करताना इन्स्टॉलेशन आणि कॉन्फिगरेशन मार्गदर्शक  
- **अनेक कौशल्य पातळ्या**: विद्यार्थ्यांपासून व्यावसायिक विकसकांपर्यंत सुसंगत सामग्री  
- **प्रायोगिक झुकाव**: व्यवहार्य उदाहरणे आणि वास्तविक विश्व परिस्थिती  
- **संपूर्ण कव्हरेज**: मूलभूत संकल्पनांपासून प्रगत एंटरप्राइझ नमुन्यांपर्यंत  
- **सुरक्षा-प्रथम दृष्टिकोन**: सुरक्षेच्या सर्वोत्तम पद्धती संपूर्ण अंतर्भूत  
- **खर्च ऑप्टिमायझेशन**: खर्च-प्रभावी डिप्लॉयमेंटसाठी मार्गदर्शन  

#### दस्तऐवजीकरण गुणवत्ता  
- **तपशीलवार कोड उदाहरणे**: व्यवहार्य, तपासलेले कोड नमुने  
- **टप्प्याटप्प्याने सूचना**: स्पष्ट, प्रभावी मार्गदर्शन  
- **संपूर्ण त्रुटी हाताळणी**: सामान्य समस्या निवारणासाठी  
- **सर्वोत्तम पद्धतींचा समावेश**: उद्योग मानके आणि शिफारसी  
- **आवृत्ती सुसंगतता**: नवीनतम Azure सेवा आणि azd वैशिष्ट्यांसह अद्ययावत  

## नियोजित भविष्यातील सुधारणा  

### आवृत्ती 3.1.0 (नियोजित)  
#### एआय प्लॅटफॉर्म विस्तार  
- **बहु-मॉडेल समर्थन**: Hugging Face, Azure Machine Learning, आणि कस्टम मॉडेल्ससाठी समाकलन नमुने  
- **एआय एजंट फ्रेमवर्क्स**: LangChain, Semantic Kernel, आणि AutoGen डिप्लॉयमेंटसाठी टेम्प्लेट्स  
- **प्रगत RAG नमुने**: Azure AI Search पेक्षा विस्तृत व्हेक्टर डेटाबेस पर्याय (Pinecone, Weaviate, इ.)  
- **एआय निरीक्षण**: मॉडेल कार्यक्षमता, टोकन वापर, आणि प्रतिसाद गुणवत्ता यासाठी सुधारित मॉनिटरिंग  

#### विकसक अनुभव  
- **VS Code विस्तार**: समाकलित AZD + Microsoft Foundry विकास अनुभव  
- **GitHub Copilot समाकलन**: एआय सहाय्यित AZD टेम्प्लेट निर्मिती  
- **परस्पर संवादात्मक ट्यूटोरियल**: एआय परिस्थितीसाठी स्वयंचलित पडताळणीसह प्रायोगिक कोडिंग व्यायाम  
- **व्हिडिओ सामग्री**: एआय डिप्लॉयमेंटवर लक्ष केंद्रित करणारे व्हिज्युअल शिकणाऱ्यांसाठी पूरक व्हिडिओ मार्गदर्शक  

### आवृत्ती 4.0.0 (नियोजित)  
#### एंटरप्राइझ एआय नमुने  
- **शासन फ्रेमवर्क**: एआय मॉडेल शासन, अनुपालन, आणि ऑडिट ट्रेल्स  
- **बहु-टेनेट एआय**: वेगळ्या ग्राहकांसाठी वेगळ्या एआय सेवा पुरवण्यासाठी नमुने  
- **एज एआय डिप्लॉयमेंट**: Azure IoT Edge आणि कंटेनर इंस्टन्सेससह समाकलन  
- **हायब्रिड क्लाउड एआय**: बहु-क्लाउड आणि हायब्रिड डिप्लॉयमेंट नमुने एआय वर्कलोडसाठी  

#### प्रगत वैशिष्ट्ये  
- **एआय पाइपलाइन ऑटोमेशन**: Azure Machine Learning पाइपलाइनसह MLOps समाकलन  
- **प्रगत सुरक्षा**: झिरो-ट्रस्ट नमुने, प्रायव्हेट एंडपॉइंट्स, आणि प्रगत धोका संरक्षण  
- **कार्यक्षमता ऑप्टिमायझेशन**: उच्च-थ्रूपुट एआय अनुप्रयोगांसाठी प्रगत ट्यूनिंग आणि स्केलिंग धोरणे  
- **जागतिक वितरण**: एआय अनुप्रयोगांसाठी कंटेंट वितरण आणि एज कॅशिंग नमुने  

### आवृत्ती 3.0.0 (नियोजित) - वर्तमान प्रकाशनाद्वारे अधिलेखन  
#### प्रस्तावित वाढी - आता v3.0.0 मध्ये अंमलात आलेले  
- ✅ **एआय-केंद्रित सामग्री**: सविस्तर Microsoft Foundry समाकलन (पूर्ण)  
- ✅ **परस्पर संवादात्मक ट्यूटोरियल**: प्रायोगिक एआय कार्यशाळा लॅब (पूर्ण)  
- ✅ **प्रगत सुरक्षा मॉड्युल**: एआय-विशिष्ट सुरक्षा नमुने (पूर्ण)  
- ✅ **कार्यक्षमता ऑप्टिमायझेशन**: एआय वर्कलोड ट्यूनिंग धोरणे (पूर्ण)  

### आवृत्ती 2.1.0 (नियोजित) - काही v3.0.0 मध्ये अंमलबजावणी  
#### लहान सुधारणा - काही वर्तमान प्रकाशनात पूर्ण  
- ✅ **अतिरिक्त उदाहरणे**: एआय-केंद्रित डिप्लॉयमेंट परिस्थिती (पूर्ण)  
- ✅ **विस्तारित FAQ**: एआय-विशिष्ट प्रश्न आणि त्रुटी निवारण (पूर्ण)  
- **साधन समाकलन**: सुधारित IDE आणि संपादक समाकलन मार्गदर्शक  
- ✅ **मॉनिटरिंग विस्तार**: एआय-विशिष्ट मॉनिटरिंग आणि अलर्टिंग नमुने (पूर्ण)  

#### अजूनही नियोजित भविष्यातील प्रकाशनासाठी  
- **मोबाइल-फ्रेंडली दस्तऐवजीकरण**: मोबाइल शिकण्यासाठी प्रतिसादक्षम डिझाईन  
- **ऑफलाइन प्रवेश**: डाउनलोड करण्याजोगे दस्तऐवजीकरण पॅकेजेस  
- **सुधारित IDE समाकलन**: AZD + AI वर्कफ्लोजसाठी VS Code विस्तार  
- **समुदाय डॅशबोর্ড**: प्रत्यक्ष समुदाय मेट्रिक्स आणि योगदान ट्रॅकिंग  

## चेंजलॉगमध्ये योगदान करणं  

### बदलांचे अहवाल  
या रिपॉझिटरीमध्ये योगदान करताना कृपया खात्री करा की चेंजलॉग नोंदीमध्ये समाविष्ट आहे:  

1. **आवृत्ती क्रमांक**: सिमॅंटिक आवृत्तीकरणानुसार (major.minor.patch)  
2. **दिनांक**: प्रकाशन किंवा अद्यतन दिनांक YYYY-MM-DD स्वरूपात  
3. **वर्ग**: जोडले, बदलले, निष्प्रभावित, काढून टाकले, दुरुस्त, सुरक्षा  
4. **स्पष्ट वर्णन**: काय बदलले याचे संक्षिप्त वर्णन  
5. **प्रभाव मूल्यांकन**: विद्यमान वापरकर्त्यांवर होणारा परिणाम  

### बदल वर्गीकरण  

#### जोडले  
- नवीन वैशिष्ट्ये, दस्तऐवजीकरण विभाग, किंवा क्षमता  
- नवीन उदाहरणे, टेम्प्लेट्स, किंवा शिक्षण संसाधने  
- अतिरिक्त साधने, स्क्रिप्ट्स, किंवा युटिलिटी  

#### बदलले  
- विद्यमान कार्यक्षमता किंवा दस्तऐवजीकरणात बदल  
- स्पष्टता किंवा अचूकता सुधारणा  
- सामग्री किंवा संघटनेचा पुनर्रचना  

#### निष्प्रभावित  
- ज्याकडे टाकण्याचा विचार आहे असे वैशिष्ट्ये किंवा पद्धती  
- काढायच्या प्रक्रिया असलेले दस्तऐवजीकरण विभाग  
- ज्यासाठी चांगले पर्याय उपलब्ध आहेत असे पद्धती  

#### काढून टाकले  
- वापरात नसलेली वैशिष्ट्ये, दस्तऐवजीकरण किंवा उदाहरणे  
- जुनी किंवा निष्प्रभावित माहिती  
- पुनरावृत्ती किंवा संकुचित सामग्री  

#### दुरुस्त  
- दस्तऐवजीकरण किंवा कोडमधील त्रुटी दुरुस्ती  
- अहवाल दिलेल्या समस्या किंवा अडचणी निवारण  
- अचूकता किंवा कार्यक्षमता सुधारणा  

#### सुरक्षा  
- सुरक्षा-संबंधित सुधारणा किंवा दुरुस्ती  
- सुरक्षा सर्वोत्तम पद्धती अद्यतन  
- सुरक्षा कमकुवतपणा निवारण  

### सिमॅंटिक आवृत्तीकरण मार्गदर्शक  

#### मुख्य आवृत्ती (X.0.0)  
- वापरकर्ता क्रिया आवश्यक असलेल्या भंगपूर्ण बदल  
- सामग्री किंवा संघटनेमध्ये महत्त्वपूर्ण पुनर्रचना  
- मूलभूत दृष्टिकोन किंवा पद्धतीत बदल  

#### लहान आवृत्ती (X.Y.0)  
- नवीन वैशिष्ट्ये किंवा सामग्री वाढी  
- मागील सुसंगतता राखणारी सुधारणा  
- अतिरिक्त उदाहरणे, साधने, किंवा संसाधने  

#### पॅच आवृत्ती (X.Y.Z)  
- त्रुटी सुधारणा आणि दुरुस्ती  
- विद्यमान सामग्रीतील लहान सुधारणा  
- स्पष्टता आणि सूक्ष्म सुधारणा  

## समुदाय अभिप्राय आणि सूचना  

आम्ही सक्रियपणे या शिकण्याच्या संसाधनास सुधारण्याकरिता समुदायाचा अभिप्राय प्रोत्साहित करतो:  

### अभिप्राय कसा द्यावा  
- **GitHub Issues**: समस्या नोंदवा किंवा सुधारणा सुचवा (एआय-विशिष्ट समस्या स्वागतार्ह)  
- **Discord चर्चासत्र**: Microsoft Foundry समुदायासोबत कल्पना शेअर करा आणि चर्चेत सहभागी व्हा  
- **पुल रिक्वेस्ट्स**: सामग्रीमध्ये थेट सुधारणा, विशेषतः एआय टेम्प्लेट्स आणि मार्गदर्शकांसाठी योगदान द्या  
- **Microsoft Foundry Discord**: AZD + AI चर्चांसाठी #Azure चॅनेलमध्ये सहभागी व्हा  
- **समुदाय फोरम**: विस्तारपूर्वक Azure विकसक चर्चेत सहभागी व्हा  

### अभिप्राय वर्गीकरण  
- **एआय सामग्रीची अचूकता**: एआय सेवा समाकलन आणि डिप्लॉयमेंट माहितीतील दुरुस्ती  
- **शिकण्याचा अनुभव**: सुधारित एआय विकसक शिकण्याच्या प्रवाहासाठी सूचना  
- **ढगाळलेली एआय सामग्री**: अतिरिक्त एआय टेम्प्लेट्स, नमुने किंवा उदाहरणांची मागणी  
- **प्रवेशयोग्यता**: विविध शिकवणी गरजांसाठी सुधारणा  
- **एआय साधन समाकलन**: उन्नत एआय विकास वर्कफ्लो समाकलनासाठी सूचना  
- **प्रॉडक्शन एआय नमुने**: एंटरप्राइझ एआय डिप्लॉयमेंट नमुन्यांची मागणी  

### प्रतिक्रियेची बांधिलकी  
- **समस्या प्रतिसाद**: नोंदवलेल्या समस्या 48 तासांत उत्तर  
- **वैशिष्ट्य विनंत्या**: एक आठवड्यांत मूल्यमापन  
- **समुदाय योगदान**: एक आठवड्यांत पुनरावलोकन  
- **सुरक्षा समस्या**: तातडीने प्राधान्याने प्रतिसाद  

## देखभाल वेळापत्रक  

### नियमित अद्यतने  
- **मासिक पुनरावलोकन**: सामग्रीची अचूकता आणि लिंक पडताळणी  
- **त्रैमासिक अद्यतने**: मुख्य सामग्री वाढी आणि सुधारणा  
- **अर्धवार्षिक पुनर्रचना**: व्यापक पुनर्गठन आणि सुधारणा  
- **वार्षिक प्रकाशने**: महत्त्वपूर्ण सुधारणा असलेले मुख्य आवृत्ती अपडेट्स  

### निरीक्षण आणि गुणवत्ता आश्वासन  
- **स्वयंचलित चाचण्या**: कोड उदाहरणे आणि लिंकची नियमित प्रमाणपत्रे  
- **समुदाय अभिप्राय समाकलन**: वापरकर्ता सूचना नियमितपणे समाविष्ट करणे  
- **तंत्रज्ञान अद्यतने**: नवीनतम Azure सेवा आणि azd प्रकाशनांसह संरेखन  
- **प्रवेशयोग्यता ऑडिट**: समावेशक डिझाईन तत्त्वे सुनिश्चित करण्यासाठी नियमित पुनरावलोकन  

## आवृत्ती समर्थन धोरण  

### वर्तमान आवृत्ती समर्थन  
- **नवीनतम मुख्य आवृत्ती**: नियमित अद्यतनांसह पूर्ण समर्थन  
- **पूर्वीची मुख्य आवृत्ती**: 12 महिन्यांसाठी सुरक्षा अद्यतने आणि महत्त्वाच्या दुरुस्त्या  
- **वरिष्ठ आवृत्त्या**: केवळ समुदाय समर्थन, अधिकृत अद्यतने नाहीत  

### स्थलांतर मार्गदर्शन  
जेव्हा मुख्य आवृत्त्या प्रसिद्ध होतात, तेव्हा आम्ही पुरवतो:  
- **स्थलांतर मार्गदर्शक**: टप्प्याटप्प्याने संक्रमण सूचना  
- **सुसंगतता नोंदी**: भंगपूर्ण बदलांची माहिती  
- **साधन समर्थन**: स्थलांतरास मदत करणारे स्क्रिप्ट्स किंवा युटिलिटी  
- **समुदाय समर्थन**: स्थलांतर प्रश्नांसाठी समर्पित फोरम  

---

**नेव्हिगेशन**  
- **मागील धडा**: [अभ्यास मार्गदर्शक](resources/study-guide.md)  
- **पुढील धडा**: [मुख्य README](README.md) कडे परत जा  

**ताजेतवाने राहा**: नवीन प्रकाशनांसाठी आणि शिकण्याच्या साहित्यांच्या महत्त्वाच्या अद्यतनांसाठी या रिपॉझिटरीवर सूचना पहा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->