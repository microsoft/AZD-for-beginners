<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T20:08:10+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ne"
}
-->
# अध्ययन मार्गदर्शक - AZD शुरुवातकर्ताहरूका लागि

## परिचय

यो विस्तृत अध्ययन मार्गदर्शकले Azure Developer CLI (azd) मा महारत हासिल गर्न संरचित सिकाइ उद्देश्यहरू, प्रमुख अवधारणाहरू, अभ्यासहरू, र मूल्यांकन सामग्रीहरू प्रदान गर्दछ। आफ्नो प्रगति ट्र्याक गर्न र सबै आवश्यक विषयहरू समेटिएको सुनिश्चित गर्न यो मार्गदर्शक प्रयोग गर्नुहोस्।

## सिकाइ लक्ष्यहरू

यो अध्ययन मार्गदर्शक पूरा गरेर, तपाईं:
- Azure Developer CLI का आधारभूत र उन्नत अवधारणाहरूमा महारत हासिल गर्नुहुनेछ
- Azure एप्लिकेसनहरू तैनात गर्न र व्यवस्थापन गर्न व्यावहारिक सीपहरू विकास गर्नुहुनेछ
- तैनातीहरू समस्या समाधान गर्न र अनुकूलन गर्न आत्मविश्वास निर्माण गर्नुहुनेछ
- उत्पादन-तयार तैनाती अभ्यासहरू र सुरक्षा विचारहरू बुझ्नुहुनेछ

## सिकाइ परिणामहरू

यो अध्ययन मार्गदर्शकका सबै खण्डहरू पूरा गरेपछि, तपाईं:
- azd प्रयोग गरेर पूर्ण एप्लिकेसन आर्किटेक्चर डिजाइन, तैनात, र व्यवस्थापन गर्न सक्षम हुनुहुनेछ
- व्यापक निगरानी, सुरक्षा, र लागत अनुकूलन रणनीतिहरू कार्यान्वयन गर्न सक्षम हुनुहुनेछ
- जटिल तैनाती समस्याहरू स्वतन्त्र रूपमा समाधान गर्न सक्षम हुनुहुनेछ
- अनुकूलन टेम्प्लेटहरू सिर्जना गर्न र azd समुदायमा योगदान गर्न सक्षम हुनुहुनेछ

## पाठ्यक्रम संरचना

### खण्ड १: सुरुवात (हप्ता १-२)

#### सिकाइ उद्देश्यहरू
- Azure Developer CLI का आधारभूत र मुख्य अवधारणाहरू बुझ्नुहोस्
- आफ्नो विकास वातावरणमा azd सफलतापूर्वक स्थापना र कन्फिगर गर्नुहोस्
- उपलब्ध टेम्प्लेट प्रयोग गरेर आफ्नो पहिलो तैनाती पूरा गर्नुहोस्
- azd परियोजना संरचनामा नेभिगेट गर्नुहोस् र प्रमुख घटकहरू बुझ्नुहोस्

#### मास्टर गर्नुपर्ने प्रमुख अवधारणाहरू
- टेम्प्लेटहरू, वातावरणहरू, र सेवाहरू
- azure.yaml कन्फिगरेसन संरचना
- आधारभूत azd आदेशहरू (init, up, down, deploy)
- कोडको रूपमा पूर्वाधारका सिद्धान्तहरू
- Azure प्रमाणीकरण र अनुमति

#### अभ्यासहरू

**अभ्यास १.१: स्थापना र सेटअप**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**अभ्यास १.२: पहिलो तैनाती**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**अभ्यास १.३: परियोजना संरचना विश्लेषण**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### आत्म-मूल्यांकन प्रश्नहरू
1. azd आर्किटेक्चरका तीन मुख्य अवधारणाहरू के हुन्?
2. azure.yaml फाइलको उद्देश्य के हो?
3. विभिन्न तैनाती लक्ष्यहरू व्यवस्थापन गर्न वातावरणहरूले कसरी मद्दत गर्छन्?
4. azd सँग प्रयोग गर्न सकिने प्रमाणीकरण विधिहरू के हुन्?
5. पहिलो पटक `azd up` चलाउँदा के हुन्छ?

### खण्ड २: कन्फिगरेसन र वातावरणहरू (हप्ता ३)

#### सिकाइ उद्देश्यहरू
- वातावरण व्यवस्थापन र कन्फिगरेसनमा महारत हासिल गर्नुहोस्
- उन्नत azure.yaml कन्फिगरेसनहरू बुझ्नुहोस्
- वातावरण-विशिष्ट सेटिङहरू र भेरिएबलहरू कार्यान्वयन गर्नुहोस्
- विभिन्न परिदृश्यहरूको लागि प्रमाणीकरण कन्फिगर गर्नुहोस्

#### मास्टर गर्नुपर्ने प्रमुख अवधारणाहरू
- वातावरण पदानुक्रम र भेरिएबल प्राथमिकता
- सेवा कन्फिगरेसन र प्यारामिटरहरू
- हुकहरू र जीवनचक्र घटनाहरू
- प्रमाणीकरण विधिहरू (प्रयोगकर्ता, सेवा प्रिन्सिपल, व्यवस्थापित पहिचान)
- कन्फिगरेसन फाइल व्यवस्थापन

#### अभ्यासहरू

**अभ्यास २.१: बहु-वातावरण सेटअप**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**अभ्यास २.२: उन्नत कन्फिगरेसन**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**अभ्यास २.३: सुरक्षा कन्फिगरेसन**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### आत्म-मूल्यांकन प्रश्नहरू
1. azd ले वातावरण भेरिएबल प्राथमिकता कसरी व्यवस्थापन गर्छ?
2. तैनाती हुकहरू के हुन् र तिनीहरू कहिले प्रयोग गर्नुपर्छ?
3. विभिन्न वातावरणहरूको लागि विभिन्न SKUs कसरी कन्फिगर गर्ने?
4. विभिन्न प्रमाणीकरण विधिहरूको सुरक्षा प्रभाव के हुन्?
5. गोप्य र संवेदनशील कन्फिगरेसन डाटा कसरी व्यवस्थापन गर्ने?

### खण्ड ३: तैनाती र प्रावधान (हप्ता ४)

#### सिकाइ उद्देश्यहरू
- तैनाती कार्यप्रवाह र उत्कृष्ट अभ्यासहरूमा महारत हासिल गर्नुहोस्
- Bicep टेम्प्लेटहरूको साथ कोडको रूपमा पूर्वाधार बुझ्नुहोस्
- जटिल बहु-सेवा आर्किटेक्चरहरू कार्यान्वयन गर्नुहोस्
- तैनाती प्रदर्शन र विश्वसनीयता अनुकूलन गर्नुहोस्

#### मास्टर गर्नुपर्ने प्रमुख अवधारणाहरू
- Bicep टेम्प्लेट संरचना र मोड्युलहरू
- स्रोत निर्भरता र क्रमबद्धता
- तैनाती रणनीतिहरू (ब्लू-ग्रीन, रोलिङ अपडेटहरू)
- बहु-क्षेत्र तैनातीहरू
- डाटाबेस माइग्रेशन र डाटा व्यवस्थापन

#### अभ्यासहरू

**अभ्यास ३.१: अनुकूलित पूर्वाधार**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**अभ्यास ३.२: बहु-सेवा एप्लिकेसन**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**अभ्यास ३.३: डाटाबेस एकीकरण**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### आत्म-मूल्यांकन प्रश्नहरू
1. ARM टेम्प्लेटको तुलनामा Bicep प्रयोगको फाइदाहरू के हुन्?
2. azd तैनातीहरूमा डाटाबेस माइग्रेशन कसरी व्यवस्थापन गर्ने?
3. शून्य-डाउनटाइम तैनातीहरूको लागि के रणनीतिहरू छन्?
4. सेवाहरू बीच निर्भरता कसरी व्यवस्थापन गर्ने?
5. बहु-क्षेत्र तैनातीहरूको लागि विचारहरू के हुन्?

### खण्ड ४: पूर्व-तैनाती मान्यता (हप्ता ५)

#### सिकाइ उद्देश्यहरू
- व्यापक पूर्व-तैनाती जाँचहरू कार्यान्वयन गर्नुहोस्
- क्षमता योजना र स्रोत मान्यता मा महारत हासिल गर्नुहोस्
- SKU चयन र लागत अनुकूलन बुझ्नुहोस्
- स्वचालित मान्यता पाइपलाइनहरू निर्माण गर्नुहोस्

#### मास्टर गर्नुपर्ने प्रमुख अवधारणाहरू
- Azure स्रोत कोटा र सीमा
- SKU चयन मापदण्ड र लागत प्रभाव
- स्वचालित मान्यता स्क्रिप्टहरू र उपकरणहरू
- क्षमता योजना पद्धतिहरू
- प्रदर्शन परीक्षण र अनुकूलन

#### अभ्यासहरू

**अभ्यास ४.१: क्षमता योजना**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**अभ्यास ४.२: पूर्व-उडान मान्यता**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**अभ्यास ४.३: SKU अनुकूलन**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### आत्म-मूल्यांकन प्रश्नहरू
1. SKU चयन निर्णयहरूमा के कारकहरूले प्रभाव पार्नुपर्छ?
2. तैनाती अघि Azure स्रोत उपलब्धता कसरी मान्यता गर्ने?
3. पूर्व-उडान जाँच प्रणालीका प्रमुख घटकहरू के हुन्?
4. तैनाती लागत कसरी अनुमान र नियन्त्रण गर्ने?
5. क्षमता योजना को लागी आवश्यक निगरानी के हो?

### खण्ड ५: समस्या समाधान र डिबगिङ (हप्ता ६)

#### सिकाइ उद्देश्यहरू
- व्यवस्थित समस्या समाधान पद्धतिहरूमा महारत हासिल गर्नुहोस्
- जटिल तैनाती समस्याहरू डिबग गर्न विशेषज्ञता विकास गर्नुहोस्
- व्यापक निगरानी र सतर्कता कार्यान्वयन गर्नुहोस्
- घटना प्रतिक्रिया र पुनर्प्राप्ति प्रक्रियाहरू निर्माण गर्नुहोस्

#### मास्टर गर्नुपर्ने प्रमुख अवधारणाहरू
- सामान्य तैनाती असफलता ढाँचाहरू
- लग विश्लेषण र सम्बन्ध प्रविधिहरू
- प्रदर्शन निगरानी र अनुकूलन
- सुरक्षा घटना पत्ता लगाउने र प्रतिक्रिया
- आपतकालीन पुनर्प्राप्ति र व्यापार निरन्तरता

#### अभ्यासहरू

**अभ्यास ५.१: समस्या समाधान परिदृश्यहरू**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**अभ्यास ५.२: निगरानी कार्यान्वयन**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**अभ्यास ५.३: घटना प्रतिक्रिया**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### आत्म-मूल्यांकन प्रश्नहरू
1. azd तैनातीहरूको समस्या समाधानको व्यवस्थित दृष्टिकोण के हो?
2. धेरै सेवाहरू र स्रोतहरूमा लगहरू कसरी सम्बन्धित गर्ने?
3. प्रारम्भिक समस्या पत्ता लगाउनका लागि सबैभन्दा महत्त्वपूर्ण निगरानी मेट्रिक्स के हुन्?
4. प्रभावकारी आपतकालीन पुनर्प्राप्ति प्रक्रियाहरू कसरी कार्यान्वयन गर्ने?
5. घटना प्रतिक्रिया योजनाका प्रमुख घटकहरू के हुन्?

### खण्ड ६: उन्नत विषयहरू र उत्कृष्ट अभ्यासहरू (हप्ता ७-८)

#### सिकाइ उद्देश्यहरू
- उद्यम-स्तर तैनाती ढाँचाहरू कार्यान्वयन गर्नुहोस्
- CI/CD एकीकरण र स्वचालनमा महारत हासिल गर्नुहोस्
- अनुकूलित टेम्प्लेटहरू विकास गर्नुहोस् र समुदायमा योगदान गर्नुहोस्
- उन्नत सुरक्षा र अनुपालन आवश्यकताहरू बुझ्नुहोस्

#### मास्टर गर्नुपर्ने प्रमुख अवधारणाहरू
- CI/CD पाइपलाइन एकीकरण ढाँचाहरू
- अनुकूलित टेम्प्लेट विकास र वितरण
- उद्यम शासन र अनुपालन
- उन्नत नेटवर्किङ र सुरक्षा कन्फिगरेसनहरू
- प्रदर्शन अनुकूलन र लागत व्यवस्थापन

#### अभ्यासहरू

**अभ्यास ६.१: CI/CD एकीकरण**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**अभ्यास ६.२: अनुकूलित टेम्प्लेट विकास**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**अभ्यास ६.३: उद्यम कार्यान्वयन**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### आत्म-मूल्यांकन प्रश्नहरू
1. azd लाई विद्यमान CI/CD कार्यप्रवाहहरूमा कसरी एकीकृत गर्ने?
2. अनुकूलित टेम्प्लेट विकासका लागि प्रमुख विचारहरू के हुन्?
3. azd तैनातीहरूमा शासन र अनुपालन कसरी कार्यान्वयन गर्ने?
4. उद्यम-स्तर तैनातीहरूको लागि उत्कृष्ट अभ्यासहरू के हुन्?
5. azd समुदायमा प्रभावकारी रूपमा कसरी योगदान गर्ने?

## व्यावहारिक परियोजनाहरू

### परियोजना १: व्यक्तिगत पोर्टफोलियो वेबसाइट
**जटिलता**: शुरुवातकर्ता  
**अवधि**: १-२ हप्ता

तपाईंको व्यक्तिगत पोर्टफोलियो वेबसाइट निर्माण र तैनात गर्नुहोस्:
- Azure Storage मा स्थिर वेबसाइट होस्टिङ
- अनुकूलित डोमेन कन्फिगरेसन
- विश्वव्यापी प्रदर्शनका लागि CDN एकीकरण
- स्वचालित तैनाती पाइपलाइन

**डेलिभरेबलहरू**:
- Azure मा तैनात कार्यरत वेबसाइट
- पोर्टफोलियो तैनातीहरूको लागि अनुकूलित azd टेम्प्लेट
- तैनाती प्रक्रियाको दस्तावेजीकरण
- लागत विश्लेषण र अनुकूलन सिफारिसहरू

### परियोजना २: कार्य व्यवस्थापन एप्लिकेसन
**जटिलता**: मध्यम  
**अवधि**: २-३ हप्ता

पूर्ण-स्ट्याक कार्य व्यवस्थापन एप्लिकेसन सिर्जना गर्नुहोस्:
- React फ्रन्टएन्ड App Service मा तैनात
- प्रमाणीकरणसहितको Node.js API ब्याकएन्ड
- माइग्रेशनसहितको PostgreSQL डाटाबेस
- Application Insights निगरानी

**डेलिभरेबलहरू**:
- प्रयोगकर्ता प्रमाणीकरणसहितको पूर्ण एप्लिकेसन
- डाटाबेस स्किमा र माइग्रेशन स्क्रिप्टहरू
- निगरानी ड्यासबोर्डहरू र सतर्कता नियमहरू
- बहु-वातावरण तैनाती कन्फिगरेसन

### परियोजना ३: माइक्रोसर्भिस ई-कमर्स प्लेटफर्म
**जटिलता**: उन्नत  
**अवधि**: ४-६ हप्ता

माइक्रोसर्भिस-आधारित ई-कमर्स प्लेटफर्म डिजाइन र कार्यान्वयन गर्नुहोस्:
- धेरै API सेवाहरू (क्याटलग, अर्डर, भुक्तानी, प्रयोगकर्ता)
- Service Bus सँग सन्देश पंक्ति एकीकरण
- प्रदर्शन अनुकूलनका लागि Redis क्यास
- व्यापक लगिङ र निगरानी

**डेलिभरेबलहरू**:
- पूर्ण माइक्रोसर्भिस आर्किटेक्चर
- अन्तर-सेवा सञ्चार ढाँचाहरू
- प्रदर्शन परीक्षण र अनुकूलन
- उत्पादन-तयार सुरक्षा कार्यान्वयन

## मूल्यांकन र प्रमाणपत्र

### ज्ञान जाँचहरू

प्रत्येक खण्डपछि यी मूल्यांकनहरू पूरा गर्नुहोस्:

**खण्ड १ मूल्यांकन**: आधारभूत अवधारणाहरू र स्थापना
- मुख्य अवधारणाहरूमा बहुविकल्पीय प्रश्नहरू
- व्यावहारिक स्थापना र कन्फिगरेसन कार्यहरू
- सरल तैनाती अभ्यास

**खण्ड २ मूल्यांकन**: कन्फिगरेसन र वातावरणहरू
- वातावरण व्यवस्थापन परिदृश्यहरू
- कन्फिगरेसन समस्या समाधान अभ्यासहरू
- सुरक्षा कन्फिगरेसन कार्यान्वयन

**खण्ड ३ मूल्यांकन**: तैनाती र प्रावधान
- पूर्वाधार डिजाइन चुनौतीहरू
- बहु-सेवा तैनाती परिदृश्यहरू
- प्रदर्शन अनुकूलन अभ्यासहरू

**खण्ड ४ मूल्यांकन**: पूर्व-तैनाती मान्यता
- क्षमता योजना केस अध्ययनहरू
- लागत अनुकूलन परिदृश्यहरू
- मान्यता पाइपलाइन कार्यान्वयन

**खण्ड ५ मूल्यांकन**: समस्या समाधान र डिबगिङ
- समस्या निदान अभ्यासहरू
- निगरानी कार्यान्वयन कार्यहरू
- घटना प्रतिक्रिया सिमुलेशनहरू

**खण्ड ६ मूल्यांकन**: उन्नत विषयहरू
- CI/CD पाइपलाइन डिजाइन
- अनुकूलित टेम्प्लेट विकास
- उद्यम आर्किटेक्चर परिदृश्यहरू

### अन्तिम क्यापस्टोन परियोजना

सबै अवधारणाहरूको महारत प्रदर्शन गर्ने पूर्ण समाधान डिजाइन र कार्यान्वयन गर्नुहोस्:

**आवश्यकताहरू**:
- बहु-स्तरीय एप्लिकेसन आर्किटेक्चर
- धेरै तैनाती वातावरणहरू
- व्यापक निगरानी र सतर्कता
- सुरक्षा र अनुपालन कार्यान्वयन
- लागत अनुकूलन र प्रदर्शन ट्युनिङ
- पूर्ण दस्तावेजीकरण र रनबुकहरू

**मूल्यांकन मापदण्ड**:
- प्राविधिक कार्यान्वयनको गुणस्तर
- दस्तावेजीकरणको पूर्णता
- सुरक्षा र उत्कृष्ट अभ्यासहरूको पालना
- प्रदर्शन र लागत अनुकूलन
- समस्या समाधान र निगरानी प्रभावकारिता

## अध्ययन स्रोतहरू र सन्दर्भहरू

### आधिकारिक दस्तावेजीकरण
- [Azure Developer CLI दस्तावेजीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep दस्तावेजीकरण](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure आर्किटेक्चर केन्द्र](https://learn.microsoft.com/en-us/azure/architecture/)

### समुदाय स्रोतहरू
- [AZD टेम्प्लेट ग्यालरी](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub संगठन](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub रिपोजिटरी](https://github.com/Azure/azure-dev)

### अभ्यास वातावरणहरू
- [Azure निःशुल्क खाता](https://azure.microsoft.com/free/)
- [Azure DevOps निःशुल्क स्तर](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### अतिरिक्त उपकरणहरू
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## अध्ययन तालिका सिफारिसहरू

### पूर्ण-समय अध्ययन (८ हप्ता)
- **हप्ता १-२**: खण्ड १-२ (सुरुवात, कन्फिगरेसन)
- **हप्ता ३-४**: खण्ड ३-४ (तैनाती, पूर्व-तैनाती)
- **हप्ता ५-६**: खण्ड ५-६ (समस्या समाधान, उन्नत विषयहरू)
- **हप्ता ७-८**: व्यावहारिक परियोजनाहरू र अन्तिम मूल्यांकन

### अंशकालिक अध्ययन (१६ हप्ता)
- **हप्ता १-४**: खण्ड १ (सुरुवात)
- **हप्ता ५-७**: खण्ड २ (कन्फिगरेसन र वातावरणहरू)
- **हप्ता ८-१०**: खण्ड ३ (तैनाती र प्रावधान)
- **हप्ता ११-१२**: खण्ड ४ (पूर्व-तैनाती मान्यता)
- **हप्ता १३-१४**: खण्ड ५ (समस्या समाधान र डिबगिङ)
- **हप्ता १५-१६**: खण्ड ६ (उन्नत विषयहरू र मूल्यांकन)

### आत्म-गति अध्ययन
- प्रत्येक खण्ड आफ्नो गति अनुसार पूरा गर्नुहोस्
- चुनौतीपूर्ण अवधारणाहरूमा थप समय खर्च गर्नुहोस्
- अभ्यासहरू दोहोर्याउनुहोस् जबसम्म तपाईं महारत हासिल गर्नुहुन्न
3. **ओपन सोर्समा योगदान दिनुहोस्**: आफ्नो टेम्प्लेटहरू र समाधानहरू समुदायसँग साझा गर्नुहोस्  
4. **अरूलाई सिकाउनुहोस्**: अरूलाई अवधारणाहरू व्याख्या गर्दा आफ्नो बुझाइलाई बलियो बनाउँछ  
5. **जिज्ञासु रहनुहोस्**: नयाँ Azure सेवाहरू र एकीकरण ढाँचाहरू निरन्तर अन्वेषण गर्नुहोस्  

---

**नेभिगेसन**  
- **अघिल्लो पाठ**: [FAQ](faq.md)  
- **अर्को पाठ**: [Changelog](../changelog.md)  

**अध्ययन प्रगति ट्र्याकिङ**: यस मार्गदर्शकलाई आफ्नो सिकाइ यात्रा ट्र्याक गर्न र Azure Developer CLI अवधारणाहरू र अभ्यासहरूको व्यापक कभरेज सुनिश्चित गर्न प्रयोग गर्नुहोस्।  

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।