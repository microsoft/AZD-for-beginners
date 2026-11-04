# Frequently Asked Questions (FAQ)

**Get Help by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **🚆 Installation Issues**: [Chapter 1: Installation & Setup](../docs/chapter-01-foundation/installation.md)
- **🤖 AI Questions**: [Chapter 2: AI-First Development](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Troubleshooting**: [Chapter 7: Troubleshooting & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduction

This comprehensive FAQ provides answers to the most common questions about Azure Developer CLI (azd) and Azure deployments. Find quick solutions to common problems, understand best practices, and get clarification on azd concepts and workflows.

## Learning Goals

By reviewing this FAQ, you will:
- Find quick answers to common Azure Developer CLI questions and issues
- Understand key concepts and terminology through practical Q&A format
- Access troubleshooting solutions for frequent problems and error scenarios
- Learn best practices through commonly asked questions about optimization
- Discover advanced features and capabilities through expert-level questions
- Reference cost, security, and deployment strategy guidance efficiently

## Learning Outcomes

With regular reference to this FAQ, you will be able to:
- Resolve common Azure Developer CLI issues independently using provided solutions
- Make informed decisions about deployment strategies and configurations
- Understand the relationship between azd and other Azure tools and services
- Apply best practices based on community experience and expert recommendations
- Troubleshoot authentication, deployment, and configuration problems effectively
- Optimize costs and performance using FAQ insights and recommendations

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

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) is a developer-centric command-line tool that accelerates the time it takes for you to get your application from local development environment to Azure. It provides best practices through templates and helps with the entire deployment lifecycle.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: General-purpose tool for managing Azure resources
- **azd**: Developer-focused tool for application deployment workflows
- azd has its own authentication and deployment workflow; Azure CLI is a separate, complementary tool
- azd includes templates, environment management, and deployment automation

### Q: Do I need Azure CLI installed to use azd?
**A**: Not for the core AZD workflow. Authenticate with `azd auth login`. Install Azure CLI separately when a template hook or an exercise explicitly runs `az` commands.

### Q: What programming languages does azd support?
**A**: azd is language-agnostic. It works with:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: Can I use azd with existing projects?
**A**: Yes! You can either:
1. Use `azd init` to add azd configuration to existing projects
2. Adapt existing projects to match azd template structure
3. Create custom templates based on your existing architecture

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Use `azd auth login` which will open a browser window for Azure authentication. For CI/CD scenarios, use service principals or managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Yes. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` to specify which subscription to use for each environment.

### Q: What permissions do I need to deploy with azd?
**A**: Typically you need:
- **Contributor** role on the resource group or subscription
- **User Access Administrator** if deploying resources that require role assignments
- Specific permissions vary by template and resources being deployed

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolutely! azd is designed for CI/CD integration. Use service principals for authentication and set environment variables for configuration.

### Q: How do I handle authentication in GitHub Actions?
**A**: Prefer workload identity federation (OIDC), configured with `azd pipeline config`. The generated workflow installs AZD and authenticates AZD directly with a federated identity. An `azure/login` step alone does not establish an AZD login. A login step within an existing job is:
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

Provision or deploy after login, with the intended AZD environment, subscription, and location configured. The identity's federated credential must trust the workflow's repository/ref or GitHub environment, and its Azure roles must allow the requested operations.

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Official and community templates: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community templates: GitHub search for "azd-template"
- Use `azd template list` to browse available templates

### Q: How do I create a custom template?
**A**: 
1. Start with an existing template structure
2. Modify `azure.yaml`, infrastructure files, and application code
3. Test thoroughly with `azd up`
4. Publish to GitHub with appropriate tags

### Q: Can I use azd without a template?
**A**: Yes, use `azd init` in an existing project to create the necessary configuration files. You'll need to manually configure `azure.yaml` and infrastructure files.

### Q: What's the difference between official and community templates?
**A**: 
- **Official templates**: Maintained by Microsoft, regularly updated, comprehensive documentation
- **Community templates**: Created by developers, may have specialized use cases, varying quality and maintenance

### Q: How do I update a template in my project?
**A**: Templates aren't automatically updated. You can:
1. Manually compare and merge changes from the source template
2. Start fresh with `azd init` using the updated template
3. Cherry-pick specific improvements from updated templates

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd can deploy any Azure service through Bicep/ARM templates, including:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, and monitoring resources

### Q: Can I deploy to multiple regions?
**A**: Yes, configure multiple regions in your Bicep templates and set the location parameter appropriately for each environment.

### Q: How do I handle database schema migrations?
**A**: Use deployment hooks in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Yes, use `azd provision` to deploy only the infrastructure components defined in your templates.

### Q: How do I deploy to existing Azure resources?
**A**: Yes, when the template supports it. Reference existing resources with Bicep's `existing` declarations or the template's documented existing-resource parameters, and map application services to their intended targets. This does not import ownership or automatically create missing permissions. Review the template before deploying.

### Q: Can I use Terraform instead of Bicep?
**A**: Yes. AZD supports Terraform as well as Bicep. Select a Terraform-based template or configure `infra.provider: terraform` in `azure.yaml`, with appropriate Terraform files and state/backend configuration. See the [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Create separate environments with `azd env new <environment-name>` and configure different settings for each:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: In the `.azure` folder within your project directory. Each environment has its own folder with configuration files.

### Q: How do I set environment-specific configuration?
**A**: Use `azd env set` to configure environment variables:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: The `.azure` folder contains sensitive information and should not be committed to version control. Instead:
1. Document required environment variables
2. Use deployment scripts to set up environments
3. Use Azure Key Vault for sensitive configuration

### Q: How do I override template defaults?
**A**: Set environment variables that correspond to template parameters:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Only variables consumed by the template affect deployment. `SKU_NAME` above is an example custom input, not a universal AZD setting.

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Common causes:
1. **Authentication issues**: Run `azd auth login`
2. **Insufficient permissions**: Check your Azure role assignments
3. **Resource naming conflicts**: Review the conflicting resource and the template's naming inputs; create a separate environment with `azd env new` when isolation is needed
4. **Quota/capacity issues**: Check regional availability
5. **Template errors**: Validate Bicep templates

### Q: How do I debug deployment failures?
**A**: 
1. Use `azd deploy --debug` for verbose output
2. Check Azure portal deployment history
3. Review Activity Log in Azure portal
4. Use `azd show` to display current environment state

### Q: Why are my environment variables not working?
**A**: Check:
1. Variable names match template parameters exactly
2. Values are properly quoted if they contain spaces
3. Environment is selected: `azd env select <environment>`
4. Variables are set in the correct environment

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down
```
Review the selected environment and deletion confirmation first. This deletes provisioned Azure resources, not the local `.azure` environment configuration. `--purge` additionally requests permanent deletion of supported soft-deleted resources and can be blocked by retention/purge protection; it is not a routine recovery step.

### Q: Why is my application not accessible after deployment?
**A**: Check:
1. Deployment completed successfully
2. Application is running (check logs in Azure portal)
3. Network security groups allow traffic
4. DNS/custom domains are configured correctly

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Costs depend on:
- Azure services deployed
- Service tiers/SKUs selected
- Regional pricing differences
- Usage patterns

Use the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) for estimates.

### Q: How do I control costs in azd deployments?
**A**: 
1. Use lower-tier SKUs for development environments
2. Set up Azure budgets and alerts
3. Use `azd down` to remove resources when not needed
4. Choose appropriate regions (costs vary by location)
5. Use Azure Cost Management tools

### Q: Are there free tier options for azd templates?
**A**: Some services have free SKUs or monthly grants, subject to eligibility, hosting plan, region, and subscription limits. These do not make a whole template free: databases, search, networking, registry, telemetry, and model inference can incur charges independently. Check the [Azure free services list](https://azure.microsoft.com/free/) and current pricing for every resource before deployment.

### Q: How do I estimate costs before deployment?
**A**: 
1. Review template's `main.bicep` to see what resources are created
2. Use Azure Pricing Calculator with specific SKUs
3. Deploy to a development environment first to monitor actual costs
4. Use Azure Cost Management for detailed cost analysis

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Keep application code separate from infrastructure
2. Use meaningful service names in `azure.yaml`
3. Implement proper error handling in build scripts
4. Use environment-specific configuration
5. Include comprehensive documentation

### Q: How should I organize multiple services in azd?
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

### Q: Should I commit the `.azure` folder to version control?
**A**: **No!** The `.azure` folder contains sensitive information. Add it to `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Use Azure Key Vault for secrets
2. Reference Key Vault secrets in application configuration
3. Never commit secrets to version control
4. Use managed identities for service-to-service authentication

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Use separate environments for each stage (dev/staging/prod)
2. Implement automated testing before deployment
3. Use service principals for authentication
4. Store sensitive configuration in pipeline secrets/variables
5. Implement approval gates for production deployments

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Yes, through deployment hooks in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Use azd commands in existing pipeline scripts
2. Standardize on azd templates across teams
3. Integrate with existing monitoring and alerting
4. Use azd's JSON output for pipeline integration

### Q: Can I use azd with Azure DevOps?
**A**: Yes, azd works with any CI/CD system. Create Azure DevOps pipelines that use azd commands.

### Q: How do I contribute to azd or create community templates?
**A**: 
1. **azd tool**: Contribute to [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Follow the [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentation**: Contribute to docs at [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: What's the roadmap for azd?
**A**: Check the [official roadmap](https://github.com/Azure/azure-dev/projects) for planned features and improvements.

### Q: How do I migrate from other deployment tools to azd?
**A**: 
1. Analyze current deployment architecture
2. Create equivalent Bicep templates
3. Configure `azure.yaml` to match current services
4. Test thoroughly in development environment
5. Gradually migrate environments

---

## Still Have Questions?

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

*Technical guidance reviewed: November 4, 2026. Cloud availability and pricing must be checked for your subscription and region.*

---

**Navigation**
- **Previous Lesson**: [Glossary](glossary.md)
- **Next Lesson**: [Study Guide](study-guide.md)