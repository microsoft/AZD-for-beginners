# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Validated against `azd 1.25.6` in June 2026.

## परिचय

In [Your First Project](first-project.md) आपण टेम्पलेटपासून सुरूवात करून अ‍ॅप तैनात केले. पण बहुतेक वेळा तुमच्याकडे आधीपासूनच एक अ‍ॅप असतो — एक Node.js API, Python Flask सेवा, .NET वेब अ‍ॅप — जो तुमच्या मशीनवर एखाद्या फोल्डरमध्ये बसलेला असतो. हा धडा दर्शवितो की त्या विद्यमान कोडमध्ये azd कसे जोडावे जेणेकरून तुम्ही `azd up` वापरून ते तैनात करू शकता, कोणत्याही टेम्पलेटची गरज नाही.

## शिकण्याची उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- azd प्रोजेक्ट सुरू करण्याचे तीन मार्ग समजून घ्याल
- विद्यमान कोडबेसमध्ये `azd init` चालविण्याची पद्धत शिकलात
- `azure.yaml` आणि `infra/` फोल्डर तुमच्या अ‍ॅपसाठी काय करतात हे समजून घ्याल
- azd ला इन्फ्रास्ट्रक्चर निर्माण करायला द्यायचे की स्वतः लिहायचे हे ठरवता येईल
- तुमचे विद्यमान अ‍ॅप `azd up` ने Azure वर तैनात कराल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यावर, तुम्ही सक्षम असाल:
- ज्याप्रकारे तुम्ही आधीपासूनच प्रोजेक्टमध्ये azd इनिशियलाइज़ कराल
- एक मूलभूत `azure.yaml` फाईल वाचण्याची आणि संपादित करण्याची क्षमता
- `azd infra generate` ने स्टार्ट-अप इन्फ्रास्ट्रक्चर तयार करणे
- तुमच्या अ‍ॅपसाठी योग्य Azure होस्ट निवडणे
- स्वतःचे अ‍ॅप तैनात करणे आणि साफ करणे

---

## azd प्रोजेक्ट सुरू करण्याचे तीन मार्ग

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | शिकण्यासाठी, किंवा सिद्ध नमुन्यापासून नवीन अ‍ॅप सुरू करण्यासाठी |
| **From your existing code** | `azd init` (in your project folder) | तुमच्याकडे आधीपासून अ‍ॅप आहे आणि तुम्ही ते तैनात करू इच्छिता |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | विद्यमान रेपोसाठी azd स्वीकारताना |

तुम्ही आधीपहिल्या पर्यायाचा सराव केला आहे. हा धडा दुसऱ्या पर्यायावर लक्ष केंद्रित करतो — जो प्रत्यक्ष जगातील सर्वात सामान्य परिस्थिती आहे.

---

## Step 1: Run `azd init` in Your Project

Open a terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

निवडा **"Use code in the current directory."** azd नंतर तुमच्या फोल्डरची स्कॅन करते, तुमची भाषा आणि फ्रेमवर्क शोधते, आणि एक होस्ट सुचवते.

### azd काय ओळखते

azd `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, किंवा `Dockerfile` सारख्या संकेतांची शोध घेतो, आणि जुळणारा Azure होस्ट सुचवितो:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

ओळखलेल्या सेवा/सेवांची पुष्टी करा, आणि azd आवश्यक फायली स्कॅफोल्ड करते.

---

## Step 2: Understand What azd Created

After init, you'll have two new things in your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — the project definition

हा azd प्रोजेक्टचा हृदयभाग आहे. एक किमान उदाहरण असे दिसते:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` ब्लॉक हा मुख्य भाग आहे: प्रत्येक एन्ट्री तुमच्या कोडच्या एखाद्या फोल्डरला Azure होस्टशी मॅप करते. जर तुमच्या अ‍ॅपमध्ये फ्रंटएंड आणि API दोन्ही असतील, तर तुमच्याकडे दोन सेवा असतील.

### `infra/` — your Azure resources as code

`infra/` फोल्डरमध्ये Bicep फाइल्स असतात ज्या तुमच्या अ‍ॅपसाठी आवश्यक Azure संसाधने (App Service, डेटाबेस इ.) परिभाषित करतात. तुम्हाला हे हस्तलिखित लिहायची गरज नाही — azd एक कार्यरत प्रारंभिक बिंदू तयार करते. तुम्ही नंतर हे संपादित करून अतिरिक्त संसाधने जोडू शकता किंवा सुरक्षा घट्ट करू शकता (याबद्दल [अध्याय 4](../chapter-04-infrastructure/README.md) मध्ये तपशीलवार).

> **Tip:** तैनात करण्यापूर्वी जनरेट केलेले इन्फ्रास्ट्रक्चर पाहण्याची किंवा सानुकूल करण्याची इच्छा आहे का? `azd infra generate` चालवा (हे `azd infra synth` म्हणूनही उपलब्ध आहे) जेणेकरून IaC डिस्कवर लिहिले जाईल आणि तुम्ही ते पुनरावलोकन व व्हर्जन-कंट्रोल करू शकता.

---

## Step 3: Set Required Configuration

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# पर्यावरण तयार करा
azd env new dev

# गुप्त नसलेले मूल्य सेट करा
azd env set API_VERSION 1.0.0
```

खऱ्या सिक्रेट्ससाठी, त्यांना Key Vault मध्ये संग्रहित करा आणि तुमच्या इन्फ्रास्ट्रक्चरमधून त्यांना संदर्भित करा — पहा [अध्याय 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow you already know:

```bash
# प्रमाणीकृत करा (azd साठी आवश्यक)
azd auth login

# निर्मित होणाऱ्या संसाधनांचे पूर्वावलोकन करा
azd provision --preview

# पायाभूत सुविधा तरतूद करा आणि तुमचा कोड तैनात करा
azd up
```

जेव्हा ते पूर्ण होते, azd तुमच्या अ‍ॅपचा URL छापते. त्याची पडताळणी खालीलप्रमाणे करा जशी कोणत्याही azd अ‍ॅपसाठी करतात:

```bash
azd show           # एंडपॉइंट्स दाखवा
azd monitor --logs # गरज असल्यास लॉग तपासा
```

---

## सामान्य प्रथम-वेळ समस्या

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

अधिक माहितीसाठी पाहा [अध्याय 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## काढून टाका

```bash
azd down --force --purge
```

---

## सारांश

- `azd init` → **"Use code in the current directory"** हा पर्याय तुमच्याकडे आधीपासून असलेल्या अ‍ॅपमध्ये azd जोडतो.
- `azure.yaml` तुमच्या कोड फोल्डर्सना Azure होस्टशी मॅप करते; `infra/` Bicep म्हणून संसाधने परिभाषित करते.
- `azd infra generate` तुम्हाला जनरेट केलेले इन्फ्रास्ट्रक्चर पुनरावलोकन किंवा सानुकूल करण्याची परवानगी देते.
- एकदा इनिशियलाइझ केल्यावर, तुमचे विद्यमान अ‍ॅप टेम्पलेट-आधारित अ‍ॅपप्रमाणेच `azd up` / `azd down` वर्कफ्लो वापरेल.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 संबंधित स्त्रोत

- [AZD मूलतत्त्वे](azd-basics.md)
- [अध्याय 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->