# ఇన్‌స్టాలేషన్ & సెటప్ గైడ్

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 1 - ప్రాథమికం & త్వరిత ప్రారంభం
- **⬅️ మునుపటి**: [AZD Basics](azd-basics.md)
- **➡️ తదుపరి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **🚀 తదుపరి అధ్యాయం**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

ఈ సమగ్ర గైడ్ మీ సిస్టమ్‌లో Azure Developer CLI (azd) ను ఇన్‌స్టాల్ చేసి అమర్చడం గురించి మీరు దశల వారీగా నేర్చుకునేలా తయారు చేయబడింది. వివిధ ఆపరేటింగ్ సిస్టమ్‌ల కోసం అనేక ఇన్‌స్టాలేషన్ పద్ధతులు, ప్రామాణీకరణ సెటప్ మరియు Azure డిప్లాయ్‌మెంట్స్ కోసం మీ డెవలప్‌మెంట్ పరిసరాన్ని ప్రారంభించడానికి అవసరమైన ప్రాథమిక కాన్ఫిగరేషన్ గురించి మీరు నేర్చుకుంటారు.

## శిక్షణ లక్ష్యాలు

ఈ పాఠం చివరికి, మీరు:
- మీ ఆపరేటింగ్ సిస్టమ్‌లో Azure Developer CLI విజయవంతంగా ఇన్‌స్టాల్ చేయగలుగుతారు
- వివిధ పద్ధతులతో Azure తో ప్రామాణీకరణని కాన్ఫిగర్ చేయగలుగుతారు
- అవసరమైన ముందస్తు షరతులతో మీ డెవలప్‌మెంట్ పర్యావరణాన్ని సెటప్ చేయగలుగుతారు
- వివిధ ఇన్‌స్టాలేషన్ ఎంపికలు మరియు వాటిని ఎప్పుడు ఉపయోగించాలో అర్థం చేసుకుంటారు
- సాధారణ ఇన్‌స్టాలేషన్ మరియు సెటప్ సమస్యలను పరిష్కరించగలుగుతారు

## అభ్యసన ఫలితాలు

ఈ పాఠాన్ని పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- మీ ప్లాట్‌ఫారమ్‌కు అనుకూలమైన పద్ధతిని ఉపయోగించి azd ఇన్‌స్టాల్ చేయడం
- azd auth login ఉపయోగించి Azure తో ప్రామాణీకరించటం
- మీ ఇన్‌స్టాలేషన్‌ని పరిశీలించడం మరియు ప్రాథమిక azd కమాండ్లను పరీక్షించడం
- azd వినియోగానికి మీ డెవలప్‌మెంట్ పర్యావరణాన్ని అత్యుత్తమంగా కాన్ఫిగర్ చేయడం
- సాధారణ ఇన్‌స్టాలేషన్ సమస్యలను స్వతంత్రంగా పరిష్కరించడం

ఈ గైడ్ మీ ఆపరేటింగ్ సిస్టమ్ లేదా డెవలప్‌మెంట్ పర్యావరణం ఏమైనా సరే, Azure Developer CLI ను మీ సిస్టమ్‌లో ఇన్‌స్టాల్ చేసి కాన్ఫిగర్ చేయడంలో మీకు సహాయం చేస్తుంది.

## ముందస్తు అవసరాలు

azd ని ఇన్‌స్టాల్ చేసేముందు, మీ వద్ద ఈ క్రింది అంశాలు ఉన్నాయో లేదో నిర్ధారించండి:
- **Azure subscription** - [ఉచిత ఖాతాను సృష్టించండి](https://azure.microsoft.com/free/)
- **Azure CLI** - ప్రామాణీకరణ మరియు వనరు నిర్వహణ కోసం
- **Git** - టెంప్లేట్లు క్లోన్ చేయడం మరియు వెర్షన్ కంట్రోల్ కోసం
- **Docker** (ఐచ్చికం) - కంటైనర్‌భరిత అనువర్తనాల కోసం

## ఇన్‌స్టాలేషన్ పద్ధతులు

### Windows

#### ఎంపిక 1: PowerShell (సిఫార్సు చేయబడింది)
```powershell
# యాడ్మినిస్ట్రేటర్‌గా లేదా ఎత్తైన హక్కులతో నడపండి
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ఎంపిక 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### ఎంపిక 3: Chocolatey
```cmd
choco install azd
```

#### ఎంపిక 4: మానువల్ ఇన్‌స్టాలేషన్
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### ఎంపిక 1: Homebrew (సిఫార్సు చేయబడింది)
```bash
brew tap azure/azd
brew install azd
```

#### ఎంపిక 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ఎంపిక 3: మానువల్ ఇన్‌స్టాలేషన్
```bash
# డౌన్‌లోడ్ చేసి ఇన్‌స్టాల్ చేయండి
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### ఎంపిక 1: Install Script (సిఫార్సు చేయబడింది)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ఎంపిక 2: ప్యాకేజ్ మేనేజర్లు

**Ubuntu/Debian:**
```bash
# Microsoft ప్యాకేజ్ రిపోజిటరీని జోడించండి
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ను ఇన్స్టాల్ చేయండి
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft ప్యాకేజ్ రిపోజిటరీని జోడించండి
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces లో ముందుగానే ఇన్‌స్టాల్ చేయబడిన ఉంటుంది. సాదా codespace ను సృష్టించి తక్షణమే azd వినియోగాన్ని ప్రారంభించండి.

### Docker

```bash
# azdను ఒక కంటైనర్‌లో నడపండి
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# సులభంగా ఉపయోగించేందుకు ఒక అలియాస్ సృష్టించండి
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ఇన్‌స్టాలేషన్‌ని నిర్ధారించండి

ఇన్‌స్టాలేషన్ తర్వాత, azd సరైనదిగా పనిచేస్తుందో లేదో నిర్ధారించండి:

```bash
# సంస్కరణను తనిఖీ చేయండి
azd version

# సహాయం చూడండి
azd --help

# అందుబాటులో ఉన్న టెంప్లేట్లను జాబితా చేయండి
azd template list
```

అంచనా అవుట్పుట్:
```
azd version 1.x.x (commit xxxxxx)
```

**గమనిక**: వాస్తవ వెర్షన్ నంబర్ మారవచ్చు. తాజా వెర్షన్ కోసం చూసి చక్కర చూడండి: [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases).

**✅ ఇన్‌స్టాలేషన్ విజయ చెక్లిస్ట్:**
- [ ] `azd version` తప్పులుండకుండా వెర్షన్ నంబర్ చూపిస్తుంది
- [ ] `azd --help` కమాండ్ డాక్యుమెంటేషన్‌ను ప్రదర్శిస్తుంది
- [ ] `azd template list` అందుబాటులో ఉన్న టెంప్లేట్లను చూపిస్తుంది
- [ ] `az account show` మీ Azure సబ్‌స్క్రిప్షన్‌ను చూపిస్తుంది
- [ ] మీరు ఒక టెస్ట్ డైరెక్టరీ సృష్టించి `azd init` విజయవంతంగా నడిపి చూడగలుగుతారు

**అన్ని పరీక్షలు సరైనవైతే, మీరు [మీ మొదటి ప్రాజెక్ట్](first-project.md) వైపు కొనసాగడానికి సిద్ధంగా ఉన్నారు!**

## ప్రామాణీకరణ సెటప్

### Azure CLI ద్వారా ప్రామాణీకరణ (సిఫార్సు చేయబడింది)
```bash
# ఇంతవరకు ఇన్‌స్టాల్ చేయబడకపోతే Azure CLIని ఇన్‌స్టాల్ చేయండి
# విండోస్: winget install Microsoft.AzureCLI
# మ్యాక్ఓఎస్: brew install azure-cli
# లినక్స్: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azureలో లాగిన్ అవ్వండి
az login

# ప్రామాణీకరణను ధృవీకరించండి
az account show
```

### డివైస్ కోడ్ ప్రామాణీకరణ
మీరు హెడ్‌లెస్ సిస్టమ్‌లో ఉన్నట్లయితే లేదా బ్రౌజర్ సమస్యలు ఎదురైతే:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
ఆటోమేషన్ పర్యావరణాల కొరకు:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## కాన్ఫిగరేషన్

### గ్లోబల్ కాన్ఫిగరేషన్
```bash
# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
azd config set defaults.subscription <subscription-id>

# డిఫాల్ట్ స్థానాన్ని సెట్ చేయండి
azd config set defaults.location eastus2

# అన్ని కాన్ఫిగరేషన్లను వీక్షించండి
azd config list
```

### పర్యావరణ వేరియబుల్స్
మీ శెల్ ప్రొఫైల్ (`.bashrc`, `.zshrc`, `.profile`) లో చేర్చండి:
```bash
# Azure కాన్ఫిగరేషన్
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd కాన్ఫిగరేషన్
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # డీబగ్ లాగింగ్‌ను ప్రారంభించండి
```

## IDE ఇంటిగ్రేషన్

### Visual Studio Code
Azure Developer CLI ఎక్స్‌టెన్షన్‌ని ఇన్‌స్టాల్ చేయండి:
1. VS Code ఓపెన్ చేయండి
2. ఎక్స్‌టెన్షన్స్ (Ctrl+Shift+X) కి వెళ్లండి
3. "Azure Developer CLI" కోసం శోధించండి
4. ఎక్స్‌టెన్షన్‌ను ఇన్‌స్టాల్ చేయండి

వైశిష్ట్యాలు:
- azure.yaml కోసం IntelliSense
- ఇంటిగ్రేటెడ్ టెర్మినల్ కమాండ్లు
- టెంప్లేట్ బ్రౌజింగ్
- డిప్లాయ్‌మెంట్ మానిటరింగ్

### GitHub Codespaces
`.devcontainer/devcontainer.json` సృష్టించండి:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Azure ప్లగిన్ ఇన్‌స్టాల్ చేయండి
2. Azure క్రెడెన్షియల్స్‌ని కాన్ఫిగర్ చేయండి
3. azd కమాండ్ల కోసం ఇంటిగ్రేటెడ్ టెర్మినల్ ఉపయోగించండి

## 🐛 ఇన్‌స్టాలేషన్ ట్రబుల్‌షూటింగ్

### సాధారణ సమస్యలు

#### అనుమతి నిరాకరించబడింది (Windows)
```powershell
# PowerShellను అడ్మినిస్ట్రేటర్‌గా అమలు చేయండి
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH సమస్యలు
azd ను మీ PATH కి మాన్యువల్లిగా చేర్చండి:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### నెట్‌వర్క్/ప్రాక్సీ సమస్యలు
```bash
# ప్రాక్సీని కాన్ఫిగర్ చేయండి
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ప్రమాణీకరణను మినహాయించండి (ఉత్పత్తి వాతావరణంలో సిఫార్సు చేయబడదు)
azd config set http.insecure true
```

#### వెర్షన్ సంగర్షణలు
```bash
# పాత ఇన్‌స్టాలేషన్లను తొలగించండి
# విండోస్: winget uninstall Microsoft.Azd
# మ్యాక్‌ఓఎస్: brew uninstall azd
# లినక్స్: sudo apt remove azd

# కాన్ఫిగరేషన్‌ను శుభ్రం చేయండి
rm -rf ~/.azd
```

### మరింత సహాయం పొందడం
```bash
# డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd <command> --debug

# ప్రస్తుత కాన్ఫిగరేషన్‌ను వీక్షించండి
azd config list

# ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితిని వీక్షించండి
azd show
```

## azd ను అప్‌డేట్ చేయడం

### స్వయంచాలక నవీకరణలు
azd నవీకరణలు అందుబాటులో ఉన్నప్పుడు మీకు తెలియజేస్తుంది:
```bash
azd version --check-for-updates
```

### మాన్యువల్ అప్డేట్స్

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 తరచుగా అడిగే ప్రశ్నలు

<details>
<summary><strong>azd మరియు az CLI లో తేడా ఏమిటి?</strong></summary>

**Azure CLI (az)**: వ్యక్తిగత Azure వనరులను నిర్వహించడానికి లో-లెవల్ సాధనం
- `az webapp create`, `az storage account create`
- ఒకేసారి ఒక వనరు
- ఇన్ఫ్రాస్ట్రక్చర్ నిర్వహణపై దృష్టి

**Azure Developer CLI (azd)**: పూర్తి అప్లికేషన్ డిప్లాయ్‌మెంట్స్ కొరకు హై-లెవల్ సాధనం
- `azd up` అన్ని వనరులతో మొత్తం అప్లికేషన్‌ను డిప్లాయ్ చేస్తుంది
- టెంప్లేట్-ఆధారిత వర్క్‌ఫ్లోలు
- డెవలపర్ ఉత్పాదకతపై దృష్టి

**మీకు రెండూ అవసరం**: azd ఆథెంటికేషన్ కోసం az CLI ను ఉపయోగిస్తుంది
</details>

<details>
<summary><strong>నేను azd ను ఇప్పటికే ఉన్న Azure వనరులతో ఉపయోగించగలనా?</strong></summary>

అవును! మీరు చేయగలరు:
1. ఇప్పటికే ఉన్న వనరులను azd ఎన్విరాన్‌మెంట్లకు ఇంపోర్ట్ చేయండి
2. Bicep టెంప్లేట్లలో ఉన్న వనరులను రిఫరెన్స్ చేయండి
3. కొత్త డిప్లాయ్‌మెంట్స్ కోసం azd ను ఉన్న ఇన్ఫ్రాస్ట్రక్చర్‌తో పాటు ఉపయోగించండి

వివరాల కోసం చూడండి [కాన్ఫిగరేషన్ గైడ్](configuration.md).
</details>

<details>
<summary><strong>azd Azure Government లేదా Azure China తో పని చేస్తాడా?</strong></summary>

అవును, క్లౌడ్‌ని కాన్ఫిగర్ చేయండి:
```bash
# ఆజ్యూర్ ప్రభుత్వం
az cloud set --name AzureUSGovernment
az login

# ఆజ్యూర్ చైనా
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>నేను azd ను CI/CD పైప్లైన్స్ లో ఉపయోగించగలనా?</strong></summary>

ఖచ్చితంగా! azd ఆటోమేషన్ కోసం డిజైన్ చేయబడింది:
- GitHub Actions ఇంటిగ్రేషన్
- Azure DevOps మద్దతు
- Service principal ప్రామాణీకరణ
- నాన్-ఇంటరాక్టివ్ మోడ్

CI/CD నమూనాల కోసం చూడండి [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>azd ఉపయోగించడానికి ఖర్చు ఎంత?</strong></summary>

azd స్వయంగా **పూర్తిగా ఉచితం** మరియు ఓపెన్-సోర్స్. మీరు కేవలం ఖర్చు చెల్లిస్తారు:
- మీరు డిప్లాయ్ చేసుకునే Azure వనరులు
- Azure వినియోగ ఖర్చులు (compute, storage, మొదలైనవి)

డిప్లాయ్‌మెంట్ ముందే ఖర్చుల అంచనాకు `azd provision --preview` ను ఉపయోగించండి.
</details>

## తదుపరి దశలు

1. **ప్రామాణీకరణ పూర్తి చేయండి**: మీ Azure సబ్‌స్క్రిప్షన్‌కి యాక్సెస్ ఉందో లేదో నిర్ధారించండి
2. **మీ మొదటి డిప్లాయ్‌మెంట్ ప్రయత్నించండి**: [మొదటి ప్రాజెక్ట్ గైడ్](first-project.md)ని అనుసరించండి
3. **టెంప్లేట్లను అన్వేషించండి**: `azd template list` తో అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
4. **మీ IDE ను కాన్ఫిగర్ చేయండి**: మీ డెవలప్‌మెంట్ పర్యావరణాన్ని సెటప్ చేయండి

## మద్దతు

మీకు సమస్యలు ఎదురైతే:
- [అధికారిక డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [సమస్యలు నివేదించండి](https://github.com/Azure/azure-dev/issues)
- [సమూహ చర్చలు](https://github.com/Azure/azure-dev/discussions)
- [Azure మద్దతు](https://azure.microsoft.com/support/)
- [**Azure ఏజెంట్ స్కిల్స్**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` ఉపయోగించి ఎడిటర్లోనే Azure కమాండ్ మార్గదర్శకత్వాన్ని పొందండి

---

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 1 - ప్రాథమికం & త్వరిత ప్రారంభం
- **⬅️ మునుపటి**: [AZD Basics](azd-basics.md) 
- **➡️ తదుపరి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **🚀 తదుపరి అధ్యాయం**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ఇన్‌స్టాలేషన్ పూర్తి!** azd తో నిర్మించటం ప్రారంభించడానికి [మీ మొదటి ప్రాజెక్ట్](first-project.md) కి కొనసాగండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండొచ్చని దయచేసి గమనించండి. మూల భాషలోని అసలు డాక్యుమెంట్‌ను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం చేయించుకోవాలని సిఫారసు చేయబడుతుంది. ఈ అనువాదం ఉపయోగించడంతో సంభవించే ఏవైనా అపార్థాలు లేదా తప్పుడు వ్యాఖ్యానాల కోసం మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->