<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "aace36eff845763a5b041a4ed9a33e02",
  "translation_date": "2025-11-18T18:57:26+00:00",
  "source_file": "course-outline.md",
  "language_code": "pcm"
}
-->
# AZD For Beginners: Course Outline & Learning Framework

## Course Overview

Learn how to sabi Azure Developer CLI (azd) wit chapters wey dey arranged to make learning easy. **We go focus well well on how to deploy AI application wit Azure AI Foundry integration.**

### Why Dis Course Important for Developers Today

From wetin we gather from Azure AI Foundry Discord community, **45% of developers wan use AZD for AI work** but dem dey face wahala like:
- How to manage AI architecture wey dey use many services
- Best way to deploy AI for production  
- How to configure Azure AI services
- How to reduce cost for AI work
- How to solve wahala wey dey happen when dem dey deploy AI

### Core Learning Objectives

When you finish dis course, you go:
- **Sabi AZD Basics**: Understand core ideas, how to install am, and configure am
- **Deploy AI Applications**: Use AZD wit Azure AI Foundry services
- **Use Infrastructure as Code**: Manage Azure resources wit Bicep templates
- **Solve Deployment Wahala**: Fix common problems and debug issues
- **Prepare for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## 🎓 Workshop Learning Experience

### Flexible Learning Delivery Options
Dis course dey fit for both **self-paced learning** and **workshop sessions**, so learners go fit get hands-on experience wit AZD and learn practical skills wit interactive exercises.

#### 🚀 Self-Paced Learning Mode
**Good for developers wey wan learn on dia own and for continuous learning**

**Features:**
- **Browser-Based Interface**: MkDocs-powered workshop wey you fit access wit any web browser
- **GitHub Codespaces Integration**: One-click development environment wey don already get tools wey you need
- **Interactive DevContainer Environment**: No need to set up for your computer - just start coding
- **Progress Tracking**: Checkpoints and exercises wey go help you track your learning
- **Community Support**: Join Azure Discord channels to ask questions and collaborate

**Learning Structure:**
- **Flexible Timing**: Learn at your own pace, whether na days or weeks
- **Checkpoint System**: Make sure you sabi one topic before you move to the next one
- **Resource Library**: Full documentation, examples, and guides for troubleshooting
- **Portfolio Development**: Create projects wey you fit use for your professional portfolio

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
**Good for corporate training, bootcamps, and schools**

**Workshop Format Options:**

**📚 Academic Course Integration (8-12 weeks)**
- **University Programs**: Semester-long course wey go get weekly 2-hour sessions
- **Bootcamp Format**: 3-5 day intensive program wey go get daily 6-8 hour sessions
- **Corporate Training**: Monthly team sessions wey go include practical project implementation
- **Assessment Framework**: Graded assignments, peer reviews, and final projects

**🚀 Intensive Workshop (1-3 days)**
- **Day 1**: Foundation + AI Development (Chapters 1-2) - 6 hours
- **Day 2**: Configuration + Infrastructure (Chapters 3-4) - 6 hours  
- **Day 3**: Advanced Patterns + Production (Chapters 5-8) - 8 hours
- **Follow-up**: Optional 2-week mentorship to finish project

**⚡ Executive Briefing (4-6 hours)**
- **Strategic Overview**: AZD value and how e go help business (1 hour)
- **Hands-On Demo**: Deploy AI application from start to finish (2 hours)
- **Architecture Review**: Enterprise patterns and governance (1 hour)
- **Implementation Planning**: Strategy for how organization go adopt am (1-2 hours)

#### 🛠️ Workshop Learning Methodology
**Discovery → Deployment → Customization approach wey go help you learn skills well well**

**Phase 1: Discovery (45 minutes)**
- **Template Exploration**: Check Azure AI Foundry templates and services
- **Architecture Analysis**: Learn multi-agent patterns and deployment strategies
- **Requirement Assessment**: Know wetin your organization need and constraints
- **Environment Setup**: Configure development environment and Azure resources

**Phase 2: Deployment (2 hours)**
- **Guided Implementation**: Step-by-step deployment of AI applications wit AZD
- **Service Configuration**: Configure Azure AI services, endpoints, and authentication
- **Security Implementation**: Use enterprise security patterns and access controls
- **Validation Testing**: Check deployments and fix common wahala

**Phase 3: Customization (45 minutes)**
- **Application Modification**: Change templates to fit your use case
- **Production Optimization**: Add monitoring, cost management, and scaling strategies
- **Advanced Patterns**: Learn multi-agent coordination and complex architectures
- **Next Steps Planning**: Plan how you go continue to dey learn

#### 🎯 Workshop Learning Outcomes
**Skills wey you go sabi after you don practice well well**

**Technical Competencies:**
- **Deploy Production AI Applications**: Deploy and configure AI-powered solutions
- **Infrastructure as Code Mastery**: Create and manage custom Bicep templates
- **Multi-Agent Architecture**: Implement coordinated AI agent solutions
- **Production Readiness**: Use security, monitoring, and governance patterns
- **Troubleshooting Expertise**: Solve deployment and configuration wahala by yourself

**Professional Skills:**
- **Project Leadership**: Lead technical teams for cloud deployment
- **Architecture Design**: Design scalable, cost-effective Azure solutions
- **Knowledge Transfer**: Teach and mentor others about AZD best practices
- **Strategic Planning**: Help organization plan how dem go use cloud

#### 📋 Workshop Resources and Materials
**Toolkit wey facilitators and learners go use**

**For Facilitators:**
- **Instructor Guide**: [Workshop Facilitation Guide](workshop/docs/instructor-guide.md) - Tips for planning and delivering sessions
- **Presentation Materials**: Slide decks, architecture diagrams, and demo scripts
- **Assessment Tools**: Exercises, knowledge checks, and evaluation rubrics
- **Technical Setup**: Environment configuration, troubleshooting guides, and backup plans

**For Learners:**
- **Interactive Workshop Environment**: [Workshop Materials](workshop/README.md) - Browser-based learning platform
- **Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed walkthroughs  
- **Reference Documentation**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-focused deep dives
- **Community Resources**: Azure Discord channels, GitHub discussions, and expert support

#### 🏢 Enterprise Workshop Implementation
**How organizations fit use dis training**

**Corporate Training Programs:**
- **Developer Onboarding**: Teach new hires AZD basics (2-4 weeks)
- **Team Upskilling**: Quarterly workshops for existing teams (1-2 days)
- **Architecture Review**: Monthly sessions for senior engineers and architects (4 hours)
- **Leadership Briefings**: Workshops for executives wey dey make technical decisions (half-day)

**Implementation Support:**
- **Custom Workshop Design**: Content wey fit your organization needs
- **Pilot Program Management**: Structured rollout wit feedback loops  
- **Ongoing Mentorship**: Support after workshop to finish projects
- **Community Building**: Create internal Azure AI developer communities

**Success Metrics:**
- **Skill Acquisition**: Measure how much participants don learn
- **Deployment Success**: How many people fit deploy production applications
- **Time to Productivity**: Reduce time wey new Azure AI projects dey take
- **Knowledge Retention**: Check how much dem still sabi 3-6 months after workshop

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (30-45 minutes) 🌱
**Prerequisites**: Azure subscription, basic command line knowledge  
**Complexity**: ⭐

#### Wetin You Go Learn
- Understand Azure Developer CLI basics
- How to install AZD for your platform  
- Your first successful deployment
- Core ideas and terms

#### Learning Resources
- [AZD Basics](docs/getting-started/azd-basics.md) - Core ideas
- [Installation & Setup](docs/getting-started/installation.md) - Guides for different platforms
- [Your First Project](docs/getting-started/first-project.md) - Hands-on tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Quick reference

#### Practical Outcome
Deploy simple web application to Azure wit AZD

---

### Chapter 2: AI-First Development (1-2 hours) 🤖
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Azure AI Foundry integration wit AZD
- Deploy AI-powered applications
- Understand AI service configurations
- RAG (Retrieval-Augmented Generation) patterns

#### Learning Resources
- [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - **NEW**: 2-3 hour hands-on lab
- [Interactive Workshop Guide](workshop/README.md) - **NEW**: Browser-based workshop wit MkDocs preview
- [Azure AI Foundry Templates](README.md#featured-azure-ai-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **NEW**: Step-by-step guided exercises

#### Practical Outcome
Deploy and configure AI-powered chat application wit RAG capabilities

#### Workshop Learning Path (Optional Enhancement)
**NEW Interactive Experience**: [Complete Workshop Guide](workshop/README.md)
1. **Discovery** (30 mins): Template selection and evaluation
2. **Deployment** (45 mins): Deploy and validate AI template functionality  
3. **Deconstruction** (30 mins): Understand template architecture and components
4. **Configuration** (30 mins): Customize settings and parameters
5. **Customization** (45 mins): Modify and iterate to make am your own
6. **Teardown** (15 mins): Clean up resources and understand lifecycle
7. **Wrap-up** (15 mins): Next steps and advanced learning paths

---

### Chapter 3: Configuration & Authentication (45-60 minutes) ⚙️
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to configure and manage environment
- Authentication and security best practices
- Resource naming and organization
- Multi-environment deployments

#### Learning Resources
- [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- Security patterns and managed identity
- Multi-environment examples

#### Practical Outcome
Manage multiple environments wit proper authentication and security

---

### Chapter 4: Infrastructure as Code & Deployment (1-1.5 hours) 🏗️
**Prerequisites**: Chapters 1-3 completed  
**Complexity**: ⭐⭐⭐

#### Wetin You Go Learn
- Advanced deployment patterns
- Infrastructure as Code wit Bicep
- Resource provisioning strategies
- How to create custom templates

#### Learning Resources
- [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- [Provisioning Resources](docs/deployment/provisioning.md) - Resource management
- Container and microservices examples

#### Practical Outcome
Deploy complex multi-service applications wit custom infrastructure templates

---

### Chapter 5: Multi-Agent AI Solutions (2-3 hours) 🤖🤖
**Prerequisites**: Chapters 1-2 completed  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments
- Customer and Inventory agent implementations

#### Learning Resources
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- Multi-agent coordination patterns

#### Practical Outcome
Deploy and manage production-ready multi-agent AI solution

---

### Chapter 6: Pre-Deployment Validation & Planning (1 hour) 🔍
**Prerequisites**: Chapter 4 completed  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation
- Cost optimization planning

#### Learning Resources
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Outcome
Validate and optimize deployments before execution

---

### Chapter 7: Troubleshooting & Debugging (1-1.5 hours) 🔧
**Prerequisites**: Any deployment chapter completed  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- Systematic debugging approaches
- Common issues and solutions
- AI-specific troubleshooting
- Performance optimization

#### Learning Resources
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Wahala wey dey happen for AI service

#### Wetin You Go Fit Do
Find wahala by yasef and fix common deployment problems

---

### Chapter 8: Production & Enterprise Patterns (2-3 hours) 🏢
**Prerequisites**: Chapters 1-4 don finish  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- How to deploy for production
- Security patterns for big companies
- How to monitor and reduce cost
- How to make system scale well and manage am

#### Learning Resources
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Patterns for big companies
- Microservices and examples for enterprise
- Frameworks for monitoring and governance

#### Wetin You Go Fit Do
Deploy apps wey dey ready for big companies with full production features

---

## Learning Progression and Complexity

### How Skills Go Dey Grow

- **🌱 Beginners**: Start with Chapter 1 (Foundation) → Chapter 2 (AI Development)
- **🔧 Intermediate**: Chapters 3-4 (Configuration & Infrastructure) → Chapter 6 (Validation)
- **🚀 Advanced**: Chapter 5 (Multi-Agent Solutions) → Chapter 7 (Troubleshooting)
- **🏢 Enterprise**: Finish all chapters, focus on Chapter 8 (Production Patterns)

### Complexity Levels

- **⭐ Basic**: One concept, tutorials wey dey guide you, 30-60 minutes
- **⭐⭐ Intermediate**: Plenty concepts, practice wey you go do by yasef, 1-2 hours  
- **⭐⭐⭐ Advanced**: Complex designs, custom solutions, 1-3 hours
- **⭐⭐⭐⭐ Expert**: Systems for production, patterns for big companies, 2-4 hours

### Flexible Learning Paths

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
Follow all 8 chapters step by step with practice and validation

## Course Completion Framework

### How You Go Validate Wetin You Learn
- **Chapter Checkpoints**: Exercises wey go show wetin you don learn
- **Hands-On Verification**: Deploy solutions wey dey work for each chapter
- **Progress Tracking**: Visual tools and badges for completion
- **Community Validation**: Share wetin you learn for Azure Discord channels

### How Dem Go Assess Wetin You Learn

#### Chapter 1-2 Completion (Foundation + AI)
- ✅ Deploy simple web app with AZD
- ✅ Deploy AI chat app with RAG
- ✅ Understand AZD basics and how AI dey join

#### Chapter 3-4 Completion (Configuration + Infrastructure)  
- ✅ Manage deployments for different environments
- ✅ Create custom Bicep templates for infrastructure
- ✅ Use secure authentication patterns

#### Chapter 5-6 Completion (Multi-Agent + Validation)
- ✅ Deploy multi-agent AI solution wey complex
- ✅ Plan capacity and reduce cost
- ✅ Use automated validation before deployment

#### Chapter 7-8 Completion (Troubleshooting + Production)
- ✅ Fix deployment wahala by yasef  
- ✅ Use monitoring and security for big companies
- ✅ Deploy apps wey dey ready for production with governance

### Certification and Recognition
- **Course Completion Badge**: Finish all 8 chapters with validation
- **Community Recognition**: Join Azure AI Foundry Discord actively
- **Professional Development**: Skills wey dey relevant for AZD and AI deployment
- **Career Advancement**: Skills for deploying cloud solutions for big companies

## 🎓 Comprehensive Learning Outcomes

### Foundation Level (Chapters 1-2)
When you finish foundation chapters, you go fit show:

**Technical Skills:**
- Deploy simple web apps to Azure with AZD commands
- Configure and deploy AI chat apps with RAG features
- Understand AZD basics: templates, environments, workflows
- Use Azure AI Foundry services with AZD deployments
- Set up Azure AI service configurations and API endpoints

**Professional Skills:**
- Follow deployment steps wey dey structured for better results
- Fix small deployment wahala with logs and documentation
- Talk well about cloud deployment processes
- Use best practices for secure AI service integration

**Learning Validation:**
- ✅ Deploy `todo-nodejs-mongo` template successfully
- ✅ Deploy and configure `azure-search-openai-demo` with RAG
- ✅ Finish interactive workshop exercises (Discovery phase)
- ✅ Join Azure Discord community discussions

### Intermediate Level (Chapters 3-4)
When you finish intermediate chapters, you go fit show:

**Technical Skills:**
- Manage deployments for different environments (dev, staging, production)
- Create custom Bicep templates for infrastructure as code
- Use secure authentication patterns with managed identity
- Deploy apps wey get many services with custom settings
- Plan resources well for cost and performance

**Professional Skills:**
- Design infrastructure wey fit scale well
- Use security best practices for cloud deployments
- Write documentation for team collaboration
- Choose correct Azure services for wetin you need

**Learning Validation:**
- ✅ Set up environments with settings wey dey specific to each one
- ✅ Create and deploy custom Bicep template for app wey get many services
- ✅ Use managed identity authentication for secure access
- ✅ Finish configuration management exercises with real examples

### Advanced Level (Chapters 5-6)
When you finish advanced chapters, you go fit show:

**Technical Skills:**
- Deploy and manage multi-agent AI solutions with workflows wey dey coordinated
- Use Customer and Inventory agent designs for retail examples
- Plan capacity well and validate resources
- Use automated validation before deployment
- Choose cost-effective SKU based on wetin you need

**Professional Skills:**
- Design AI solutions wey complex for production
- Lead technical talks about AI deployment strategies
- Teach junior developers AZD and AI deployment best practices
- Recommend AI architecture patterns for business needs

**Learning Validation:**
- ✅ Deploy retail multi-agent solution with ARM templates
- ✅ Show agent coordination and workflow management
- ✅ Finish capacity planning exercises with real resource limits
- ✅ Validate deployment readiness with automated checks

### Expert Level (Chapters 7-8)
When you finish expert chapters, you go fit show:

**Technical Skills:**
- Find and fix deployment wahala by yasef
- Use security patterns and governance frameworks for big companies
- Design monitoring and alerting strategies wey complete
- Optimize production deployments for scale, cost, and performance
- Set up CI/CD pipelines with testing and validation

**Professional Skills:**
- Lead cloud transformation projects for big companies
- Design and use deployment standards for organizations
- Teach development teams advanced AZD practices
- Help make decisions for enterprise AI deployments

**Learning Validation:**
- ✅ Fix deployment problems wey dey complex
- ✅ Use enterprise security patterns with compliance needs
- ✅ Design and deploy monitoring with Application Insights
- ✅ Finish governance framework for big companies

## 🎯 Course Completion Certification

### How You Go Track Progress
Check your progress with checkpoints wey dey structured:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### How You Go Verify
After each chapter, check wetin you don learn through:

1. **Finish Practical Exercises**: Deploy solutions wey dey work for each chapter
2. **Knowledge Assessment**: Check FAQ and do self-assessment
3. **Community Engagement**: Share wetin you learn and get feedback for Azure Discord
4. **Portfolio Development**: Write down your deployments and wetin you learn
5. **Peer Review**: Work with other learners for complex examples

### Benefits of Completing Course
When you finish all chapters with verification, you go get:

**Technical Skills:**
- **Production Experience**: Deploy real AI apps to Azure environments
- **Professional Skills**: Skills wey dey ready for big company deployment and troubleshooting  
- **Architecture Knowledge**: Multi-agent AI solutions and complex infrastructure designs
- **Troubleshooting Mastery**: Fix deployment and configuration wahala by yasef

**Professional Development:**
- **Industry Recognition**: Skills wey dey high demand for AZD and AI deployment
- **Career Advancement**: Skills for cloud architect and AI deployment specialist roles
- **Community Leadership**: Join Azure developer and AI communities actively
- **Continuous Learning**: Foundation for advanced Azure AI Foundry specialization

**Portfolio Assets:**
- **Deployed Solutions**: Examples of AI apps and infrastructure designs wey dey work
- **Documentation**: Guides for deployment and troubleshooting  
- **Community Contributions**: Discussions, examples, and improvements wey you share for Azure community
- **Professional Network**: Connections with Azure experts and AI deployment people

### Wetin You Go Fit Do After Course
When you finish, you go fit specialize for:
- **Azure AI Foundry Expert**: Deep skills for AI model deployment and management
- **Cloud Architecture Leadership**: Designs for big company deployment and governance
- **Developer Community Leadership**: Contribute to Azure samples and community resources
- **Corporate Training**: Teach AZD and AI deployment skills for organizations

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg make you sabi say automatic translation fit get mistake or no dey correct well. Di original dokyument for im native language na di main source wey you go fit trust. For important information, e good make professional human translation dey use. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->