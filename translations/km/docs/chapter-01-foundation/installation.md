# មគ្គុទេសក៍ការដំឡើង និងការតំឡើង

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកដំបូង](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 1 - មូលដ្ឋាន និងការចាប់ផ្តើមយ៉ាងរហ័ស
- **⬅️ ផ្ទៅមុន**: [មូលដ្ឋាន AZD](azd-basics.md)
- **➡️ បន្ទាប់**: [គម្រោងដំបូងរបស់អ្នក](first-project.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 2៖ ការអភិវឌ្ឍន៍ផ្អែកលើ AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## ការណែនាំ

មគ្គុទេសក៍បង្ហាញពេញលេញនេះ នឹងដឹកនាំអ្នកឆ្លងកាត់ការដំឡើង និងការកំណត់រចនាសម្ព័ន្ធ Azure Developer CLI (azd) លើប្រព័ន្ធរបស់អ្នក។ អ្នកនឹងសិក្សារបៀបដំឡើងជាច្រើនសម្រាប់ប្រព័ន្ធប្រតិបត្តិការ ផ្នែកការតំឡើងកំណត់សិទ្ធិ និងការកំណត់បឋម ដើម្បីរៀបចំបរិស្ថានអភិវឌ្ឍន៍របស់អ្នកសម្រាប់ការចេញផ្សាយទៅ Azure។

## គោលបំណងរៀន

តាមចប់មេរៀននេះ អ្នកនឹង:
- ដំឡើង Azure Developer CLI បានជោគជ័យលើប្រព័ន្ធប្រតិបត្តិការបស់អ្នក
- កំណត់សិទ្ធិការចូលអ្នកជាមួយ Azure ដោយប្រើវិធីសាស្រ្តច្រើន
- រៀបចំបរិស្ថានអភិវឌ្ឍន៍របស់អ្នកជាមួយអ្វីដែលត្រូវការចាំបាច់
- យល់ដឹងអំពីជម្រុងការដំឡើងផ្សេងៗ និងពេលដែលត្រូវប្រើមួយម្ដងៗ
- ដោះស្រាយបញ្ហាទូទៅនៃការដំឡើង និងការតំឡើង

## លទ្ធផលរៀន

បន្ទាប់ពីបញ្ចប់មេរៀននេះ អ្នកនឹងអាច:
- ដំឡើង azd ដោយប្រើវិធីសមរម្យសម្រាប់វេទិការបស់អ្នក
- បញ្ចាក់អត្តសញ្ញាណជាមួយ Azure ដោយប្រើ azd auth login
- បញ្ជាក់ពិនិត្យការដំឡើង និងសាកល្បងពាក្យបញ្ជាឋ្លីៗរបស់ azd
- កំណត់បរិស្ថានអភិវឌ្ឍន៍របស់អ្នកសម្រាប់ប្រើប្រាស់ azd ដោយមានប្រសិទ្ធិភាព
- ដោះស្រាយបញ្ហាដំឡើងទូទៅដោយឯករាជ្យ

មគ្គុទេសក៍នេះនឹងជួយអ្នកដំឡើង និងកំណត់រចនាសម្ព័ន្ធ Azure Developer CLI លើប្រព័ន្ធរបស់អ្នក មិនថាអ្នកប្រើប្រព័ន្ធប្រតិបត្តិការ ឬបរិស្ថានអភិវឌ្ឍន៍អ្វី។

## តម្រូវការមុន

មុនពេលដំឡើង azd សូមប្រាកដថាអ្នកមាន:
- **ការជាវប្រើប្រាស់ Azure** - [បង្កើតគណនីឥតគិតថ្លៃ](https://azure.microsoft.com/free/)
- **Azure CLI** (ជាជម្រើស) - សម្រាប់ឧទាហរណ៍ដែលបញ្ជូលបញ្ជាកើតឡើងនៅពេលច្បាស់លាស់ `az`; azd ចូលសិទ្ធដោយឯករាជ្យ
- **Git** - សម្រាប់ចម្លងគំរូ និងគ្រប់គ្រងកំណែ
- **Docker** (ជាជម្រើស) - សម្រាប់កម្មវិធីផ្ទុកក្នុងកុងតឺន័រ

**ផ្លូវ Foundry GA ជំពូក 2៖** ប្រើ AZD **1.37.0 ឬក្រោយពីនេះ**, ធ្វើការតំឡើងបណ្ណែកម្មវិធីជាមួយ `azd ext install microsoft.foundry`, ហើយប្រើ Python **3.13+** និង **uv** បច្ចុប្បន្នសម្រាប់គំរូ hosted-agent។ របៀបបញ្ចេញកូដរបស់វាបង្កើតពីចម្ងាយ ដូច្នេះ វាមិនត្រូវការការបង្កើត Docker នៅក្នុងកុំព្យូទ័រប្រព័ន្ធមូលដ្ឋានទេ។ សិទ្ធិ Foundry, ការតែងតាំងម៉ូដែលតំបន់, និងគណនីគត់ត្រូវបានទាមទារ; សូមមើល [ការកំណត់ hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize)។

## វិធីសាស្រ្តតំឡើង

### Windows

#### ជម្រើស 1: Windows Package Manager (កំណត់អត្តសញ្ញាណ)
```cmd
winget install microsoft.azd
```

#### ជម្រើស 2: ស្ក្រីប PowerShell ដើម្បីតំឡើង
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ជម្រើស 3: Chocolatey
```cmd
choco install azd
```

#### ជម្រើស 4: តំឡើងដោយដៃ
1. ទាញយកជំណែកថ្មីបំផុតពី [GitHub](https://github.com/Azure/azure-dev/releases)
2. ដកស្រង់ទៅ `C:\Program Files\azd\`
3. បន្ថែមទៅអថេរសៀវភៅ PATH ចលនា

### macOS

#### ជម្រើស 1: Homebrew (កំណត់អត្តសញ្ញាណ)
```bash
brew tap azure/azd
brew install azd
```

#### ជម្រើស 2: ស្ក្រីបសម្រាប់តំឡើង
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ជម្រើស 3: តំឡើងដោយដៃ
ទាញយកឯកសារសង្ខេបសម្រាប់ស្ថាបត្យកម្ម macOS របស់អ្នកពី [assets របស់ការចេញផ្សាយ](https://github.com/Azure/azure-dev/releases), ដកស្រង់វា ហើយបន្ថែម `azd` ឯកសារបញ្ចូលទៅក្នុង `PATH` របស់អ្នក។

### Linux

#### ជម្រើស 1: ស្ក្រីបតំឡើង (កំណត់អត្តសញ្ញាណ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ជម្រើស 2: Package Managers

**តំឡើងដោយដៃពី assets នៃការចេញផ្សាយ៖**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

បន្ទប់ Codespaces និងបរិយាកាស dev container មួយចំនួនមានរួចហើយ `azd` ប៉ុន្តែអ្នកគួរត្រូវពិនិត្យវាប្រក្រតីមុនមិនអាចគិតថាវាមាន។

```bash
azd version
```

ប្រសិនបើ `azd` ខ្វះ, តំឡើងវាជាមួយស្ក្រីបស្តង់ដារសម្រាប់បរិយាកាស។

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

ធុង ephemeral នេះមិនរក្សាស្ថានភាពចូលប្រើរវាងរត់ឡើងទេ។ សម្រាប់ការបញ្ចេញកូដម្តងហើយម្តងទៀត, សូមប្រើ [ការកំណត់ dev container](dev-containers.md); ការបង្កើតធុងក៏ត្រូវការដំណើរការដែលអាចចូលដំណើរការពីក្នុងធុង។

## ✅ ផ្ទៀងផ្ទាត់ការតំឡើង

បន្ទាប់ពីតំឡើង, ផ្ទៀងផ្ទាត់ថា azd កំពុងដំណើរការបានត្រឹមត្រូវ៖

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

លទ្ធផលដែលរំពឹង:
```
azd version 1.x.x (commit xxxxxx)
```

**កំណត់សម្គាល់**៖ អំនានលេខកំណែកម្មវិធីពិតប្រាកដនឹងខុសគ្នា។ សូមពិនិត្យ [ការចេញផ្សាយ Azure Developer CLI](https://github.com/Azure/azure-dev/releases) សម្រាប់កំណែថ្មីបំផុត។

**✅ បញ្ជីត្រួតពិនិត្យជោគជ័យវិធីសាស្រ្តតំឡើង៖**
- [ ] `azd version` បង្ហាញលេខកំណែដោយគ្មានកំហុស
- [ ] `azd --help` បង្ហាញឯកសារបញ្ជាពាក្យបញ្ជា
- [ ] `azd template list` បង្ហាញទំព័រលំនាំដើមដែលមាន
- [ ] អ្នកអាចបង្កើតថតសាកល្បង និងរត់ `azd init` បានដោយជោគជ័យ

**បើការត្រួតពិនិត្យទាំងអស់បានជោគជ័យ អ្នកត្រៀមខ្លួនរួចរាល់សម្រាប់ [គម្រោងដំបូងរបស់អ្នក](first-project.md)!**

## ការកំណត់តែសំងាត់

### ការកំណត់ដែលណែនាំសម្រាប់អ្នកដែលចាប់ផ្តើម

សម្រាប់បច្ចាន AZD ដំបូង, ចូលកម្មវិធីជាមួយ `azd auth login`។

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

ប្រើការចូលប្រើ Azure CLI នៅពេលដែលអ្នកមានគម្រោងរត់ពាក្យបញ្ជា `az` ដោយខ្លួនឯងនៅពេលវេលាគ្រប់គ្រង។

### ការផ្ទៀងផ្ទាត់ Azure CLI (ជាជម្រើស)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### តើអ្នកគួរប្រើចរន្តចូលប្រើណាដែរឬទេ?

- ប្រើ `azd auth login` ប្រសិនបើអ្នកកំពុងធ្វើតាមផ្លូវ AZD ដំបូងហើយធ្វើបច្ចានពាក្យបញ្ជា `azd` ជាចម្បង។
- ក៏ប្រើ `az login` នៅពេលដែលអ្នកចង់រត់ពាក្យបញ្ជា Azure CLI ដូចជា `az account show` ឬពិនិត្យធនធានដោយផ្ទាល់។
- ប្រសិនបើហាត់ប្រាណមានទាំង `azd` និង `az`, រត់ពាក្យចូលប្រើទាំងពីរម្តងនៅ​ចាប់ផ្តើម។

### ការផ្ទៀងផ្ទាត់កូដឧបករណ៍
ប្រសិនបើអ្នកនៅលើប្រព័ន្ធមិនមានផ្ទាំងម៉ោន ឬមានបញ្ហាប្រើប្រាស់កម្មវិធីរុករក៖
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
សម្រាប់បរិយាកាសដោយស្វ័យប្រវត្តិ:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### បញ្ជាក់ការកំណត់របស់អ្នកបានពេញលេញ

ប្រសិនបើអ្នកចង់ធ្វើតេស្តការត្រៀមរហ័សមុនចាប់ផ្តើមជំពូក 1:

**Windows៖**
```powershell
.\validate-setup.ps1
```

**macOS / Linux៖**
```bash
bash ./validate-setup.sh
```

## ការកំណត់

### ការកំណត់ជាតារាង
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### អថេរបរិយាកាស
បន្ថែមទៅក្នុងពិព័រណ៍ Shell របស់អ្នក (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## ការរួមបញ្ចូល IDE

### Visual Studio Code
តំឡើងកម្មវិធីបន្ថែម Azure Developer CLI:
1. បើក VS Code
2. ទៅកាន់ផ្នែក Extensions (Ctrl+Shift+X)
3. ស្វែងរក "Azure Developer CLI"
4. តំឡើងកម្មវិធីបន្ថែម

លក្ខណៈពិសេសៈ
- IntelliSense សម្រាប់ azure.yaml
- ពាក្យបញ្ជាទៅកាន់ Terminal ត្រូវបានបញ្ចូលរួម
- ការពង្រីកទំព័រលំនាំដើម
- ការតាមដានការចេញផ្សាយ

### GitHub Codespaces
បង្កើត `.devcontainer/devcontainer.json`:
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
1. ដំឡើងកម្មវិធីបន្ថែម Azure
2. កំណត់ការចូលប្រើ Azure
3. ប្រើ terminal built-in សម្រាប់ពាក្យបញ្ជា azd

## 🐛 ការដោះស្រាយបញ្ហាការដំឡើង

### បញ្ហាទូទៅ

#### ច្រានចោលការអនុញ្ញាត (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### បញ្ហា PATH
បញ្ចូល azd ទៅក្នុង PATH ក្នុងដៃ:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### បញ្ហារបៀបបណ្ដាញ/ប្រូកស៊ី
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### បញ្ហាគ្នាសរសេរ version
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### រកជំនួយបន្ថែម
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## ការអាប់ដេត azd

### ការត្រួតពិនិត្យអាប់ដេត
azd នឹងជូនដំណឹងនៅពេលមានrelease ថ្មី ហើយអ្នកអាចបញ្ជាក់កំណែបច្ចុប្បន្នបានដោយ៖
```bash
azd version
```

### ការអាប់ដេតដោយដៃ

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

## 💡 សំណួរ​ដែល​សួរ​ប្រចាំ

<details>
<summary><strong>តើអ្វីជាការប្រែប្រួលរវាង azd និង az CLI?</strong></summary>

**Azure CLI (az)**: ឧបករណ៍កម្រិតទាបសម្រាប់គ្រប់គ្រងធនធាន Azure ឯកឯង
- `az webapp create`, `az storage account create`
- តែធនធានមួយ នៅលើពេល
- ផ្តោតលើការគ្រប់គ្រងហេដ្ឋារចនាសម្ព័ន្ធ

**Azure Developer CLI (azd)**: ឧបករណ៍កម្រិតខ្ពស់សម្រាប់ការផ្ទុកកម្មវិធីពេញលេញ
- `azd up` ផ្ទុកកម្មវិធីទាំងមូលជាមួយធនធានទាំងអស់
- វិធីសាស្រ្តផ្អែកលើគំរូ
- ផ្តោតលើផលិតភាពអ្នកអwickញ

**ពួកវាផ្សេងគ្នា**៖ azd ប្រើការផ្ទៀងផ្ទាត់ដោយខ្លួនឯងជារួមទាំង មានតែត្រូវតែដំឡើង និងប្រើ Azure CLI សម្រាប់ពាក្យបញ្ជា `az` ប៉ុណ្ណោះ ឬជ្រើសរើសចូលរួមក្នុង `azd config set auth.useAzCliAuth true` ។
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើ azd ជាមួយធនធាន Azure ដែលមានស្រាប់ទេ?</strong></summary>

ច្បាស់ណាស់! អ្នកអាច:
1. នាំចូលធនធានដែលមានស្រាប់ទៅក្នុងបរិយាកាស azd
2. ឯកភាពធនធានដែលមានស្រាប់ ក្នុងគំរូ Bicep របស់អ្នក
3. ប្រើ azd សម្រាប់ការផ្ទុកថ្មីជាមួយហេដ្ឋារចនាសម្ព័ន្ធដែលមានស្រាប់

មើល [Configuration Guide](../chapter-03-configuration/configuration.md) សម្រាប់ព័ត៌មានលម្អិត។
</details>

<details>
<summary><strong>តើ azd ប្រតិបត្តិការជាមួយ Azure Government ឬ Azure China ទេ?</strong></summary>

ច្បាស់ណាស់ ត្រូវកំណត់ cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

ប្រសិនបើអ្នកផងដែរ ប្រើ Azure CLI សូមកំណត់ `az cloud set --name ...` នៅលើផ្ទាល់ខ្លួន។ សេវាកម្មគំរូ និងការចូលប្រើផ្នែកម៉ូដែល ផ្លាស់ប្ដូរតាម cloud។
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើ azd ក្នុង CI/CD pipelines បានទេ?</strong></summary>

ពិតណាស់! azd បានរចនាសម្រាប់អូតូម៉ាទិស។
- សមាភាព GitHub Actions
- គាំទ្រ Azure DevOps
- ការផ្ទៀងផ្ទាត់តំណាងសេវា
- របៀបទំនាក់ទំនងមិនចូលរួម

មើល [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) សម្រាប់គំរូ CI/CD។
</details>

<details>
<summary><strong>តើតម្លៃនៃការប្រើ azd ត្រូវបង់ប៉ុន្មាន?</strong></summary>

azd គឺ **សេរីពេញលេញ** និងបើកប្រភព ហើយអ្នកត្រូវបង់សម្រាប់៖
- ធនធាន Azure ដែលអ្នកបង្កើត
- ថ្លៃការប្រើ Azure (គណនាថាមពល, ស្តុក, ល។)

ប្រើ `azd provision --preview` ដើម្បីពិនិត្យធនធានដែលបានផ្ដល់ដំណើរការ បន្ទាប់មកប៉ាន់ស្មានថ្លៃវិញជាមួយ [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)។ មិញមិនគណនាតំលៃរួចទេ។
</details>

## ជំហានបន្ទាប់

1. **បញ្ចប់ការផ្ទៀងផ្ទាត់**: ប្រាកដថាអ្នកអាចចូលប្រើ subscription Azure របស់អ្នក
2. **សាកល្បងការផ្ទុកដំបូងរបស់អ្នក**: ធ្វើតាម [First Project Guide](first-project.md)
3. **ស្វែងរកគំរូ**: ស្វែងរកគំរូដែលមានជាមួយ `azd template list`
4. **កំណត់ IDE របស់អ្នក**: ដំឡើងបរិយាកាសអwickញរបស់អ្នក

## គាំទ្រ

ប្រសិនបើអ្នកប្រទៈបញ្ហា:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - ទទួលការណែនាំពាក្យបញ្ជា Azure ក្នុងកម្មវិធីកែសម្រួលរបស់អ្នកដោយផ្ទាល់ជាមួយ `npx skills add microsoft/github-copilot-for-azure`

---

**ការរុករកជំពូក:**
- **📚 ផ្ទះវគ្គ**: [AZD For Beginners](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 1 - មូលដ្ឋាន និងការចាប់ផ្តើមរហ័ស
- **⬅️ មុននេះ**: [AZD Basics](azd-basics.md) 
- **➡️ បន្ទាប់**: [Your First Project](first-project.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 2: ការអwickញ AI ជាលើកដំបូង](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ដំឡើងរួចរាល់!** បន្ដទៅ [Your First Project](first-project.md) ដើម្បីចាប់ផ្តើមសាងសង់ជាមួយ azd។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->