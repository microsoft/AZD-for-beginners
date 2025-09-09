<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:06:04+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "bn"
}
-->
# স্টাডি গাইড - AZD নবাগতদের জন্য

## ভূমিকা

এই বিস্তৃত স্টাডি গাইডটি আপনাকে Azure Developer CLI (azd) শিখতে সাহায্য করার জন্য কাঠামোবদ্ধ শিক্ষার লক্ষ্য, মূল ধারণা, অনুশীলন এবং মূল্যায়ন উপকরণ প্রদান করে। এই গাইডটি ব্যবহার করে আপনার অগ্রগতি ট্র্যাক করুন এবং নিশ্চিত করুন যে আপনি সমস্ত গুরুত্বপূর্ণ বিষয়গুলি কভার করেছেন।

## শিক্ষার লক্ষ্য

এই স্টাডি গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure Developer CLI-এর মৌলিক এবং উন্নত ধারণাগুলি আয়ত্ত করবেন
- Azure অ্যাপ্লিকেশন ডিপ্লয় এবং পরিচালনা করার বাস্তব দক্ষতা অর্জন করবেন
- ডিপ্লয়মেন্ট সমস্যা সমাধান এবং অপ্টিমাইজেশনে আত্মবিশ্বাস তৈরি করবেন
- প্রোডাকশন-রেডি ডিপ্লয়মেন্ট পদ্ধতি এবং নিরাপত্তা বিবেচনা বুঝবেন

## শিক্ষার ফলাফল

এই স্টাডি গাইডের সমস্ত অংশ সম্পন্ন করার পরে আপনি সক্ষম হবেন:
- azd ব্যবহার করে সম্পূর্ণ অ্যাপ্লিকেশন আর্কিটেকচার ডিজাইন, ডিপ্লয় এবং পরিচালনা করতে
- পর্যবেক্ষণ, নিরাপত্তা এবং খরচ অপ্টিমাইজেশনের কৌশল বাস্তবায়ন করতে
- জটিল ডিপ্লয়মেন্ট সমস্যাগুলি স্বাধীনভাবে সমাধান করতে
- কাস্টম টেমপ্লেট তৈরি করতে এবং azd কমিউনিটিতে অবদান রাখতে

## কোর্সের কাঠামো

### মডিউল ১: শুরু করা (১-২ সপ্তাহ)

#### শিক্ষার লক্ষ্য
- Azure Developer CLI-এর মৌলিক বিষয় এবং মূল ধারণা বুঝুন
- আপনার ডেভেলপমেন্ট এনভায়রনমেন্টে azd সফলভাবে ইনস্টল এবং কনফিগার করুন
- একটি বিদ্যমান টেমপ্লেট ব্যবহার করে আপনার প্রথম ডিপ্লয়মেন্ট সম্পন্ন করুন
- azd প্রজেক্ট স্ট্রাকচার নেভিগেট করুন এবং মূল উপাদানগুলি বুঝুন

#### আয়ত্ত করার মূল ধারণা
- টেমপ্লেট, এনভায়রনমেন্ট এবং সার্ভিস
- azure.yaml কনফিগারেশন স্ট্রাকচার
- মৌলিক azd কমান্ড (init, up, down, deploy)
- কোড হিসেবে অবকাঠামোর নীতিমালা
- Azure প্রমাণীকরণ এবং অনুমোদন

#### অনুশীলন

**অনুশীলন ১.১: ইনস্টলেশন এবং সেটআপ**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**অনুশীলন ১.২: প্রথম ডিপ্লয়মেন্ট**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**অনুশীলন ১.৩: প্রজেক্ট স্ট্রাকচার বিশ্লেষণ**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### স্ব-মূল্যায়ন প্রশ্ন
1. azd আর্কিটেকচারের তিনটি মূল ধারণা কী কী?
2. azure.yaml ফাইলের উদ্দেশ্য কী?
3. বিভিন্ন ডিপ্লয়মেন্ট টার্গেট পরিচালনা করতে এনভায়রনমেন্ট কীভাবে সাহায্য করে?
4. azd-এর সাথে কোন প্রমাণীকরণ পদ্ধতি ব্যবহার করা যেতে পারে?
5. প্রথমবার `azd up` চালানোর সময় কী ঘটে?

### মডিউল ২: কনফিগারেশন এবং এনভায়রনমেন্ট (৩ সপ্তাহ)

#### শিক্ষার লক্ষ্য
- এনভায়রনমেন্ট ম্যানেজমেন্ট এবং কনফিগারেশন আয়ত্ত করুন
- উন্নত azure.yaml কনফিগারেশন বুঝুন
- এনভায়রনমেন্ট-নির্দিষ্ট সেটিংস এবং ভেরিয়েবল বাস্তবায়ন করুন
- বিভিন্ন পরিস্থিতির জন্য প্রমাণীকরণ কনফিগার করুন

#### আয়ত্ত করার মূল ধারণা
- এনভায়রনমেন্ট হায়ারার্কি এবং ভেরিয়েবল প্রিসিডেন্স
- সার্ভিস কনফিগারেশন এবং প্যারামিটার
- হুক এবং লাইফসাইকেল ইভেন্ট
- প্রমাণীকরণ পদ্ধতি (ইউজার, সার্ভিস প্রিন্সিপাল, ম্যানেজড আইডেন্টিটি)
- কনফিগারেশন ফাইল ম্যানেজমেন্ট

#### অনুশীলন

**অনুশীলন ২.১: মাল্টি-এনভায়রনমেন্ট সেটআপ**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**অনুশীলন ২.২: উন্নত কনফিগারেশন**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**অনুশীলন ২.৩: নিরাপত্তা কনফিগারেশন**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### স্ব-মূল্যায়ন প্রশ্ন
1. azd কীভাবে এনভায়রনমেন্ট ভেরিয়েবল প্রিসিডেন্স পরিচালনা করে?
2. ডিপ্লয়মেন্ট হুক কী এবং কখন এটি ব্যবহার করা উচিত?
3. বিভিন্ন এনভায়রনমেন্টের জন্য বিভিন্ন SKU কীভাবে কনফিগার করবেন?
4. বিভিন্ন প্রমাণীকরণ পদ্ধতির নিরাপত্তা প্রভাব কী?
5. গোপনীয় তথ্য এবং সংবেদনশীল কনফিগারেশন ডেটা কীভাবে পরিচালনা করবেন?

### মডিউল ৩: ডিপ্লয়মেন্ট এবং প্রভিশনিং (৪ সপ্তাহ)

#### শিক্ষার লক্ষ্য
- ডিপ্লয়মেন্ট ওয়ার্কফ্লো এবং সেরা পদ্ধতি আয়ত্ত করুন
- Bicep টেমপ্লেট ব্যবহার করে কোড হিসেবে অবকাঠামো বুঝুন
- জটিল মাল্টি-সার্ভিস আর্কিটেকচার বাস্তবায়ন করুন
- ডিপ্লয়মেন্ট পারফরম্যান্স এবং নির্ভরযোগ্যতা অপ্টিমাইজ করুন

#### আয়ত্ত করার মূল ধারণা
- Bicep টেমপ্লেট স্ট্রাকচার এবং মডিউল
- রিসোর্স নির্ভরতা এবং অর্ডারিং
- ডিপ্লয়মেন্ট কৌশল (ব্লু-গ্রিন, রোলিং আপডেট)
- মাল্টি-রিজিওন ডিপ্লয়মেন্ট
- ডাটাবেস মাইগ্রেশন এবং ডেটা ম্যানেজমেন্ট

#### অনুশীলন

**অনুশীলন ৩.১: কাস্টম অবকাঠামো**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**অনুশীলন ৩.২: মাল্টি-সার্ভিস অ্যাপ্লিকেশন**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**অনুশীলন ৩.৩: ডাটাবেস ইন্টিগ্রেশন**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### স্ব-মূল্যায়ন প্রশ্ন
1. ARM টেমপ্লেটের তুলনায় Bicep ব্যবহারের সুবিধা কী?
2. azd ডিপ্লয়মেন্টে ডাটাবেস মাইগ্রেশন কীভাবে পরিচালনা করবেন?
3. জিরো-ডাউনটাইম ডিপ্লয়মেন্টের জন্য কী কৌশল রয়েছে?
4. সার্ভিসগুলির মধ্যে নির্ভরতা কীভাবে পরিচালনা করবেন?
5. মাল্টি-রিজিওন ডিপ্লয়মেন্টের জন্য কী বিবেচনা করা উচিত?

### মডিউল ৪: প্রি-ডিপ্লয়মেন্ট ভ্যালিডেশন (৫ সপ্তাহ)

#### শিক্ষার লক্ষ্য
- বিস্তৃত প্রি-ডিপ্লয়মেন্ট চেক বাস্তবায়ন করুন
- সক্ষমতা পরিকল্পনা এবং রিসোর্স ভ্যালিডেশন আয়ত্ত করুন
- SKU নির্বাচন এবং খরচ অপ্টিমাইজেশন বুঝুন
- স্বয়ংক্রিয় ভ্যালিডেশন পাইপলাইন তৈরি করুন

#### আয়ত্ত করার মূল ধারণা
- Azure রিসোর্স কোটা এবং সীমা
- SKU নির্বাচন মানদণ্ড এবং খরচ প্রভাব
- স্বয়ংক্রিয় ভ্যালিডেশন স্ক্রিপ্ট এবং টুল
- সক্ষমতা পরিকল্পনার পদ্ধতি
- পারফরম্যান্স টেস্টিং এবং অপ্টিমাইজেশন

#### অনুশীলন

**অনুশীলন ৪.১: সক্ষমতা পরিকল্পনা**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**অনুশীলন ৪.২: প্রি-ফ্লাইট ভ্যালিডেশন**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**অনুশীলন ৪.৩: SKU অপ্টিমাইজেশন**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### স্ব-মূল্যায়ন প্রশ্ন
1. SKU নির্বাচন সিদ্ধান্তে কোন বিষয়গুলি প্রভাবিত করা উচিত?
2. ডিপ্লয়মেন্টের আগে Azure রিসোর্স উপলব্ধতা কীভাবে যাচাই করবেন?
3. প্রি-ফ্লাইট চেক সিস্টেমের মূল উপাদানগুলি কী?
4. ডিপ্লয়মেন্ট খরচ কীভাবে অনুমান এবং নিয়ন্ত্রণ করবেন?
5. সক্ষমতা পরিকল্পনার জন্য কোন পর্যবেক্ষণ অপরিহার্য?

### মডিউল ৫: সমস্যা সমাধান এবং ডিবাগিং (৬ সপ্তাহ)

#### শিক্ষার লক্ষ্য
- পদ্ধতিগত সমস্যা সমাধানের পদ্ধতি আয়ত্ত করুন
- জটিল ডিপ্লয়মেন্ট সমস্যাগুলি ডিবাগ করার দক্ষতা তৈরি করুন
- বিস্তৃত পর্যবেক্ষণ এবং সতর্কতা বাস্তবায়ন করুন
- ঘটনা প্রতিক্রিয়া এবং পুনরুদ্ধার পদ্ধতি তৈরি করুন

#### আয়ত্ত করার মূল ধারণা
- সাধারণ ডিপ্লয়মেন্ট ব্যর্থতার প্যাটার্ন
- লগ বিশ্লেষণ এবং সম্পর্ক প্রযুক্তি
- পারফরম্যান্স পর্যবেক্ষণ এবং অপ্টিমাইজেশন
- নিরাপত্তা ঘটনা সনাক্তকরণ এবং প্রতিক্রিয়া
- দুর্যোগ পুনরুদ্ধার এবং ব্যবসায়িক ধারাবাহিকতা

#### অনুশীলন

**অনুশীলন ৫.১: সমস্যা সমাধানের পরিস্থিতি**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**অনুশীলন ৫.২: পর্যবেক্ষণ বাস্তবায়ন**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**অনুশীলন ৫.৩: ঘটনা প্রতিক্রিয়া**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### স্ব-মূল্যায়ন প্রশ্ন
1. azd ডিপ্লয়মেন্ট সমস্যাগুলি সমাধানের পদ্ধতিগত পদ্ধতি কী?
2. একাধিক সার্ভিস এবং রিসোর্সের মধ্যে লগ কীভাবে সম্পর্ক করবেন?
3. প্রাথমিক সমস্যা সনাক্তকরণের জন্য কোন পর্যবেক্ষণ মেট্রিক সবচেয়ে গুরুত্বপূর্ণ?
4. কার্যকর দুর্যোগ পুনরুদ্ধার পদ্ধতি কীভাবে বাস্তবায়ন করবেন?
5. একটি ঘটনা প্রতিক্রিয়া পরিকল্পনার মূল উপাদানগুলি কী?

### মডিউল ৬: উন্নত বিষয় এবং সেরা পদ্ধতি (৭-৮ সপ্তাহ)

#### শিক্ষার লক্ষ্য
- এন্টারপ্রাইজ-গ্রেড ডিপ্লয়মেন্ট প্যাটার্ন বাস্তবায়ন করুন
- CI/CD ইন্টিগ্রেশন এবং অটোমেশন আয়ত্ত করুন
- কাস্টম টেমপ্লেট তৈরি করুন এবং কমিউনিটিতে অবদান রাখুন
- উন্নত নিরাপত্তা এবং সম্মতি প্রয়োজনীয়তা বুঝুন

#### আয়ত্ত করার মূল ধারণা
- CI/CD পাইপলাইন ইন্টিগ্রেশন প্যাটার্ন
- কাস্টম টেমপ্লেট ডেভেলপমেন্ট এবং বিতরণ
- এন্টারপ্রাইজ গভর্নেন্স এবং সম্মতি
- উন্নত নেটওয়ার্কিং এবং নিরাপত্তা কনফিগারেশন
- পারফরম্যান্স অপ্টিমাইজেশন এবং খরচ ব্যবস্থাপনা

#### অনুশীলন

**অনুশীলন ৬.১: CI/CD ইন্টিগ্রেশন**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**অনুশীলন ৬.২: কাস্টম টেমপ্লেট ডেভেলপমেন্ট**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**অনুশীলন ৬.৩: এন্টারপ্রাইজ বাস্তবায়ন**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### স্ব-মূল্যায়ন প্রশ্ন
1. azd বিদ্যমান CI/CD ওয়ার্কফ্লোতে কীভাবে ইন্টিগ্রেট করবেন?
2. কাস্টম টেমপ্লেট ডেভেলপমেন্টের জন্য কী বিবেচনা করা উচিত?
3. azd ডিপ্লয়মেন্টে গভর্নেন্স এবং সম্মতি কীভাবে বাস্তবায়ন করবেন?
4. এন্টারপ্রাইজ-স্কেল ডিপ্লয়মেন্টের জন্য সেরা পদ্ধতি কী?
5. azd কমিউনিটিতে কার্যকরভাবে কীভাবে অবদান রাখবেন?
3. **ওপেন সোর্সে অবদান রাখুন**: আপনার টেমপ্লেট এবং সমাধানগুলো কমিউনিটির সাথে শেয়ার করুন  
4. **অন্যদের শেখান**: অন্যদের কাছে ধারণাগুলো ব্যাখ্যা করলে আপনার নিজের বোঝাপড়া আরও দৃঢ় হয়  
5. **কৌতূহলী থাকুন**: নতুন Azure পরিষেবা এবং ইন্টিগ্রেশন প্যাটার্নগুলো নিয়মিতভাবে অন্বেষণ করুন  

---

**নেভিগেশন**  
- **পূর্ববর্তী পাঠ**: [FAQ](faq.md)  
- **পরবর্তী পাঠ**: [Changelog](../changelog.md)  

**অধ্যয়নের অগ্রগতি ট্র্যাকিং**: এই গাইডটি ব্যবহার করে আপনার শেখার যাত্রা ট্র্যাক করুন এবং Azure Developer CLI-এর সমস্ত ধারণা ও অনুশীলনের ব্যাপক কাভারেজ নিশ্চিত করুন।  

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা তার জন্য দায়ী থাকব না।