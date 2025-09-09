<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:07:22+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "mr"
}
-->
# अभ्यास मार्गदर्शक - AZD नवशिक्यांसाठी

## परिचय

ही व्यापक अभ्यास मार्गदर्शिका Azure Developer CLI (azd) मध्ये प्रवीणता मिळवण्यासाठी संरचित शिक्षण उद्दिष्टे, महत्त्वाचे संकल्पना, सराव व्यायाम आणि मूल्यमापन साहित्य प्रदान करते. तुमच्या प्रगतीचा मागोवा ठेवण्यासाठी आणि सर्व आवश्यक विषय कव्हर केल्याची खात्री करण्यासाठी या मार्गदर्शिकेचा वापर करा.

## शिक्षण उद्दिष्टे

ही अभ्यास मार्गदर्शिका पूर्ण करून, तुम्ही:
- Azure Developer CLI च्या मूलभूत आणि प्रगत संकल्पनांमध्ये प्रवीण व्हाल
- Azure अनुप्रयोग तैनात आणि व्यवस्थापित करण्यासाठी व्यावहारिक कौशल्ये विकसित कराल
- तैनातीचे समस्या सोडवणे आणि अनुकूलित करण्याचा आत्मविश्वास निर्माण कराल
- उत्पादन-तयार तैनाती पद्धती आणि सुरक्षा विचार समजून घ्याल

## शिक्षण परिणाम

सर्व विभाग पूर्ण केल्यानंतर, तुम्ही:
- azd वापरून संपूर्ण अनुप्रयोग आर्किटेक्चर डिझाइन, तैनात आणि व्यवस्थापित करू शकाल
- व्यापक मॉनिटरिंग, सुरक्षा आणि खर्च अनुकूलन धोरणे अंमलात आणू शकाल
- जटिल तैनाती समस्या स्वतंत्रपणे सोडवू शकाल
- सानुकूल टेम्पलेट तयार करू शकाल आणि azd समुदायात योगदान देऊ शकाल

## अभ्यासक्रम संरचना

### मॉड्यूल 1: सुरुवात करणे (आठवडे 1-2)

#### शिक्षण उद्दिष्टे
- Azure Developer CLI च्या मूलभूत गोष्टी आणि मुख्य संकल्पना समजून घ्या
- तुमच्या विकास वातावरणावर azd यशस्वीरित्या स्थापित आणि कॉन्फिगर करा
- विद्यमान टेम्पलेट वापरून तुमची पहिली तैनाती पूर्ण करा
- azd प्रकल्प संरचनेतून नेव्हिगेट करा आणि मुख्य घटक समजून घ्या

#### मास्टर करण्यासाठी महत्त्वाचे संकल्पना
- टेम्पलेट्स, वातावरण आणि सेवा
- azure.yaml कॉन्फिगरेशन संरचना
- मूलभूत azd आदेश (init, up, down, deploy)
- कोड म्हणून पायाभूत सुविधा तत्त्वे
- Azure प्रमाणीकरण आणि अधिकृतता

#### सराव व्यायाम

**व्यायाम 1.1: स्थापना आणि सेटअप**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**व्यायाम 1.2: पहिली तैनाती**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**व्यायाम 1.3: प्रकल्प संरचना विश्लेषण**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### स्व-मूल्यमापन प्रश्न
1. azd आर्किटेक्चरचे तीन मुख्य संकल्पना कोणत्या आहेत?
2. azure.yaml फाइलचा उद्देश काय आहे?
3. वेगवेगळ्या तैनाती लक्ष्य व्यवस्थापित करण्यात वातावरण कसे मदत करते?
4. azd सह कोणत्या प्रमाणीकरण पद्धती वापरल्या जाऊ शकतात?
5. तुम्ही प्रथमच `azd up` चालवता तेव्हा काय होते?

### मॉड्यूल 2: कॉन्फिगरेशन आणि वातावरण (आठवडा 3)

#### शिक्षण उद्दिष्टे
- वातावरण व्यवस्थापन आणि कॉन्फिगरेशनमध्ये प्रवीण व्हा
- प्रगत azure.yaml कॉन्फिगरेशन समजून घ्या
- वातावरण-विशिष्ट सेटिंग्ज आणि व्हेरिएबल्स अंमलात आणा
- वेगवेगळ्या परिस्थितींसाठी प्रमाणीकरण कॉन्फिगर करा

#### मास्टर करण्यासाठी महत्त्वाचे संकल्पना
- वातावरण श्रेणी आणि व्हेरिएबल प्राधान्य
- सेवा कॉन्फिगरेशन आणि पॅरामीटर्स
- हुक्स आणि जीवनचक्र घटना
- प्रमाणीकरण पद्धती (वापरकर्ता, सेवा प्रिन्सिपल, व्यवस्थापित ओळख)
- कॉन्फिगरेशन फाइल व्यवस्थापन

#### सराव व्यायाम

**व्यायाम 2.1: मल्टी-वातावरण सेटअप**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**व्यायाम 2.2: प्रगत कॉन्फिगरेशन**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**व्यायाम 2.3: सुरक्षा कॉन्फिगरेशन**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### स्व-मूल्यमापन प्रश्न
1. azd वातावरण व्हेरिएबल प्राधान्य कसे हाताळते?
2. तैनाती हुक्स म्हणजे काय आणि तुम्ही त्यांचा वापर कधी करावा?
3. वेगवेगळ्या वातावरणांसाठी वेगवेगळ्या SKUs कसे कॉन्फिगर करता येतील?
4. वेगवेगळ्या प्रमाणीकरण पद्धतींच्या सुरक्षा परिणाम काय आहेत?
5. गुपिते आणि संवेदनशील कॉन्फिगरेशन डेटा कसा व्यवस्थापित कराल?

### मॉड्यूल 3: तैनाती आणि तरतूद (आठवडा 4)

#### शिक्षण उद्दिष्टे
- तैनाती कार्यप्रवाह आणि सर्वोत्तम पद्धतींमध्ये प्रवीण व्हा
- Bicep टेम्पलेट्ससह कोड म्हणून पायाभूत सुविधा समजून घ्या
- जटिल मल्टी-सर्व्हिस आर्किटेक्चर अंमलात आणा
- तैनाती कार्यक्षमता आणि विश्वासार्हता अनुकूलित करा

#### मास्टर करण्यासाठी महत्त्वाचे संकल्पना
- Bicep टेम्पलेट संरचना आणि मॉड्यूल्स
- संसाधन अवलंबित्व आणि क्रम
- तैनाती धोरणे (ब्लू-ग्रीन, रोलिंग अपडेट्स)
- मल्टी-प्रदेश तैनाती
- डेटाबेस स्थलांतर आणि डेटा व्यवस्थापन

#### सराव व्यायाम

**व्यायाम 3.1: सानुकूल पायाभूत सुविधा**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**व्यायाम 3.2: मल्टी-सर्व्हिस अनुप्रयोग**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**व्यायाम 3.3: डेटाबेस एकत्रीकरण**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### स्व-मूल्यमापन प्रश्न
1. ARM टेम्पलेट्सवर Bicep वापरण्याचे फायदे काय आहेत?
2. azd तैनातींमध्ये डेटाबेस स्थलांतर कसे हाताळता येईल?
3. शून्य-डाउनटाइम तैनातीसाठी कोणती धोरणे आहेत?
4. सेवांमधील अवलंबित्व कसे व्यवस्थापित करता येईल?
5. मल्टी-प्रदेश तैनातीसाठी विचार काय आहेत?

### मॉड्यूल 4: तैनातीपूर्व सत्यापन (आठवडा 5)

#### शिक्षण उद्दिष्टे
- व्यापक तैनातीपूर्व तपासणी अंमलात आणा
- क्षमता नियोजन आणि संसाधन सत्यापनात प्रवीण व्हा
- SKU निवड आणि खर्च अनुकूलन समजून घ्या
- स्वयंचलित सत्यापन पाइपलाइन तयार करा

#### मास्टर करण्यासाठी महत्त्वाचे संकल्पना
- Azure संसाधन कोटा आणि मर्यादा
- SKU निवड निकष आणि खर्च परिणाम
- स्वयंचलित सत्यापन स्क्रिप्ट आणि साधने
- क्षमता नियोजन पद्धती
- कार्यक्षमता चाचणी आणि अनुकूलन

#### सराव व्यायाम

**व्यायाम 4.1: क्षमता नियोजन**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**व्यायाम 4.2: प्री-फ्लाइट सत्यापन**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**व्यायाम 4.3: SKU ऑप्टिमायझेशन**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### स्व-मूल्यमापन प्रश्न
1. SKU निवड निर्णयांवर कोणते घटक प्रभाव टाकतात?
2. तैनातीपूर्व Azure संसाधन उपलब्धता कशी सत्यापित कराल?
3. प्री-फ्लाइट चेक सिस्टमचे मुख्य घटक कोणते आहेत?
4. तैनाती खर्च कसे अंदाज आणि नियंत्रित कराल?
5. क्षमता नियोजनासाठी कोणते मॉनिटरिंग आवश्यक आहे?

### मॉड्यूल 5: समस्या सोडवणे आणि डीबगिंग (आठवडा 6)

#### शिक्षण उद्दिष्टे
- प्रणालीबद्ध समस्या सोडवण्याच्या पद्धतींमध्ये प्रवीण व्हा
- जटिल तैनाती समस्यांचे डीबगिंग कौशल्य विकसित करा
- व्यापक मॉनिटरिंग आणि अलर्टिंग अंमलात आणा
- घटना प्रतिसाद आणि पुनर्प्राप्ती प्रक्रिया तयार करा

#### मास्टर करण्यासाठी महत्त्वाचे संकल्पना
- सामान्य तैनाती अपयश नमुने
- लॉग विश्लेषण आणि सहसंबंध तंत्र
- कार्यक्षमता मॉनिटरिंग आणि ऑप्टिमायझेशन
- सुरक्षा घटना शोध आणि प्रतिसाद
- आपत्ती पुनर्प्राप्ती आणि व्यवसाय सातत्य

#### सराव व्यायाम

**व्यायाम 5.1: समस्या सोडवण्याचे परिदृश्य**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**व्यायाम 5.2: मॉनिटरिंग अंमलबजावणी**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**व्यायाम 5.3: घटना प्रतिसाद**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### स्व-मूल्यमापन प्रश्न
1. azd तैनाती समस्या सोडवण्यासाठी प्रणालीबद्ध दृष्टिकोन काय आहे?
2. अनेक सेवा आणि संसाधनांमध्ये लॉग कसे सहसंबंधित कराल?
3. लवकर समस्या शोधण्यासाठी सर्वात महत्त्वाचे मॉनिटरिंग मेट्रिक्स कोणते आहेत?
4. प्रभावी आपत्ती पुनर्प्राप्ती प्रक्रिया कशी अंमलात आणाल?
5. घटना प्रतिसाद योजनेचे मुख्य घटक कोणते आहेत?

### मॉड्यूल 6: प्रगत विषय आणि सर्वोत्तम पद्धती (आठवडे 7-8)

#### शिक्षण उद्दिष्टे
- एंटरप्राइझ-ग्रेड तैनाती नमुने अंमलात आणा
- CI/CD एकत्रीकरण आणि स्वयंचलनात प्रवीण व्हा
- सानुकूल टेम्पलेट तयार करा आणि समुदायात योगदान द्या
- प्रगत सुरक्षा आणि अनुपालन आवश्यकता समजून घ्या

#### मास्टर करण्यासाठी महत्त्वाचे संकल्पना
- CI/CD पाइपलाइन एकत्रीकरण नमुने
- सानुकूल टेम्पलेट विकास आणि वितरण
- एंटरप्राइझ गव्हर्नन्स आणि अनुपालन
- प्रगत नेटवर्किंग आणि सुरक्षा कॉन्फिगरेशन
- कार्यक्षमता ऑप्टिमायझेशन आणि खर्च व्यवस्थापन

#### सराव व्यायाम

**व्यायाम 6.1: CI/CD एकत्रीकरण**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**व्यायाम 6.2: सानुकूल टेम्पलेट विकास**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**व्यायाम 6.3: एंटरप्राइझ अंमलबजावणी**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### स्व-मूल्यमापन प्रश्न
1. azd विद्यमान CI/CD कार्यप्रवाहांमध्ये कसे एकत्रित करता येईल?
2. सानुकूल टेम्पलेट विकासासाठी महत्त्वाचे विचार काय आहेत?
3. azd तैनातींमध्ये गव्हर्नन्स आणि अनुपालन कसे अंमलात आणता येईल?
4. एंटरप्राइझ-स्केल तैनातीसाठी सर्वोत्तम पद्धती कोणत्या आहेत?
5. azd समुदायात प्रभावीपणे कसे योगदान देता येईल?

## व्यावहारिक प्रकल्प

### प्रकल्प 1: वैयक्तिक पोर्टफोलिओ वेबसाइट
**जटिलता**: नवशिक्या  
**कालावधी**: 1-2 आठवडे

तयार करा आणि तैनात करा:
- Azure Storage वर स्थिर वेबसाइट होस्टिंग
- सानुकूल डोमेन कॉन्फिगरेशन
- जागतिक कार्यक्षमतेसाठी CDN एकत्रीकरण
- स्वयंचलित तैनाती पाइपलाइन

**डिलिव्हरेबल्स**:
- Azure वर कार्यरत वेबसाइट
- पोर्टफोलिओ तैनातीसाठी सानुकूल azd टेम्पलेट
- तैनाती प्रक्रियेचे दस्तऐवजीकरण
- खर्च विश्लेषण आणि ऑप्टिमायझेशन शिफारसी

### प्रकल्प 2: कार्य व्यवस्थापन अनुप्रयोग
**जटिलता**: मध्यम  
**कालावधी**: 2-3 आठवडे

पूर्ण-स्टॅक कार्य व्यवस्थापन अनुप्रयोग तयार करा:
- React फ्रंटएंड App Service वर तैनात
- Node.js API बॅकएंडसह प्रमाणीकरण
- PostgreSQL डेटाबेस स्थलांतरांसह
- Application Insights मॉनिटरिंग

**डिलिव्हरेबल्स**:
- वापरकर्ता प्रमाणीकरणासह पूर्ण अनुप्रयोग
- डेटाबेस स्कीमा आणि स्थलांतर स्क्रिप्ट्स
- मॉनिटरिंग डॅशबोर्ड आणि अलर्टिंग नियम
- मल्टी-वातावरण तैनाती कॉन्फिगरेशन

### प्रकल्प 3: मायक्रोसर्व्हिसेस ई-कॉमर्स प्लॅटफॉर्म
**जटिलता**: प्रगत  
**कालावधी**: 4-6 आठवडे

मायक्रोसर्व्हिसेस-आधारित ई-कॉमर्स प्लॅटफॉर्म डिझाइन आणि अंमलात आणा:
- अनेक API सेवा (कॅटलॉग, ऑर्डर्स, पेमेंट्स, युजर्स)
- Service Bus सह मेसेज क्व्यू एकत्रीकरण
- Redis कॅश कार्यक्षमता ऑप्टिमायझेशनसाठी
- व्यापक लॉगिंग आणि मॉनिटरिंग

**डिलिव्हरेबल्स**:
- पूर्ण मायक्रोसर्व्हिसेस आर्किटेक्चर
- इंटर-सर्व्हिस कम्युनिकेशन नमुने
- कार्यक्षमता चाचणी आणि ऑप्टिमायझेशन
- उत्पादन-तयार सुरक्षा अंमलबजावणी

## मूल्यमापन आणि प्रमाणपत्र

### ज्ञान तपासणी

प्रत्येक मॉड्यूलनंतर हे मूल्यमापन पूर्ण करा:

**मॉड्यूल 1 मूल्यमापन**: मूलभूत संकल्पना आणि स्थापना
- मुख्य संकल्पनांवर बहुपर्यायी प्रश्न
- व्यावहारिक स्थापना आणि कॉन्फिगरेशन कार्य
- साधी तैनाती व्यायाम

**मॉड्यूल 2 मूल्यमापन**: कॉन्फिगरेशन आणि वातावरण
- वातावरण व्यवस्थापन परिदृश्ये
- कॉन्फिगरेशन समस्या सोडवण्याचे व्यायाम
- सुरक्षा कॉन्फिगरेशन अंमलबजावणी

**मॉड्यूल 3 मूल्यमापन**: तैनाती आणि तरतूद
- पायाभूत सुविधा डिझाइन आव्हाने
- मल्टी-सर्व्हिस तैनाती परिदृश्ये
- कार्यक्षमता ऑप्टिमायझेशन व्यायाम

**मॉड्यूल 4 मूल्यमापन**: तैनातीपूर्व सत्यापन
- क्षमता नियोजन केस स्टडीज
- खर्च ऑप्टिमायझेशन परिदृश्ये
- सत्यापन पाइपलाइन अंमलबजावणी

**मॉड्यूल 5 मूल्यमापन**: समस्या सोडवणे आणि डीबगिंग
- समस्या निदान व्यायाम
- मॉनिटरिंग अंमलबजावणी कार्य
- घटना प्रतिसाद सिम्युलेशन

**मॉड्यूल 6 मूल्यमापन**: प्रगत विषय
- CI/CD पाइपलाइन डिझाइन
- सानुकूल टेम्पलेट विकास
- एंटरप्राइझ आर्किटेक्चर परिदृश्ये

### अंतिम कॅपस्टोन प्रकल्प

सर्व संकल्पनांचे प्रवीणता दर्शविणारा संपूर्ण उपाय डिझाइन आणि अंमलात आणा:

**आवश्यकता**:
- मल्टी-टियर अनुप्रयोग आर्किटेक्चर
- अनेक तैनाती वातावरण
- व्यापक मॉनिटरिंग आणि अलर्टिंग
- सुरक्षा आणि अनुपालन अंमलबजावणी
- खर्च ऑप्टिमायझेशन आणि कार्यक्षमता ट्यूनिंग
- संपूर्ण दस्तऐवजीकरण आणि रनबुक्स

**मूल्यमापन निकष**:
- तांत्रिक अंमलबजावणी गुणवत्ता
- दस्तऐवजीकरण पूर्णता
- सुरक्षा आणि सर्वोत्तम पद्धतींचे पालन
- कार्यक्षमता आणि खर्च ऑप्टिमायझेशन
- समस्या सोडवणे आणि मॉनिटरिंग प्रभावीता

## अभ्यास संसाधने आणि संदर्भ

### अधिकृत दस्तऐवज
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep दस्तऐवज](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)

### समुदाय संसाधने
- [AZD टेम्पलेट गॅलरी](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub संघटना](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub रिपॉझिटरी](https://github.com/Azure/azure-dev)

### सराव वातावरण
- [Azure मोफत खाते](https://azure.microsoft.com/free/)
- [Azure DevOps मोफत टियर](https://azure.microsoft.com/services/devops/)
- [GitHub क्रिया](https://github.com/features/actions)

### अतिरिक्त साधने
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## अभ्यास वेळापत्रक शिफारसी

### पूर्ण-वेळ अभ्यास (8 आठवडे)
- **आठवडे 1-2**: मॉड्यूल 1-2 (सुरुवात करणे, कॉन्फिगरेशन)
- **आठवडे 3-4
3. **ओपन सोर्समध्ये योगदान द्या**: आपल्या टेम्पलेट्स आणि सोल्यूशन्स समुदायासोबत शेअर करा  
4. **इतरांना शिकवा**: संकल्पना इतरांना समजावून सांगणे आपल्या स्वतःच्या समजूतदारपणाला बळकट करते  
5. **जिज्ञासू रहा**: सतत नवीन Azure सेवा आणि इंटिग्रेशन पॅटर्न्स शोधत रहा  

---

**नेव्हिगेशन**  
- **मागील धडा**: [FAQ](faq.md)  
- **पुढील धडा**: [Changelog](../changelog.md)  

**अभ्यास प्रगती ट्रॅकिंग**: या मार्गदर्शकाचा उपयोग आपल्या शिकण्याच्या प्रवासाचे ट्रॅकिंग करण्यासाठी करा आणि Azure Developer CLI च्या सर्व संकल्पना आणि पद्धतींचे व्यापक कव्हरेज सुनिश्चित करा.  

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.