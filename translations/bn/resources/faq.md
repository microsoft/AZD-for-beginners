# প্রায়শই জিজ্ঞাসিত প্রশ্নাবলী (FAQ)

**অধ্যায় অনুযায়ী সহায়তা পান**
- **📚 কোর্স হোম**: [AZD শুরুকারীদের জন্য](../README.md)
- **🚆 ইনস্টলেশন সমস্যা**: [Chapter 1: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 এআই সম্পর্কিত প্রশ্ন**: [Chapter 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 সমস্যা সমাধান**: [Chapter 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## ভূমিকা

এই বিস্তৃত FAQ Azure Developer CLI (azd) এবং Azure ডেপ্লয়মেন্ট সংক্রান্ত সবচেয়ে সাধারণ প্রশ্নগুলোর উত্তর প্রদান করে। সাধারণ সমস্যার দ্রুত সমাধান, সেরা অনুশীলন বোঝা, এবং azd ধারণা ও ওয়ার্কফ্লোর সম্পর্কিত ক্ল্যারিফিকেশন পেতে এখানে দেখুন।

## শেখার লক্ষ্য

এই FAQ পর্যালোচনা করে আপনি:
- Azure Developer CLI সম্পর্কিত সাধারণ প্রশ্ন ও সমস্যার দ্রুত উত্তর পাবেন
- ব্যবহারিক প্রশ্নোত্তর মাধ্যমে মূল ধারণা ও পরিভাষা বুঝতে পারবেন
- প্রায়ই হওয়া সমস্যা ও ত্রুটি পরিস্থিতির জন্য ট্রাবলশুটিং সমাধান জানতে পারবেন
- অপটিমাইজেশন সম্পর্কিত সাধারণ প্রশ্নের মাধ্যমে সেরা অনুশীলন শিখবেন
- এক্সপার্ট-স্তরের প্রশ্নের মাধ্যমে উন্নত ফিচার ও সক্ষমতা আবিষ্কার করবেন
- খরচ, সিকিউরিটি, ও ডেপ্লয়মেন্ট কৌশল সম্পর্কিত নির্দেশিকা দ্রুত রেফারেন্স করবেন

## শেখার ফলাফল

নিয়মিত এই FAQ রেফার করে আপনি সক্ষম হবেন:
- প্রদত্ত সমাধান ব্যবহার করে স্বতন্ত্রভাবে সাধারণ Azure Developer CLI সমস্যাগুলো সমাধান করতে
- ডেপ্লয়মেন্ট কৌশল ও কনফিগারেশন সম্পর্কে তথ্যভিত্তিক সিদ্ধান্ত নিতে
- azd এবং অন্যান্য Azure টুল ও সার্ভিসগুলোর মধ্যে সম্পর্ক বুঝতে
- কমিউনিটি অভিজ্ঞতা এবং এক্সপার্ট সুপারিশের ভিত্তিতে সেরা অনুশীলন প্রয়োগ করতে
- অথেনটিকেশন, ডেপ্লয়মেন্ট, ও কনফিগারেশন সমস্যা কার্যকরভাবে ট্রাবলশুট করতে
- FAQ ইনসাইট ও সুপারিশ ব্যবহার করে খরচ ও পারফরম্যান্স অপ্টিমাইজ করতে

## সূচিপত্র

- [শুরু করা](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## শুরু করা

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) হল একটি ডেভেলপার-কেন্দ্রিক কমান্ড-লাইন টুল যা আপনার অ্যাপ্লিকেশনকে লোকাল ডেভেলপমেন্ট পরিবেশ থেকে Azure-এ নিয়ে যাওয়ার সময় দ্রুত করে। এটি টেমপ্লেটের মাধ্যমে সেরা অনুশীলন প্রদান করে এবং পুরো ডেপ্লয়মেন্ট লাইফসাইকেলকে সহজ করে।

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Azure রিসোর্স ম্যানেজ করার জন্য সাধারণ-উদ্দেশ্য টুল
- **azd**: অ্যাপ্লিকেশন ডেপ্লয়মেন্ট ওয়ার্কফ্লোসমূহের জন্য ডেভেলপার-ফোকাসড টুল
- azd অভ্যন্তরীণভাবে Azure CLI ব্যবহার করে কিন্তু সাধারণ ডেভেলপমেন্ট সিনারিওগুলোর জন্য উচ্চ-স্তরের বিমূর্ততা প্রদান করে
- azd টেমপ্লেট, পরিবেশ ব্যবস্থাপনা, এবং ডেপ্লয়মেন্ট অটোমেশন অন্তর্ভুক্ত করে

### Q: Do I need Azure CLI installed to use azd?
**A**: Yes, azd অথেনটিকেশন এবং কিছু অপারেশনের জন্য Azure CLI চাই। প্রথমে Azure CLI ইন্সটল করুন, তারপর azd ইন্সটল করুন।

### Q: What programming languages does azd support?
**A**: azd ভাষা-নিরপেক্ষ। এটি কাজ করে:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: Can I use azd with existing projects?
**A**: Yes! আপনি বা:
1. Use `azd init` to add azd configuration to existing projects
2. Adapt existing projects to match azd template structure
3. Create custom templates based on your existing architecture

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Use `azd auth login` যা Azure অথেনটিকেশনের জন্য একটি ব্রাউজার উইন্ডো খুলবে। CI/CD পরিস্থিতিতে service principals বা managed identities ব্যবহার করুন।

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Yes. Use `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` প্রতিটি পরিবেশের জন্য কোন সাবস্ক্রিপশন ব্যবহার করতে হবে সেট করতে।

### Q: What permissions do I need to deploy with azd?
**A**: সাধারণত আপনার প্রয়োজন:
- **Contributor** ভূমিকা রিসোর্স গ্রুপ বা সাবস্ক্রিপশনে
- যদি রোল অ্যাসাইনমেন্ট দরকার হয় তাহলে **User Access Administrator**
- নির্দিষ্ট অনুমতিগুলো টেমপ্লেট ও ডেপ্লয় করা রিসোর্স অনুযায়ী ভিন্ন হতে পারে

### Q: Can I use azd in CI/CD pipelines?
**A**: Absolutely! azd CI/CD ইন্টিগ্রেশনের জন্য ডিজাইন করা। অথেনটিকেশনের জন্য service principals ব্যবহার করুন এবং কনফিগারেশনের জন্য এনভায়রনমেন্ট ভেরিয়েবল সেট করুন।

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
**A**: azd Bicep/ARM টেমপ্লেটের মাধ্যমে যে কোনো Azure সার্ভিস ডেপ্লয় করতে পারে, যার মধ্যে রয়েছে:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, and monitoring resources

### Q: Can I deploy to multiple regions?
**A**: Yes, আপনার Bicep টেমপ্লেটে একাধিক রিজিয়ন কনফিগার করুন এবং প্রতিটি পরিবেশের জন্য location প্যারামিটারটি সঠিকভাবে সেট করুন।

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
**A**: এটি জটিল এবং সরাসরি সমর্থিত নয়। আপনি করতে পারেন:
1. বিদ্যমান রিসোর্সগুলোকে আপনার Bicep টেমপ্লেটে ইমপোর্ট করুন
2. টেমপ্লেটে বিদ্যমান রিসোর্স রেফারেন্স ব্যবহার করুন
3. রিসোর্স গুলো শর্তসাপেক্ষে তৈরী বা রেফারেন্স করার জন্য টেমপ্লেট পরিবর্তন করুন

### Q: Can I use Terraform instead of Bicep?
**A**: বর্তমানে, azd প্রধানত Bicep/ARM টেমপ্লেটকে সমর্থন করে। Terraform সমর্থন আনুষ্ঠানিকভাবে উপলব্ধ নয়, যদিও কমিউনিটি সমাধান থাকতে পারে।

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: `azd env new <environment-name>` ব্যবহার করে আলাদা পরিবেশ তৈরি করুন এবং প্রতিটির জন্য ভিন্ন সেটিংস কনফিগার করুন:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: আপনার প্রকল্প ডিরেক্টরির `.azure` ফোল্ডারে। প্রতিটি পরিবেশের নিজস্ব ফোল্ডার ও কনফিগারেশন ফাইল থাকে।

### Q: How do I set environment-specific configuration?
**A**: `azd env set` ব্যবহার করে এনভায়রনমেন্ট ভেরিয়েবল কনফিগার করুন:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: `.azure` ফোল্ডারে সংবেদনশীল তথ্য থাকে এবং এটাকে ভার্সন কন্ট্রোলে কমিট করা উচিত নয়। বরং:
1. প্রয়োজনীয় এনভায়রনমেন্ট ভেরিয়েবলগুলো ডকুমেন্ট করুন
2. এনভায়রনমেন্ট সেটআপ করার জন্য ডেপ্লয়মেন্ট স্ক্রিপ্ট ব্যবহার করুন
3. সংবেদনশীল কনফিগারের জন্য Azure Key Vault ব্যবহার করুন

### Q: How do I override template defaults?
**A**: টেমপ্লেট প্যারামিটারগুলোর সাথে সামঞ্জস্যপূর্ণ এনভায়রনমেন্ট ভেরিয়েবল সেট করুন:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: সাধারণ কারণগুলো:
1. **Authentication issues**: Run `azd auth login`
2. **Insufficient permissions**: Check your Azure role assignments
3. **Resource naming conflicts**: Change AZURE_ENV_NAME
4. **Quota/capacity issues**: Check regional availability
5. **Template errors**: Validate Bicep templates

### Q: How do I debug deployment failures?
**A**: 
1. Use `azd deploy --debug` for verbose output
2. Check Azure portal deployment history
3. Review Activity Log in Azure portal
4. Use `azd show` to display current environment state

### Q: Why are my environment variables not working?
**A**: পরীক্ষা করুন:
1. ভেরিয়েবল নামগুলো টেমপ্লেট প্যারামিটারের সাথে সঠিকভাবে মেলে কি না
2. যদি ভ্যালুতে স্পেস থাকে তবে সেগুলো ঠিকভাবে কোট করা আছে কি না
3. পরিবেশ সিলেক্ট করা আছে: `azd env select <environment>`
4. ভেরিয়েবলগুলো সঠিক পরিবেশে সেট করা হয়েছে কি না

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
এটি সমস্ত রিসোর্স এবং পরিবেশ কনফিগারেশন মুছে দেয়।

### Q: Why is my application not accessible after deployment?
**A**: পরীক্ষা করুন:
1. ডেপ্লয়মেন্ট সফলভাবে সম্পন্ন হয়েছে কি না
2. অ্যাপ্লিকেশন চলছে কি না (Azure পোর্টালে লগগুলো চেক করুন)
3. নেটওয়ার্ক সিকিউরিটি গ্রুপ ট্রাফিক অনুমোদন করে কি না
4. DNS/কাস্টম ডোমেইন সঠিকভাবে কনফিগার করা আছে কি না

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: খরচ নির্ভর করে:
- ডেপ্লয় করা Azure সার্ভিসগুলোর উপর
- নির্বাচিত সার্ভিস টিয়ার/SKU গুলোর উপর
- রিজিয়নভিত্তিক মূল্যের পার্থক্যের উপর
- ব্যবহার প্যাটার্নের উপর

প্রাক্কলনের জন্য [Azure মূল্য নির্ধারণ ক্যালকুলেটর](https://azure.microsoft.com/pricing/calculator/) ব্যবহার করুন।

### Q: How do I control costs in azd deployments?
**A**: 
1. উন্নয়ন পরিবেশগুলোর জন্য নিম্ন-টিয়ার SKU ব্যবহার করুন
2. Azure বাজেট এবং অ্যালার্ট সেট করুন
3. ব্যবহার না করার সময় `azd down` ব্যবহার করে রিসোর্স সরিয়ে দিন
4. উপযুক্ত রিজিয়ন বেছে নিন (মূল্য অবস্থানের উপর নির্ভর করে)
5. Azure Cost Management টুল ব্যবহার করুন

### Q: Are there free tier options for azd templates?
**A**: অনেক Azure সার্ভিস ফ্রি টিয়ার অফার করে:
- App Service: Free tier available
- Azure Functions: 1M free executions/month
- Cosmos DB: Free tier with 400 RU/s
- Application Insights: First 5GB/month free

প্রযোজ্য স্থানে টেমপ্লেটগুলোকে ফ্রি টিয়ার ব্যবহার করার জন্য কনফিগার করুন।

### Q: How do I estimate costs before deployment?
**A**: 
1. টেমপ্লেটের `main.bicep` রিভিউ করে দেখুন কোন রিসোর্সগুলো তৈরি হচ্ছে
2. নির্দিষ্ট SKU ব্যবহার করে Azure মূল্য নির্ধারণ ক্যালকুলেটর ব্যবহার করুন
3. প্রথমে একটি ডেভেলপমেন্ট এনভায়রনমেন্টে ডেপ্লয় করে বাস্তব খরচ মনিটর করুন
4. বিস্তারিত খরচ বিশ্লেষণের জন্য Azure Cost Management ব্যবহার করুন

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. অ্যাপ্লিকেশন কোড এবং ইনফ্রাস্ট্রাকচার আলাদা রাখুন
2. `azure.yaml`-এ অর্থবহ সার্ভিস নাম ব্যবহার করুন
3. বিল্ড স্ক্রিপ্টে সঠিক এরর হ্যান্ডলিং বাস্তবায়ন করুন
4. এনভায়রনমেন্ট-নির্দিষ্ট কনফিগারেশন ব্যবহার করুন
5. বিস্তৃত ডকুমেন্টেশন অন্তর্ভুক্ত করুন

### Q: How should I organize multiple services in azd?
**A**: সুপারিশকৃত স্ট্রাকচার ব্যবহার করুন:
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
**A**: **না!** `.azure` ফোল্ডারে সংবেদনশীল তথ্য থাকে। এটিকে `.gitignore`-এ যোগ করুন:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. গোপন তথ্যের জন্য Azure Key Vault ব্যবহার করুন
2. অ্যাপ্লিকেশন কনফিগারেশনে Key Vault সিক্রেট রেফারেন্স করুন
3. কখনোই সিক্রেটগুলো ভার্সন কন্ট্রোলে কমিট করবেন না
4. সার্ভিস-টু-সার্ভিস অথেনটিকেশনের জন্য managed identities ব্যবহার করুন

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. প্রতিটি স্টেজের জন্য আলাদা পরিবেশ ব্যবহার করুন (dev/staging/prod)
2. ডেপ্লয়মেন্টের আগে স্বয়ংক্রিয় টেস্টিং বাস্তবায়ন করুন
3. অথেনটিকেশনের জন্য service principals ব্যবহার করুন
4. পাইপলাইনের সিক্রেটস/ভেরিয়েবলগুলোতে সংবেদনশীল কনফিগারেশন সংরক্ষণ করুন
5. প্রোডাকশনের ডেপ্লয়মেন্টের জন্য অনুমোদন গেট বাস্তবায়ন করুন

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Yes, `azure.yaml`-এ ডেপ্লয়মেন্ট হুক ব্যবহার করে:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. উপস্থিত পাইপলাইন স্ক্রিপ্টে azd কমান্ড ব্যবহার করুন
2. টিমগুলোর মধ্যে azd টেমপ্লেট স্ট্যান্ডার্ডাইজ করুন
3. বিদ্যমান মনিটরিং ও অ্যালার্টিং-এর সাথে ইন্টিগ্রেট করুন
4. পাইপলাইন ইন্টিগ্রেশনের জন্য azd এর JSON আউটপুট ব্যবহার করুন

### Q: Can I use azd with Azure DevOps?
**A**: Yes, azd যেকোনো CI/CD সিস্টেমের সাথে কাজ করে। azd কমান্ড ব্যবহার করে Azure DevOps পাইপলাইন তৈরি করুন।

### Q: How do I contribute to azd or create community templates?
**A**: **A**:
1. **azd টুল**: [Azure/azure-dev](https://github.com/Azure/azure-dev)-এ অবদান করুন
2. **টেমপ্লেটস**: টেমপ্লেট তৈরি করুন [টেমপ্লেট নির্দেশিকা](https://github.com/Azure-Samples/awesome-azd) অনুসারে
3. **ডকুমেন্টেশন**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)-এ ডকুমেন্টেশনে অবদান রাখুন

### Q: azd-এর রোডম্যাপ কী?
**A**: পরিকল্পিত ফিচার ও উন্নতির জন্য [অফিশিয়াল রোডম্যাপ](https://github.com/Azure/azure-dev/projects) দেখুন।

### Q: আমি কীভাবে অন্যান্য ডিপ্লয়মেন্ট টুলগুলো থেকে azd-এ মাইগ্রেট করব?
**A**: 
1. বর্তমান ডিপ্লয়মেন্ট আর্কিটেকচার বিশ্লেষণ করুন
2. সমতুল্য Bicep টেমপ্লেট তৈরি করুন
3. বর্তমান সার্ভিসগুলোর সাথে মেলে এমনভাবে `azure.yaml` কনফিগার করুন
4. ডেভেলপমেন্ট এনভায়রনমেন্টে সম্পূর্ণভাবে পরীক্ষা করুন
5. ধীরে ধীরে পরিবেশগুলো মাইগ্রেট করুন

---

## এখনও প্রশ্ন আছে?

### **প্রথমে অনুসন্ধান করুন**
- [অফিশিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) দেখুন
- একইরকম সমস্যার জন্য [GitHub issues](https://github.com/Azure/azure-dev/issues) অনুসন্ধান করুন

### **সহায়তা নিন**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - কমিউনিটি সমর্থন
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - প্রযুক্তিগত প্রশ্ন
- [Azure Discord](https://discord.gg/azure) - তাত্ক্ষণিক কমিউনিটি চ্যাট

### **সমস্যা রিপোর্ট করুন**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - বাগ রিপোর্ট এবং ফিচার অনুরোধ
- প্রাসঙ্গিক লগ, ত্রুটির বার্তা, এবং পুনরাবৃত্তি করার ধাপগুলো অন্তর্ভুক্ত করুন

### **আরও জানুন**
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure আর্কিটেকচার সেন্টার](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ওয়েল-আর্কিটেক্টেড ফ্রেমওয়ার্ক](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*এই FAQ নিয়মিতভাবে আপডেট করা হয়। সর্বশেষ আপডেট: 9 সেপ্টেম্বর, 2025*

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [শব্দকোষ](glossary.md)
- **পরবর্তী পাঠ**: [অধ্যয়ন গাইড](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা বজায় রাখার চেষ্টা করি; তবুও অনুগ্রহ করে মনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসম্পূর্ণতা থাকতে পারে। মূল নথিটিকে তার প্রাকৃতিক ভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ন তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->