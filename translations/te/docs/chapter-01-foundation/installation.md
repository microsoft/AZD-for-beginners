# ఇన్‌స్టాలేషన్ & సెటప్ గైడ్

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభకులకు](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: అధ్యాయం 1 - పునాది మరియు త్వరిత ప్రారంభం
- **⬅️ ముందు**: [AZD Basics](azd-basics.md)
- **➡️ తరువాత**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **🚀 తదుపరి చాప్టర్**: [అధ్యాయం 2: AI-ఫస్ట్ డెవలప్మెంట్](../chapter-02-ai-development/microsoft-foundry-integration.md)

## పరిచయం

ఈ సమగ్ర మార్గదర్శిని మీ సిస్టమ్‌లో Azure Developer CLI (azd) ని ఇన్స్టాల్ చేసి కాన్ఫిగర్ చేయడంలో మీకు దశల వారీగా సహాయం చేస్తుంది. మీరు వివిధ ఆపరేటింగ్ సిస్టమ్‌లకు అనుకూలంగా ఉన్న బహుకళ ఇన్‌స్టాలేషన్ పద్ధతులను, ధృవీకరణ సెటప్‌ను మరియు Azure డిప్లాయ్‌మెంట్‌ల కోసం మీ అభివృద్ధి వాతావరణాన్ని సిద్ధం చేయడానికి అవసరమైన ప్రాథమిక కాన్ఫిగరేషన్లను నేర్చుకుంటారు.

## పాఠ్య లక్ష్యాలు

ఈ పాఠ్యాన్ని పూర్తి చేసిన తరువాత, మీరు:
- మీ ఆపరేటింగ్ సిస్టమ్‌పై Azure Developer CLI విజయవంతంగా ఇన్స్టాల్ చేయగలరు
- బహు పద్ధతుల ద్వారా Azure తో ధృవీకరణను కాన్ఫిగర్ చేయగలరు
- అవసరమైన ప్రీరిక్విసైట్లతో మీ అభివృద్ధి వాతావరణాన్ని సెట్ చేయగలరు
- వివిధ ఇన్‌స్టాలేషన్ ఎంపికలు మరియు వాటిని ఎప్పుడు ఉపయోగించాలో అర్థం చేసుకోగలరు
- సాధారణ ఇన్‌స్టాలేషన్ మరియు సెటప్ సమస్యలను ట్రబుల్షూట్ చేయగలరు

## అధ్యయన ఫలితాలు

ఈ పాఠ్యాన్ని పూర్తి చేసిన తర్వాత, మీరు చేయగలరు:
- మీ ప్లాట్‌ఫారమ్‌కి అనుకూలమైన పద్ధతి ద్వారా azd ఇన్స్టాల్ చేయడం
- `azd auth login` ఉపయోగించి Azure తో ధృవీకరణ చేయడం
- మీ ఇన్‌స్టాలేషన్‌ను నిర్ధారించుకుని ప్రాథమిక azd కమాండ్లను పరీక్షించడం
- azd ఉపయోగానికి ఉత్తమంగా మీ అభివృద్ధి వాతావరణాన్ని కాన్ఫిగర్ చేయడం
- సాధారణ ఇన్‌స్టాలేషన్ సమస్యలను స్వతంత్రంగా పరిష్కరించడం

ఈ గైడ్ మీ ఆపరేటింగ్ సిస్టమ్ లేదా అభివృద్ధి వాతావరణం ఎంతైనా సంబంధ లేకుండా Azure Developer CLI ని ఇన్స్టాల్ చేసి కాన్ఫిగర్ చేయడంలో మీకు సహాయపడుతుంది.

## ముందస్తు అవసరాలు

azd ఇన్స్టాల్ చేయడానికి ముందు, మీరు కలిగి ఉండాలని నిర్ధారించుకోండి:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - ధృవీకరణ మరియు వనరుల నిర్వహణ కోసం
- **Git** - టెంప్లేట్ క్లోన్ చేయడం మరియు వెర్షన్ కంట్రోల్ కోసం
- **Docker** (ఐచ్ఛికం) - కంటైనరైజ్డ్ అప్లికేషన్ల కోసం

## ఇన్‌స్టాలేషన్ పద్ధతులు

### Windows

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# winget అందుబాటులో లేకపోతే ఇది ఉపయోగకరం
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. తాజా రీలీజ్‌ను [GitHub](https://github.com/Azure/azure-dev/releases) నుండి డౌన్లోడ్ చేయండి
2. Extract to `C:\Program Files\azd\`
3. PATH పరిసర వేరియబుల్‌లో చేర్చండి

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
# డౌన్లోడ్ చేసి ఇన్‌స్టాల్ చేయండి
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# మీ Linux ఆర్కిటెక్చర్‌కు అనుగుణంగా తాజా ఆర్కైవ్‌ను ఈ చిరునామా నుండి డౌన్లోడ్ చేయండి:
# https://github.com/Azure/azure-dev/releases
# తరువాత దాన్ని ఎక్స్‌ట్రాక్ట్ చేసి azd బైనరీని మీ PATHలో జోడించండి.
```

### GitHub Codespaces

కొన్ని Codespaces మరియు dev container పరిసరాలు ఇప్పటికే `azd` ని కలిగి ఉంటాయి, కానీ ఇది ఊహించుకోవడం కాకుండా మీరు తనిఖీ చేయాలి:

```bash
azd version
```

If `azd` is missing, install it with the standard script for the environment.

### Docker

```bash
# azd‌ను ఒక కంటెయినర్‌లో నడపండి
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# సులభంగా ఉపయోగించేందుకు ఒక అలియాస్ సృష్టించండి
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ ఇన్‌స్టాలేషన్‌ను ధృవీకరించండి

ఇన్‌స్టాలేషన్ తర్వాత, azd సరిగా పని చేస్తున్నదో లేదో ధృవీకరించండి:

```bash
# సంస్కరణను తనిఖీ చేయండి
azd version

# సహాయం చూడండి
azd --help

# లభ్యమయ్యే టెంప్లేట్‌లను జాబితా చేయండి
azd template list
```

అంచనా అవుట్‌పుట్:
```
azd version 1.x.x (commit xxxxxx)
```

**గమనించండి**: వాస్తవ సంస్కరణ సంఖ్య మారవచ్చు. తాజా సంస్కరణ కోసం చూసి: [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases).

**✅ ఇన్‌స్టాలేషన్ విజయపు చెక్లిస్ట్:**
- [ ] `azd version` లోపాల్లేకుండా సంస్కరణ సంఖ్య చూపుతుంది
- [ ] `azd --help` కమాండ్ డాక్యుమెంటేషన్‌ను ప్రదర్శిస్తుంది
- [ ] `azd template list` అందుబాటులో ఉన్న టెంప్లేట్లను చూపిస్తుంది
- [ ] మీరు ఒక టెస్ట్ డైరెక్టరీ సృష్టించి `azd init` ను విజయవంతంగా రన్ చేయగలరు

**అన్ని చెక్స్స్ ఉత్తీర్ణమైతే, మీరు [మీ మొదటి ప్రాజెక్ట్](first-project.md) కు ముందుకు పోవడానికి సిద్ధంగా ఉన్నారు!**

## ధృవీకరణ సెటప్

### కొత్తవారికి సిఫార్సు చేసే సెటప్

AZD-ఫస్టు వర్క్‌ఫ్లోల కోసం, `azd auth login` తో సైన్ ఇన్ చేయండి.

```bash
# azd up వంటి AZD కమాండ్ల కోసం అవసరం
azd auth login

# AZD ప్రామాణీకరణ స్థితిని నిర్ధారించండి
azd auth login --check-status
```

కోర్సు సమయంలో మీరు స్వయంగా `az` కమాండ్లను రన్ చేయాలని ప్రణాళిక చేసుకుంటే మాత్రమే Azure CLI సైన్-ఇన్ ఉపయోగించండి.

### Azure CLI ద్వారా ధృవీకరణ (ఐచ్ఛికం)
```bash
# ఇప్పటివరకు ఇన్‌స్టాల్ చేయకపోతే Azure CLIని ఇన్‌స్టాల్ చేయండి
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: మీ డిస్ట్రిబ్యూషన్ కోసం Azure CLI ఇన్‌స్టాల్ డాక్యుమెంటేషన్‌ను చూడండి

# Azureలో లాగిన్ చేయండి
az login

# ప్రామాణీకరణను ధృవీకరించండి
az account show
```

### మీరు ఏ సైన్-ఇన్ ఫ్లో ఉపయోగించాలి?

- మీరు బిగినర్ AZD పాఠాన్ని అనుసరిస్తున్నట్లయితే మరియు ప్రధానంగా `azd` కమాండ్లను నిర్వహిస్తుంటే, `azd auth login` వినియోగించండి.
- మీరు `az account show` వంటి Azure CLI కమాండ్లను రన్ చేయాలని అనుకుంటే కూడా `az login` ఉపయోగించండి.
- ఒక వ్యాయామంలో `azd` మరియు `az` రెండు కమాండ్లు ఉంటే, ప్రారంభంలో ఒకసారి రెండింటినీ సైన్-ఇన్ చేయండి.

### డివైస్ కోడ్ ధృవీకరణ
మీకు హెడ్లెస్ సిస్టమ్ లేదా బ్రౌజర్ సమస్యలు ఉంటే:
```bash
azd auth login --use-device-code
```

### సర్వీస్ ప్రిన్సిపల్ (CI/CD)
ఆటోమేటెడ్ పరిసరాల కోసం:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### మీ పూర్తి సెటప్‌ను ధృవీకరించండి

అధ్యాయం 1 ప్రారంభించక ముందు సత్వర సిద్ధత తనిఖీ చేయాలనుకుంటే:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## కాన్ఫిగరేషన్

### గ్లోబల్ కాన్ఫిగరేషన్
```bash
# డిఫాల్ట్ సబ్స్క్రిప్షన్‌ను సెట్ చేయండి
azd config set defaults.subscription <subscription-id>

# డిఫాల్ట్ ప్రదేశాన్ని సెట్ చేయండి
azd config set defaults.location eastus2

# అన్ని కాన్ఫిగరేషన్లను చూడండి
azd config show
```

### పర్యావరణ వేరియబుల్స్
మీ షెల్ ప్రొఫైల్ (`.bashrc`, `.zshrc`, `.profile`) లో జోడించండి:
```bash
# Azure కాన్ఫిగరేషన్
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd కాన్ఫిగరేషన్
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
```

## IDE సమన్వయం

### Visual Studio Code
Azure Developer CLI ఎక్స్‌టెన్షన్ ఇన్స్టాల్ చేయండి:
1. VS Code ఓపెన్ చేయండి
2. Extensions కి వెళ్ళండి (Ctrl+Shift+X)
3. "Azure Developer CLI" కోసం శోధించండి
4. ఎక్స్‌టెన్షన్ ఇన్స్టాల్ చేయండి

ఫీచర్లు:
- IntelliSense for azure.yaml
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
1. Azure ప్లగిన్ ఇన్స్టాల్ చేయండి
2. Azure క్రెడెన్షియల్స్ కాన్ఫిగర్ చేయండి
3. azd కమాండ్ల కోసం ఇంటిగ్రేటెడ్ టెర్మినల్ ఉపయోగించండి

## 🐛 ఇన్‌స్టాలేషన్ సమస్య పరిష్కారం

### సాధారణ సమస్యలు

#### అనుమతి తిరస్కరించబడింది (Windows)
```powershell
# PowerShellను అడ్మినిస్ట్రేటర్‌గా চালించండి
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH సమస్యలు
కార్యాచరణ కోసం azd ను మీ PATH లో మాన్యువల్‌గా జోడించండి:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### నెట్‌వర్క్/ప్రాక్‌సీ సమస్యలు
```bash
# ప్రాక్సీని కాన్ఫిగర్ చేయండి
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL ధృవీకరణను దాటివేయండి (ఉత్పత్తి వాతావరణం కోసం సిఫారసు చేయబడదు)
azd config set http.insecure true
```

#### సంస్కరణ ఘర్షణలు
```bash
# పాత ఇన్‌స్టాలేషన్లను తొలగించండి
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: మళ్లీ ఇన్‌స్టాల్ చేయడానికి ముందు పాత azd బైనరీ లేదా సింబాలిక్ లింక్‌ను తొలగించండి

# కాన్ఫిగరేషన్‌ను శుభ్రం చేయండి
rm -rf ~/.azd
```

### ఇంకా సహాయం కావాలంటే
```bash
# డీబగ్ లాగింగ్‌ను సక్రియం చేయండి
export AZD_DEBUG=true
azd <command> --debug

# ప్రస్తుత కాన్ఫిగరేషన్‌ను వీక్షించండి
azd config show

# ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితిని వీక్షించండి
azd show
```

## azd అనువర్తనం నవీకరణ

### అప్డేట్ చెక్
azd కొత్త రీలీజ్ అందుబాటులో ఉన్నప్పుడు హెచ్చరిస్తుంది, మరియు మీరు మీ ప్రస్తుత బిల్డ్‌ని నిర్ధారించవచ్చు:
```bash
azd version
```

### మాన్యువల్ అప్డేట్స్

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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

**Azure CLI (az)**: వ్యక్తిగత Azure వనరుల నిర్వహణ కోసం తక్కువ-స్థాయి టూల్
- `az webapp create`, `az storage account create`
- ఒక్కసారి ఒక వనరు
- ఇన్ఫ్రాస్ట్రక్చర్ నిర్వహణపై దృష్టి

**Azure Developer CLI (azd)**: పూర్తిస్థాయి అప్లికేషన్ డిప్లాయ్‌మెంట్ల కోసం ఉన్నత-స్థాయి టూల్
- `azd up` మొత్తం అప్లికేషన్‌ను అన్ని వనరులతో ఒకేసారి డిప్లాయ్ చేస్తుంది
- టెంప్లేట్ ఆధారిత వర్క్‌ఫ్లోలు
- డెవలపర్ ఉత్పాదకతపై దృష్టి

**మీకు రెండూ అవసరం**: azd ధృవీకరణ కోసం az CLI ను ఉపయోగిస్తుంది
</details>

<details>
<summary><strong>నాల已有 Azure వనరులతో azd ఉపయోగించవచ్చు嗎?</strong></summary>

అవును! మీరు చేయగలరు:
1. ఉన్న వనరులను azd ఎన్విరాన్మెంట్స్‌లో దిగుమతి చేసుకోండి
2. మీ Bicep టెంప్లేట్స్‌లో ఉన్న వనరులను సూచించండి
3. ఉన్న ఇన్ఫ్రాస్ట్రక్చర్‌తో పాటు కొత్త డిప్లాయ్‌మెంట్‌ల కోసం azd ను ఉపయోగించండి

వివరాలకు చూడండి [కాన్ఫిగరేషన్ గైడ్](configuration.md).
</details>

<details>
<summary><strong>azd Azure Government లేదా Azure China తో పని చేస్తుంది吗?</strong></summary>

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
<summary><strong>CI/CD పై azd ఉపయోగించగలనా?</strong></summary>

ఖచ్చితంగా! azd ఆటోమేషన్ కోసం రూపొందించబడింది:
- GitHub Actions సమాకరణ
- Azure DevOps మద్దతు
- సర్వీస్ ప్రిన్సిపల్ ధృవీకరణ
- నాన్-ఇంటరాక్టివ్ మోడ్

CI/CD నమూనాల కోసం చూడండి [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>azd ఉపయోగించే ఖర్చు ఎంత?</strong></summary>

azd స్వయంగా **సంపూర్ణంగా ఉచితం** మరియు ఓపెన్-సోర్స్. మీరు కేవలం చెల్లిస్తారు:
- మీరు డిప్లాయ్ చేసే Azure వనరులు
- Azure వినియోగ ఖర్చులు (compute, storage, మొదలైనవి)

డిప్లాయ్‌మెంట్ ముందు ఖర్చులను అంచనా వేసేందుకు `azd provision --preview` ఉపయోగించండి.
</details>

## తదుపరి దశలు

1. **ధృవీకరణ పూర్తి చేయండి**: మీ Azure subscription కి యాక్సెస్ ఉందని నిర్ధారించుకోండి
2. **మీ మొదటి డిప్లాయ్‌మెంట్ ప్రయత్నించండి**: [మొదటి ప్రాజెక్ట్ గైడ్](first-project.md) ను అనుసరించండి
3. **టెంప్లేట్లను అన్వేషించండి**: `azd template list` తో అందుబాటులో ఉన్న టెంప్లేట్లను బ్రౌజ్ చేయండి
4. **మీ IDE ను కాన్ఫిగర్ చేయండి**: మీ అభివృద్ధి వాతావరణాన్ని సెటప్ చేయండి

## సహాయం

సమస్యలు ఎదురైతే:
- [అధికారిక డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ఇష్యూలను నివేదించండి](https://github.com/Azure/azure-dev/issues)
- [కమ్యూనిటీ చర్చలు](https://github.com/Azure/azure-dev/discussions)
- [Azure మద్దతు](https://azure.microsoft.com/support/)
- [**Azure ఏజెంట్ నైపుణ్యాలు**](https://skills.sh/microsoft/github-copilot-for-azure) - మీ ఎడిటర్లో నేరుగా Azure కమాండ్ మార్గదర్శకత్వం పొందడానికి `npx skills add microsoft/github-copilot-for-azure` ఉపయోగించండి

---

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభకులకు](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: అధ్యాయం 1 - పునాది మరియు త్వరిత ప్రారంభం
- **⬅️ ముందు**: [AZD Basics](azd-basics.md) 
- **➡️ తరువాత**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **🚀 తదుపరి చాప్టర్**: [అధ్యాయం 2: AI-ఫస్ట్ డెవలప్మెంట్](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ఇన్‌స్టాలేషన్ పూర్తి!** azd తో బిల్డ్ చేయడం ప్రారంభించడానికి [మీ మొదటి ప్రాజెక్ట్](first-project.md) కు సాగండి.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**గమనిక**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండవచ్చు. స్థానిక భాషలో ఉన్న అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం వృత్తిపరమైన మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదాన్ని ఉపయోగించడం వలన ఏర్పడే ఏవైనా అపార్థాలు లేదా తప్పుదోషాలకు మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->