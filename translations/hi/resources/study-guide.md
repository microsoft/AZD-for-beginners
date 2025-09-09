<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:46:14+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "hi"
}
-->
# अध्ययन गाइड - AZD शुरुआती लोगों के लिए

## परिचय

यह व्यापक अध्ययन गाइड संरचित सीखने के उद्देश्यों, प्रमुख अवधारणाओं, अभ्यासों और मूल्यांकन सामग्री प्रदान करता है ताकि आप Azure Developer CLI (azd) में महारत हासिल कर सकें। इस गाइड का उपयोग अपनी प्रगति को ट्रैक करने और यह सुनिश्चित करने के लिए करें कि आपने सभी आवश्यक विषयों को कवर कर लिया है।

## सीखने के लक्ष्य

इस अध्ययन गाइड को पूरा करके, आप:
- Azure Developer CLI के सभी मौलिक और उन्नत अवधारणाओं में महारत हासिल करेंगे
- Azure एप्लिकेशन को तैनात और प्रबंधित करने में व्यावहारिक कौशल विकसित करेंगे
- तैनाती को डिबग और अनुकूलित करने में आत्मविश्वास बनाएंगे
- उत्पादन-तैयार तैनाती प्रथाओं और सुरक्षा विचारों को समझेंगे

## सीखने के परिणाम

सभी अनुभागों को पूरा करने के बाद, आप सक्षम होंगे:
- azd का उपयोग करके संपूर्ण एप्लिकेशन आर्किटेक्चर डिज़ाइन, तैनात और प्रबंधित करें
- व्यापक निगरानी, सुरक्षा और लागत अनुकूलन रणनीतियों को लागू करें
- जटिल तैनाती समस्याओं को स्वतंत्र रूप से हल करें
- कस्टम टेम्पलेट बनाएं और azd समुदाय में योगदान दें

## पाठ्यक्रम संरचना

### मॉड्यूल 1: शुरुआत करना (सप्ताह 1-2)

#### सीखने के उद्देश्य
- Azure Developer CLI की मूलभूत बातें और मुख्य अवधारणाओं को समझें
- अपने विकास वातावरण में azd को सफलतापूर्वक इंस्टॉल और कॉन्फ़िगर करें
- एक मौजूदा टेम्पलेट का उपयोग करके अपनी पहली तैनाती पूरी करें
- azd प्रोजेक्ट संरचना को नेविगेट करें और प्रमुख घटकों को समझें

#### प्रमुख अवधारणाएँ
- टेम्पलेट, वातावरण और सेवाएँ
- azure.yaml कॉन्फ़िगरेशन संरचना
- बुनियादी azd कमांड (init, up, down, deploy)
- कोड के रूप में बुनियादी ढांचा (Infrastructure as Code) सिद्धांत
- Azure प्रमाणीकरण और प्राधिकरण

#### अभ्यास

**अभ्यास 1.1: इंस्टॉलेशन और सेटअप**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**अभ्यास 1.2: पहली तैनाती**  
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**अभ्यास 1.3: प्रोजेक्ट संरचना विश्लेषण**  
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### आत्म-मूल्यांकन प्रश्न
1. azd आर्किटेक्चर के तीन मुख्य अवधारणाएँ क्या हैं?
2. azure.yaml फ़ाइल का उद्देश्य क्या है?
3. विभिन्न तैनाती लक्ष्यों को प्रबंधित करने में वातावरण कैसे मदद करते हैं?
4. azd के साथ कौन-कौन से प्रमाणीकरण विधियाँ उपयोग की जा सकती हैं?
5. जब आप पहली बार `azd up` चलाते हैं तो क्या होता है?

### मॉड्यूल 2: कॉन्फ़िगरेशन और वातावरण (सप्ताह 3)

#### सीखने के उद्देश्य
- वातावरण प्रबंधन और कॉन्फ़िगरेशन में महारत हासिल करें
- उन्नत azure.yaml कॉन्फ़िगरेशन को समझें
- वातावरण-विशिष्ट सेटिंग्स और वेरिएबल्स लागू करें
- विभिन्न परिदृश्यों के लिए प्रमाणीकरण कॉन्फ़िगर करें

#### प्रमुख अवधारणाएँ
- वातावरण पदानुक्रम और वेरिएबल प्राथमिकता
- सेवा कॉन्फ़िगरेशन और पैरामीटर
- हुक और जीवनचक्र घटनाएँ
- प्रमाणीकरण विधियाँ (उपयोगकर्ता, सेवा प्रिंसिपल, प्रबंधित पहचान)
- कॉन्फ़िगरेशन फ़ाइल प्रबंधन

#### अभ्यास

**अभ्यास 2.1: मल्टी-वातावरण सेटअप**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**अभ्यास 2.2: उन्नत कॉन्फ़िगरेशन**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**अभ्यास 2.3: सुरक्षा कॉन्फ़िगरेशन**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### आत्म-मूल्यांकन प्रश्न
1. azd वेरिएबल प्राथमिकता को कैसे संभालता है?
2. तैनाती हुक क्या हैं और आपको उनका उपयोग कब करना चाहिए?
3. विभिन्न वातावरणों के लिए अलग-अलग SKUs कैसे कॉन्फ़िगर करें?
4. विभिन्न प्रमाणीकरण विधियों के सुरक्षा प्रभाव क्या हैं?
5. गुप्त और संवेदनशील कॉन्फ़िगरेशन डेटा को कैसे प्रबंधित करें?

### मॉड्यूल 3: तैनाती और प्रावधान (सप्ताह 4)

#### सीखने के उद्देश्य
- तैनाती वर्कफ़्लो और सर्वोत्तम प्रथाओं में महारत हासिल करें
- Bicep टेम्पलेट्स के साथ कोड के रूप में बुनियादी ढांचा को समझें
- जटिल मल्टी-सेवा आर्किटेक्चर लागू करें
- तैनाती प्रदर्शन और विश्वसनीयता को अनुकूलित करें

#### प्रमुख अवधारणाएँ
- Bicep टेम्पलेट संरचना और मॉड्यूल
- संसाधन निर्भरताएँ और क्रम
- तैनाती रणनीतियाँ (ब्लू-ग्रीन, रोलिंग अपडेट्स)
- मल्टी-रीजन तैनाती
- डेटाबेस माइग्रेशन और डेटा प्रबंधन

#### अभ्यास

**अभ्यास 3.1: कस्टम बुनियादी ढांचा**  
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**अभ्यास 3.2: मल्टी-सेवा एप्लिकेशन**  
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**अभ्यास 3.3: डेटाबेस एकीकरण**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### आत्म-मूल्यांकन प्रश्न
1. ARM टेम्पलेट्स की तुलना में Bicep का उपयोग करने के फायदे क्या हैं?
2. azd तैनाती में डेटाबेस माइग्रेशन को कैसे संभालें?
3. शून्य-डाउनटाइम तैनाती के लिए कौन-कौन सी रणनीतियाँ मौजूद हैं?
4. सेवाओं के बीच निर्भरताओं को कैसे प्रबंधित करें?
5. मल्टी-रीजन तैनाती के लिए क्या विचार आवश्यक हैं?

### मॉड्यूल 4: पूर्व-तैनाती मान्यता (सप्ताह 5)

#### सीखने के उद्देश्य
- व्यापक पूर्व-तैनाती जांच लागू करें
- क्षमता योजना और संसाधन मान्यता में महारत हासिल करें
- SKU चयन और लागत अनुकूलन को समझें
- स्वचालित मान्यता पाइपलाइनों का निर्माण करें

#### प्रमुख अवधारणाएँ
- Azure संसाधन कोटा और सीमाएँ
- SKU चयन मानदंड और लागत प्रभाव
- स्वचालित मान्यता स्क्रिप्ट और उपकरण
- क्षमता योजना पद्धतियाँ
- प्रदर्शन परीक्षण और अनुकूलन

#### अभ्यास

**अभ्यास 4.1: क्षमता योजना**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**अभ्यास 4.2: प्री-फ्लाइट मान्यता**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**अभ्यास 4.3: SKU अनुकूलन**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### आत्म-मूल्यांकन प्रश्न
1. SKU चयन निर्णयों को कौन-कौन से कारक प्रभावित करते हैं?
2. तैनाती से पहले Azure संसाधन उपलब्धता को कैसे मान्य करें?
3. प्री-फ्लाइट चेक सिस्टम के प्रमुख घटक क्या हैं?
4. तैनाती लागत का अनुमान और नियंत्रण कैसे करें?
5. क्षमता योजना के लिए कौन-कौन सी निगरानी आवश्यक है?

### मॉड्यूल 5: समस्या निवारण और डिबगिंग (सप्ताह 6)

#### सीखने के उद्देश्य
- व्यवस्थित समस्या निवारण पद्धतियों में महारत हासिल करें
- जटिल तैनाती समस्याओं को डिबग करने में विशेषज्ञता विकसित करें
- व्यापक निगरानी और अलर्टिंग लागू करें
- घटना प्रतिक्रिया और पुनर्प्राप्ति प्रक्रियाएँ बनाएं

#### प्रमुख अवधारणाएँ
- सामान्य तैनाती विफलता पैटर्न
- लॉग विश्लेषण और सहसंबंध तकनीक
- प्रदर्शन निगरानी और अनुकूलन
- सुरक्षा घटना का पता लगाना और प्रतिक्रिया देना
- आपदा पुनर्प्राप्ति और व्यवसाय निरंतरता

#### अभ्यास

**अभ्यास 5.1: समस्या निवारण परिदृश्य**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**अभ्यास 5.2: निगरानी कार्यान्वयन**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**अभ्यास 5.3: घटना प्रतिक्रिया**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### आत्म-मूल्यांकन प्रश्न
1. azd तैनाती को डिबग करने के लिए व्यवस्थित दृष्टिकोण क्या है?
2. कई सेवाओं और संसाधनों में लॉग को कैसे सहसंबंधित करें?
3. प्रारंभिक समस्या का पता लगाने के लिए कौन-कौन से निगरानी मीट्रिक्स सबसे महत्वपूर्ण हैं?
4. प्रभावी आपदा पुनर्प्राप्ति प्रक्रियाएँ कैसे लागू करें?
5. घटना प्रतिक्रिया योजना के प्रमुख घटक क्या हैं?

### मॉड्यूल 6: उन्नत विषय और सर्वोत्तम प्रथाएँ (सप्ताह 7-8)

#### सीखने के उद्देश्य
- एंटरप्राइज़-ग्रेड तैनाती पैटर्न लागू करें
- CI/CD एकीकरण और स्वचालन में महारत हासिल करें
- कस्टम टेम्पलेट विकसित करें और समुदाय में योगदान दें
- उन्नत सुरक्षा और अनुपालन आवश्यकताओं को समझें

#### प्रमुख अवधारणाएँ
- CI/CD पाइपलाइन एकीकरण पैटर्न
- कस्टम टेम्पलेट विकास और वितरण
- एंटरप्राइज़ गवर्नेंस और अनुपालन
- उन्नत नेटवर्किंग और सुरक्षा कॉन्फ़िगरेशन
- प्रदर्शन अनुकूलन और लागत प्रबंधन

#### अभ्यास

**अभ्यास 6.1: CI/CD एकीकरण**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**अभ्यास 6.2: कस्टम टेम्पलेट विकास**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**अभ्यास 6.3: एंटरप्राइज़ कार्यान्वयन**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### आत्म-मूल्यांकन प्रश्न
1. मौजूदा CI/CD वर्कफ़्लो में azd को कैसे एकीकृत करें?
2. कस्टम टेम्पलेट विकास के लिए प्रमुख विचार क्या हैं?
3. azd तैनाती में गवर्नेंस और अनुपालन कैसे लागू करें?
4. एंटरप्राइज़-स्केल तैनाती के लिए सर्वोत्तम प्रथाएँ क्या हैं?
5. azd समुदाय में प्रभावी ढंग से कैसे योगदान करें?

## व्यावहारिक परियोजनाएँ

### परियोजना 1: व्यक्तिगत पोर्टफोलियो वेबसाइट  
**जटिलता**: शुरुआती  
**अवधि**: 1-2 सप्ताह  

एक व्यक्तिगत पोर्टफोलियो वेबसाइट बनाएं और तैनात करें:  
- Azure Storage पर स्थिर वेबसाइट होस्टिंग  
- कस्टम डोमेन कॉन्फ़िगरेशन  
- वैश्विक प्रदर्शन के लिए CDN एकीकरण  
- स्वचालित तैनाती पाइपलाइन  

**डिलीवरबल्स**:  
- Azure पर कार्यशील वेबसाइट  
- पोर्टफोलियो तैनाती के लिए कस्टम azd टेम्पलेट  
- तैनाती प्रक्रिया का दस्तावेज़ीकरण  
- लागत विश्लेषण और अनुकूलन सिफारिशें  

### परियोजना 2: टास्क प्रबंधन एप्लिकेशन  
**जटिलता**: मध्यम  
**अवधि**: 2-3 सप्ताह  

एक पूर्ण-स्टैक टास्क प्रबंधन एप्लिकेशन बनाएं:  
- React फ्रंटएंड App Service पर तैनात  
- Node.js API बैकएंड के साथ प्रमाणीकरण  
- PostgreSQL डेटाबेस माइग्रेशन के साथ  
- Application Insights निगरानी  

**डिलीवरबल्स**:  
- उपयोगकर्ता प्रमाणीकरण के साथ पूर्ण एप्लिकेशन  
- डेटाबेस स्कीमा और माइग्रेशन स्क्रिप्ट  
- निगरानी डैशबोर्ड और अलर्टिंग नियम  
- मल्टी-वातावरण तैनाती कॉन्फ़िगरेशन  

### परियोजना 3: माइक्रोसर्विस ई-कॉमर्स प्लेटफ़ॉर्म  
**जटिलता**: उन्नत  
**अवधि**: 4-6 सप्ताह  

माइक्रोसर्विस-आधारित ई-कॉमर्स प्लेटफ़ॉर्म डिज़ाइन और कार्यान्वित करें:  
- कई API सेवाएँ (कैटलॉग, ऑर्डर्स, पेमेंट्स, उपयोगकर्ता)  
- Service Bus के साथ संदेश कतार एकीकरण  
- प्रदर्शन अनुकूलन के लिए Redis कैश  
- व्यापक लॉगिंग और निगरानी  

**डिलीवरबल्स**:  
- पूर्ण माइक्रोसर्विस आर्किटेक्चर  
- इंटर-सेवा संचार पैटर्न  
- प्रदर्शन परीक्षण और अनुकूलन  
- उत्पादन-तैयार सुरक्षा कार्यान्वयन  

## मूल्यांकन और प्रमाणन

### ज्ञान जांच

प्रत्येक मॉड्यूल के बाद इन मूल्यांकनों को पूरा करें:

**मॉड्यूल 1 मूल्यांकन**: बुनियादी अवधारणाएँ और इंस्टॉलेशन  
- मुख्य अवधारणाओं पर बहुविकल्पीय प्रश्न  
- व्यावहारिक इंस्टॉलेशन और कॉन्फ़िगरेशन कार्य  
- सरल तैनाती अभ्यास  

**मॉड्यूल 2 मूल्यांकन**: कॉन्फ़िगरेशन और वातावरण  
- वातावरण प्रबंधन परिदृश्य  
- कॉन्फ़िगरेशन समस्या निवारण अभ्यास  
- सुरक्षा कॉन्फ़िगरेशन कार्यान्वयन  

**मॉड्यूल 3 मूल्यांकन**: तैनाती और प्रावधान  
- बुनियादी ढांचा डिज़ाइन चुनौतियाँ  
- मल्टी-सेवा तैनाती परिदृश्य  
- प्रदर्शन अनुकूलन अभ्यास  

**मॉड्यूल 4 मूल्यांकन**: पूर्व-तैनाती मान्यता  
- क्षमता योजना केस स्टडी  
- लागत अनुकूलन परिदृश्य  
- मान्यता पाइपलाइन कार्यान्वयन  

**मॉड्यूल 5 मूल्यांकन**: समस्या निवारण और डिबगिंग  
- समस्या निदान अभ्यास  
- निगरानी कार्यान्वयन कार्य  
- घटना प्रतिक्रिया सिमुलेशन  

**मॉड्यूल 6 मूल्यांकन**: उन्नत विषय  
- CI/CD पाइपलाइन डिज़ाइन  
- कस्टम टेम्पलेट विकास  
- एंटरप्राइज़ आर्किटेक्चर परिदृश्य  

### अंतिम कैपस्टोन परियोजना

एक संपूर्ण समाधान डिज़ाइन और कार्यान्वित करें जो सभी अवधारणाओं में महारत को प्रदर्शित करता है:

**आवश्यकताएँ**:  
- मल्टी-टियर एप्लिकेशन आर्किटेक्चर  
- कई तैनाती वातावरण  
- व्यापक निगरानी और अलर्टिंग  
- सुरक्षा और अनुपालन कार्यान्वयन  
- लागत अनुकूलन और प्रदर्शन ट्यूनिंग  
- पूर्ण दस्तावेज़ीकरण और रनबुक  

**मूल्यांकन मानदंड**:  
- तकनीकी कार्यान्वयन गुणवत्ता  
- दस्तावेज़ीकरण पूर्णता  
- सुरक्षा और सर्वोत्तम प्रथाओं का पालन  
- प्रदर्शन और लागत अनुकूलन  
- समस्या निवारण और निगरानी प्रभावशीलता  

## अध्ययन संसाधन और संदर्भ

### आधिकारिक दस्तावेज़ीकरण  
- [Azure Developer CLI दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure आर्किटेक्चर केंद्र](https://learn.microsoft.com/en-us/azure/architecture/)  

### सामुदायिक संसाधन  
- [AZD टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub संगठन](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub रिपॉजिटरी](https://github.com/Azure/azure-dev)  

### अभ्यास वातावरण  
- [Azure फ्री अकाउंट](https://azure.microsoft.com/free/)  
- [Azure DevOps फ्री टियर](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### अतिरिक्त उपकरण  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## अध्ययन अनुसूची सिफारिशें

### पूर्णकालिक अध्ययन (8 सप्ताह)  
- **सप्ताह 1-2**: मॉड्यूल 1-2 (शुरुआत, कॉन्फ़िगरेशन)  
- **सप्ताह 3-4**: मॉड्यूल 3-4 (तैनाती, पूर्व-तैनाती)  
- **सप्ताह 5-6**: मॉड्यूल 5-6 (समस्या निवारण, उन्नत विषय)  
- **सप्ताह 7-8**: व्यावहारिक परियोजनाएँ और अंतिम मूल्यांकन  

### अंशकालिक अध्ययन (16 सप्ताह)  
- **सप्ताह 1-4**: मॉड्यूल 1 (शुरुआत)  
- **सप्ताह 5-7**: मॉड्यूल 2 (कॉन्फ़िगरेशन और वातावरण)  
- **सप्ताह 8-10**: मॉड्यूल 3 (तैनाती और प्रावधान)  
- **सप्ताह 11-12**: मॉड्यूल 4 (पूर्व-तैनाती मान्यता)  
- **सप्ताह 13-14**: मॉड्यूल 5 (समस्या निवारण और डिबगिंग)  
- **सप्ताह 15-16**: मॉड्यूल 6 (उन्नत विषय और मूल्यांकन)  

### स्व-गति अध्ययन  
- प्रत्येक मॉड्यूल को अपनी गति से पूरा करें  
- चुनौतीपूर्ण अवधारणाओं पर अतिरिक्त समय बिताएँ  
- अभ्यास
3. **ओपन सोर्स में योगदान करें**: अपने टेम्पलेट्स और समाधानों को समुदाय के साथ साझा करें  
4. **दूसरों को सिखाएं**: दूसरों को अवधारणाएं समझाने से आपकी खुद की समझ मजबूत होती है  
5. **जिज्ञासु बने रहें**: नए Azure सेवाओं और इंटीग्रेशन पैटर्न्स को लगातार खोजते रहें  

---

**नेविगेशन**  
- **पिछला पाठ**: [FAQ](faq.md)  
- **अगला पाठ**: [Changelog](../changelog.md)  

**अध्ययन प्रगति ट्रैकिंग**: इस गाइड का उपयोग अपनी सीखने की यात्रा को ट्रैक करने और Azure Developer CLI की सभी अवधारणाओं और प्रथाओं को पूरी तरह से कवर करने के लिए करें।  

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।