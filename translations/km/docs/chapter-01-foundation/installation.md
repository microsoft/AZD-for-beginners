# មគ្គុទេសក៍ដំឡើង និងតំឡើង

**ការបើកទស្សនៈជាតារាង៖**
- **📚 ផ្ទះមុខវិជ្ជា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជាតារាងបច្ចុប្បន្ន**: ជាតារាងទី 1 - មូលដ្ឋាន និងចាប់ផ្ដើមយ៉ាងរហ័ស
- **⬅️ មុន**: [AZD ជាលក្ខណ:មូលដ្ឋាន](azd-basics.md)
- **➡️ បន្ទាប់**: [គម្រោង​ដំបូងរបស់អ្នក](first-project.md)
- **🚀 ជាតារាងបន្ទាប់**: [ជាតារាងទី 2: អភិវឌ្ឍន៍ផ្តោតលើ AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## មុខងារ

មគ្គុទេសក៍ពេញលេញនេះនឹងដឹកនាំអ្នកតាមដំណាក់កាលដំឡើង និងកំណត់រចនាសម្ព័ន្ធ Azure Developer CLI (azd) លើប្រព័ន្ធរបស់អ្នក។ អ្នកនឹងរៀនពីវិធីដំឡើងជាច្រើនសម្រាប់ប្រព័ន្ធប្រតិបត្តិការផ្សេងៗ ការតំឡើងការផ្ទៀងផ្ទាត់តំណាង អ្នកផ្ទាល់ខ្លួន និងការកំណត់រចនាសម្ព័ន្ធដំបូងដើម្បីត្រៀមបរិស្ថានអភិវឌ្ឍន៍របស់អ្នកសម្រាប់ការដាក់ពាក្យបង្ហាញ Azure។

## គោលបំណងរៀន

នៅចុងការសិក្សានេះ អ្នកនឹងអាច:
- ដំឡើង Azure Developer CLI សម្រេចលើប្រព័ន្ធប្រតិបត្តិការរបស់អ្នក
- កំណត់រចនាសម្ព័ន្ធការផ្ទៀងផ្ទាត់តំណាងជាមួយ Azure ក្នុងវិធីជាច្រើន
- កំណត់បរិស្ថានអភិវឌ្ឍន៍ជាមួយលក្ខខណ្ឌទាមទារដ៏ចាំបាច់
- យល់ដឹងពីជម្រើសការដំឡើងផ្សេងៗ និងពេលវេលានៃការប្រើប្រាស់
- ជួសជុលបញ្ហាប្រឈមនៅពេលដំឡើង និងតំឡើង

## លទ្ធផលការសិក្សា

បន្ទាប់ពីបញ្ចប់មេរៀននេះ អ្នកនឹងអាច:
- ដំឡើង azd ដោយប្រើវិធីសមរម្យសម្រាប់វេទិការបស់អ្នក
- ផ្ទៀងផ្ទាត់តំណាងជាមួយ Azure ដោយប្រើ azd auth login
- ធ្វើតេស្តការដំឡើង និងរបៀបបញ្ជាដំបូងនៃ azd
- កំណត់បរិស្ថានអភិវឌ្ឍន៍សម្រាប់ប្រើប្រាស់ azd យ៉ាងមានប្រសិទ្ធភាព
- ដោះស្រាយបញ្ហាដំឡើងទៀងទាត់ដោយខ្លួនឯង

មគ្គុទេសក៍នេះនឹងជួយអ្នកដំឡើង និងកំណត់រចនាសម្ព័ន្ធ Azure Developer CLI លើប្រព័ន្ធរបស់អ្នក មិនគិតថាបរិស្ថានអភិវឌ្ឍន៍ ឬប្រព័ន្ធប្រតិបត្តិការណាឡើយ។

## លក្ខខណ្ឌចាំបាច់

មុនពេលដំឡើង azd សូមប្រាកដថាអ្នកមានៈ
- **ការជាវ Azure** - [បង្កើតគណនីឥតគិតថ្លៃ](https://azure.microsoft.com/free/)
- **Azure CLI** (ជាជម្រើស) - សម្រាប់ឧទាហរណ៍ដែលបញ្ជាក់ត្រូវរត់ `az`; azd ផ្ទៀងផ្ទាត់ដោយឡែក
- **Git** - សម្រាប់ថតពិន្ទុគំរូ និងការត្រួតពិនិត្យកំណែ
- **Docker** (ជាជម្រើស) - សម្រាប់កម្មវិធីជាបន្ទះ

## វិធីសាស្រ្តដំឡើង

### Windows

#### ជម្រើសទី 1: Windows Package Manager (ផ្ដល់អនុសាសន៍)
```cmd
winget install microsoft.azd
```

#### ជម្រើសទី 2: ស្គ្រីបដំឡើង PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### ជម្រើសទី 3: Chocolatey
```cmd
choco install azd
```

#### ជម្រើសទី 4: ដំឡើងដោយដៃ
1. ទាញយកប្រេកង់ថ្មីពី [GitHub](https://github.com/Azure/azure-dev/releases)
2. ដកស្រង់ចេញទៅ `C:\Program Files\azd\`
3. បន្ថែមទៅអថេរ PATH

### macOS

#### ជម្រើសទី 1: Homebrew (ផ្ដល់អនុសាសន៍)
```bash
brew tap azure/azd
brew install azd
```

#### ជម្រើសទី 2: ស្គ្រីបដំឡើង
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ជម្រើសទី 3: ដំឡើងដោយដៃ
ទាញយកឯកសារដែលសមស្របសម្រាប់សំណង់ macOS របស់អ្នកពី [the release assets](https://github.com/Azure/azure-dev/releases) ដកស្រង់វា ហើយបន្ថែមប៊ីណារី `azd` ទៅក្នុង `PATH` របស់អ្នក។

### Linux

#### ជម្រើសទី 1: ស្គ្រីបដំឡើង (ផ្ដល់អនុសាសន៍)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### ជម្រើសទី 2: Package Managers

**ដំឡើងដោយដៃពី release assets:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

មាន Codespaces និងបរិស្ថាន dev container ពីមុនដែលរួមបញ្ចូល `azd` ប៉ុន្តែអ្នកគួរតែបញ្ជាក់ឲ្យបានប្រាកដជាងការសន្មត់វា:

```bash
azd version
```

ប្រសិនបើ `azd` ខ្វះ ត្រូវដំឡើងវាជាមួយស្គ្រីបធម្មតាដូចក្នុងបរិស្ថាន។

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

កុងតឺន័រព្រោះពន្លឺនេះមិនរក្សាស្ថានភាពការចូលរបាក់មួយឬក៏ច្រើនដង។ សម្រាប់ការដាក់ពាក្យជាច្រើន ដើម្បីប្រើប្រាស់ [dev container setup](dev-containers.md); ការសាងសង់ container ក៏ត្រូវការប្រព័ន្ធដំណើរការ Docker ដែលអាចចូលពីខាងក្នុង។

## ✅ បញ្ជាក់ការដំឡើង

បន្ទាប់ពីដំឡើង សូមបញ្ជាក់ថា azd ធ្វើការបានត្រឹមត្រូវ៖

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

លទ្ធផលដែលរំពឹងទុក៖
```
azd version 1.x.x (commit xxxxxx)
```

**កំណត់ចំណាំ**: លេខកំណែពិតប្រាកដនឹងខុសគ្នា។ ពិនិត្យមើល [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) សម្រាប់កំណែថ្មីបំផុត។

**✅ បញ្ជីត្រួតពិនិត្យជោគជ័យការដំឡើង:**
- [ ] `azd version` បង្ហាញលេខកំណែដោយគ្មានកំហុស
- [ ] `azd --help` បង្ហាញឯកសារពីបញ្ជា
- [ ] `azd template list` បង្ហាញគំរូមានស្រាប់
- [ ] អ្នកអាចបង្កើតថតសាកល្បង និងរត់ `azd init` ដោយជោគជ័យ

**ប្រសិនបើការត្រួតពិនិត្យទាំងអស់ជាប់ អ្នករួចរាល់ក្នុងការបន្តទៅ [គម្រោងដំបូងរបស់អ្នក](first-project.md)!**

## កំណត់រចនាសម្ព័ន្ធការផ្ទៀងផ្ទាត់តំណាង

### ការកំណត់រចនាសម្ព័ន្ធសម្រាប់អ្នកចាប់ផ្ដើម (ផ្ដល់អនុសាសន៍)

សម្រាប់ដំណើរការផ្ទាល់ AZD ជាលំដាប់ដំបូង សូមចូលបញ្ជាក់លទ្ធភាពជាមួយ `azd auth login`។

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

ប្រើ Azure CLI ចូលតែពេលអ្នកមានផែនការរត់បញ្ជា `az` ដោយខ្លួនឯងក្នុងវគ្គសិក្សា។

### ការផ្ទៀងផ្ទាត់តំណាង Azure CLI (ជាជម្រើស)
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

### តើអ្នកគួរប្រើដំណើរការចូលណាមួយ?

- ប្រើ `azd auth login` ប្រសិនបើអ្នកតាមដានផ្លូវ AZD សម្រាប់អ្នកចាប់ផ្ដើម ហើយភាគច្រើនរត់បញ្ជា `azd`។
- ក៏ប្រើ `az login` ផងដែរ នៅពេលអ្នកចង់រត់បញ្ជា Azure CLI ដូចជា `az account show` ឬពិនិត្យមើលធនធានផ្ទាល់។
- ប្រសិនបើលំហាត់មានការរួមបញ្ចូលបញ្ជា `azd` និង `az` រួមគ្នា សូមរត់ស្គ្រីបចូលទាំងពីរដងនៅដើម។

### ការផ្ទៀងផ្ទាត់កូដឧបករណ៍
ប្រសិនបើអ្នកនៅលើប្រព័ន្ធមិនមាននរណាអាចប្រើប៊្របស៊័រឬមានបញ្ហា:
```bash
azd auth login --use-device-code
```

### អ្នកផ្ទាល់ប្រតិបត្តិការផស័រ (CI/CD)
សម្រាប់បរិស្ថានស្វ័យប្រវត្តិ:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### បញ្ជាក់ការតំឡើងបញ្ចប់របស់អ្នក

ប្រសិនបើអ្នកចង់ធ្វើតេស្តសមត្ថភាពរហ័សមុនចាប់ផ្តើមជាតារាងទី 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## ការកំណត់រចនាសម្ព័ន្ធ

### ការកំណត់រចនាសម្ព័ន្ធផែនដី
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### អថេរបរិស្ថាន
បន្ថែមទៅទៅក្នុងបង្ហាញសែលរបស់អ្នក (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## ការរួមបញ្ចូល IDE

### Visual Studio Code
ដំឡើងផ្នែកបន្ថែម Azure Developer CLI:
1. បើក VS Code
2. ទៅកាន់ផ្នែកបន្ថែម (Ctrl+Shift+X)
3. ស្វែងរក "Azure Developer CLI"
4. ដំឡើងផ្នែកបន្ថែម

លក្ខណៈពិសេស:
- IntelliSense សម្រាប់ azure.yaml
- បញ្ជាកម្មវិធីបញ្ចូលនៅក្នុង terminal
- ការស្ទូតទំព័រគំរូ
- ការតាមដានការដាក់ពាក្យបង្ហាញ

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
1. ដំឡើងផ្នែកបន្ថែម Azure
2. កំណត់លិខិត Azure
3. ប្រើ terminal រួមសម្រាប់បញ្ជា azd

## 🐛 ការជួសជុលបញ្ហាការដំឡើង

### បញ្ហាទូទៅ

#### ការអនុញ្ញាតបដិសេធ (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### បញ្ហា PATH
បន្ថែម azd ដោយដៃទៅ PATH របស់អ្នក:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### បញ្ហាបណ្តាញ/ប្រព័ន្ធតំណ
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### បំណងកំណែ
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

### បញ្ជាក់ការអាប់ដេត
azd ចេញសេចក្ដីជូនដំណឹងពេលមានកំណែថ្មី ហើយអ្នកអាចបញ្ជាក់ការសាងសង់បច្ចុប្បន្នរបស់អ្នកដោយ:
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

## 💡 សំណួរដែលសួរញឹកញាប់

<details>
<summary><strong>តើអ្វីជាការប្រៀបធៀបរវាង azd និង az CLI?</strong></summary>

**Azure CLI (az)**: ឧបករណ៍កម្រិតទាបសម្រាប់គ្រប់គ្រងធនធាន Azure ម្នាក់ទៅម្នាក់
- `az webapp create`, `az storage account create`
- មួយធនធានក្នុងមួយពេល
- ផ្ដោតលើការគ្រប់គ្រងស្ថាបត្យកម្ម

**Azure Developer CLI (azd)**: ឧបករណ៍កម្រិតខ្ពស់សម្រាប់ការដាក់ពាក្យ全部កម្មវិធី
- `azd up` ដាក់ពាក្យកម្មវិធីទាំងមូលជាមួយធនធានទាំងអស់
- ដំណើរការតាមគំរូ
- ផ្ដោតទៅលើផលិតភាពអ្នកអភិវឌ្ឍន៍

**ពួកវាផ្ទាល់ខ្លួន**: azd ប្រើការផ្ទៀងផ្ទាត់របស់ខ្លួនដោយលំនាំដើម។ ដំឡើង និងចូលបញ្ជាក់ Azure CLI តែសម្រាប់បញ្ជា `az` ឬជាផ្លូវការ ជ្រើសរើសទៅ `azd config set auth.useAzCliAuth true`។
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើ azd ជាមួយធនធាន Azure មានស្រាប់បានទេ?</strong></summary>

មែន! អ្នកអាច៖
1. នាំចូលធនធានមានស្រាប់ទៅក្នុងបរិស្ថាន azd
2. ឯកសារយោងធនធានមានស្រាប់នៅក្នុងគំរូ Bicep របស់អ្នក
3. ប្រើ azd សម្រាប់ការដាក់ពាក្យថ្មីជាមួយប្រាក់កំចាយធនធានមានស្រាប់

មើល [មគ្គុទេសក៍កំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md) សម្រាប់ពត៌មានលម្អិត។
</details>

<details>
<summary><strong>តើ azd ធ្វើការជាមួយ Azure Government ជាឬ Azure China ទេ?</strong></summary>

មែន អាចកំណត់ cloud៖
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

ប្រសិនបើអ្នកក៏ប្រើ Azure CLI ក៏ត្រូវកំណត់ `az cloud set --name ...` ផងដែរ។ សេវាកម្មគំរូ និងមានភាពអាចប្រើបានភាគច្រើនចម្លែកគ្នាតាម cloud។
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើ azd ក្នុងបណ្តោយ CI/CD បានទេ?</strong></summary>

មែនហើយ! azd ត្រូវបានរចនាសម្រាប់ស្វ័យប្រវត្តិកម្ម៖
- ការរួមបញ្ចូល GitHub Actions
- ការគាំទ្រដល់ Azure DevOps
- ការផ្ទៀងផ្ទាត់តំណាង service principal
- របៀបមិនមានការចេញផ្សាយនៅផ្ទាល់

មើល [មគ្គុទេសក៍ដាក់ពាក្យ](../chapter-04-infrastructure/deployment-guide.md) សម្រាប់លំនាំ CI/CD។
</details>

<details>
<summary><strong>តើតម្លៃនៃការប្រើ azd ជាអ្វី?</strong></summary>

azd មាន **ឥតគិតថ្លៃទាំងស្រុង** និងជាកម្មវិធីបើកប្រភព។ អ្នកបង់ប្រាក់ទេតែសម្រាប់:
- ធនធាន Azure ដែលអ្នកដាក់ពាក្យ
- ចំណាយប្រើប្រាស់ Azure (កុំព្យូទ័រ, ស្តុក, និងផ្សេងៗ)

ប្រើ `azd provision --preview` ដើម្បីពិនិត្យធនធានដែលផ្តល់អនុសាសន៍ បន្ទាប់មកប៉ាន់ប្រមាណថ្លៃជាមួយ [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)។ ពិនិត្យមើលមិនគិតថ្លៃ។
</details>

## ជំហានបន្ទាប់

1. **បញ្ចប់ការផ្ទៀងផ្ទាត់តំណាង**: ប្រាកដថាអ្នកអាចចូលប្រើការជាវ Azure របស់អ្នក
2. **សាកល្បងការដាក់ពាក្យដំបូងរបស់អ្នក**: អនុវត្តតាម [មគ្គុទេសក៍គម្រោងដំបូង](first-project.md)
3. **ស្វែងយល់ពីគំរូ**: ស្វែងរកគំរូដែលមានស្រាប់ជាមួយ `azd template list`
4. **កំណត់រចនាសម្ព័ន្ធ IDE**: ត្រៀមបរិស្ថានអភិវឌ្ឍន៍របស់អ្នក

## ស្រោចស្រង់ជំនួយ

ប្រសិនបើប្រទះបញ្ហា:
- [ឯកសារផ្លូវការនា](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [រាយការណ៍បញ្ហារ](https://github.com/Azure/azure-dev/issues)
- [ការពិភាក្សាសហគមន៍](https://github.com/Azure/azure-dev/discussions)
- [ជំនួយ Azure](https://azure.microsoft.com/support/)
- [**ជំនាញ Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - ទទួលបានមគ្គុទេសក្តការបញ្ជាជាមួយ Azure ដោយផ្ទាល់ក្នុងកម្មវិធីកែសម្រួលរបស់អ្នកជាមួយ `npx skills add microsoft/github-copilot-for-azure`

---

**ការបើកទស្សនៈជាតារាង៖**
- **📚 ផ្ទះមុខវិជ្ជា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជាតារាងបច្ចុប្បន្ន**: ជាតារាងទី 1 - មូលដ្ឋាន និងចាប់ផ្ដើមយ៉ាងរហ័ស
- **⬅️ មុន**: [AZD ជាលក្ខណ:មូលដ្ឋាន](azd-basics.md) 
- **➡️ បន្ទាប់**: [គម្រោង​ដំបូងរបស់អ្នក](first-project.md)
- **🚀 ជាតារាងបន្ទាប់**: [ជាតារាងទី 2: អភិវឌ្ឍន៍ផ្តោតលើ AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ ដំឡើងរួចរាល់!** បន្តទៅ [គម្រោងដំបូងរបស់អ្នក](first-project.md) ដើម្បីចាប់ផ្ដើមបង្កើតជាមួយ azd។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->