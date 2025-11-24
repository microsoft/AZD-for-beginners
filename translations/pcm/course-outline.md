<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a0861541126250c3558d667e9b13c50",
  "translation_date": "2025-11-24T13:26:51+00:00",
  "source_file": "course-outline.md",
  "language_code": "pcm"
}
-->
# AZD For Beginners: Course Outline & Learning Framework

## Course Overview

Learn how to sabi Azure Developer CLI (azd) step by step. **We go focus well well on how to deploy AI apps with Microsoft Foundry.**

### Why Dis Course Make Sense for Developers Today

From wetin we see for Microsoft Foundry Discord community, **45% of developers wan use AZD for AI work** but dem dey face wahala like:
- How to handle AI setups wey get plenty services
- How to deploy AI for production well
- How to connect and set up Azure AI services
- How to save money for AI work
- How to fix wahala wey dey happen when dem dey deploy AI

### Wetin You Go Learn

When you finish dis course, you go sabi:
- **AZD Basics**: How e work, how to install am, and how to set am up
- **Deploy AI Apps**: Use AZD with Microsoft Foundry services
- **Infrastructure as Code**: Use Bicep templates to manage Azure resources
- **Fix Deployment Wahala**: Solve common problems and debug issues
- **Prepare for Production**: Security, scaling, monitoring, and cost management
- **Build Complex AI Solutions**: Deploy AI setups wey get plenty agents

## 🎓 Workshop Learning Experience

### How You Fit Learn
Dis course dey for both **self-paced learning** and **workshop sessions**, so you fit practice AZD and learn skills wey you go use for real work.

#### 🚀 Self-Paced Learning Mode
**Good for developers wey wan learn on their own**

**Wetin You Go Get:**
- **Browser-Based Interface**: MkDocs-powered workshop wey you fit use for any browser
- **GitHub Codespaces Integration**: One-click dev environment wey don already get tools
- **Interactive DevContainer Environment**: No need to set up anything for your computer - just start coding
- **Progress Tracking**: Checkpoints and exercises to track your progress
- **Community Support**: Join Azure Discord channels to ask questions and connect with others

**How E Work:**
- **Flexible Timing**: Learn at your own time, whether na days or weeks
- **Checkpoint System**: Make sure you sabi one level before you move to the next
- **Resource Library**: Full documentation, examples, and troubleshooting guides
- **Portfolio Development**: Build projects wey you fit show for your portfolio

**How to Start (Self-Paced):**
```bash
# Option 1: GitHub Codespaces (E dey recommended)
# Go the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions wey dey workshop/README.md
```

#### 🏛️ Facilitated Workshop Sessions
**Good for companies, bootcamps, and schools**

**Workshop Format Options:**

**📚 Academic Course Integration (8-12 weeks)**
- **University Programs**: Semester-long course with weekly 2-hour sessions
- **Bootcamp Format**: 3-5 day intensive program with daily 6-8 hour sessions
- **Corporate Training**: Monthly team sessions with practical projects
- **Assessment Framework**: Graded assignments, peer reviews, and final projects

**🚀 Intensive Workshop (1-3 days)**
- **Day 1**: Foundation + AI Development (Chapters 1-2) - 6 hours
- **Day 2**: Configuration + Infrastructure (Chapters 3-4) - 6 hours  
- **Day 3**: Advanced Patterns + Production (Chapters 5-8) - 8 hours
- **Follow-up**: Optional 2-week mentorship to finish project

**⚡ Executive Briefing (4-6 hours)**
- **Strategic Overview**: Why AZD dey important and wetin e fit do for business (1 hour)
- **Hands-On Demo**: Deploy AI app from start to finish (2 hours)
- **Architecture Review**: Enterprise patterns and governance (1 hour)
- **Implementation Planning**: How to make your organization use am (1-2 hours)

#### 🛠️ Workshop Learning Methodology
**Discovery → Deployment → Customization approach to learn skills by doing**

**Phase 1: Discovery (45 minutes)**
- **Template Exploration**: Check Azure AI Foundry templates and services
- **Architecture Analysis**: Understand how multi-agent patterns and deployment work
- **Requirement Assessment**: Know wetin your organization need
- **Environment Setup**: Set up dev environment and Azure resources

**Phase 2: Deployment (2 hours)**
- **Guided Implementation**: Deploy AI apps step by step with AZD
- **Service Configuration**: Set up Azure AI services, endpoints, and authentication
- **Security Implementation**: Add security patterns and access controls
- **Validation Testing**: Test deployments and fix common issues

**Phase 3: Customization (45 minutes)**
- **Application Modification**: Change templates to fit your needs
- **Production Optimization**: Add monitoring, cost management, and scaling
- **Advanced Patterns**: Learn multi-agent coordination and complex setups
- **Next Steps Planning**: Plan how to continue learning

#### 🎯 Workshop Learning Outcomes
**Skills wey you go get from hands-on practice**

**Technical Competencies:**
- **Deploy Production AI Apps**: Deploy and set up AI-powered solutions
- **Infrastructure as Code Mastery**: Create and manage Bicep templates
- **Multi-Agent Architecture**: Build coordinated AI agent solutions
- **Production Readiness**: Add security, monitoring, and governance
- **Troubleshooting Expertise**: Solve deployment and configuration problems

**Professional Skills:**
- **Project Leadership**: Lead teams for cloud deployment
- **Architecture Design**: Design scalable, cost-effective Azure solutions
- **Knowledge Transfer**: Teach others AZD best practices
- **Strategic Planning**: Help your organization adopt cloud strategies

#### 📋 Workshop Resources and Materials
**Tools for facilitators and learners**

**For Facilitators:**
- **Instructor Guide**: [Workshop Facilitation Guide](workshop/docs/instructor-guide.md) - Tips for planning and teaching
- **Presentation Materials**: Slide decks, diagrams, and demo scripts
- **Assessment Tools**: Exercises, knowledge checks, and rubrics
- **Technical Setup**: Guides for setup, troubleshooting, and backup plans

**For Learners:**
- **Interactive Workshop Environment**: [Workshop Materials](workshop/README.md) - Browser-based learning
- **Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed walkthroughs  
- **Reference Documentation**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-focused guides
- **Community Resources**: Azure Discord channels, GitHub discussions, and expert support

#### 🏢 Enterprise Workshop Implementation
**How companies fit use dis training**

**Corporate Training Programs:**
- **Developer Onboarding**: Teach new hires AZD basics (2-4 weeks)
- **Team Upskilling**: Quarterly workshops for teams (1-2 days)
- **Architecture Review**: Monthly sessions for senior engineers (4 hours)
- **Leadership Briefings**: Half-day workshops for decision makers

**Implementation Support:**
- **Custom Workshop Design**: Content wey fit your company needs
- **Pilot Program Management**: Plan rollout with feedback
- **Ongoing Mentorship**: Support after workshop for projects
- **Community Building**: Create internal Azure AI developer groups

**Success Metrics:**
- **Skill Acquisition**: Measure how much participants don learn
- **Deployment Success**: How many people fit deploy production apps
- **Time to Productivity**: Reduce time to start new Azure AI projects
- **Knowledge Retention**: Check learning 3-6 months after workshop

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (30-45 minutes) 🌱
**Wetin You Need**: Azure subscription, small command line knowledge  
**Level**: ⭐

#### Wetin You Go Learn
- Wetin Azure Developer CLI be
- How to install AZD for your platform  
- Your first deployment
- Core concepts and terms

#### Learning Resources
- [AZD Basics](docs/getting-started/azd-basics.md) - Core concepts
- [Installation & Setup](docs/getting-started/installation.md) - Platform-specific guides
- [Your First Project](docs/getting-started/first-project.md) - Hands-on tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Quick reference

#### Practical Outcome
Deploy simple web app to Azure with AZD

---

### Chapter 2: AI-First Development (1-2 hours) 🤖
**Wetin You Need**: Finish Chapter 1  
**Level**: ⭐⭐

#### Wetin You Go Learn
- How to use Microsoft Foundry with AZD
- Deploy AI-powered apps
- How to set up AI services
- RAG (Retrieval-Augmented Generation) patterns

#### Learning Resources
- [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **NEW**: 2-3 hour hands-on lab
- [Interactive Workshop Guide](workshop/README.md) - **NEW**: Browser-based workshop
- [Microsoft Foundry Templates](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **NEW**: Step-by-step exercises

#### Practical Outcome
Deploy and set up AI-powered chat app with RAG

#### Workshop Learning Path (Optional)
**NEW Interactive Experience**: [Complete Workshop Guide](workshop/README.md)
1. **Discovery** (30 mins): Choose and check templates
2. **Deployment** (45 mins): Deploy and test AI template  
3. **Deconstruction** (30 mins): Understand template architecture
4. **Configuration** (30 mins): Adjust settings
5. **Customization** (45 mins): Make changes to fit your needs
6. **Teardown** (15 mins): Clean up resources
7. **Wrap-up** (15 mins): Plan next steps

---

### Chapter 3: Configuration & Authentication (45-60 minutes) ⚙️
**Wetin You Need**: Finish Chapter 1  
**Level**: ⭐⭐

#### Wetin You Go Learn
- How to set up and manage environments
- Authentication and security best practices
- How to name and organize resources
- Deploy to multiple environments

#### Learning Resources
- [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- [Authentication & Security Patterns](docs/getting-started/authsecurity.md) - Managed identity and Key Vault integration
- Multi-environment examples

#### Practical Outcome
Manage environments with proper authentication and security

---

### Chapter 4: Infrastructure as Code & Deployment (1-1.5 hours) 🏗️
**Wetin You Need**: Finish Chapters 1-3  
**Level**: ⭐⭐⭐

#### Wetin You Go Learn
- Advanced deployment patterns
- Infrastructure as Code with Bicep
- How to provision resources
- How to create custom templates

- Deploy containerized apps with Azure Container Apps and AZD

#### Learning Resources
- [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- [Provisioning Resources](docs/deployment/provisioning.md) - Resource management
- Container and microservices examples
- [Container App Examples](examples/container-app/README.md) - Quick start, production, and advanced deployment patterns

#### Practical Outcome
Deploy complex apps with custom infrastructure templates

---

### Chapter 5: Multi-Agent AI Solutions (2-3 hours) 🤖🤖
**Wetin You Need**: Finish Chapters 1-2  
**Level**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- Multi-agent architecture patterns
- How to coordinate agents
- Deploy AI for production
- Customer and Inventory agent setups

- Add containerized microservices to agent-based solutions

#### Learning Resources
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Full implementation
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- Multi-agent coordination patterns
- [Microservices Architecture Example](../../examples/container-app/microservices) - Service-to-service communication, async messaging, and production deployment

#### Practical Outcome
Deploy and manage production-ready multi-agent AI solution

---

### Chapter 6: Pre-Deployment Validation & Planning (1 hour) 🔍
**Wetin You Need**: Finish Chapter 4  
**Level**: ⭐⭐

#### Wetin You Go Learn
- How to plan capacity and validate resources
- How to choose SKUs
- Pre-flight checks and automation
- Plan to save costs

#### Learning Resources
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts
- [Application Insights Integration](docs/pre-deployment/application-insights.md) - Monitoring and observability
- [Multi-Agent Coordination Patterns](docs/pre-deployment/coordination-patterns.md) - Agent orchestration strategies

#### Practical Outcome
Check and make sure say deployment go work well before you run am

---

### Chapter 7: Troubleshoot & Debug (1-1.5 hours) 🔧
**Prerequisite**: Any deployment chapter wey you don finish  
**Complexity**: ⭐⭐

#### Wetin You Go Learn
- How to debug step by step
- Common wahala and how to solve am
- Troubleshoot AI wahala
- How to make performance better

#### Learning Resources
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Outcome
Make you sabi how to find and fix common deployment wahala by yourself

---

### Chapter 8: Production & Enterprise Patterns (2-3 hours) 🏢
**Prerequisite**: Chapters 1-4 wey you don finish  
**Complexity**: ⭐⭐⭐⭐

#### Wetin You Go Learn
- How to deploy for production
- Enterprise security patterns
- How to monitor and reduce cost
- Scalability and governance

- Best ways to deploy container apps for production (security, monitoring, cost, CI/CD)

#### Learning Resources
- [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Enterprise patterns
- Microservices and enterprise examples
- Monitoring and governance frameworks
- [Microservices Architecture Example](../../examples/container-app/microservices) - Blue-green/canary deployment, distributed tracing, and cost optimization

#### Practical Outcome
Deploy enterprise-ready apps wey get full production features

---

## Learning Progression and Complexity

### Progressive Skill Building

- **🌱 Beginners**: Start with Chapter 1 (Foundation) → Chapter 2 (AI Development)
- **🔧 Intermediate**: Chapters 3-4 (Configuration & Infrastructure) → Chapter 6 (Validation)
- **🚀 Advanced**: Chapter 5 (Multi-Agent Solutions) → Chapter 7 (Troubleshooting)
- **🏢 Enterprise**: Finish all chapters, focus on Chapter 8 (Production Patterns)

- **Container App Path**: Chapters 4 (Containerized deployment), 5 (Microservices integration), 8 (Production best practices)

### Complexity Indicators

- **⭐ Basic**: One concept, guided tutorials, 30-60 minutes
- **⭐⭐ Intermediate**: Plenty concepts, hands-on practice, 1-2 hours  
- **⭐⭐⭐ Advanced**: Complex architectures, custom solutions, 1-3 hours
- **⭐⭐⭐⭐ Expert**: Production systems, enterprise patterns, 2-4 hours

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
Follow all 8 chapters step by step with hands-on practice and validation

## Course Completion Framework

### Knowledge Validation
- **Chapter Checkpoints**: Practical exercises wey go show wetin you don learn
- **Hands-On Verification**: Deploy working solutions for each chapter
- **Progress Tracking**: Visual indicators and completion badges
- **Community Validation**: Share wetin you learn for Azure Discord channels

### Learning Outcomes Assessment

#### Chapter 1-2 Completion (Foundation + AI)
- ✅ Deploy basic web app using AZD
- ✅ Deploy AI-powered chat app with RAG
- ✅ Understand AZD core concepts and AI integration

#### Chapter 3-4 Completion (Configuration + Infrastructure)  
- ✅ Manage multi-environment deployments
- ✅ Create custom Bicep infrastructure templates
- ✅ Implement secure authentication patterns

#### Chapter 5-6 Completion (Multi-Agent + Validation)
- ✅ Deploy complex multi-agent AI solution
- ✅ Do capacity planning and cost optimization
- ✅ Implement automated pre-deployment validation

#### Chapter 7-8 Completion (Troubleshooting + Production)
- ✅ Debug and fix deployment wahala by yourself  
- ✅ Implement enterprise-grade monitoring and security
- ✅ Deploy production-ready apps with governance

### Certification and Recognition
- **Course Completion Badge**: Finish all 8 chapters with practical validation
- **Community Recognition**: Join Microsoft Foundry Discord actively
- **Professional Development**: Industry-relevant AZD and AI deployment skills
- **Career Advancement**: Enterprise-ready cloud deployment capabilities

## 🎓 Comprehensive Learning Outcomes

### Foundation Level (Chapters 1-2)
When you finish foundation chapters, you go fit show say you sabi:

**Technical Capabilities:**
- Deploy simple web apps to Azure using AZD commands
- Configure and deploy AI-powered chat apps with RAG capabilities
- Understand core AZD concepts: templates, environments, provisioning workflows
- Integrate Microsoft Foundry services with AZD deployments
- Navigate Azure AI service configurations and API endpoints

**Professional Skills:**
- Follow structured deployment workflows for better results
- Troubleshoot basic deployment wahala using logs and documentation
- Talk well about cloud deployment processes
- Use best practices for secure AI service integration

**Learning Verification:**
- ✅ Successfully deploy `todo-nodejs-mongo` template
- ✅ Deploy and configure `azure-search-openai-demo` with RAG
- ✅ Finish interactive workshop exercises (Discovery phase)
- ✅ Join Azure Discord community discussions

### Intermediate Level (Chapters 3-4)
When you finish intermediate chapters, you go fit show say you sabi:

**Technical Capabilities:**
- Manage multi-environment deployments (dev, staging, production)
- Create custom Bicep templates for infrastructure as code
- Implement secure authentication patterns with managed identity
- Deploy complex multi-service apps with custom configurations
- Optimize resource provisioning strategies for cost and performance

**Professional Skills:**
- Design scalable infrastructure architectures
- Use security best practices for cloud deployments
- Document infrastructure patterns for team collaboration
- Choose correct Azure services for requirements

**Learning Verification:**
- ✅ Configure separate environments with environment-specific settings
- ✅ Create and deploy custom Bicep template for multi-service app
- ✅ Implement managed identity authentication for secure access
- ✅ Finish configuration management exercises with real scenarios

### Advanced Level (Chapters 5-6)
When you finish advanced chapters, you go fit show say you sabi:

**Technical Capabilities:**
- Deploy and manage multi-agent AI solutions with workflows
- Implement Customer and Inventory agent architectures for retail scenarios
- Do capacity planning and resource validation
- Run automated pre-deployment validation and optimization
- Design cost-effective SKU selections based on workload requirements

**Professional Skills:**
- Architect complex AI solutions for production environments
- Lead technical discussions about AI deployment strategies
- Mentor junior developers in AZD and AI deployment best practices
- Recommend AI architecture patterns for business requirements

**Learning Verification:**
- ✅ Deploy complete retail multi-agent solution with ARM templates
- ✅ Show agent coordination and workflow orchestration
- ✅ Finish capacity planning exercises with real resource constraints
- ✅ Validate deployment readiness through automated pre-flight checks

### Expert Level (Chapters 7-8)
When you finish expert chapters, you go fit show say you sabi:

**Technical Capabilities:**
- Find and fix complex deployment wahala by yourself
- Use enterprise-grade security patterns and governance frameworks
- Design monitoring and alerting strategies
- Optimize production deployments for scale, cost, and performance
- Set up CI/CD pipelines with proper testing and validation

**Professional Skills:**
- Lead enterprise cloud transformation projects
- Design and use organizational deployment standards
- Train and mentor development teams in advanced AZD practices
- Influence technical decisions for enterprise AI deployments

**Learning Verification:**
- ✅ Fix complex multi-service deployment failures
- ✅ Use enterprise security patterns with compliance requirements
- ✅ Design and deploy production monitoring with Application Insights
- ✅ Finish enterprise governance framework implementation

## 🎯 Course Completion Certification

### Progress Tracking Framework
Track your learning progress with structured checkpoints:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Verification Process
After you finish each chapter, check your knowledge through:

1. **Practical Exercise Completion**: Deploy working solutions for each chapter
2. **Knowledge Assessment**: Check FAQ sections and finish self-assessments
3. **Community Engagement**: Share wetin you learn and get feedback for Azure Discord
4. **Portfolio Development**: Document your deployments and wetin you learn
5. **Peer Review**: Work with other learners on complex scenarios

### Course Completion Benefits
When you finish all chapters with verification, you go get:

**Technical Expertise:**
- **Production Experience**: Deploy real AI apps to Azure environments
- **Professional Skills**: Enterprise-ready deployment and troubleshooting capabilities  
- **Architecture Knowledge**: Multi-agent AI solutions and complex infrastructure patterns
- **Troubleshooting Mastery**: Fix deployment and configuration wahala by yourself

**Professional Development:**
- **Industry Recognition**: Skills wey dey high demand for AZD and AI deployment areas
- **Career Advancement**: Qualifications for cloud architect and AI deployment specialist roles
- **Community Leadership**: Join Azure developer and AI communities actively
- **Continuous Learning**: Foundation for advanced Microsoft Foundry specialization

**Portfolio Assets:**
- **Deployed Solutions**: Working examples of AI apps and infrastructure patterns
- **Documentation**: Full deployment guides and troubleshooting procedures  
- **Community Contributions**: Discussions, examples, and improvements wey you share with Azure community
- **Professional Network**: Connections with Azure experts and AI deployment practitioners

### Post-Course Learning Path
Graduates go ready for advanced specialization for:
- **Microsoft Foundry Expert**: Deep specialization for AI model deployment and orchestration
- **Cloud Architecture Leadership**: Enterprise-scale deployment design and governance
- **Developer Community Leadership**: Contribute to Azure samples and community resources
- **Corporate Training**: Teach AZD and AI deployment skills for organizations

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transleto service [Co-op Translator](https://github.com/Azure/co-op-translator) do di translation. Even though we dey try make am accurate, abeg sabi say machine translation fit get mistake or no dey correct well. Di original dokyument wey dey for im native language na di main source wey you go trust. For important information, e better make professional human translator check am. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->