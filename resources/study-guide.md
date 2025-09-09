# Study Guide - AZD For Beginners

## Introduction

This comprehensive study guide provides structured learning objectives, key concepts, practice exercises, and assessment materials to help you master Azure Developer CLI (azd). Use this guide to track your progress and ensure you've covered all essential topics.

## Learning Goals

By completing this study guide, you will:
- Master all fundamental and advanced concepts of Azure Developer CLI
- Develop practical skills in deploying and managing Azure applications
- Build confidence in troubleshooting and optimizing deployments
- Understand production-ready deployment practices and security considerations

## Learning Outcomes

After completing all sections of this study guide, you will be able to:
- Design, deploy, and manage complete application architectures using azd
- Implement comprehensive monitoring, security, and cost optimization strategies
- Troubleshoot complex deployment issues independently
- Create custom templates and contribute to the azd community

## Course Structure

### Module 1: Getting Started (Weeks 1-2)

#### Learning Objectives
- Understand Azure Developer CLI fundamentals and core concepts
- Successfully install and configure azd on your development environment
- Complete your first deployment using an existing template
- Navigate the azd project structure and understand key components

#### Key Concepts to Master
- Templates, environments, and services
- azure.yaml configuration structure
- Basic azd commands (init, up, down, deploy)
- Infrastructure as Code principles
- Azure authentication and authorization

#### Practice Exercises

**Exercise 1.1: Installation and Setup**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercise 1.3: Project Structure Analysis**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Self-Assessment Questions
1. What are the three core concepts of azd architecture?
2. What is the purpose of the azure.yaml file?
3. How do environments help manage different deployment targets?
4. What authentication methods can be used with azd?
5. What happens when you run `azd up` for the first time?

### Module 2: Configuration and Environments (Week 3)

#### Learning Objectives
- Master environment management and configuration
- Understand advanced azure.yaml configurations
- Implement environment-specific settings and variables
- Configure authentication for different scenarios

#### Key Concepts to Master
- Environment hierarchy and variable precedence
- Service configuration and parameters
- Hooks and lifecycle events
- Authentication methods (user, service principal, managed identity)
- Configuration file management

#### Practice Exercises

**Exercise 2.1: Multi-Environment Setup**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercise 2.2: Advanced Configuration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercise 2.3: Security Configuration**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Self-Assessment Questions
1. How does azd handle environment variable precedence?
2. What are deployment hooks and when should you use them?
3. How do you configure different SKUs for different environments?
4. What are the security implications of different authentication methods?
5. How do you manage secrets and sensitive configuration data?

### Module 3: Deployment and Provisioning (Week 4)

#### Learning Objectives
- Master deployment workflows and best practices
- Understand Infrastructure as Code with Bicep templates
- Implement complex multi-service architectures
- Optimize deployment performance and reliability

#### Key Concepts to Master
- Bicep template structure and modules
- Resource dependencies and ordering
- Deployment strategies (blue-green, rolling updates)
- Multi-region deployments
- Database migrations and data management

#### Practice Exercises

**Exercise 3.1: Custom Infrastructure**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercise 3.2: Multi-Service Application**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Self-Assessment Questions
1. What are the advantages of using Bicep over ARM templates?
2. How do you handle database migrations in azd deployments?
3. What strategies exist for zero-downtime deployments?
4. How do you manage dependencies between services?
5. What are the considerations for multi-region deployments?

### Module 4: Pre-Deployment Validation (Week 5)

#### Learning Objectives
- Implement comprehensive pre-deployment checks
- Master capacity planning and resource validation
- Understand SKU selection and cost optimization
- Build automated validation pipelines

#### Key Concepts to Master
- Azure resource quotas and limits
- SKU selection criteria and cost implications
- Automated validation scripts and tools
- Capacity planning methodologies
- Performance testing and optimization

#### Practice Exercises

**Exercise 4.1: Capacity Planning**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Self-Assessment Questions
1. What factors should influence SKU selection decisions?
2. How do you validate Azure resource availability before deployment?
3. What are the key components of a pre-flight check system?
4. How do you estimate and control deployment costs?
5. What monitoring is essential for capacity planning?

### Module 5: Troubleshooting and Debugging (Week 6)

#### Learning Objectives
- Master systematic troubleshooting methodologies
- Develop expertise in debugging complex deployment issues
- Implement comprehensive monitoring and alerting
- Build incident response and recovery procedures

#### Key Concepts to Master
- Common deployment failure patterns
- Log analysis and correlation techniques
- Performance monitoring and optimization
- Security incident detection and response
- Disaster recovery and business continuity

#### Practice Exercises

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Self-Assessment Questions
1. What is the systematic approach to troubleshooting azd deployments?
2. How do you correlate logs across multiple services and resources?
3. What monitoring metrics are most critical for early problem detection?
4. How do you implement effective disaster recovery procedures?
5. What are the key components of an incident response plan?

### Module 6: Advanced Topics and Best Practices (Week 7-8)

#### Learning Objectives
- Implement enterprise-grade deployment patterns
- Master CI/CD integration and automation
- Develop custom templates and contribute to the community
- Understand advanced security and compliance requirements

#### Key Concepts to Master
- CI/CD pipeline integration patterns
- Custom template development and distribution
- Enterprise governance and compliance
- Advanced networking and security configurations
- Performance optimization and cost management

#### Practice Exercises

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Self-Assessment Questions
1. How do you integrate azd into existing CI/CD workflows?
2. What are the key considerations for custom template development?
3. How do you implement governance and compliance in azd deployments?
4. What are the best practices for enterprise-scale deployments?
5. How do you contribute effectively to the azd community?

## Practical Projects

### Project 1: Personal Portfolio Website
**Complexity**: Beginner  
**Duration**: 1-2 weeks

Build and deploy a personal portfolio website using:
- Static website hosting on Azure Storage
- Custom domain configuration
- CDN integration for global performance
- Automated deployment pipeline

**Deliverables**:
- Working website deployed on Azure
- Custom azd template for portfolio deployments
- Documentation of deployment process
- Cost analysis and optimization recommendations

### Project 2: Task Management Application
**Complexity**: Intermediate  
**Duration**: 2-3 weeks

Create a full-stack task management application with:
- React frontend deployed to App Service
- Node.js API backend with authentication
- PostgreSQL database with migrations
- Application Insights monitoring

**Deliverables**:
- Complete application with user authentication
- Database schema and migration scripts
- Monitoring dashboards and alerting rules
- Multi-environment deployment configuration

### Project 3: Microservices E-commerce Platform
**Complexity**: Advanced  
**Duration**: 4-6 weeks

Design and implement a microservices-based e-commerce platform:
- Multiple API services (catalog, orders, payments, users)
- Message queue integration with Service Bus
- Redis cache for performance optimization
- Comprehensive logging and monitoring

**Deliverables**:
- Complete microservices architecture
- Inter-service communication patterns
- Performance testing and optimization
- Production-ready security implementation

## Assessment and Certification

### Knowledge Checks

Complete these assessments after each module:

**Module 1 Assessment**: Basic concepts and installation
- Multiple choice questions on core concepts
- Practical installation and configuration tasks
- Simple deployment exercise

**Module 2 Assessment**: Configuration and environments
- Environment management scenarios
- Configuration troubleshooting exercises
- Security configuration implementation

**Module 3 Assessment**: Deployment and provisioning
- Infrastructure design challenges
- Multi-service deployment scenarios
- Performance optimization exercises

**Module 4 Assessment**: Pre-deployment validation
- Capacity planning case studies
- Cost optimization scenarios
- Validation pipeline implementation

**Module 5 Assessment**: Troubleshooting and debugging
- Problem diagnosis exercises
- Monitoring implementation tasks
- Incident response simulations

**Module 6 Assessment**: Advanced topics
- CI/CD pipeline design
- Custom template development
- Enterprise architecture scenarios

### Final Capstone Project

Design and implement a complete solution that demonstrates mastery of all concepts:

**Requirements**:
- Multi-tier application architecture
- Multiple deployment environments
- Comprehensive monitoring and alerting
- Security and compliance implementation
- Cost optimization and performance tuning
- Complete documentation and runbooks

**Evaluation Criteria**:
- Technical implementation quality
- Documentation completeness
- Security and best practices adherence
- Performance and cost optimization
- Troubleshooting and monitoring effectiveness

## Study Resources and References

### Official Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Resources
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Practice Environments
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Additional Tools
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Study Schedule Recommendations

### Full-Time Study (8 weeks)
- **Weeks 1-2**: Modules 1-2 (Getting Started, Configuration)
- **Weeks 3-4**: Modules 3-4 (Deployment, Pre-deployment)
- **Weeks 5-6**: Modules 5-6 (Troubleshooting, Advanced Topics)
- **Weeks 7-8**: Practical Projects and Final Assessment

### Part-Time Study (16 weeks)
- **Weeks 1-4**: Module 1 (Getting Started)
- **Weeks 5-7**: Module 2 (Configuration and Environments)
- **Weeks 8-10**: Module 3 (Deployment and Provisioning)
- **Weeks 11-12**: Module 4 (Pre-deployment Validation)
- **Weeks 13-14**: Module 5 (Troubleshooting and Debugging)
- **Weeks 15-16**: Module 6 (Advanced Topics and Assessment)

### Self-Paced Study
- Complete each module at your own pace
- Spend additional time on challenging concepts
- Repeat exercises until you achieve mastery
- Join community discussions and ask questions

## Success Tips

### Effective Learning Strategies
1. **Practice Regularly**: Deploy applications frequently to build muscle memory
2. **Experiment Fearlessly**: Use development environments to try new configurations
3. **Document Your Learning**: Keep notes on solutions to problems you encounter
4. **Join the Community**: Participate in discussions and contribute to projects
5. **Stay Current**: Follow Azure updates and new azd features

### Common Pitfalls to Avoid
1. **Skipping Prerequisites**: Ensure you have proper foundation knowledge
2. **Rushing Through Concepts**: Take time to understand fundamentals thoroughly
3. **Ignoring Security**: Always implement security best practices from the start
4. **Not Testing Thoroughly**: Test deployments in multiple environments
5. **Avoiding Documentation**: Good documentation is essential for maintenance

### Building Practical Experience
1. **Start Small**: Begin with simple applications and gradually increase complexity
2. **Learn from Failure**: Use troubleshooting exercises as learning opportunities
3. **Contribute to Open Source**: Share your templates and solutions with the community
4. **Teach Others**: Explaining concepts to others reinforces your own understanding
5. **Stay Curious**: Continuously explore new Azure services and integration patterns

---

**Navigation**
- **Previous Lesson**: [FAQ](faq.md)
- **Next Lesson**: [Changelog](../changelog.md)

**Study Progress Tracking**: Use this guide to track your learning journey and ensure comprehensive coverage of all Azure Developer CLI concepts and practices.