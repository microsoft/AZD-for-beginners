<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T21:37:29+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "tl"
}
-->
# AZD Pangunahing Kaalaman - Pag-unawa sa Azure Developer CLI

## Panimula

Ang araling ito ay magpapakilala sa iyo sa Azure Developer CLI (azd), isang makapangyarihang tool sa command-line na nagpapabilis ng iyong paglalakbay mula sa lokal na pag-develop patungo sa Azure deployment. Malalaman mo ang mga pangunahing konsepto, pangunahing tampok, at kung paano pinapasimple ng azd ang pag-deploy ng cloud-native na mga aplikasyon.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng araling ito, ikaw ay:
- Mauunawaan kung ano ang Azure Developer CLI at ang pangunahing layunin nito
- Matututo ng mga pangunahing konsepto ng templates, environments, at services
- Tuklasin ang mga pangunahing tampok kabilang ang template-driven development at Infrastructure as Code
- Mauunawaan ang istruktura ng proyekto ng azd at workflow
- Handa nang i-install at i-configure ang azd para sa iyong development environment

## Mga Resulta ng Pag-aaral

Pagkatapos makumpleto ang araling ito, magagawa mong:
- Ipaliwanag ang papel ng azd sa modernong cloud development workflows
- Tukuyin ang mga bahagi ng istruktura ng proyekto ng azd
- Ilarawan kung paano nagtutulungan ang templates, environments, at services
- Mauunawaan ang mga benepisyo ng Infrastructure as Code gamit ang azd
- Makilala ang iba't ibang azd commands at ang kanilang mga layunin

## Ano ang Azure Developer CLI (azd)?

Ang Azure Developer CLI (azd) ay isang tool sa command-line na idinisenyo upang pabilisin ang iyong paglalakbay mula sa lokal na pag-develop patungo sa Azure deployment. Pinapasimple nito ang proseso ng pagbuo, pag-deploy, at pamamahala ng cloud-native na mga aplikasyon sa Azure.

## Mga Pangunahing Konsepto

### Templates
Ang templates ang pundasyon ng azd. Naglalaman ang mga ito ng:
- **Application code** - Ang iyong source code at mga dependencies
- **Infrastructure definitions** - Mga Azure resources na tinukoy sa Bicep o Terraform
- **Configuration files** - Mga settings at environment variables
- **Deployment scripts** - Mga automated deployment workflows

### Environments
Ang environments ay kumakatawan sa iba't ibang deployment targets:
- **Development** - Para sa testing at development
- **Staging** - Pre-production environment
- **Production** - Live production environment

Ang bawat environment ay may sariling:
- Azure resource group
- Mga configuration settings
- Deployment state

### Services
Ang services ang mga building blocks ng iyong aplikasyon:
- **Frontend** - Mga web application, SPAs
- **Backend** - Mga API, microservices
- **Database** - Mga solusyon sa data storage
- **Storage** - File at blob storage

## Mga Pangunahing Tampok

### 1. Template-Driven Development
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Domain-specific language ng Azure
- **Terraform** - Multi-cloud infrastructure tool
- **ARM Templates** - Azure Resource Manager templates

### 3. Integrated Workflows
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Environment Management
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Istruktura ng Proyekto

Isang tipikal na istruktura ng proyekto ng azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Mga Configuration Files

### azure.yaml
Ang pangunahing configuration file ng proyekto:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Environment-specific na configuration:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Karaniwang Workflows

### Pagsisimula ng Bagong Proyekto
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Siklo ng Pag-develop
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Pamamahala ng Maramihang Environments
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Mga Navigation Commands

### Discovery
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Pamamahala ng Proyekto
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitoring
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Mga Pinakamahusay na Kasanayan

### 1. Gumamit ng Makahulugang Pangalan
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Gamitin ang Templates
- Magsimula sa mga umiiral na templates
- I-customize ayon sa iyong pangangailangan
- Gumawa ng reusable templates para sa iyong organisasyon

### 3. Paghiwalay ng Environments
- Gumamit ng magkakahiwalay na environments para sa dev/staging/prod
- Huwag mag-deploy nang direkta sa production mula sa lokal na makina
- Gumamit ng CI/CD pipelines para sa production deployments

### 4. Pamamahala ng Configuration
- Gumamit ng environment variables para sa sensitibong data
- Panatilihin ang configuration sa version control
- I-dokumento ang environment-specific na mga settings

## Pag-unlad sa Pag-aaral

### Baguhan (Linggo 1-2)
1. I-install ang azd at mag-authenticate
2. Mag-deploy ng simpleng template
3. Unawain ang istruktura ng proyekto
4. Matutunan ang mga pangunahing commands (up, down, deploy)

### Intermediate (Linggo 3-4)
1. I-customize ang templates
2. Pamahalaan ang maramihang environments
3. Unawain ang infrastructure code
4. Mag-set up ng CI/CD pipelines

### Advanced (Linggo 5+)
1. Gumawa ng custom templates
2. Advanced na mga infrastructure patterns
3. Multi-region deployments
4. Enterprise-grade configurations

## Mga Susunod na Hakbang

- [Installation & Setup](installation.md) - I-install at i-configure ang azd
- [Your First Project](first-project.md) - Hands-on tutorial
- [Configuration Guide](configuration.md) - Mga advanced na opsyon sa configuration

## Karagdagang Mga Mapagkukunan

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

**Navigation**
- **Nakaraang Aralin**: [README](../../README.md)
- **Susunod na Aralin**: [Installation & Setup](installation.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.