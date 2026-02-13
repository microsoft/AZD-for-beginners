# ఇన్‌స్టాలేషన్ & సెటప్ గైడ్

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికుల కోసం](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 1 - ప్రాథమికం & త్వరిత ప్రారంభం
- **⬅️ పూర్వం**: [AZD ప్రాథమికాలు](azd-basics.md)
- **➡️ తదుపరి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 2: AI-ప్రథమ అభివృద్ధి](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

ఈ సమగ్ర మార్గదర్శకం మీ సిస్టమ్‌లో Azure Developer CLI (azd)ని ఇన్‌స్టాల్ చేసి కాన్ఫిగర్ చేయడంలో మీకు దశల వారిగా సహాయం చేస్తుంది. వివిధ ఆపరేటింగ్ సిస్టమ్‌ల కోసం బహు ఇన్‌స్టాలేషన్ విధానాలు, ఆథెంటికేషన్ సెటప్, మరియు Azure డిప్లాయ్‌మెంట్‌ల కోసం మీ డెవలప్‌మెంట్ పరిసరాన్ని ప్రారంభంగా కాన్ఫిగర్ చేయటానికి అవసరమైన ప్రాథమిక సెట్టింగులను మీరు నేర్చుకుంటారు.

## నేర్చుకునే లక్ష్యాలు

ఈ పాఠం చివరకి, మీరు:
- మీ ఆపరేటింగ్ సిస్టమ్‌పై Azure Developer CLI విజయవంతంగా ఇన్‌స్టాలేషన్ చేయగలుగుతారు
- వివిధ పద్ధతులతో Azure తో ఆథెంటికేషన్ కాన్ఫిగర్ చేయగలుగుతారు
- అవసరమైన ప్రీరిక్విజిట్లతో మీ డెవలప్‌మెంట్ పరిసరాన్ని సెట్ చేసుకోగలుగుతారు
- వివిధ ఇన్‌స్టాలేషన్ ఎంపికలను మరియు వాటిని ఎప్పుడు ఉపయోగించాలో అర్థం చేసుకోగలుగుతారు
- సాధారణ ఇన్‌స్టాలేషన్ మరియు సెటప్ సమస్యలను తీర్చగలుగుతారు

## నేర్చుకున్న ఫలితాలు

ఈ పాఠం పూర్తి చేసిన తర్వాత, మీరు చేయగలిగే విషయాలు:
- మీ ప్లాట్‌ఫార్మ్‌కు అనుగుణమైన పద్ధతితో azd ఇన్‌స్టాల్ చేయగలిగే సామర్థ్యం
- azd auth login ఉపయోగించి Azure తో ఆథెంటికేట్ చేయగలిగే సామర్థ్యం
- ఇన్‌స్టాలేషన్‌ను నిర్ధారించి ప్రాథమిక azd కమాండ్లను పరీక్షించగలిగే సామర్థ్యం
- azd ఉపయోగానికి సరైన విధంగా మీ డెవలప్‌మెంట్ పరిసరాన్ని కాన్ఫిగర్ చేయగలిగే సామర్థ్యం
- సాధారణ ఇన్‌స్టాలేషన్ సమస్యలను స్వతంత్రంగా పరిష్కరించగలిగే సామర్థ్యం

ఈ గైడ్ మీ ఆపరేటింగ్ సిస్టమ్ లేదా డెవలప్‌మెంట్ పరిసరాన్ని సహా, Azure Developer CLI ని మీ సిస్టమ్‌లో ఇన్‌స్టాల్ చేసి కాన్ఫిగర్ చేయడంలో మీకు సహాయపడుతుంది.

## ప్రీరిక్విజిట్స్

azd ఇన్‌స్టాల్ చేసేముందు, మీ వద్ద ఉండాలి:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - ఆథెంటికేషన్ మరియు రిసోర్స్ మేనేజ్‌మెంట్ కోసం
- **Git** - టెంప్లేట్లను క్లోన్ చేయడానికి మరియు వెర్షన్ కంట్రోల్ కోసం
- **Docker** (ఐచ్ఛికం) - కంటైనరైజ్డ్ అప్లికేషన్ల కోసం

## ఇన్‌స్టాలేషన్ విధానాలు

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# అడ్మినిస్ట్రేటర్‌గా లేదా ఉన్నత అనుమతులతో అమలు చేయండి
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# డౌన్లోడ్ చేయి, ఇన్స్టాల్ చేయండి
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft ప్యాకేజీ రిపాజిటరీని జోడించండి
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd ను ఇన్‌స్టాల్ చేయండి
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft ప్యాకేజ్ రిపాజిటరీని జోడించండి
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces లో ముందే ఇన్‌స్టాల్ చేయబడినగా ఉంటుంది. ఒక codespace సృష్టించి తక్షణమే azd ఉపయోగించడం ప్రారంభించండి.

### Docker

```bash
# azd‌ను కంటైనర్‌లో నడపండి
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# సులభంగా ఉపయోగించడానికి అలియాస్‌ను సృష్టించండి
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ఇన్‌స్టాలేషన్ నిర్ధారించండి

ఇన్‌స్టాలేషన్ తర్వాత, azd సరిగా పని చేస్తున్నదో కాదో నిర్ధారించండి:

```bash
# సంస్కరణను తనిఖీ చేయండి
azd version

# సహాయం చూడండి
azd --help

# అందుబాటులో ఉన్న టెంప్లేట్లను జాబితా చేయండి
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**గమనిక**: వాస్తవ వెర్షన్ సంఖ్య వేరుగా ఉంటుంది. తాజా వెర్షన్ కోసం చూడండి [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases).

**✅ ఇన్‌స్టాలేషన్ విజయ లక్ష్య పట్టిక:**
- [ ] `azd version` లో ఎటువంటి పొరపాటు లేకుండా వెర్షన్ సంఖ్య చూపించాలి
- [ ] `azd --help` కమాండ్ డాక్యుమెంటేషన్ చూపించాలి
- [ ] `azd template list` అందుబాటులో ఉన్న టెంప్లేట్లను చూపించాలి
- [ ] `az account show` మీ Azure subscription ను చూపించాలి
- [ ] మీరు ఒక పరీక్ష డైరెక్టరీ సృష్టించి `azd init` విజయవంతంగా నిర్వహించగలగాలి

**అన్ని పరీక్షలూ సరైనవైతే, మీరు [మీ మొదటి ప్రాజెక్ట్](first-project.md)కు వెళ్లేందుకు సిద్ధంగా ఉన్నారు!**

## ప్రమాణీకరణ సెటప్

### Azure CLI ప్రమాణీకరణ (సిఫార్సు చేయబడింది)
```bash
# Azure CLI ఇప్పటికీ ఇన్‌స్టాల్ చేయనట్లయితే ఇన్‌స్టాల్ చేయండి
# విండోస్: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# లినక్స్: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azureలో లాగిన్ అవ్వండి
az login

# ప్రామాణీకరణను ధృవీకరించండి
az account show
```

### Device Code Authentication
మీరు హెడ్‌లెస్ సిస్టమ్‌లో ఉన్నట్లయితే లేదా బ్రౌజర్ సమస్యలు ఎదురైతే:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
ఆటోమేటెడ్ పరిసరాల కోసం:
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

# అన్ని కాన్ఫిగరేషన్‌లను వీక్షించండి
azd config list
```

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్
మీ షెల్ ప్రొఫైల్ (`.bashrc`, `.zshrc`, `.profile`)లో జోడించండి:
```bash
# Azure కాన్ఫిగరేషన్
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd కాన్ఫిగరేషన్
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # డీబగ్ లాగింగ్ సక్రియం చేయండి
```

## IDE సమాకరణ

### Visual Studio Code
Azure Developer CLI ఎక్స్టెన్షన్ ఇన్‌స్టాల్ చేయండి:
1. VS Code ఓపెన్ చేయండి
2. Extensions (Ctrl+Shift+X) కి వెళ్లు
3. "Azure Developer CLI" అని శోధించండి
4. ఎక్స్టెన్షన్‌ను ఇన్‌స్టాల్ చేయండి

ఫీచర్లు:
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
1. Azure ప్లగిన్‌ను ఇన్‌స్టాల్ చేయండి
2. Azure క్రెడెన్షియల్స్‌ను కాన్ఫిగర్ చేయండి
3. azd కమాండ్ల కోసం ఇంటిగ్రేటెడ్ టెర్మినల్ ఉపయోగించండి

## 🐛 ఇన్‌స్టాలేషన్ ట్రబుల్షూటింగ్

### సాధారణ సమస్యలు

#### అనుమతి నిరాకరించబడింది (Windows)
```powershell
# PowerShell ను అడ్మినిస్ట్రేటర్‌గా అమలు చేయండి
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH సమస్యలు
ఇప్పుడు azd ను మీ PATH లో మానవీయంగా జోడించండి:

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

# SSL ధృవీకరణను దాటవేయండి (ఉత్పత్తి కోసం సిఫార్సు చేయబడదు)
azd config set http.insecure true
```

#### వెర్షన్ సంఘర్షణలు
```bash
# పాత ఇన్‌స్టాలేషన్లను తొలగించండి
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# కాన్ఫిగరేషన్‌ను శుభ్రం చేయండి
rm -rf ~/.azd
```

### మరింత సహాయం పొందడం
```bash
# డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd <command> --debug

# ప్రస్తుత కాన్ఫిగరేషన్‌ను చూడండి
azd config list

# ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితిని చూడండి
azd show
```

## azd ను నవీకరించడం

### ఆటోమాటిక్ నవీకరణలు
azd కు నవీకరణలు అందుబాటులో ఉంటే అది మీకు తెలియజేస్తుంది:
```bash
azd version --check-for-updates
```

### మాన్యువల్ నవీకరణలు

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
<summary><strong>azd మరియు az CLI మధ్య తేడా ఏమిటి?</strong></summary>

**Azure CLI (az)**: వ్యక్తిగత Azure రిసోర్సులని నిర్వహించే తక్కువ స్థాయి సాధనం
- `az webapp create`, `az storage account create`
- ఒక్కోసారి ఒక్కో రిసోర్స్‌ను నిర్వహిస్తుంది
- మౌలిక వనరుల నిర్వహణపై దృష్టి

**Azure Developer CLI (azd)**: పూర్తి అప్లికేషన్ డిప్లాయ్‌మెంట్స్ కోసం ఉన్న ఉన్నత స్థాయి సాధనం
- `azd up` మొత్తం అప్లికేషన్‌ను మరియు అన్ని రిసోర్సులను డిప్లాయ్ చేస్తుంది
- టెంప్లేట్-ఆధారిత వర్క్‌ఫ్లోలు
- డెవలపర్ ఉత్పాదకతపై దృష్టి

**మీకు రెండింటి అవసరం**: azd ఆథెంటికేషన్ కోసం az CLI ను ఉపయోగిస్తుంది
</details>

<details>
<summary><strong>నేను azd ను ఉన్నతమైన Azure రిసోర్సులతో ఉపయోగించవచ్చా?</strong></summary>

అవును! మీరు చేయగలుగుతారు:
1. ఉన్నత రిసోర్సులను azd పరిసరాల్లో ఇంపోర్ట్ చేయండి
2. ఉన్నత రిసోర్సులను మీ Bicep టెంప్లేట్స్‌లో రిఫరెన్స్ చేయండి
3. ఉన్న ఇన్‍ఫ్రాస్ట్రక్చర్ తో పాటు కొత్త డిప్లాయ్‌మెంట్‌ల కోసం azd ఉపయోగించండి

వివరాలకు చూడండి [Configuration Guide](configuration.md).
</details>

<details>
<summary><strong>azd Azure Government లేదా Azure China తో పని చేస్తుందా?</strong></summary>

అవును, క్లౌడ్‌ను కాన్ఫిగర్ చేయండి:
```bash
# Azure ప్రభుత్వం
az cloud set --name AzureUSGovernment
az login

# Azure చైనా
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>నేను CI/CD పైప్లైన్లలో azd ను ఉపయోగించగలనా?</strong></summary>

ఖచ్చితంగా! azd ఆటోమేషన్ కోసం డిజైన్ చేయబడింది:
- GitHub Actions సమాకరణ
- Azure DevOps మద్దతు
- సర్వీస్ ప్రిన్సిపల్ ఆథెంటికేషన్
- నాన్-ఇంటరాక్టివ్ మోడ్

CI/CD నమూనాల కోసం చూడండి [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>azd ఉపయోగించడానికి ఖర్చు ఎంత?</strong></summary>

azd స్వయంగా **పూర్తిగా ఉచితం** మరియు ఓపెన్-సోర్స్. మీరు కేవలంకి చెల్లించవలసింది:
- మీరు డిప్లాయ్ చేసే Azure రిసోర్సులు
- Azure వినియోగ ఖర్చులు (compute, storage, మొదలైనవి)

డిప్లాయ్‌మెంట్‌కు ముందు ఖర్చుల అంచనాకు `azd provision --preview` ఉపయోగించండి.
</details>

## తరువాతి దశలు

1. **ప్రమాణీకరణ పూర్తి చేయండి**: మీరు మీ Azure subscription కు యాక్సెస్ కలిగి ఉన్నారా అని నిర్ధారించండి
2. **మీ మొదటి డిప్లాయ్‌మెంట్ ప్రయత్నించండి**: [First Project Guide](first-project.md) ను అనుసరించండి
3. **టెంప్లేట్లను అన్వేషించండి**: `azd template list` తో అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
4. **మీ IDE ని కాన్ఫిగర్ చేయండి**: మీ డెవలప్‌మెంట్ పరిసరాన్ని సెట్ చేయండి

## మద్దతు

మీకు సమస్యలు ఎదురైనప్పుడు:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికుల కోసం](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 1 - ప్రాథమికం & త్వరిత ప్రారంభం
- **⬅️ పూర్వం**: [AZD ప్రాథమికాలు](azd-basics.md) 
- **➡️ తదుపరి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 2: AI-ప్రథమ అభివృద్ధి](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ఇన్‌స్టాలేషన్ పూర్తి!** azd తో నిర్మించటం ప్రారంభించడానికి [మీ మొదటి ప్రాజెక్ట్](first-project.md) కి కొనసాగండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
అస్పష్టీకరణ:
ఈ డాక్యుమెంట్‌ను AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించారు. మేము ఖచ్చితత్వానికి మేలుకోవడానికి ప్రయత్నించినప్పటికీ, ఆటోమెటెడ్ అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండవచ్చని దయచేసి గమనించండి. సహజ భాషలో ఉన్న అసలు డాక్యుమెంట్‌ను అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదం వినియోగం కారణంగా ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుగా వివరించడంవల్ల జరిగిన పరిణామాల కోసం మేము బాధ్యులు కాకపోవచ్చు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->