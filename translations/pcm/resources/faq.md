# Frequently Asked Questions (FAQ)

**Get Help by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **🚆 Installation Issues**: [Chapter 1: Installation & Setup](../docs/chapter-01-foundation/installation.md)
- **🤖 AI Questions**: [Chapter 2: AI-First Development](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Chapter 7: Troubleshooting & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduction

Dis comprehensive FAQ dey provide ansa to di most common questions about Azure Developer CLI (azd) and Azure deployments. Find quick solutions to common problems, understand best practices, and get clarification on azd concepts and workflows.

## Learning Goals

By reading dis FAQ, you go:
- Find quick ansa to common Azure Developer CLI questions and wahala
- Understand key concepts and terminology through practical Q&A format
- Access troubleshooting solutions for frequent problems and error scenarios
- Learn best practices through commonly asked questions about optimization
- Discover advanced features and capabilities through expert-level questions
- Reference cost, security, and deployment strategy guidance efficiently

## Learning Outcomes

If you dey check dis FAQ regularly, you fit:
- Solve common Azure Developer CLI problems by yourself using di solutions wey dey
- Make correct decisions about how to deploy and how to set am
- Understand how azd and other Azure tools and services relate
- Use best practices wey community and experts recommend
- Solve authentication, deployment, and configuration wahala well well
- Cut cost and make performance beta using FAQ tips and advice

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
**A**: Azure Developer CLI (azd) na developer centered command-line tool wey dey make am fast to move your application from your local development environment go Azure. E dey provide best practices through templates and e dey help for the whole deployment life cycle.

### Q: How azd different from Azure CLI?
**A**: 
- **Azure CLI**: Na general-purpose tool for managing Azure resources
- **azd**: Na developer-focused tool for application deployment workflows
- azd get im own authentication and deployment workflow; Azure CLI na separate, complementary tool
- azd get templates, environment management, and deployment automation

### Q: I need Azure CLI make I fit use azd?
**A**: No for the core AZD workflow. Authenticate with `azd auth login`. Install Azure CLI separately if template hook or exercise sharp run `az` commands.

### Q: Wetin be the programming languages wey azd support?
**A**: azd no dey limit to any language. E dey work with:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: I fit use azd with projects wey I don dey work on before?
**A**: Yes o! You fit either:
1. Use `azd init` to add azd configuration to your existing projects
2. Adjust your existing projects to fit azd template structure
3. Make custom templates based on your existing architecture

---

## Authentication & Access

### Q: How I go take authenticate with Azure using azd?
**A**: Use `azd auth login` wey go open browser window for Azure authentication. For CI/CD wahala, use service principals or managed identities.

### Q: I fit use azd with many Azure subscriptions?
**A**: Yes. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` to talk which subscription to use for each environment.

### Q: Which permissions I need to deploy with azd?
**A**: Normally you need:
- **Contributor** role on di resource group or subscription
- **User Access Administrator** if you dey deploy resources require role assignments
- Specific permissions dey vary by template and resources wey you dey deploy

### Q: I fit use azd for CI/CD pipelines?
**A**: Sure! azd design for CI/CD integration. Use service principals for authentication and set environment variables for configuration.

### Q: How I go take handle authentication for GitHub Actions?
**A**: Better make you use workload identity federation (OIDC), configured with `azd pipeline config`. The workflow wey dem generate dey install AZD and authenticate AZD directly with federated identity. Only `azure/login` step no fit establish AZD login. Login step for inside existing job na:
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

After login, you fit provision or deploy, with correct AZD environment, subscription, and location configured. Di identity federated credential must trust workflow repository/ref or GitHub environment, and im Azure roles must allow di operations wey dem request.

---

## Templates & Projects

### Q: Where I fit find azd templates?
**A**: 
- Official and community templates: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community templates: GitHub search for "azd-template"
- Use `azd template list` to look templates wey dey available

### Q: How I take create custom template?
**A**: 
1. Start from existing template structure
2. Change `azure.yaml`, infrastructure files, and application code
3. Test well with `azd up`
4. Publish am for GitHub with correct tags

### Q: I fit use azd without template?
**A**: Yes, use `azd init` inside existing project to create di configuration files wey you need. You go still need to manually configure `azure.yaml` and infrastructure files.

### Q: Wetin be di difference between official and community templates?
**A**: 
- **Official templates**: Microsoft dey maintain am, dem dey update am regularly, e get full documentation
- **Community templates**: Developers create am, dem fit get special use case, quality and maintenance fit change

### Q: How I go take update template for my project?
**A**: Templates no dey update automatically. You fit:
1. Manually compare and merge changes from source template
2. Start fresh with `azd init` to use updated template
3. Cherry-pick specific better changes from updated templates

---

## Deployment & Infrastructure

### Q: Which Azure services azd fit deploy?
**A**: azd fit deploy any Azure service through Bicep/ARM templates, including:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, and monitoring resources

### Q: I fit deploy for more than one region?
**A**: Yes, configure many regions for your Bicep templates and set the location parameter well for each environment.

### Q: How I take handle database schema migrations?
**A**: Use deployment hooks inside `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: I fit deploy only infrastructure without applications?
**A**: Yes, use `azd provision` to deploy just di infrastructure components wey your templates define.

### Q: How I take deploy to existing Azure resources?
**A**: Yes, if di template support am. Use existing resources with Bicep's `existing` declarations or di template existing-resource parameters, and map application services to di targets wey dem need. Dis one no mean say you dey import ownership or automatically create permission wey no dey. Make sure say you check di template well before you deploy.

### Q: I fit use Terraform instead of Bicep?
**A**: Yes. AZD dey support Terraform and Bicep. Choose Terraform-based template or configure `infra.provider: terraform` inside `azure.yaml`, with correct Terraform files and state/backend config. See [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuration & Environments

### Q: How I go manage different environments (dev, staging, prod)?
**A**: Create separate environments with `azd env new <environment-name>` and set different settings for each:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where dem store environment configurations?
**A**: Dem dey store am for `.azure` folder inside your project. Each environment get im own folder with config files.

### Q: How I go fit set environment-specific configuration?
**A**: Use `azd env set` to set environment variables:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: I fit share environment configurations with my team?
**A**: `.azure` folder get sensitive info and e no suppose dey commit to version control. Instead:
1. Document the environment variables wey you need
2. Use deployment scripts make you set up environment
3. Use Azure Key Vault for sensitive configuration

### Q: How I go override template defaults?
**A**: Set environment variables wey correspond to template parameters:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Only variables wey the template dey use go affect deployment. `SKU_NAME` wey dey above na example custom input, no be universal AZD setting.

---

## Troubleshooting

### Q: Why `azd up` dey fail?
**A**: Common reasons:
1. **Authentication issues**: Run `azd auth login`
2. **Insufficient permissions**: Check your Azure role assignments
3. **Resource naming conflicts**: Check conflicting resource and template naming inputs; make separate environment with `azd env new` if you need isolation
4. **Quota/capacity issues**: Check regional availability
5. **Template errors**: Validate Bicep templates

### Q: How I go debug deployment failures?
**A**: 
1. Use `azd deploy --debug` for detailed output
2. Check Azure portal deployment history
3. Review Activity Log inside Azure portal
4. Use `azd show` to show current environment state

### Q: Why my environment variables no dey work?
**A**: Check:
1. Variable names match template parameters exactly
2. Values dey properly quoted if dem get spaces
3. Environment dey selected: `azd env select <environment>`
4. Variables dey set for correct environment

### Q: How I go clean up failed deployments?
**A**: 
```bash
azd down
```
 Check di environment wey you select and delete confirmation first. Dis one go delete provisioned Azure resources, no be di local `.azure` environment config. `--purge` fit also request permanent deletion of supported soft-deleted resources and e fit block by retention/purge protection; na im no be normal recovery step.

### Q: Why my application no dey accessible after deployment?
**A**: Check:
1. Deployment finish well
2. Application dey run (check logs for Azure portal)
3. Network security groups allow traffic
4. DNS/custom domains dey configured well

---

## Cost & Billing

### Q: How much azd deployments go cost?
**A**: Cost depend on:
- Azure services wey you deploy
- Service tiers/SKUs wey you select
- Regional pricing differences
- Usage patterns

Use [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) to estimate cost.

### Q: How I go take control cost for azd deployments?
**A**: 
1. Use lower-tier SKUs for development environments
2. Set Azure budgets and alerts
3. Use `azd down` to remove resource when you no need dem
4. Choose right regions (cost dey different by location)
5. Use Azure Cost Management tools

### Q: Dem get free tier options for azd templates?
**A**: Some services get free SKUs or monthly grants, but e dey depend on eligibility, hosting plan, region, and subscription limits. Dem no fit make whole template free: databases, search, networking, registry, telemetry, and model inference fit carry charges separate. Check [Azure free services list](https://azure.microsoft.com/free/) and current pricing before you deploy every resource.

### Q: How I fit estimate costs before deployment?
**A**: 
1. Review template's `main.bicep` to know which resources go dey created
2. Use Azure Pricing Calculator with specific SKUs
3. Deploy for development environment first to monitor real cost
4. Use Azure Cost Management for detailed cost analysis

---

## Best Practices

### Q: Wetin be best practices for azd project structure?
**A**: 
1. Keep application code separate from infrastructure
2. Use meaningful service names for `azure.yaml`
3. Use proper error handling for build scripts
4. Use environment-specific configuration
5. Include full documentation

### Q: How I go take organize many services for azd?
**A**: Use recommended structure:
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

### Q: How I go manage secrets and sensitive configuration?
**A**: 
1. Use Azure Key Vault for secrets
2. Refer Key Vault secrets for application configuration
3. No ever commit secrets for version control
4. Use managed identities for service-to-service authentication

### Q: Wetin be the recommended way for CI/CD with azd?
**A**: 
1. Use different environments for each stage (dev/staging/prod)
2. Do automated testing before deployment
3. Use service principals for authentication
4. Store sensitive configuration for pipeline secrets/variables
5. Put approval gates for production deployments

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

### Q: How I go take integrate azd with existing DevOps processes?
**A**: 
1. Use azd commands inside existing pipeline scripts
2. Standardize on azd templates across teams
3. Integrate with existing monitoring and alerting
4. Use azd's JSON output for pipeline integration

### Q: I fit use azd with Azure DevOps?
**A**: Yes, azd dey work with any CI/CD system. Make Azure DevOps pipelines wey dey use azd commands.

### Q: How I go contribute to azd or create community templates?
**A**: 
1. **azd tool**: Contribute to [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Follow the [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentation**: Contribute to docs for [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Wetin be the roadmap for azd?
**A**: Check the [official roadmap](https://github.com/Azure/azure-dev/projects) for planned features and improvements.

### Q: How I go migrate from other deployment tools to azd?
**A**: 
1. Check current deployment architecture well well
2. Create equal Bicep templates
3. Configure `azure.yaml` to fit current services
4. Test am well for development environment
5. Gradually migrate environments

---

## You Still Get Questions?

### **Search First**
- Check the [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Search [GitHub issues](https://github.com/Azure/azure-dev/issues) for similar wahala

### **Get Help**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community support
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technical questions
- [Azure Discord](https://discord.gg/azure) - Real-time community chat

### **Report Issues**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bug reports and feature requests
- Put relevant logs, error messages, and steps to reproduce

### **Learn More**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Technical guidance review na November 4, 2026. Cloud availability and pricing need to dey checked for your subscription and region.*

---

**Navigation**
- **Previous Lesson**: [Glossary](glossary.md)
- **Next Lesson**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->