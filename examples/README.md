# Examples - Practical AZD Templates and Configurations

## Introduction

This directory contains practical examples, templates, and real-world scenarios to help you learn Azure Developer CLI through hands-on practice. Each example provides complete working code, infrastructure templates, and detailed instructions for different application architectures and deployment patterns.

## Learning Goals

By working through these examples, you will:
- Practice Azure Developer CLI workflows with realistic application scenarios
- Understand different application architectures and their azd implementations
- Master Infrastructure as Code patterns for various Azure services
- Apply configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns in practical contexts
- Build experience with troubleshooting and debugging real deployment scenarios

## Learning Outcomes

Upon completing these examples, you will be able to:
- Deploy various application types using Azure Developer CLI confidently
- Adapt provided templates to your own application requirements
- Design and implement custom infrastructure patterns using Bicep
- Configure complex multi-service applications with proper dependencies
- Apply security, monitoring, and performance best practices in real scenarios
- Troubleshoot and optimize deployments based on practical experience

## Directory Structure

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Quick Start Examples

### For Beginners
1. **[Simple Web App](./simple-web-app/)** - Deploy a basic Node.js web application
2. **[Static Website](./static-website/)** - Host a static website on Azure Storage
3. **[Container App](./container-app/)** - Deploy a containerized application

### For Intermediate Users
4. **[Database App](./database-app/)** - Web application with PostgreSQL database
5. **[Serverless Function](./serverless-function/)** - Azure Functions with HTTP triggers
6. **[Microservices](./microservices/)** - Multi-service application with API gateway

## 📋 Usage Instructions

### Running Examples Locally

1. **Clone or Copy Example**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adapting Examples

Each example includes:
- **README.md** - Detailed setup and customization instructions
- **azure.yaml** - AZD configuration with comments
- **infra/** - Bicep templates with parameter explanations
- **src/** - Sample application code
- **scripts/** - Helper scripts for common tasks

## 🎯 Learning Objectives

### Example Categories

#### **Basic Deployments**
- Single-service applications
- Simple infrastructure patterns
- Basic configuration management
- Cost-effective development setups

#### **Advanced Scenarios**
- Multi-service architectures
- Complex networking configurations
- Database integration patterns
- Security and compliance implementations

#### **Production-Ready Patterns**
- High availability configurations
- Monitoring and observability
- CI/CD integration
- Disaster recovery setups

## 📖 Example Descriptions

### Simple Web App
**Technologies**: Node.js, App Service, Application Insights  
**Complexity**: Beginner  
**Concepts**: Basic deployment, environment variables, health checks

### Static Website
**Technologies**: HTML/CSS/JS, Storage Account, CDN  
**Complexity**: Beginner  
**Concepts**: Static hosting, CDN integration, custom domains

### Container App
**Technologies**: Docker, Container Apps, Container Registry  
**Complexity**: Intermediate  
**Concepts**: Containerization, scaling, ingress configuration

### Database App
**Technologies**: Python Flask, PostgreSQL, App Service  
**Complexity**: Intermediate  
**Concepts**: Database connections, secrets management, migrations

### Serverless Function
**Technologies**: Azure Functions, Cosmos DB, API Management  
**Complexity**: Intermediate  
**Concepts**: Event-driven architecture, bindings, API management

### Microservices
**Technologies**: Multiple services, Service Bus, API Gateway  
**Complexity**: Advanced  
**Concepts**: Service communication, message queuing, load balancing

## 🛠 Configuration Examples

The `configurations/` directory contains reusable components:

### Environment Configurations
- Development environment settings
- Staging environment configurations
- Production-ready configurations
- Multi-region deployment setups

### Bicep Modules
- Reusable infrastructure components
- Common resource patterns
- Security-hardened templates
- Cost-optimized configurations

### Helper Scripts
- Environment setup automation
- Database migration scripts
- Deployment validation tools
- Cost monitoring utilities

## 🔧 Customization Guide

### Adapting Examples for Your Use Case

1. **Review Prerequisites**
   - Check Azure service requirements
   - Verify subscription limits
   - Understand cost implications

2. **Modify Configuration**
   - Update `azure.yaml` service definitions
   - Customize Bicep templates
   - Adjust environment variables

3. **Test Thoroughly**
   - Deploy to development environment first
   - Validate functionality
   - Test scaling and performance

4. **Security Review**
   - Review access controls
   - Implement secrets management
   - Enable monitoring and alerting

## 📊 Comparison Matrix

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| Simple Web App | 1 | ❌ | Basic | Basic | ⭐ |
| Static Website | 1 | ❌ | ❌ | Basic | ⭐ |
| Container App | 1 | ❌ | Basic | Full | ⭐⭐ |
| Database App | 2 | ✅ | Full | Full | ⭐⭐⭐ |
| Serverless Function | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 Learning Path

### Recommended Progression

1. **Start with Simple Web App**
   - Learn basic AZD concepts
   - Understand deployment workflow
   - Practice environment management

2. **Try Static Website**
   - Explore different hosting options
   - Learn about CDN integration
   - Understand DNS configuration

3. **Move to Container App**
   - Learn containerization basics
   - Understand scaling concepts
   - Practice with Docker

4. **Add Database Integration**
   - Learn database provisioning
   - Understand connection strings
   - Practice secrets management

5. **Explore Serverless**
   - Understand event-driven architecture
   - Learn about triggers and bindings
   - Practice with APIs

6. **Build Microservices**
   - Learn service communication
   - Understand distributed systems
   - Practice complex deployments

## 🔍 Finding the Right Example

### By Technology Stack
- **Node.js**: Simple Web App, Microservices
- **Python**: Database App, Serverless Function
- **Static Sites**: Static Website
- **Containers**: Container App, Microservices
- **Databases**: Database App, Serverless Function

### By Architecture Pattern
- **Monolithic**: Simple Web App, Database App
- **Static**: Static Website
- **Microservices**: Microservices example
- **Serverless**: Serverless Function
- **Hybrid**: Container App

### By Complexity Level
- **Beginner**: Simple Web App, Static Website
- **Intermediate**: Container App, Database App, Serverless Function  
- **Advanced**: Microservices

## 📚 Additional Resources

### Documentation Links
- [AZD Template Specification](https://aka.ms/azd/templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Examples
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contributing Examples

Have a useful example to share? We welcome contributions!

### Submission Guidelines
1. Follow the established directory structure
2. Include comprehensive README.md
3. Add comments to configuration files
4. Test thoroughly before submitting
5. Include cost estimates and prerequisites

### Example Template Structure
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Pro Tip**: Start with the simplest example that matches your technology stack, then gradually work your way up to more complex scenarios. Each example builds on concepts from the previous ones!

**Next Steps**: 
- Choose an example that matches your skill level
- Follow the setup instructions in the example's README
- Experiment with customizations
- Share your learnings with the community

---

**Navigation**
- **Previous Lesson**: [Study Guide](../resources/study-guide.md)
- **Return to**: [Main README](../README.md)