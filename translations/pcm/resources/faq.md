# Frequently Asked Questions (FAQ)

**Get Help by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **🚆 Installation Wahala**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 AI Questions**: [Chapter 2: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Troubleshooting**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Introduction

Dis FAQ dey answer di common questions wey people dey ask about Azure Developer CLI (azd) and how to deploy for Azure. E go help you find quick solution to wahala, understand di best way to do am, and clear your mind about azd concepts and workflows.

## Learning Goals

If you read dis FAQ well, you go:
- Get quick answer to di common wahala wey dey happen with Azure Developer CLI
- Understand di main ideas and words wey dem dey use through Q&A wey dey practical
- See solution to wahala wey dey happen often and error wey fit show
- Learn di best way to do am through di common questions wey people dey ask about optimization
- Discover di advanced features and wetin dem fit do through expert-level questions
- Get guidance about cost, security, and deployment strategy fast

## Learning Outcomes

If you dey use dis FAQ often, you go fit:
- Solve di common wahala wey dey happen with Azure Developer CLI by yourself with di solution wey dem provide
- Make better decision about how you go deploy and configure your app
- Understand how azd and other Azure tools and services dey work together
- Use di best way to do am wey community and experts don recommend
- Solve wahala wey dey happen with authentication, deployment, and configuration well
- Use di FAQ advice to reduce cost and make performance better

## Table of Contents

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: Wetin be Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) na tool wey developers dey use for command-line wey dey make am fast to move your app from your local development environment go Azure. E dey provide templates wey dey follow di best way to do am and e dey help for di whole deployment process.

### Q: Wetin be di difference between azd and Azure CLI?
**A**: 
- **Azure CLI**: Na general tool wey dey manage Azure resources
- **azd**: Na tool wey developers dey use for application deployment workflows
- azd dey use Azure CLI inside but e dey provide higher-level way to do di common development things
- azd get templates, environment management, and e dey automate deployment

### Q: I need to install Azure CLI before I fit use azd?
**A**: Yes, azd dey need Azure CLI for authentication and some operations. First install Azure CLI, then install azd.

### Q: Which programming languages azd dey support?
**A**: azd no dey choose language. E dey work with:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: I fit use azd for project wey I don already get?
**A**: Yes! You fit:
1. Use `azd init` to add azd configuration for di project wey you don already get
2. Change di project wey you don already get to match azd template structure
3. Create custom templates wey dey follow di architecture wey you don already get

---

## Authentication & Access

### Q: How I go take authenticate with Azure using azd?
**A**: Use `azd auth login` wey go open browser window for Azure authentication. For CI/CD, use service principals or managed identities.

### Q: I fit use azd with plenty Azure subscriptions?
**A**: Yes. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` to choose di subscription wey you wan use for each environment.

### Q: Which permission I need to deploy with azd?
**A**: Normally you go need:
- **Contributor** role for di resource group or subscription
- **User Access Administrator** if you dey deploy resources wey need role assignments
- Di permission wey you need fit change based on di template and resources wey you dey deploy

### Q: I fit use azd for CI/CD pipelines?
**A**: Of course! azd dey work well for CI/CD integration. Use service principals for authentication and set environment variables for configuration.

### Q: How I go take handle authentication for GitHub Actions?
**A**: Use di Azure Login action with service principal credentials:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where I fit find azd templates?
**A**: 
- Official templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community templates: Search GitHub for "azd-template"
- Use `azd template list` to see di templates wey dey available

### Q: How I go take create custom template?
**A**: 
1. Start with di template structure wey dey already
2. Change `azure.yaml`, infrastructure files, and application code
3. Test am well with `azd up`
4. Publish am for GitHub with di correct tags

### Q: I fit use azd without template?
**A**: Yes, use `azd init` for di project wey you don already get to create di configuration files wey you need. You go need configure `azure.yaml` and infrastructure files by yourself.

### Q: Wetin be di difference between official and community templates?
**A**: 
- **Official templates**: Microsoft dey maintain am, dem dey update am often, e get better documentation
- **Community templates**: Developers dey create am, e fit get special use cases, di quality and maintenance fit dey different

### Q: How I go take update template for my project?
**A**: Templates no dey update by themselves. You fit:
1. Compare and merge di changes from di source template by yourself
2. Start afresh with `azd init` using di updated template
3. Pick di specific improvement wey dey di updated templates

---

## Deployment & Infrastructure

### Q: Which Azure services azd fit deploy?
**A**: azd fit deploy any Azure service through Bicep/ARM templates, like:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, and monitoring resources

### Q: I fit deploy for plenty regions?
**A**: Yes, configure plenty regions for your Bicep templates and set di location parameter well for each environment.

### Q: How I go take handle database schema migrations?
**A**: Use deployment hooks for `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: I fit deploy only infrastructure without applications?
**A**: Yes, use `azd provision` to deploy only di infrastructure wey dey di templates.

### Q: How I go take deploy to Azure resources wey don already dey?
**A**: E dey complex and azd no dey support am directly. You fit:
1. Add di resources wey don already dey to your Bicep templates
2. Use di resources wey don already dey for templates
3. Change templates to create or use di resources wey don already dey

### Q: I fit use Terraform instead of Bicep?
**A**: For now, azd dey support Bicep/ARM templates. Terraform no dey officially supported, but community fit get solution.

---

## Configuration & Environments

### Q: How I go take manage different environments (dev, staging, prod)?
**A**: Create different environments with `azd env new <environment-name>` and configure di settings for each:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where dem dey store environment configurations?
**A**: For di `.azure` folder wey dey your project directory. Each environment get im own folder with configuration files.

### Q: How I go take set environment-specific configuration?
**A**: Use `azd env set` to configure environment variables:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: I fit share environment configurations with my team members?
**A**: Di `.azure` folder get sensitive information and e no suppose dey version control. Instead:
1. Write down di environment variables wey dem need
2. Use deployment scripts to set up environments
3. Use Azure Key Vault for sensitive configuration

### Q: How I go take change di default settings for template?
**A**: Set environment variables wey match di template parameters:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why `azd up` no dey work?
**A**: Di common reasons na:
1. **Authentication wahala**: Run `azd auth login`
2. **Permission no dey enough**: Check your Azure role assignments
3. **Resource name dey clash**: Change AZURE_ENV_NAME
4. **Quota/capacity wahala**: Check di availability for di region
5. **Template error**: Validate di Bicep templates

### Q: How I go take debug deployment wahala?
**A**: 
1. Use `azd deploy --debug` to see di full output
2. Check di deployment history for Azure portal
3. Look di Activity Log for Azure portal
4. Use `azd show` to see di current environment state

### Q: Why my environment variables no dey work?
**A**: Check:
1. Di variable names dey match di template parameters well
2. Di values dey quoted well if dem get space
3. Di environment dey selected: `azd env select <environment>`
4. Di variables dey set for di correct environment

### Q: How I go take clean failed deployments?
**A**: 
```bash
azd down --force --purge
```
Dis go remove all resources and environment configuration.

### Q: Why my app no dey accessible after deployment?
**A**: Check:
1. Di deployment finish well
2. Di app dey run (check di logs for Azure portal)
3. Di Network security groups dey allow traffic
4. DNS/custom domains dey configured well

---

## Cost & Billing

### Q: How much azd deployments go cost?
**A**: Di cost dey depend on:
- Di Azure services wey you deploy
- Di service tiers/SKUs wey you choose
- Di price for di region
- How you dey use am

Use di [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) to estimate.

### Q: How I go take control cost for azd deployments?
**A**: 
1. Use di lower-tier SKUs for development environments
2. Set up Azure budgets and alerts
3. Use `azd down` to remove resources if you no dey use dem
4. Choose di region wey dey cheaper (price dey change by location)
5. Use Azure Cost Management tools

### Q: azd templates get free tier options?
**A**: Plenty Azure services get free tiers:
- App Service: Free tier dey
- Azure Functions: 1M free executions/month
- Cosmos DB: Free tier with 400 RU/s
- Application Insights: First 5GB/month free

Configure templates to use di free tiers if e dey available.

### Q: How I go take estimate cost before deployment?
**A**: 
1. Check di template `main.bicep` to see di resources wey dem go create
2. Use Azure Pricing Calculator with di specific SKUs
3. Deploy for development environment first to monitor di real cost
4. Use Azure Cost Management to analyze di cost well

---

## Best Practices

### Q: Wetin be di best way to arrange azd project structure?
**A**: 
1. Keep di app code separate from di infrastructure
2. Use service names wey make sense for `azure.yaml`
3. Handle errors well for build scripts
4. Use configuration wey dey specific to environment
5. Add better documentation

### Q: How I go take arrange plenty services for azd?
**A**: Use di recommended structure:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: I suppose commit di `.azure` folder for version control?
**A**: **No!** Di `.azure` folder get sensitive information. Add am to `.gitignore`:
```gitignore
.azure/
```

### Q: How I go take handle secrets and sensitive configuration?
**A**: 
1. Use Azure Key Vault for secrets
2. Reference di Key Vault secrets for app configuration
3. No ever commit secrets for version control
4. Use managed identities for service-to-service authentication

### Q: Wetin be di best way to do CI/CD with azd?
**A**: 
1. Use different environments for each stage (dev/staging/prod)
2. Test everything well before deployment
3. Use service principals for authentication
4. Store sensitive configuration for pipeline secrets/variables
5. Add approval gates for production deployments

---

## Advanced Topics

### Q: I fit add custom functionality for azd?
**A**: Yes, through deployment hooks for `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How I go take use azd with di DevOps process wey I don already get?
**A**: 
1. Use azd commands for di pipeline scripts wey you don already get
2. Make azd templates standard for di team
3. Add am to di monitoring and alerting wey you don already get
4. Use di JSON output for azd to connect am with pipeline

### Q: I fit use azd with Azure DevOps?
**A**: Yes, azd dey work with any CI/CD system. Create Azure DevOps pipelines wey dey use azd commands.

### Q: How I go take contribute to azd or create community templates?
**A**: 
1. **azd tool**: Make you help for [Azure/azure-dev](https://github.com/Azure/azure-dev)  
2. **Templates**: Make templates wey follow [template guidelines](https://github.com/Azure-Samples/awesome-azd)  
3. **Documentation**: Help for docs for [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### Q: Wetin be the roadmap for azd?  
**A**: Check the [official roadmap](https://github.com/Azure/azure-dev/projects) to see the plans for new features and improvements.  

### Q: How I go fit move from other deployment tools go azd?  
**A**:  
1. Look your current deployment setup well  
2. Make Bicep templates wey match am  
3. Set `azure.yaml` to fit your current services  
4. Test am well for development environment  
5. Small small, move your environments  

---

## You still get questions?  

### **Search First**  
- Check the [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Search [GitHub issues](https://github.com/Azure/azure-dev/issues) to see if person don get the same wahala  

### **Get Help**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community go fit help you  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Ask technical questions  
- [Azure Discord](https://discord.gg/azure) - Chat with community for real-time  

### **Report Issues**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Report bugs or ask for new features  
- Add logs, error messages, and steps wey show how the problem take happen  

### **Learn More**  
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Dis FAQ dey update regularly. Last update: September 9, 2025*  

---

**Navigation**  
- **Previous Lesson**: [Glossary](glossary.md)  
- **Next Lesson**: [Study Guide](study-guide.md)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even as we dey try make am accurate, abeg sabi say automated translations fit get mistake or no dey correct well. Di original dokyument for im native language na di main source wey you go trust. For important information, e good make professional human translation dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->