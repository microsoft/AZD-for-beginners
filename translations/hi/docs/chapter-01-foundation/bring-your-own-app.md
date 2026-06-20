# अपने ही ऐप लाएँ - मौजूदा प्रोजेक्ट में azd जोड़ें

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Validated against `azd 1.25.6` in जून 2026.

## परिचय

In [Your First Project](first-project.md) आपने एक टेम्पलेट से शुरू करके एक ऐप डिप्लॉय किया था। लेकिन अधिकतर समय आपके पास पहले से ही एक ऐप होता है — एक Node.js API, एक Python Flask सेवा, एक .NET वेब ऐप — जो आपकी मशीन पर किसी फ़ोल्डर में पड़ा होता है। यह पाठ दिखाता है कि मौजूदा कोड में azd कैसे जोड़ा जाए ताकि आप `azd up` से इसे डिप्लॉय कर सकें, किसी टेम्पलेट की आवश्यकता नहीं है।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- azd प्रोजेक्ट शुरू करने के तीन तरीकों को समझेंगे
- मौजूदा कोडबेस के अंदर `azd init` चलाएँगे
- समझेंगे कि `azure.yaml` और `infra/` फ़ोल्डर आपकी ऐप के लिए क्या करते हैं
- जानेंगे कि कब azd को इंफ्रास्ट्रक्चर जेनरेट करने दें बनाम खुद लिखें
- अपने मौजूदा ऐप को Azure पर `azd up` से डिप्लॉय करेंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- किसी ऐसे प्रोजेक्ट में azd इनिशियलाइज़ करना जो आपके पास पहले से है
- एक बेसिक `azure.yaml` फ़ाइल पढ़ना और संपादित करना
- `azd infra generate` से स्टार्टर इन्फ्रा जनरेट करना
- अपनी ऐप के लिए उपयुक्त Azure होस्ट चुनना
- अपना एप्लिकेशन डिप्लॉय और क्लीनअप करना

---

## azd प्रोजेक्ट शुरू करने के तीन तरीके

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | सीखने के लिए, या एक प्रमाणित सैंपल से नया ऐप शुरू करने के लिए |
| **From your existing code** | `azd init` (in your project folder) | आपके पास पहले से एक ऐप है और आप इसे डिप्लॉय करना चाहते हैं |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | किसी मौजूदा रिपॉज़िटरी के लिए azd अपनाते समय |

आपने पहले विकल्प का अभ्यास किया था। यह पाठ दूसरा कवर करता है — जो असली दुनिया में सबसे आम परिदृश्य है।

---

## चरण 1: अपने प्रोजेक्ट में `azd init` चलाएँ

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

चुनें: **"Use code in the current directory."** azd तब आपके फ़ोल्डर को स्कैन करता है, आपकी भाषा और फ्रेमवर्क का पता लगाता है, और एक होस्ट प्रस्तावित करता है।

### azd क्या पहचानता है

azd ऐसे संकेतों की तलाश करता है जैसे `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, या एक `Dockerfile`, और एक मेल खाने वाला Azure होस्ट सुझाता है:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service या Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

पहचाने गए सर्विस(ओं) की पुष्टि करें, और azd उन फ़ाइलों का स्कैफ़ोल्ड कर देगा जिनकी आपको ज़रूरत है।

---

## चरण 2: समझें कि azd ने क्या बनाया

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

### `azure.yaml` — प्रोजेक्ट परिभाषा

यह azd प्रोजेक्ट का हृदय है। एक न्यूनतम `azure.yaml` ऐसा दिखता है:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` ब्लॉक प्रमुख हिस्सा है: प्रत्येक प्रविष्टि आपके कोड के एक फ़ोल्डर को Azure होस्ट से मैप करती है। यदि आपके ऐप में फ्रंटएंड और एक API दोनों हैं, तो आपके पास दो सर्विसेज़ होंगी।

### `infra/` — आपके Azure संसाधन कोड के रूप में

`infra/` फ़ोल्डर में वे Bicep फ़ाइलें होती हैं जो आपके ऐप के लिए आवश्यक Azure संसाधनों (App Service, डेटाबेस, आदि) को परिभाषित करती हैं। इन्हें आपको हाथ से लिखने की आवश्यकता नहीं है — azd एक कार्यशील शुरुआत जनरेट करता है। आप बाद में इन्हें संसाधन जोड़ने या सुरक्षा कड़ाई करने के लिए संपादित कर सकते हैं (कवर किया गया [Chapter 4](../chapter-04-infrastructure/README.md) में)।

> **टिप:** क्या आप डिप्लॉय करने से पहले जनरेट की गई इन्फ्रास्ट्रक्चर देखना या कस्टमाइज़ करना चाहते हैं? `azd infra generate` चलाएँ (यह `azd infra synth` के रूप में भी उपलब्ध है) ताकि IaC डिस्क पर लिखा जा सके और आप इसे समीक्षा और वर्शन-कंट्रोल कर सकें।

---

## चरण 3: आवश्यक कॉन्फ़िगरेशन सेट करें

यदि आपकी ऐप को सेटिंग्स या सीक्रेट्स (एक कनेक्शन स्ट्रिंग, एक API कुंजी) की आवश्यकता है, तो इन्हें हार्डकोड न करें। पर्यावरण मानों का उपयोग करें:

```bash
# एक वातावरण बनाएं
azd env new dev

# एक गैर-गोपनीय मान सेट करें
azd env set API_VERSION 1.0.0
```

वास्तविक सीक्रेट्स के लिए, इन्हें Key Vault में स्टोर करें और अपनी इंफ्रास्ट्रक्चर से संदर्भित करें — देखें [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## चरण 4: परिनियोजित करें

अब वही कार्यप्रवाह उपयोग करें जिसे आप पहले से जानते हैं:

```bash
# प्रमाणीकरण करें (azd के लिए आवश्यक)
azd auth login

# बनाए जाने वाले संसाधनों का पूर्वावलोकन करें
azd provision --preview

# बुनियादी ढांचा तैयार करें और अपना कोड परिनियोजित करें
azd up
```

जब यह समाप्त हो जाए, azd आपकी ऐप का URL प्रिंट करेगा। किसी भी azd ऐप की तरह इसे सत्यापित करें:

```bash
azd show           # एंडपॉइंट दिखाएँ
azd monitor --logs # आवश्यक होने पर लॉग जांचें
```

---

## सामान्य पहली बार की समस्याएँ

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | मेनिफेस्ट जोड़ें, या `azd init` के दौरान होस्ट मैन्युअली चुनें |
| Build fails during `azd up` | App needs a build step | `azure.yaml` में सर्विस के अंतर्गत `buildCommand`/`outputPath` जोड़ें |
| App starts but returns errors | Missing config/secret | `azd env set` से मान सेट करें या Key Vault को जोड़ें |
| Wrong host chosen | Auto-detection guessed | `azure.yaml` में `host:` संपादित करें और `azd up` फिर से चलाएँ |

अधिक के लिए, देखें [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## साफ़ करें

```bash
azd down --force --purge
```

---

## सारांश

- `azd init` → **"Use code in the current directory"** किसी ऐसे ऐप में azd जोड़ता है जो आपके पास पहले से है।
- `azure.yaml` आपके कोड फ़ोल्डरों को Azure होस्ट से मैप करता है; `infra/` Bicep के रूप में संसाधनों को परिभाषित करता है।
- `azd infra generate` आपको जनरेट की गई इन्फ्रास्ट्रक्चर की समीक्षा या अनुकूलन करने देता है।
- एक बार इनिशियलाइज़ हो जाने के बाद, आपका मौजूदा ऐप टेम्पलेट-आधारित ऐप के समान ही `azd up` / `azd down` वर्कफ़्लो का उपयोग करता है।

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 संबंधित संसाधन

- [AZD Basics](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->