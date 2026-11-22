# Frequently Asked Questions (FAQ)

**Get Help by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **🚆 Installation Issues**: [Chapter 1: Installation & Setup](../docs/chapter-01-foundation/installation.md)
- **🤖 AI Questions**: [Chapter 2: AI-First Development](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Chapter 7: Troubleshooting & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduction

Disfala complete FAQ de for give ansa to di most common kwestin dem about Azure Developer CLI (azd) an Azure deployments. Find quick solushon dem to common wahala, sabi beta way dem de do am, an get klarifikeshon on top azd koncepts an workflow dem.

## Learning Goals

If you review dis FAQ, you go:
- Find quick ansa dem to common Azure Developer CLI kwestin dem an wahala dem
- Understand di important koncepts an tok tok dem through beta Q&A style
- Get troubleshooting solushons for di common problem dem an error dem
- Learn beta beta way dem de use through common kwestin about beta way dem de do am
- Find advanced feature an power through expert level kwestin dem
- Use beta beta way for cost, security, and deployment strategy easily

## Learning Outcomes

If you dey use dis FAQ steady, you go fit:
- Solve common Azure Developer CLI wahala dem yuself wit di solushons we dem provide
- Make beta decision for deployment strategy an configurations
- Understand how azd de work wit oda Azure tools an services
- Follow beta beta way we community an expert dem recommend
- Debug authentication, deployment, and configuration wahala well well
- Save cost and improve performance using di FAQ info and beta tips

## Table of Contents

- [Getting Started](#getting-started)
- [Authentication & Access](#authentication--access)
- [Templates & Projects](#templates--projects)
- [Deployment & Infrastructure](#deployment--infrastructure)
- [Configuration & Environments](#configuration--environments)
- [Troubleshooting](#troubleshooting)
- [Cost & Billing](#cost--billing)
- [Best Practices](#best-practices)
- [Advanced Topics](#advanced-topics)

---

## Getting Started

### Q: Wetin be Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) na developer focused command-line tool wey dey fast-track how you fit move your app from local development environment go Azure. E dey provide beta way dem de do am through templates and e dey help di full deployment lifecycle.

### Q: How azd different from Azure CLI?
**A**: 
- **Azure CLI**: Tool wey general purposes for managing Azure resources
- **azd**: Tool wey focus on developer for application deployment workflow
- azd get im own authentication an deployment workflow; Azure CLI na different, complementary tool
- azd carry templates, environment management, an deployment automation inside

### Q: I need Azure CLI install before I fit take use azd?
**A**: No be for core AZD workflow. You fit authenticate with `azd auth login`. Install Azure CLI separately if template hook or exercise call `az` commands explicitly.

### Q: Which programming language azd dey support?
**A**: azd no get language bias. E dey work with:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: I fit use azd with project we I don dae before?
**A**: Yes o! You fit:
1. Use `azd init` to add azd configuration to your old project dem
2. Change your old project to fit azd template setup
3. Make your own template based on how you don build am before

### Q: Wetin change with Foundry extension wey don general available?
**A**: Di `microsoft.foundry` bundle reach version 1.0 an GA on November 5, 2026. Wit AZD 1.37.0+ you fit use `azd ext install microsoft.foundry` to install seven core extension dem for agents, connections, inspector, projects, routines, skills, and toolboxes. E no be new command namespace, and dem components de version separately. Evaluations, datasets, fine-tuning, an custom models dem dey install separately; optional preview features no go turn GA just because the bundle na GA.

Di [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) dey use Python 3.13+ and current uv. `azd ai agent run` dey open Agent Inspector for your local, but model calls still dey use Azure and e go charge. Code-mode `azd deploy` dey upload source for remote build without necessity to build local container.

### Q: Does `azd down` remove hosted agent from foundry project we dem don dey use?
**A**: No for di reused-project road we the hosted-agent quickstart talk about: e go lef di project, hosted agent, and oda resource dem for where dem de. Make you remove di resource dem we you no want separately without deleting resource we dem de share. If environment create new Foundry project, `azd down` go delete im resource group and everything wey de inside. Make you check di [cleanup guidance](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) and deletion prompt dem before you go commot am.

---

## Authentication & Access

### Q: How I dey authenticate with Azure using azd?
**A**: Use `azd auth login` wey go open browser window for Azure authentication. For CI/CD wahala, use service principals or managed identities.

### Q: I fit use azd with many Azure subscriptions?
**A**: Yes o. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` to mark di subscription we you wan use for each environment.

### Q: Which permission I go need to deploy wit azd?
**A**: Normally you go need:
- **Contributor** role for di resource group or subscription
- **User Access Administrator** if you dey deploy resource wey need role assignments
- Di specific permission fit change depend on di template and resource wey you wan deploy

### Q: I fit use azd for CI/CD pipeline dem?
**A**: Of course! azd na tool we dey design for CI/CD join. Use service principals for authentication and set environment variable dem for configuration.

### Q: How I go handle authentication for GitHub Action dem?
**A**: Make you prefer workload identity federation (OIDC), wey you fit configure with `azd pipeline config`. Di generated workflow dey install AZD and dey authenticate AZD straight for federated identity. Only `azure/login` step alone no go set AZD login. Di login step we you put for inside existing job be:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Deploy or provision after dem login, wit di AZD environment, subscription, and location we dem set. Di identity federated credential must trust workflow repository/ref or GitHub environment, an im Azure role dem must allow di operation dem we you ask.

---

## Templates & Projects

### Q: Where I fit find azd template dem?
**A**: 
- Official an community template dem: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community template dem: GitHub search for "azd-template"
- Use `azd template list` to look template wey dey available

### Q: How I fit create my own custom template?
**A**: 
1. Start wit existing template structure
2. Change `azure.yaml`, infrastructure file dem, and app code dem
3. Test well well wit `azd up`
4. Publish am for GitHub wit beta tags

### Q: I fit use azd without template?
**A**: Yes o, use `azd init` for existing project to create di required configuration file dem. You go need to manually arrange `azure.yaml` and infrastructure file dem.

### Q: Wetin be di difference between official and community template dem?
**A**: 
- **Official templates**: Di ones we Microsoft dey maintain, dem dey update am steady, get well documented
- **Community templates**: Dem developers dey create am, fit get special use case, quality and maintenance fit different

### Q: How I fit update template for my project?
**A**: Templates no dey update automatically. You fit:
1. Manually compare an join changes from source template
2. Start fresh wit `azd init` using di updated template
3. Pick beta beta improvement from updated template

---

## Deployment & Infrastructure

### Q: Which Azure service dem azd fit deploy?
**A**: azd fit deploy any Azure service through Bicep/ARM template dem, including:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, an monitoring resource dem

### Q: I fit deploy to many regions?
**A**: Yes, set multiple regions for your Bicep template dem and set di location parameter right for each environment.

### Q: How I go manage database schema migration?
**A**: Use deployment hooks for `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: I fit deploy just infrastructure without application dem?
**A**: Yes, use `azd provision` to deploy only infrastructure components wey your template talk about.

### Q: How I take deploy to existing Azure resource dem?
**A**: Yes, if di template allow am. Make you reference existing resource dem with Bicep's `existing` declarations or di template existing-resource parameters, and map app services to the target we dem intend. Dis one no dey import ownership or create missing permission dem automatically. Make you check di template well before you deploy.

### Q: I fit use Terraform instead make I use Bicep?
**A**: Yes o. AZD dey support Terraform as well as Bicep. Choose Terraform-based template or setup `infra.provider: terraform` in `azure.yaml`, wit beta Terraform file dem an state/backend setup. Make you check [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuration & Environments

### Q: How I go manage different environment (dev, staging, prod)?
**A**: Make separate environment dem wit `azd env new <environment-name>` and set different setting dem for each one:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where environment configuration dem de store?
**A**: Na for `.azure` folder wey dey inside your project directory. Each environment get im own folder with configuration file dem.

### Q: How I go set environment-specific configuration?
**A**: Use `azd env set` to set environment variables:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: I fit share environment configuration among team member dem?
**A**: Di `.azure` folder get sensitive tins inside an e no suppose enter version control. Instead:
1. Write down required environment variable dem
2. Use deployment scripts to setup environment dem
3. Use Azure Key Vault for sensitive configuration

### Q: How I fit override template default setting dem?
**A**: Set environment variables wey go match template parameter dem:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Only those variable dem we template dey use na dem go affect deployment. `SKU_NAME` wey dey above na example custom input, e no be universal AZD setting.

---

## Troubleshooting

### Q: Why `azd up` dey fail?
**A**: Common cause na:
1. **Authentication matter**: Run `azd auth login`
2. **Permission no enough**: Check your Azure role assignment dem
3. **Resource name conflict**: Check the conflicting resource and di template naming input dem; create separate environment wit `azd env new` if you want isolation
4. **Quota or capacity problem**: Check regional availability
5. **Template error**: Validate Bicep template dem

### Q: How I go debug deployment failure dem?
**A**: 
1. Use `azd deploy --debug` for verbose output
2. Check Azure portal deployment history
3. Review Activity Log for Azure portal
4. Use `azd show` to display current environment state

### Q: Why my environment variable no dey work?
**A**: Check:
1. Variable name na same as template parameter dem exactly
2. Value dem get correct quote if e get space
3. Environment wey you select: `azd env select <environment>`
4. Variable dem set for correct environment

### Q: How I fit clean failed deployment dem?
**A**: 
```bash
azd down
```
Make sure you check the environment we you select an confirmation for deletion before you proceed. Na for delete provisioned Azure resource dem, e no dey affect local `.azure` environment configuration. `--purge` still go ask make e delete protected resource dem permanently, and e fit block by retention or purge protection; dis no be usual recovery step.

### Q: Why my application no dey accessible after deployment?
**A**: Check:
1. Deployment finish well well
2. Application dey run (check logs for Azure portal)
3. Network security groups dey allow traffic
4. DNS or custom domain dem set correctly

---

## Cost & Billing

### Q: How much azd deployment go cost?
**A**: Cost go depend on:
- Azure service dem we you deploy
- Service tiers or SKU we you choose
- Regional price difference
- How you dey use am

Use [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) to estimate.

### Q: How I go fit control cost for azd deployment dem?
**A**: 
1. Use lower-tier SKU for development environment dem
2. Setup Azure budget an alert dem
3. Use `azd down` to remove resource dem when you no need am
4. Choose suitable region (cost fit change based on location)
5. Use Azure Cost Management tool dem

### Q: Dem get free tier options for azd templates?
**A**: Some services get free SKUs or monthly grants, epp like eligibility, hosting plan, region, and subscription limits dey. Dem no mean say whole template free: databases, search, networking, registry, telemetry, and model inference fit still charge separately. Check the [Azure free services list](https://azure.microsoft.com/free/) and current pricing for every resource before you deploy.

### Q: How I fit estimate cost before deployment?
**A**: 
1. Look template `main.bicep` to see the resources wey dem go create
2. Use Azure Pricing Calculator with correct SKUs
3. First deploy for development environment make you fit monitor actual costs
4. Use Azure Cost Management for detailed cost analysis

---

## Best Practices

### Q: Wetin be the best practices for azd project structure?
**A**: 
1. Make application code separate from infrastructure
2. Use meaningful service names inside `azure.yaml`
3. Make sure correct error handling dey for build scripts
4. Use environment-specific configuration
5. Include full documentation

### Q: How I go take organize many services for azd?
**A**: Use the recommended structure:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: I suppose commit `.azure` folder to version control?
**A**: **No!** `.azure` folder get sensitive info. Add am to `.gitignore`:
```gitignore
.azure/
```

### Q: How I handle secrets and sensitive configuration?
**A**: 
1. Use Azure Key Vault for secrets
2. Reference Key Vault secrets for application configuration
3. No ever commit secrets to version control
4. Use managed identities to do service-to-service authentication

### Q: Wetin be the recommended approach for CI/CD with azd?
**A**: 
1. Use separate environments for each stage (dev/staging/prod)
2. Implement automated testing before deployment
3. Use service principals for authentication
4. Store sensitive configuration for pipeline secrets/variables
5. Implement approval gates for production deployments

---

## Advanced Topics

### Q: I fit extend azd with custom functionality?
**A**: Yes, through deployment hooks inside `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How I fit integrate azd with existing DevOps processes?
**A**: 
1. Use azd commands for existing pipeline scripts
2. Standardize azd templates across teams
3. Integrate with existing monitoring and alerting
4. Use azd's JSON output for pipeline integration

### Q: I fit use azd with Azure DevOps?
**A**: Yes, azd dey work with any CI/CD system. Create Azure DevOps pipelines wey use azd commands.

### Q: How I fit contribute to azd or create community templates?
**A**: 
1. **azd tool**: Contribute to [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Follow the [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentation**: Contribute to docs for [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Wetin be the roadmap for azd?
**A**: Check the [official roadmap](https://github.com/Azure/azure-dev/projects) for planned features and improvements.

### Q: How I go migrate from other deployment tools to azd?
**A**: 
1. Analyze current deployment architecture
2. Create equivalent Bicep templates
3. Configure `azure.yaml` to match current services
4. Test well-well for development environment
5. Slowly migrate environments

---

## You still get questions?

### **Search First**
- Check the [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Search [GitHub issues](https://github.com/Azure/azure-dev/issues) for similar problems

### **Get Help**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community support
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technical questions
- [Azure Discord](https://discord.gg/azure) - Real-time community chat

### **Report Issues**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bug reports and feature requests
- Include relevant logs, error messages, and steps to reproduce

### **Learn More**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technical guidance reviewed: November 4, 2026. Cloud availability and pricing must dey checked for your subscription and region.* 

---

**Navigation**
- **Previous Lesson**: [Glossary](glossary.md)
- **Next Lesson**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->