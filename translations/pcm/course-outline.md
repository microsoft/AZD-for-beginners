# AZD For Beginners: Course Outline & Learning Framework

## Course Overview

Master Azure Developer CLI (azd) through structured chapters designed for progressive learning. **Special focus on AI application deployment with Microsoft Foundry integration.**

### Why This Course is Essential for Modern Developers

Developers deploying AI workloads commonly need guidance on:
- Complex multi-service AI architectures
- Production AI deployment best practices  
- Azure AI service integration and configuration
- Cost optimization for AI workloads
- Troubleshooting AI-specific deployment issues

### Core Learning Objectives

By completing this structured course, you will:
- **Master AZD Fundamentals**: Core concepts, installation, and configuration
- **Deploy AI Applications**: Use AZD with Microsoft Foundry services
- **Implement Infrastructure as Code**: Manage Azure resources with Bicep templates
- **Troubleshoot Deployments**: Resolve common issues and debug problems
- **Optimize for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## 🎓 Workshop Learning Experience

### Flexible Learning Delivery Options
This course is designed to support both **self-paced individual learning** and **facilitated workshop sessions**, enabling learners to get hands-on experience with AZD while developing practical skills through interactive exercises.

#### 🚀 Self-Paced Learning Mode
**Perfect for individual developers and continuous learning**

**Features:**
- **Browser-Based Interface**: Complete MkDocs-powered workshop accessible through any web browser
- **GitHub Codespaces Integration**: One-click development environment with pre-configured tools
- **Interactive DevContainer Environment**: No local setup required - start coding immediately
- **Progress Tracking**: Built-in checkpoints and validation exercises
- **Community Support**: Access to Azure Discord channels for questions and collaboration

**Learning Structure:**
- **Flexible Timing**: Complete chapters at your own pace over days or weeks
- **Checkpoint System**: Validate learning before advancing to complex topics
- **Resource Library**: Comprehensive documentation, examples, and troubleshooting guides
- **Portfolio Development**: Build deployable projects for professional portfolios

**Getting Started (Self-Paced):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Facilitated Workshop Sessions
**Ideal for corporate training, bootcamps, and educational institutions**

**Workshop Format Options:**

**📚 Academic Course Integration (8-12 weeks)**
- **University Programs**: Semester-long course with weekly 2-hour sessions
- **Bootcamp Format**: Intensive 3-5 day program with daily 6-8 hour sessions
- **Corporate Training**: Monthly team sessions with practical project implementation
- **Assessment Framework**: Graded assignments, peer reviews, and final projects

**🚀 Intensive Workshop (1-3 days)**
- **Day 1**: Foundation + AI Development (Chapters 1-2) - 6 hours
- **Day 2**: Configuration + Infrastructure (Chapters 3-4) - 6 hours  
- **Day 3**: Advanced Patterns + Production (Chapters 5-8) - 8 hours
- **Follow-up**: Optional 2-week mentorship for project completion

**⚡ Executive Briefing (4-6 hours)**
- **Strategic Overview**: AZD value proposition and business impact (1 hour)
- **Hands-On Demo**: Deploy AI application end-to-end (2 hours)
- **Architecture Review**: Enterprise patterns and governance (1 hour)
- **Implementation Planning**: Organizational adoption strategy (1-2 hours)

#### 🛠️ Workshop Learning Methodology
**Discovery → Deployment → Customization approach for hands-on skill development**

**Phase 1: Discovery (45 minutes)**
- **Template Exploration**: Evaluate Microsoft Foundry templates and services
- **Architecture Analysis**: Understand multi-agent patterns and deployment strategies
- **Requirement Assessment**: Identify organizational needs and constraints
- **Environment Setup**: Configure development environment and Azure resources

**Phase 2: Deployment (2 hours)**
- **Guided Implementation**: Step-by-step deployment of AI applications with AZD
- **Service Configuration**: Configure Azure AI services, endpoints, and authentication
- **Security Implementation**: Apply enterprise security patterns and access controls
- **Validation Testing**: Verify deployments and troubleshoot common issues

**Phase 3: Customization (45 minutes)**
- **Application Modification**: Adapt templates for specific use cases and requirements
- **Production Optimization**: Implement monitoring, cost management, and scaling strategies
- **Advanced Patterns**: Explore multi-agent coordination and complex architectures
- **Next Steps Planning**: Define learning path for continued skill development

#### 🎯 Workshop Learning Outcomes
**Measurable skills developed through hands-on practice**

**Technical Competencies:**
- **Deploy Production AI Applications**: Successfully deploy and configure AI-powered solutions
- **Infrastructure as Code Mastery**: Create and manage custom Bicep templates
- **Multi-Agent Architecture**: Implement coordinated AI agent solutions
- **Production Readiness**: Apply security, monitoring, and governance patterns
- **Troubleshooting Expertise**: Independently resolve deployment and configuration issues

**Professional Skills:**
- **Project Leadership**: Lead technical teams in cloud deployment initiatives
- **Architecture Design**: Design scalable, cost-effective Azure solutions
- **Knowledge Transfer**: Train and mentor colleagues in AZD best practices
- **Strategic Planning**: Influence organizational cloud adoption strategies

#### 📋 Workshop Resources and Materials
**Comprehensive toolkit for facilitators and learners**

**For Facilitators:**
- **Instructor Guide**: [Workshop Overview](workshop/README.md) - Session planning and delivery guidance
- **Presentation Materials**: Slide decks, architecture diagrams, and demo scripts
- **Assessment Tools**: Practical exercises, knowledge checks, and evaluation rubrics
- **Technical Setup**: Environment configuration, troubleshooting guides, and backup plans

**For Learners:**
- **Interactive Workshop Environment**: [Workshop Materials](workshop/README.md) - Browser-based learning platform
- **Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed implementation walkthroughs  
- **Reference Documentation**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-focused deep dives
- **Community Resources**: Azure Discord channels, GitHub discussions, and expert support

#### 🏢 Enterprise Workshop Implementation
**Organizational deployment and training strategies**

**Corporate Training Programs:**
- **Developer Onboarding**: New hire orientation with AZD fundamentals (2-4 weeks)
- **Team Upskilling**: Quarterly workshops for existing development teams (1-2 days)
- **Architecture Review**: Monthly sessions for senior engineers and architects (4 hours)
- **Leadership Briefings**: Executive workshops for technical decision makers (half-day)

**Implementation Support:**
- **Custom Workshop Design**: Tailored content for specific organizational needs
- **Pilot Program Management**: Structured rollout with success metrics and feedback loops  
- **Ongoing Mentorship**: Post-workshop support for project implementation
- **Community Building**: Internal Azure AI developer communities and knowledge sharing

**Success Metrics:**
- **Skill Acquisition**: Pre/post assessments measuring technical competency growth
- **Deployment Success**: Percentage of participants successfully deploying production applications
- **Time to Productivity**: Reduced onboarding time for new Azure AI projects
- **Knowledge Retention**: Follow-up assessments 3-6 months post-workshop

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (30-45 minutes) 🌱
**Prerequisites**: Azure subscription, basic command line knowledge  
**Complexity**: ⭐

#### What You'll Learn
- Understanding Azure Developer CLI fundamentals
- Installing AZD on your platform  
- Your first successful deployment
- Core concepts and terminology

#### Learning Resources
- [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Core concepts
- [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platform-specific guides
- [Your First Project](docs/chapter-01-foundation/first-project.md) - Hands-on tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Quick reference

#### Practical Outcome
Successfully deploy a simple web application to Azure using AZD

---

### Chapter 2: AI-First Development (1-2 hours) 🤖
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Microsoft Foundry integration with AZD
- Deploying AI-powered applications
- Understanding AI service configurations
- RAG (Retrieval-Augmented Generation) patterns

#### Learning Resources
- [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - **NEW**: Comprehensive 2-3 hour hands-on lab
- [Interactive Workshop Guide](workshop/README.md) - **NEW**: Browser-based workshop with MkDocs preview
- [Microsoft Foundry Templates](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **NEW**: Step-by-step guided exercises

#### Practical Outcome
Deploy and configure an AI-powered chat application with RAG capabilities

#### Workshop Learning Path (Optional Enhancement)
**NEW Interactive Experience**: [Complete Workshop Guide](workshop/README.md)
1. **Discovery** (30 mins): Template selection and evaluation
2. **Deployment** (45 mins): Deploy and validate AI template functionality  
3. **Deconstruction** (30 mins): Understand template architecture and components
4. **Configuration** (30 mins): Customize settings and parameters
5. **Customization** (45 mins): Modify and iterate to make it yours
6. **Teardown** (15 mins): Clean up resources and understand lifecycle
7. **Wrap-up** (15 mins): Next steps and advanced learning paths

---

### Chapter 3: Configuration & Authentication (45-60 minutes) ⚙️
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Environment configuration and management
- Authentication and security best practices
- Resource naming and organization
- Multi-environment deployments

#### Learning Resources
- [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Environment setup
- [Authentication & Security Patterns](docs/chapter-03-configuration/authsecurity.md) - Managed identity and Key Vault integration
- Multi-environment examples

#### Practical Outcome
Manage multiple environments with proper authentication and security

---

### Chapter 4: Infrastructure as Code & Deployment (1-1.5 hours) 🏗️
**Prerequisites**: Chapters 1-3 completed  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- Advanced deployment patterns
- Infrastructure as Code with Bicep
- Resource provisioning strategies
- Custom template creation

- Containerized application deployment with Azure Container Apps and AZD

#### Learning Resources
- [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Complete workflows
- [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Resource management
- Container and microservices examples
- [Container App Examples](examples/container-app/README.md) - Quick start, production, and advanced deployment patterns

#### Practical Outcome
Deploy complex multi-service applications using custom infrastructure templates

---

### Chapter 5: Multi-Agent AI Solutions (2-3 hours) 🤖🤖
**Prerequisites**: Chapters 1-2 completed  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments
- Customer and Inventory agent implementations

- Integrating containerized microservices as part of agent-based solutions

#### Learning Resources
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Architecture blueprint, not a complete application
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Infrastructure scaffold with implementation prerequisites
- Multi-agent coordination patterns
- [Microservices Architecture Example](../../examples/container-app/microservices) - Service-to-service communication, async messaging, and production deployment

#### Practical Outcome
Design a multi-agent AI solution and identify the application implementation, validation, and operational work needed beyond provisioning infrastructure

---

### Chapter 6: Pre-Deployment Validation & Planning (1 hour) 🔍
**Prerequisites**: Chapter 4 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation
- Cost optimization planning

#### Learning Resources
- [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource validation
- [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Cost-effective choices
- [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automated scripts
- [Application Insights Integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring and observability
- [Multi-Agent Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Agent orchestration strategies

#### Practical Outcome
Validate and optimize deployments before execution

---

### Chapter 7: Troubleshooting & Debugging (1-1.5 hours) 🔧
**Wetin you need know before**: Any deployment chapter wey you don finish  
**How e hard**: ⭐⭐

#### Wetin You Go Learn
- Systematic way to debug tins
- Common wahala and how to solve am
- AI-specific troubleshooting
- How to make wetin dey work faster

#### Learning Materials
- [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ and solutions
- [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Step-by-step strategies
- [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI service problems

#### Wetin Dem Expect Make You Fit Do
Fit diagnose and solve common deployment wahala by yourself

---

### Chapter 8: Production & Enterprise Patterns (2-3 hours) 🏢
**Wetin you need know before**: Chapters 1-4 done  
**How e hard**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Production deployment strategies
- Enterprise security patterns
- Monitoring and cost optimization
- Scalability and governance

- Best practices for production container app deployments (security, monitoring, cost, CI/CD)

#### Learning Materials
- [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- Microservices and enterprise examples
- Monitoring and governance frameworks
- [Microservices Architecture Example](../../examples/container-app/microservices) - Blue-green/canary deployment, distributed tracing, and cost optimization

#### Wetin Dem Expect Make You Fit Do
Deploy enterprise-ready applications wey get full production features

---

## How Learning Go Take Progress & Hardness

### How Skill Go Take Build

- **🌱 Beginners**: Start with Chapter 1 (Foundation) → Chapter 2 (AI Development)
- **🔧 Intermediate**: Chapters 3-4 (Configuration & Infrastructure) → Chapter 6 (Validation)
- **🚀 Advanced**: Chapter 5 (Multi-Agent Solutions) → Chapter 7 (Troubleshooting)
- **🏢 Enterprise**: Complete all chapters, focus on Chapter 8 (Production Patterns)

- **Container App Path**: Chapters 4 (Containerized deployment), 5 (Microservices integration), 8 (Production best practices)

### How To Tell How E Hard

- **⭐ Basic**: One concept, guided tutorials, 30-60 minutes
- **⭐⭐ Intermediate**: Many concepts, hands-on practice, 1-2 hours  
- **⭐⭐⭐ Advanced**: Complex architectures, custom solutions, 1-3 hours
- **⭐⭐⭐⭐ Expert**: Production systems, enterprise patterns, 2-4 hours

### Flexible Way to Learn

#### 🎯 AI Developer Fast Track (4-6 hours)
1. **Chapter 1**: Foundation & Quick Start (45 mins)
2. **Chapter 2**: AI-First Development (2 hours)  
3. **Chapter 5**: Multi-Agent AI Solutions (3 hours)
4. **Chapter 8**: Production AI Best Practices (1 hour)

#### 🛠️ Infrastructure Specialist Path (5-7 hours)
1. **Chapter 1**: Foundation & Quick Start (45 mins)
2. **Chapter 3**: Configuration & Authentication (1 hour)
3. **Chapter 4**: Infrastructure as Code & Deployment (1.5 hours)
4. **Chapter 6**: Pre-Deployment Validation & Planning (1 hour)
5. **Chapter 7**: Troubleshooting & Debugging (1.5 hours)
6. **Chapter 8**: Production & Enterprise Patterns (2 hours)

#### 🎓 Complete Learning Journey (8-12 hours)
Finish all 8 chapters with hands-on practice and validation

## How Course Completion Go Work

### Knowledge Check
- **Chapter Checkpoints**: Practical exercises wey get measurable results
- **Hands-On Verification**: Deploy working solutions for each chapter
- **Progress Tracking**: Visual signs and completion badges
- **Community Validation**: Share experiences for Azure Discord channels

### Wetin You Go Fit Show After You Learn

#### Chapter 1-2 Done (Foundation + AI)
- ✅ Deploy simple web application using AZD
- ✅ Deploy AI-powered chat application with RAG
- ✅ Understand AZD core concepts and AI integration

#### Chapter 3-4 Done (Configuration + Infrastructure)  
- ✅ Manage multi-environment deployments
- ✅ Create custom Bicep infrastructure templates
- ✅ Implement secure authentication patterns

#### Chapter 5-6 Done (Multi-Agent + Validation)
- ✅ Deploy complex multi-agent AI solution
- ✅ Perform capacity planning and cost optimization
- ✅ Implement automated pre-deployment validation

#### Chapter 7-8 Done (Troubleshooting + Production)
- ✅ Debug and resolve deployment issues independently  
- ✅ Implement enterprise-grade monitoring and security
- ✅ Deploy production-ready applications with governance

### Certification and Recognition
- **Course Completion Badge**: Complete all 8 chapters with practical validation
- **Community Recognition**: Active participation in Microsoft Foundry Discord
- **Professional Development**: Industry-relevant AZD and AI deployment skills
- **Career Advancement**: Enterprise-ready cloud deployment capabilities

## 🎓 Full Learning Outcomes

### Foundation Level (Chapters 1-2)
After you finish foundation chapters, person go show:

**Technical Skills:**
- Deploy simple web apps to Azure using AZD commands
- Configure and deploy AI-powered chat apps with RAG ability
- Understand main AZD concepts: templates, environments, provisioning workflows
- Join Microsoft Foundry services with AZD deployments
- Navigate Azure AI service settings and API endpoints

**Professional Skills:**
- Follow structured deployment workflows for steady results
- Troubleshoot basic deployment wahala using logs and docs
- Talk well about cloud deployment processes
- Use best ways for secure AI service join

**Learning Check:**
- ✅ Successfully deploy `todo-nodejs-mongo` template
- ✅ Deploy and set up `azure-search-openai-demo` with RAG
- ✅ Finish interactive workshop exercises (Discovery phase)
- ✅ Join Azure Discord community talks

### Intermediate Level (Chapters 3-4)
After you finish intermediate chapters, person go show:

**Technical Skills:**
- Manage multi-environment deployments (dev, staging, production)
- Make custom Bicep templates for infrastructure as code
- Use secure authentication patterns with managed identity
- Deploy complex multi-service apps with custom settings
- Make resource provisioning better for cost and performance

**Professional Skills:**
- Design scalable infrastructure architectures
- Use security best practices for cloud deployments
- Write down infrastructure patterns for team work
- Check and pick correct Azure services for needs

**Learning Check:**
- ✅ Set separate environments with environment-specific settings
- ✅ Make and deploy custom Bicep template for multi-service app
- ✅ Use managed identity authentication for secure access
- ✅ Finish configuration management exercises with real cases

### Advanced Level (Chapters 5-6)
After you finish advanced chapters, person go show:

**Technical Skills:**
- Deploy and manage multi-agent AI solutions with coordinated workflows
- Use Customer and Inventory agent designs for retail cases
- Do full capacity planning and resource validation
- Run automated pre-deployment validation and optimization
- Design cost-effective SKU choice based on workload needs

**Professional Skills:**
- Design complex AI solutions for production environments
- Lead technical talks about AI deployment strategies
- Teach junior developers in AZD and AI deployment best ways
- Check and advise AI architecture patterns for business needs

**Learning Check:**
- ✅ Review retail multi-agent blueprint and see difference between provisioned infrastructure and missing app implementation
- ✅ Show agent coordination and workflow management
- ✅ Finish capacity planning exercises with real resource limits
- ✅ Confirm deployment readiness through automated pre-flight checks

### Expert Level (Chapters 7-8)
After you finish expert chapters, person go show:

**Technical Skills:**
- Diagnose and solve complex deployment wahala by yourself
- Use enterprise-grade security patterns and governance frameworks
- Design full monitoring and alerting plans
- Make production deployments better for scale, cost, and performance
- Set up CI/CD pipelines with proper testing and validation

**Professional Skills:**
- Lead enterprise cloud transformation projects
- Design and put in place organizational deployment standards
- Train and guide development teams for advanced AZD ways
- Influence technical decisions for enterprise AI deployments

**Learning Check:**
- ✅ Solve complex multi-service deployment failures
- ✅ Use enterprise security patterns with compliance demands
- ✅ Design and deploy production monitoring with Application Insights
- ✅ Finish enterprise governance framework implementation

## 🎯 Course Completion Certificate

### Progress Tracking System
Track how your learning dey go through organized checkpoints:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Verification Process
After you finish each chapter, check your knowledge by:

1. **Practical Exercise Done**: Deploy working solutions for each chapter
2. **Knowledge Assessment**: Check FAQ sections and do self-assessments
3. **Community Engagement**: Share tori and get feedback for Azure Discord
4. **Portfolio Development**: Write your deployments and lessons learned
5. **Peer Review**: Work together with other learners on complex cases

### Course Completion Benefits
After you finish all chapters with verification, you go get:

**Technical Expertise:**
- **Production Experience**: Deploy real AI apps to Azure environments
- **Professional Skills**: Enterprise-ready deployment and troubleshooting fit
- **Architecture Knowledge**: Multi-agent AI solutions and complex infrastructure patterns
- **Troubleshooting Mastery**: Solve deployment and configuration wahala by yourself

**Professional Development:**
- **Industry Recognition**: Verified skills for high-demand AZD and AI deployment areas
- **Career Advancement**: Qualification for cloud architect and AI deployment specialist roles
- **Community Leadership**: Active member for Azure developer and AI communities
- **Continuous Learning**: Foundation for advanced Microsoft Foundry specialization

**Portfolio Assets:**
- **Deployed Solutions**: Working examples of AI apps and infrastructure patterns
- **Documentation**: Complete deployment guides and troubleshooting steps
- **Community Contributions**: Talks, examples, and improvements wey you share for Azure community
- **Professional Network**: Connections with Azure experts and AI deployment workers

### Wetin To Learn After Course
Graduates dey ready for advanced specialization for:
- **Microsoft Foundry Expert**: Deep skill for AI model deployment and managing am
- **Cloud Architecture Leadership**: Enterprise-scale deployment design and governance
- **Developer Community Leadership**: Contribute to Azure samples and community resources
- **Corporate Training**: Teach AZD and AI deployment skills for companies

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->