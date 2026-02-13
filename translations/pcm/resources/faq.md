# Wetin People Dey Ask (FAQ)

**Find Help by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **🚆 Installation Issues**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 AI Questions**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Introduction

Dis full FAQ go give answers to di common kweschons wey people dey ask about Azure Developer CLI (azd) and Azure deployments. E go help you find quick solutions to common problems, understand beta practices, and clear tori on azd concepts and how things dey flow.

## Learning Goals

By reading dis FAQ, you go:
- Find quick answers to common Azure Developer CLI kweschons and wahala
- Understand key concepts and terms through practical Q&A style
- Access troubleshooting solutions for frequent problems and error cases
- Learn best practices from common kweschons about optimization
- Discover advanced features and wetin dem fit do through expert-level kweschons
- Quickly check guidance about cost, security, and deployment strategy

## Learning Outcomes

If you dey refer to dis FAQ regular, you go fit:
- Solve common Azure Developer CLI wahala by yourself using di solutions wey dey here
- Make informed decisions about deployment strategies and configuration
- Understand how azd take relate with other Azure tools and services
- Use best practices based on community experience and expert suggestions
- Troubleshoot authentication, deployment, and configuration problems well
- Optimize cost and performance using di tips and recommendations for dis FAQ

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
**A**: Azure Developer CLI (azd) na tool wey developers dey use for command-line to speed up how dem take move application from local development environment go Azure. E dey give best practices through templates and e dey help for the whole deployment lifecycle.

### Q: How azd different from Azure CLI?
**A**: 
- **Azure CLI**: Tool wey fit do plenty tins to manage Azure resources
- **azd**: Tool wey focus on developers and application deployment flows
- azd dey use Azure CLI inside but e dey provide higher-level abstractions for common development scenarios
- azd get templates, environment management, and deployment automation

### Q: Do I need Azure CLI installed to use azd?
**A**: Yes, azd need Azure CLI for authentication and some operations. Install Azure CLI first, then install azd.

### Q: Wetin programming languages azd support?
**A**: azd dey language-agnostic. E dey work with:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: Fit I use azd with existing projects?
**A**: Yes! You fit either:
1. Use `azd init` to add azd configuration to existing projects
2. Adapt existing projects to match azd template structure
3. Create custom templates based on your current architecture

---

## Authentication & Access

### Q: How I go authenticate with Azure using azd?
**A**: Use `azd auth login` wey go open browser window for Azure authentication. For CI/CD scenarios, use service principals or managed identities.

### Q: Fit I use azd with multiple Azure subscriptions?
**A**: Yes. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` to tell which subscription make each environment use.

### Q: Wetin permissions I need to deploy with azd?
**A**: Normally you go need:
- **Contributor** role on the resource group or subscription
- **User Access Administrator** if you dey deploy resources wey need role assignments
- Specific permissions fit change base on template and resources wey you dey deploy

### Q: Fit I use azd for CI/CD pipelines?
**A**: Sure! azd dem design am for CI/CD integration. Use service principals for authentication and set environment variables for configuration.

### Q: How I handle authentication for GitHub Actions?
**A**: Use the Azure Login action with service principal credentials:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where I go find azd templates?
**A**: 
- Official templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community templates: search GitHub for "azd-template"
- Use `azd template list` to browse di templates wey dey available

### Q: How I go create custom template?
**A**: 
1. Start with one template wey already exist
2. Modify `azure.yaml`, infrastructure files, and application code
3. Test well with `azd up`
4. Publish to GitHub with correct tags

### Q: Fit I use azd without template?
**A**: Yes, run `azd init` inside existing project to create the configuration files wey you need. You go still need configure `azure.yaml` and infrastructure files by hand.

### Q: Wetin difference between official and community templates?
**A**: 
- **Official templates**: Microsoft dey maintain dem, dem dey update regularly, and dem get good documentation
- **Community templates**: Developers create dem, fit get special use cases, and quality/maintenance fit vary

### Q: How I go update template for my project?
**A**: Templates no dey update automatic. You fit:
1. Manually compare and merge changes from the source template
2. Start fresh with `azd init` using the updated template
3. Cherry-pick specific improvements from updated templates

---

## Deployment & Infrastructure

### Q: Which Azure services azd fit deploy?
**A**: azd fit deploy any Azure service through Bicep/ARM templates, including:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, and monitoring resources

### Q: Fit I deploy to multiple regions?
**A**: Yes, configure multiple regions in your Bicep templates and set the location parameter correct for each environment.

### Q: How I go handle database schema migrations?
**A**: Use deployment hooks inside `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Fit I deploy only infrastructure without applications?
**A**: Yes, use `azd provision` to deploy only the infrastructure parts wey dey defined in your templates.

### Q: How I go deploy to existing Azure resources?
**A**: E dey complex and no dey directly supported. You fit:
1. Import existing resources into your Bicep templates
2. Use existing resource references inside templates
3. Modify templates to conditionally create or reference resources

### Q: Fit I use Terraform instead of Bicep?
**A**: For now, azd mainly support Bicep/ARM templates. Official Terraform support no dey yet, but community solutions fit dey.

---

## Configuration & Environments

### Q: How I go manage different environments (dev, staging, prod)?
**A**: Create separate environments with `azd env new <environment-name>` and configure different settings for each:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where environment configurations dey stored?
**A**: For the `.azure` folder inside your project directory. Each environment get im own folder with configuration files.

### Q: How I go set environment-specific configuration?
**A**: Use `azd env set` to configure environment variables:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Fit I share environment configurations among team members?
**A**: The `.azure` folder get sensitive info and dem no suppose commit am to version control. Instead:
1. Document the environment variables wey need set
2. Use deployment scripts to set up environments
3. Use Azure Key Vault for sensitive configuration

### Q: How I go override template defaults?
**A**: Set environment variables wey match the template parameters:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why `azd up` dey fail?
**A**: Common reasons:
1. **Authentication issues**: Run `azd auth login`
2. **Insufficient permissions**: Check your Azure role assignments
3. **Resource naming conflicts**: Change AZURE_ENV_NAME
4. **Quota/capacity issues**: Check regional availability
5. **Template errors**: Validate Bicep templates

### Q: How I go debug deployment failures?
**A**: 
1. Use `azd deploy --debug` for verbose output
2. Check Azure portal deployment history
3. Review Activity Log inside Azure portal
4. Use `azd show` to display current environment state

### Q: Why my environment variables no dey work?
**A**: Check:
1. Variable names match template parameters exactly
2. Values dey properly quoted if dem get spaces
3. Environment don dey selected: `azd env select <environment>`
4. Variables don set for the correct environment

### Q: How I go clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
This removes all resources and environment configuration.

### Q: Why my application no open after deployment?
**A**: Check:
1. Deployment finish successful
2. Application dey run (check logs for Azure portal)
3. Network security groups allow traffic
4. DNS/custom domains don configure correct

---

## Cost & Billing

### Q: How much azd deployments go cost?
**A**: Cost dey depend on:
- Azure services wey you deploy
- Service tiers/SKUs wey you choose
- Regional pricing differences
- How you dey use am

Use the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) to get estimate.

### Q: How I go control costs for azd deployments?
**A**: 
1. Use lower-tier SKUs for development environments
2. Set up Azure budgets and alerts
3. Use `azd down` to remove resources when you no need dem
4. Choose the correct regions (cost differ by location)
5. Use Azure Cost Management tools

### Q: Dem dey free tier options for azd templates?
**A**: Many Azure services get free tiers:
- App Service: Free tier dey
- Azure Functions: 1M free executions/month
- Cosmos DB: Free tier with 400 RU/s
- Application Insights: First 5GB/month free

Configure templates to use free tiers where dem dey available.

### Q: How I go estimate costs before deployment?
**A**: 
1. Review template `main.bicep` to see which resources dem go create
2. Use Azure Pricing Calculator with the specific SKUs
3. Deploy to a development environment first to watch real costs
4. Use Azure Cost Management for detailed cost analysis

---

## Best Practices

### Q: Wetin be best practices for azd project structure?
**A**: 
1. Keep application code separate from infrastructure
2. Use clear service names inside `azure.yaml`
3. Put proper error handling for build scripts
4. Use environment-specific configuration
5. Include good documentation

### Q: How I go organize multiple services for azd?
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

### Q: I suppose commit the `.azure` folder to version control?
**A**: **No!** The `.azure` folder get sensitive information. Add am to `.gitignore`:
```gitignore
.azure/
```

### Q: How I go handle secrets and sensitive configuration?
**A**: 
1. Use Azure Key Vault for secrets
2. Reference Key Vault secrets in application configuration
3. Never commit secrets to version control
4. Use managed identities for service-to-service authentication

### Q: Wetin the recommended approach for CI/CD with azd?
**A**: 
1. Use separate environments for each stage (dev/staging/prod)
2. Run automated tests before deployment
3. Use service principals for authentication
4. Store sensitive configuration in pipeline secrets/variables
5. Put approval gates for production deployments

---

## Advanced Topics

### Q: Fit I extend azd with custom functionality?
**A**: Yes, through deployment hooks inside `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How I go integrate azd with existing DevOps processes?
**A**: 
1. Use azd commands inside your existing pipeline scripts
2. Standardize on azd templates across teams
3. Integrate with your monitoring and alerting setup
4. Use azd JSON output for pipeline integration

### Q: Fit I use azd with Azure DevOps?
**A**: Yes, azd go work with any CI/CD system. Create Azure DevOps pipelines wey run azd commands.

### Q: How I go contribute to azd or create community templates?
**A**:
1. **azd tool**: Help contribute for [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Create templates wey follow di [template guidelines](https://github.com/Azure-Samples/awesome-azd)
3. **Documentation**: Contribute to docs for [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Wetin be di roadmap for azd?
**A**: See di [official roadmap](https://github.com/Azure/azure-dev/projects) for di features wey dem don plan an di improvements.

### Q: How I go migrate from other deployment tools to azd?
**A**: 
1. Check di current deployment architecture
2. Create Bicep templates wey dey equivalent
3. Configure `azure.yaml` make e match di current services
4. Test am well for development environment
5. Migrate di environments small-small

---

## You still get questions?

### **Search First**
- Check di [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Search [GitHub issues](https://github.com/Azure/azure-dev/issues) for similar problem dem

### **Get Help**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Support from di community
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technical questions
- [Azure Discord](https://discord.gg/azure) - Real-time chat with di community

### **Report Issues**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bug reports and feature requests
- Include relevant logs, error messages, and steps wey fit reproduce am

### **Learn More**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Dis FAQ dey updated regular. Last updated: September 9, 2025*

---

**Navigation**
- **Previous Lesson**: [Glossary](glossary.md)
- **Next Lesson**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis dokument don translate wit AI translation service wey dem dey call Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg sabi say automatic translations fit get mistakes or no too accurate. Di original dokument for im original language na im be di authoritative source. If na serious or important information, e better make professional human translator check or translate am. We no dey responsible for any misunderstanding or wrong interpretation wey fit come from using dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->