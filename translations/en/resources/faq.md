<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-10T07:22:24+00:00",
  "source_file": "resources/faq.md",
  "language_code": "en"
}
-->
# Frequently Asked Questions (FAQ)

## Introduction

This FAQ provides answers to common questions about Azure Developer CLI (azd) and Azure deployments. It offers quick solutions to frequent issues, clarifies concepts and workflows, and shares best practices.

## Learning Goals

By reading this FAQ, you will:
- Quickly find answers to common Azure Developer CLI questions and problems
- Understand key concepts and terminology through practical Q&A
- Access troubleshooting solutions for frequent errors
- Learn optimization best practices through commonly asked questions
- Explore advanced features and capabilities through expert-level topics
- Efficiently reference guidance on cost, security, and deployment strategies

## Learning Outcomes

By regularly consulting this FAQ, you will:
- Independently resolve common Azure Developer CLI issues using provided solutions
- Make informed decisions about deployment strategies and configurations
- Understand how azd integrates with other Azure tools and services
- Apply best practices based on community insights and expert advice
- Troubleshoot authentication, deployment, and configuration issues effectively
- Optimize costs and performance using the recommendations provided

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

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) is a command-line tool designed for developers to streamline the process of deploying applications from a local environment to Azure. It offers templates and automates the deployment lifecycle.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: A general-purpose tool for managing Azure resources.
- **azd**: A developer-focused tool for application deployment workflows.
- azd uses Azure CLI internally but provides higher-level abstractions for common development scenarios.
- azd includes templates, environment management, and deployment automation.

### Q: Do I need Azure CLI installed to use azd?
**A**: Yes, Azure CLI is required for authentication and certain operations. Install Azure CLI first, then install azd.

### Q: What programming languages does azd support?
**A**: azd is language-agnostic and supports:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: Can I use azd with existing projects?
**A**: Yes! You can:
1. Use `azd init` to add azd configuration to existing projects.
2. Adapt existing projects to match azd template structure.
3. Create custom templates based on your existing architecture.

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Use `azd auth login`, which opens a browser window for Azure authentication. For CI/CD scenarios, use service principals or managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Yes. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` to specify the subscription for each environment.

### Q: What permissions do I need to deploy with azd?
**A**: Typically:
- **Contributor** role on the resource group or subscription.
- **User Access Administrator** for resources requiring role assignments.
- Permissions vary depending on the template and resources deployed.

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolutely! azd is designed for CI/CD integration. Use service principals for authentication and set environment variables for configuration.

### Q: How do I handle authentication in GitHub Actions?
**A**: Use the Azure Login action with service principal credentials:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Official templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community templates: Search GitHub for "azd-template."
- Use `azd template list` to browse available templates.

### Q: How do I create a custom template?
**A**: 
1. Start with an existing template structure.
2. Modify `azure.yaml`, infrastructure files, and application code.
3. Test thoroughly with `azd up`.
4. Publish to GitHub with appropriate tags.

### Q: Can I use azd without a template?
**A**: Yes, use `azd init` in an existing project to create the necessary configuration files. You'll need to manually configure `azure.yaml` and infrastructure files.

### Q: What's the difference between official and community templates?
**A**: 
- **Official templates**: Maintained by Microsoft, regularly updated, with comprehensive documentation.
- **Community templates**: Created by developers, may have specialized use cases, with varying quality and maintenance.

### Q: How do I update a template in my project?
**A**: Templates aren't automatically updated. You can:
1. Manually compare and merge changes from the source template.
2. Start fresh with `azd init` using the updated template.
3. Cherry-pick specific improvements from updated templates.

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd can deploy any Azure service through Bicep/ARM templates, including:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, and monitoring resources

### Q: Can I deploy to multiple regions?
**A**: Yes, configure multiple regions in your Bicep templates and set the location parameter for each environment.

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
**A**: This is complex and not directly supported. You can:
1. Import existing resources into your Bicep templates.
2. Use existing resource references in templates.
3. Modify templates to conditionally create or reference resources.

### Q: Can I use Terraform instead of Bicep?
**A**: Currently, azd primarily supports Bicep/ARM templates. Terraform support is not officially available, though community solutions may exist.

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
1. Document required environment variables.
2. Use deployment scripts to set up environments.
3. Use Azure Key Vault for sensitive configuration.

### Q: How do I override template defaults?
**A**: Set environment variables that correspond to template parameters:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Common causes:
1. **Authentication issues**: Run `azd auth login`.
2. **Insufficient permissions**: Check your Azure role assignments.
3. **Resource naming conflicts**: Change AZURE_ENV_NAME.
4. **Quota/capacity issues**: Check regional availability.
5. **Template errors**: Validate Bicep templates.

### Q: How do I debug deployment failures?
**A**: 
1. Use `azd deploy --debug` for detailed output.
2. Check Azure portal deployment history.
3. Review Activity Log in Azure portal.
4. Use `azd show` to display the current environment state.

### Q: Why are my environment variables not working?
**A**: Check:
1. Variable names match template parameters exactly.
2. Values are properly quoted if they contain spaces.
3. Environment is selected: `azd env select <environment>`.
4. Variables are set in the correct environment.

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
This removes all resources and environment configuration.

### Q: Why is my application not accessible after deployment?
**A**: Check:
1. Deployment completed successfully.
2. Application is running (check logs in Azure portal).
3. Network security groups allow traffic.
4. DNS/custom domains are configured correctly.

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Costs depend on:
- Azure services deployed.
- Service tiers/SKUs selected.
- Regional pricing differences.
- Usage patterns.

Use the [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) for estimates.

### Q: How do I control costs in azd deployments?
**A**: 
1. Use lower-tier SKUs for development environments.
2. Set up Azure budgets and alerts.
3. Use `azd down` to remove resources when not needed.
4. Choose appropriate regions (costs vary by location).
5. Use Azure Cost Management tools.

### Q: Are there free tier options for azd templates?
**A**: Many Azure services offer free tiers:
- App Service: Free tier available.
- Azure Functions: 1M free executions/month.
- Cosmos DB: Free tier with 400 RU/s.
- Application Insights: First 5GB/month free.

Configure templates to use free tiers where available.

### Q: How do I estimate costs before deployment?
**A**: 
1. Review the template's `main.bicep` to see what resources are created.
2. Use Azure Pricing Calculator with specific SKUs.
3. Deploy to a development environment first to monitor actual costs.
4. Use Azure Cost Management for detailed cost analysis.

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Keep application code separate from infrastructure.
2. Use meaningful service names in `azure.yaml`.
3. Implement proper error handling in build scripts.
4. Use environment-specific configuration.
5. Include comprehensive documentation.

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
1. Use Azure Key Vault for secrets.
2. Reference Key Vault secrets in application configuration.
3. Never commit secrets to version control.
4. Use managed identities for service-to-service authentication.

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Use separate environments for each stage (dev/staging/prod).
2. Implement automated testing before deployment.
3. Use service principals for authentication.
4. Store sensitive configuration in pipeline secrets/variables.
5. Implement approval gates for production deployments.

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
1. Use azd commands in existing pipeline scripts.
2. Standardize on azd templates across teams.
3. Integrate with existing monitoring and alerting.
4. Use azd's JSON output for pipeline integration.

### Q: Can I use azd with Azure DevOps?
**A**: Yes, azd works with any CI/CD system. Create Azure DevOps pipelines that use azd commands.

### Q: How do I contribute to azd or create community templates?
**A**: 
1. **azd tool**: Contribute to [Azure/azure-dev](https://github.com/Azure/azure-dev).
2. **Templates**: Create templates following the [template guidelines](https://github.com/Azure-Samples/awesome-azd).
3. **Documentation**: Contribute to docs at [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs).

### Q: What's the roadmap for azd?
**A**: Check the [official roadmap](https://github.com/Azure/azure-dev/projects) for planned features and improvements.

### Q: How do I migrate from other deployment tools to azd?
**A**:
1. Evaluate the current deployment architecture  
2. Develop equivalent Bicep templates  
3. Adjust `azure.yaml` to align with existing services  
4. Conduct comprehensive testing in the development environment  
5. Transition environments incrementally  

---

## Still Have Questions?

### **Search First**  
- Refer to the [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Look through [GitHub issues](https://github.com/Azure/azure-dev/issues) for similar concerns  

### **Get Help**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community-driven support  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Ask technical questions  
- [Azure Discord](https://discord.gg/azure) - Engage in real-time community chats  

### **Report Issues**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Submit bug reports or request features  
- Provide relevant logs, error details, and reproduction steps  

### **Learn More**  
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*This FAQ is updated regularly. Last updated: September 9, 2025*  

---

**Navigation**  
- **Previous Lesson**: [Glossary](glossary.md)  
- **Next Lesson**: [Study Guide](study-guide.md)  

---

**Disclaimer**:  
This document has been translated using the AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we aim for accuracy, please note that automated translations may include errors or inaccuracies. The original document in its native language should be regarded as the authoritative source. For critical information, professional human translation is advised. We are not responsible for any misunderstandings or misinterpretations resulting from the use of this translation.