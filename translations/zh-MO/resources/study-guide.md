# Study Guide - Comprehensive Learning Objectives

**Learning Path Navigation**
- **📚 Course Home**: [AZD 入門](../README.md)
- **📖 Start Learning**: [第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Progress Tracking**: [課程完成](../README.md#-course-completion--certification)

## Introduction

本完整學習指南提供結構化的學習目標、關鍵概念、實作練習與評量材料，幫助你掌握 Azure Developer CLI (azd)。使用此指南追蹤你的進度並確保已涵蓋所有必要主題。

## Learning Goals

完成本學習指南後，你將能夠：
- 精通 Azure Developer CLI 的所有基礎與進階概念
- 培養部署與管理 Azure 應用程式的實務技能
- 在故障排除與部署優化方面建立信心
- 了解生產就緒的部署實務與安全性考量

## Learning Outcomes

完成本學習指南所有章節後，你將能：
- 使用 azd 設計、部署及管理完整的應用程式架構
- 實作完整的監控、安全與成本最佳化策略
- 能獨立排解複雜的部署問題
- 建立自訂範本並為 azd 社群做出貢獻

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (Week 1)
**Duration**: 30-45 minutes | **Complexity**: ⭐

#### Learning Objectives
- 了解 Azure Developer CLI 的核心概念與術語
- 成功在你的開發平台上安裝並配置 AZD
- 使用現有範本部署你的第一個應用程式
- 有效操作 AZD 的命令列介面

#### Key Concepts to Master
- AZD 專案結構與組件 (azure.yaml, infra/, src/)
- 以範本為基礎的部署工作流程
- 環境設定基礎
- 資源群組與訂閱管理

#### Practical Exercises
1. **Installation Verification**: Install AZD and verify with `azd version`
2. **First Deployment**: Deploy todo-nodejs-mongo template successfully
3. **Environment Setup**: Configure your first environment variables
4. **Resource Exploration**: Navigate deployed resources in Azure Portal

#### Assessment Questions
- AZD 專案的核心組件有哪些？
- 如何從範本初始化一個新專案？
- `azd up` 與 `azd deploy` 之間有何不同？
- 如何使用 AZD 管理多個環境？

---

### Chapter 2: AI-First Development (Week 2)
**Duration**: 1-2 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- 將 Microsoft Foundry 服務整合到 AZD 工作流程中
- 部署並配置具 AI 能力的應用程式
- 理解 RAG（檢索增強生成）實作模式
- 管理 AI 模型的部署與擴展

#### Key Concepts to Master
- Microsoft Foundry Models 服務整合與 API 管理
- AI Search 配置與向量索引
- 模型部署策略與容量規劃
- AI 應用程式的監控與效能優化

#### Practical Exercises
1. **AI Chat Deployment**: Deploy azure-search-openai-demo template
2. **RAG Implementation**: Configure document indexing and retrieval
3. **Model Configuration**: Set up multiple AI models with different purposes
4. **AI Monitoring**: Implement Application Insights for AI workloads

#### Assessment Questions
- 如何在 AZD 範本中配置 Microsoft Foundry Models 服務？
- RAG 架構的主要元件有哪些？
- 如何管理 AI 模型的容量與擴展？
- 對於 AI 應用程式，哪些監控指標很重要？

---

### Chapter 3: Configuration & Authentication (Week 3)
**Duration**: 45-60 minutes | **Complexity**: ⭐⭐

#### Learning Objectives
- 精通環境配置與管理策略
- 實作安全的驗證模式與 Managed Identity
- 使用適當的命名規則來組織資源
- 配置多環境部署（dev、staging、prod）

#### Key Concepts to Master
- 環境階層與配置先後順序
- Managed Identity 與 Service Principal 驗證
- Key Vault 整合以管理機密
- 環境特定參數管理

#### Practical Exercises
1. **Multi-Environment Setup**: Configure dev, staging, and prod environments
2. **Security Configuration**: Implement managed identity authentication
3. **Secrets Management**: Integrate Azure Key Vault for sensitive data
4. **Parameter Management**: Create environment-specific configurations

#### Assessment Questions
- 如何使用 AZD 配置不同的環境？
- 使用 Managed Identity 比 Service Principal 有哪些好處？
- 如何安全地管理應用程式機密？
- AZD 中的配置階層是什麼？

---

### Chapter 4: Infrastructure as Code & Deployment (Week 4-5)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐⭐

#### Learning Objectives
- 建立並自訂 Bicep 基礎建設範本
- 實作進階部署模式與工作流程
- 了解資源佈建策略
- 設計可擴展的多服務架構

- 使用 Azure Container Apps 與 AZD 部署容器化應用程式


#### Key Concepts to Master
- Bicep 範本結構與最佳實務
- 資源相依性與部署順序
- 參數檔案與範本模組化
- 自訂 hook 與部署自動化
- Container App 部署模式（快速入門、正式環境、微服務）

#### Practical Exercises
1. **Custom Template Creation**: Build a multi-service application template
2. **Bicep Mastery**: Create modular, reusable infrastructure components
3. **Deployment Automation**: Implement pre/post deployment hooks
4. **Architecture Design**: Deploy complex microservices architecture
5. **Container App Deployment**: Deploy the [Simple Flask API](../../../examples/container-app/simple-flask-api) and [Microservices Architecture](../../../examples/container-app/microservices) examples using AZD

#### Assessment Questions
- 如何為 AZD 建立自訂 Bicep 範本？
- 組織基礎建設程式碼的最佳實務為何？
- 在範本中如何處理資源相依性？
- 哪些部署模式支援零停機更新？

---

### Chapter 5: Multi-Agent AI Solutions (Week 6-7)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- 設計並實作多代理（multi-agent）AI 架構
- 協調代理之間的協作與通訊
- 部署具生產能力的 AI 解決方案並加入監控
- 理解代理的專長化與工作流程模式
- 將容器化微服務整合為多代理解決方案的一部分

#### Key Concepts to Master
- 多代理架構模式與設計原則
- 代理通訊協定與資料流程
- AI 代理的負載平衡與擴展策略
- 多代理系統的生產監控
- 容器化環境中的服務間通訊

#### Practical Exercises
1. **Retail Solution Deployment**: Deploy the complete multi-agent retail scenario
2. **Agent Customization**: Modify Customer and Inventory agent behaviors
3. **Architecture Scaling**: Implement load balancing and auto-scaling
4. **Production Monitoring**: Set up comprehensive monitoring and alerting
5. **Microservices Integration**: Extend the [Microservices Architecture](../../../examples/container-app/microservices) example to support agent-based workflows

#### Assessment Questions
- 如何設計有效的多代理通訊模式？
- 在擴展 AI 代理工作負載時，需考量哪些要點？
- 如何監控與除錯多代理 AI 系統？
- 哪些生產模式可確保 AI 代理的可靠性？

---

### Chapter 6: Pre-Deployment Validation & Planning (Week 8)
**Duration**: 1 hour | **Complexity**: ⭐⭐

#### Learning Objectives
- 執行完整的容量規劃與資源驗證
- 為成本效益選擇最佳的 Azure SKU
- 實作自動化的 pre-flight 檢查與驗證
- 以成本最佳化策略進行部署規劃

#### Key Concepts to Master
- Azure 資源配額與容量限制
- SKU 選擇準則與成本最佳化
- 自動化驗證腳本與測試
- 部署規劃與風險評估

#### Practical Exercises
1. **Capacity Analysis**: Analyze resource requirements for your applications
2. **SKU Optimization**: Compare and select cost-effective service tiers
3. **Validation Automation**: Implement pre-deployment check scripts
4. **Cost Planning**: Create deployment cost estimates and budgets

#### Assessment Questions
- 在部署前如何驗證 Azure 的容量？
- 哪些因素會影響 SKU 選擇決策？
- 如何自動化部署前的驗證？
- 有哪些策略可幫助優化部署成本？

---

### Chapter 7: Troubleshooting & Debugging (Week 9)
**Duration**: 1-1.5 hours | **Complexity**: ⭐⭐

#### Learning Objectives
- 為 AZD 部署建立系統化的除錯方法
- 解決常見的部署與配置問題
- 除錯 AI 特有的問題與效能問題
- 實作監控與警示以進行主動問題偵測

#### Key Concepts to Master
- 診斷技術與日誌策略
- 常見失敗模式及其解法
- 效能監控與優化
- 事件回應與復原程序

#### Practical Exercises
1. **Diagnostic Skills**: Practice with intentionally broken deployments
2. **Log Analysis**: Use Azure Monitor and Application Insights effectively
3. **Performance Tuning**: Optimize slow-performing applications
4. **Recovery Procedures**: Implement backup and disaster recovery

#### Assessment Questions
- 最常見的 AZD 部署失敗有哪些？
- 如何除錯驗證與權限相關的問題？
- 哪些監控策略有助於防止生產問題？
- 如何在 Azure 中優化應用程式效能？

---

### Chapter 8: Production & Enterprise Patterns (Week 10-11)
**Duration**: 2-3 hours | **Complexity**: ⭐⭐⭐⭐

#### Learning Objectives
- 實作企業級的部署策略
- 設計安全模式與合規框架
- 建立監控、治理與成本管理
- 使用 AZD 整合建立可擴展的 CI/CD 管線
- 套用生產環境容器應用的最佳實務（安全性、監控、成本、CI/CD）

#### Key Concepts to Master
- 企業安全與合規需求
- 治理框架與政策實作
- 進階監控與成本管理
- CI/CD 整合與自動化部署管線
- 容器化工作負載的藍綠與金絲雀部署策略

#### Practical Exercises
1. **Enterprise Security**: Implement comprehensive security patterns
2. **Governance Framework**: Set up Azure Policy and resource management
3. **Advanced Monitoring**: Create dashboards and automated alerting
4. **CI/CD Integration**: Build automated deployment pipelines
5. **Production Container Apps**: Apply security, monitoring, and cost optimization to the [Microservices Architecture](../../../examples/container-app/microservices) example

#### Assessment Questions
- 如何在 AZD 部署中實作企業級安全？
- 哪些治理模式可確保合規與成本控管？
- 如何為生產系統設計可擴展的監控？
- 哪些 CI/CD 模式最適合與 AZD 工作流程搭配？

#### Learning Objectives
- 了解 Azure Developer CLI 的基本概念與核心概念
- 成功在你的開發環境上安裝並配置 azd
- 使用現有範本完成第一次部署
- 瀏覽 azd 專案結構並了解關鍵組件

#### Key Concepts to Master
- 範本、環境與服務
- azure.yaml 的配置結構
- 基本 azd 指令 (init, up, down, deploy)
- 基礎設施即程式碼原則
- Azure 驗證與授權

#### Practice Exercises

**Exercise 1.1: Installation and Setup**
```bash
# 完成這些任務：
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercise 1.2: First Deployment**
```bash
# 部署一個簡單的網頁應用程式：
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
1. azd 架構的三個核心概念是什麼？
2. azure.yaml 檔案的目的為何？
3. 環境如何幫助管理不同的部署目標？
4. azd 可以使用哪些驗證方法？
5. 當你第一次執行 `azd up` 時會發生什麼事？

---

## Progress Tracking and Assessment Framework
```bash
# 建立及設定多個環境：
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
# 實施安全最佳做法:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Self-Assessment Questions
1. azd 如何處理環境變數的先後順序？
2. 什麼是部署 hook，何時應該使用它們？
3. 如何為不同環境配置不同的 SKU？
4. 不同驗證方法的安全性影響為何？
5. 如何管理機密與敏感的配置資料？

### Module 3: Deployment and Provisioning (Week 4)

#### Learning Objectives
- 精通部署工作流程與最佳實務
- 了解使用 Bicep 範本的基礎設施即程式碼
- 實作複雜的多服務架構
- 優化部署效能與可靠性

#### Key Concepts to Master
- Bicep 範本結構與模組
- 資源相依性與排序
- 部署策略（藍綠、滾動更新）
- 多區域部署
- 資料庫遷移與資料管理

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
# 部署微服務架構：
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercise 3.3: Database Integration**
```bash
# 實作資料庫部署模式：
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Self-Assessment Questions
1. 使用 Bicep 相較於 ARM 範本有何優勢？
2. 在 azd 部署中如何處理資料庫遷移？
3. 存在哪些零停機部署的策略？
4. 如何管理服務之間的相依性？
5. 多區域部署需考量哪些因素？

### Module 4: Pre-Deployment Validation (Week 5)

#### Learning Objectives
- 實施全面的部署前檢查
- 精通容量規劃與資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動化驗證管道

#### 應掌握的關鍵概念
- Azure 資源配額與限制
- SKU 選擇準則與成本影響
- 自動化驗證腳本與工具
- 容量規劃方法論
- 效能測試與優化

#### 練習題

**練習 4.1：容量規劃**
```bash
# 實作容量驗證：
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**練習 4.2：部署前驗證**
```powershell
# 建立全面的驗證流程：
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**練習 4.3：SKU 優化**
```bash
# 優化服務配置:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 自我評估問題
1. 哪些因素應影響 SKU 的選擇決策？
2. 在部署前你如何驗證 Azure 資源的可用性？
3. 部署前檢查系統的關鍵組成部分有哪些？
4. 你如何估算並控制部署成本？
5. 哪些監控對容量規劃是必要的？

### 模組 5：疑難排解與偵錯（第 6 週）

#### 學習目標
- 精通系統化的疑難排解方法
- 培養偵錯複雜部署問題的專業技能
- 實施全面的監控與警示
- 建立事件回應與復原程序

#### 應掌握的關鍵概念
- 常見部署失敗模式
- 日誌分析與關聯技術
- 效能監控與優化
- 安全事件偵測與回應
- 災難復原與業務持續性

#### 練習題

**練習 5.1：疑難排解情境**
```bash
# 練習解決常見問題：
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**練習 5.2：監控實作**
```bash
# 設定全面監控：
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**練習 5.3：事件回應**
```bash
# 建立事故應變程序：
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我評估問題
1. 對 azd 部署的系統化疑難排解方法是什麼？
2. 你如何在多個服務與資源間關聯日誌？
3. 哪些監控指標對早期問題偵測最為關鍵？
4. 你如何實施有效的災難復原程序？
5. 事件回應計畫的關鍵組成部分有哪些？

### 模組 6：進階主題與最佳實務（第 7-8 週）

#### 學習目標
- 實作企業級的部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂範本並貢獻社群
- 了解進階安全與合規需求

#### 應掌握的關鍵概念
- CI/CD 管線整合模式
- 自訂範本開發與發佈
- 企業治理與合規
- 進階網路與安全設定
- 效能優化與成本管理

#### 練習題

**練習 6.1：CI/CD 整合**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**練習 6.2：自訂範本開發**
```bash
# 建立並發佈自訂範本:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**練習 6.3：企業實作**
```bash
# 實作企業級功能:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 自我評估問題
1. 你如何將 azd 整合到現有的 CI/CD 工作流程？
2. 自訂範本開發的主要考量是什麼？
3. 你如何在 azd 部署中實施治理與合規？
4. 企業規模部署的最佳實務為何？
5. 你如何有效地為 azd 社群做出貢獻？

## 實作專案

### 專案 1：個人作品集網站
<strong>複雜度</strong>: 初級  
<strong>持續時間</strong>: 1-2 週

使用以下方式建立並部署個人作品集網站：
- 在 Azure Storage 上的靜態網站託管
- 自訂網域設定
- 整合 CDN 以提升全球效能
- 自動化部署管線

<strong>交付項目</strong>:
- 在 Azure 上部署並可運作的網站
- 用於作品集部署的自訂 azd 範本
- 部署流程文件
- 成本分析與優化建議

### 專案 2：任務管理應用程式
<strong>複雜度</strong>: 中階  
<strong>持續時間</strong>: 2-3 週

建立具有下列功能的全端任務管理應用程式：
- React 前端部署到 App Service
- 具有驗證的 Node.js API 後端
- 含遷移的 PostgreSQL 資料庫
- Application Insights 監控

<strong>交付項目</strong>:
- 含使用者驗證的完整應用程式
- 資料庫架構與遷移腳本
- 監控儀表板與警示規則
- 多環境部署設定

### 專案 3：微服務電子商務平台
<strong>複雜度</strong>: 進階  
<strong>持續時間</strong>: 4-6 週

設計並實作一個基於微服務的電子商務平台：
- 多個 API 服務（目錄、訂單、付款、使用者）
- 與 Service Bus 整合的訊息佇列
- 使用 Redis 快取以優化效能
- 全面性的日誌紀錄與監控

<strong>參考範例</strong>：請參閱 [微服務架構](../../../examples/container-app/microservices) 以取得生產就緒的範本與部署指南

<strong>交付項目</strong>:
- 完整的微服務架構
- 服務間通訊模式
- 效能測試與優化
- 生產就緒的安全實作

## 評量與認證

### 知識檢測

在每個模組後完成以下評量：

**模組 1 評量**：基本概念與安裝
- 核心概念的多選題
- 實際的安裝與設定任務
- 簡單的部署練習

**模組 2 評量**：設定與環境
- 環境管理情境
- 設定故障排除練習
- 安全設定實作

**模組 3 評量**：部署與佈建
- 基礎設施設計挑戰
- 多服務部署情境
- 效能優化練習

**模組 4 評量**：部署前驗證
- 容量規劃案例研究
- 成本優化情境
- 驗證管線實作

**模組 5 評量**：疑難排解與偵錯
- 問題診斷練習
- 監控實作任務
- 事件回應模擬

**模組 6 評量**：進階主題
- CI/CD 管線設計
- 自訂範本開發
- 企業架構情境

### 最終整合專案

設計並實作一個能展示所有概念掌握度的完整解決方案：

<strong>需求</strong>:
- 多層次應用程式架構
- 多個部署環境
- 全面的監控與警示
- 安全與合規實作
- 成本優化與效能調校
- 完整文件與 runbooks

<strong>評分標準</strong>:
- 技術實作品質
- 文件完整性
- 安全與最佳實務遵循
- 效能與成本優化
- 疑難排解與監控成效

## 學習資源與參考資料

### 官方文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群資源
- [AZD 範本畫廊](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 倉庫](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure 免費帳戶](https://azure.microsoft.com/free/)
- [Azure DevOps 免費方案](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 其他工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 建議學習進度

### 全職學習（8 週）
- **第 1-2 週**：模組 1-2（快速上手、設定）
- **第 3-4 週**：模組 3-4（部署、部署前）
- **第 5-6 週**：模組 5-6（疑難排解、進階主題）
- **第 7-8 週**：實作專案與最終評估

### 兼職學習（16 週）
- **第 1-4 週**：模組 1（快速上手）
- **第 5-7 週**：模組 2（設定與環境）
- **第 8-10 週**：模組 3（部署與佈建）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（疑難排解與偵錯）
- **第 15-16 週**：模組 6（進階主題與評量）

---

## 進度追蹤與評量框架

### 章節完成檢查清單

使用下列可衡量成果追蹤每章進度：

#### 📚 第 1 章：基礎與快速入門
- [ ] <strong>安裝完成</strong>：已在您的平台安裝並驗證 AZD
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
- [ ] <strong>環境設定</strong>：已配置第一組環境變數
- [ ] <strong>資源導覽</strong>：已在 Azure 入口網站探索部署的資源
- [ ] <strong>指令掌握</strong>：熟悉基本的 AZD 指令

#### 🤖 第 2 章：以 AI 為先的開發
- [ ] **AI 範本部署**：已成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：配置文件索引與檢索
- [ ] <strong>模型設定</strong>：設定多個具不同用途的 AI 模型
- [ ] **AI 監控**：為 AI 工作負載實作 Application Insights
- [ ] <strong>效能優化</strong>：調校 AI 應用效能

#### ⚙️ 第 3 章：設定與驗證
- [ ] <strong>多環境設定</strong>：配置 dev、staging 與 prod 環境
- [ ] <strong>安全實作</strong>：設定 Managed Identity 驗證
- [ ] <strong>機密管理</strong>：整合 Azure Key Vault 管理敏感資料
- [ ] <strong>參數管理</strong>：建立環境專屬配置
- [ ] <strong>驗證掌握</strong>：實作安全的存取模式

#### 🏗️ 第 4 章：基礎設施即程式碼與部署
- [ ] <strong>自訂範本建立</strong>：建立多服務應用程式範本
- [ ] **Bicep 精通**：建立模組化、可重用的基礎設施元件
- [ ] <strong>部署自動化</strong>：實作部署前/後的 hooks
- [ ] <strong>架構設計</strong>：部署複雜的微服務架構
- [ ] <strong>範本優化</strong>：為效能與成本優化範本

#### 🎯 第 5 章：多代理 AI 解決方案
- [ ] <strong>零售解決方案部署</strong>：部署完整的多代理零售情境
- [ ] <strong>代理自訂</strong>：修改客服與庫存代理行為
- [ ] <strong>架構擴充</strong>：實作負載平衡與自動擴充
- [ ] <strong>生產監控</strong>：建立全面的監控與警示
- [ ] <strong>效能調校</strong>：優化多代理系統效能

#### 🔍 第 6 章：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用所需的資源
- [ ] **SKU 優化**：選擇具成本效益的服務等級
- [ ] <strong>驗證自動化</strong>：實作部署前檢查腳本
- [ ] <strong>成本規劃</strong>：建立部署成本估算與預算
- [ ] <strong>風險評估</strong>：辨識並緩解部署風險

#### 🚨 第 7 章：疑難排解與偵錯
- [ ] <strong>診斷技能</strong>：成功偵錯故意破壞的部署
- [ ] <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
- [ ] <strong>效能調校</strong>：優化效能不佳的應用程式
- [ ] <strong>復原程序</strong>：實作備份與災難復原
- [ ] <strong>監控設定</strong>：建立主動式監控與警示

#### 🏢 第 8 章：生產環境與企業實務
- [ ] <strong>企業安全</strong>：實作完整的安全模式
- [ ] <strong>治理框架</strong>：設定 Azure Policy 與資源管理
- [ ] <strong>進階監控</strong>：建立儀表板與自動化警示
- [ ] **CI/CD 整合**：建立自動化部署管線
- [ ] <strong>合規實作</strong>：符合企業合規需求

### 學習時程與里程碑

#### 第 1-2 週：基礎建立
- <strong>里程碑</strong>：使用 AZD 部署第一個 AI 應用
- <strong>驗證</strong>：可透過公開 URL 存取的運作應用
- <strong>技能</strong>：基本 AZD 工作流程與 AI 服務整合

#### 第 3-4 週：設定精通
- <strong>里程碑</strong>：具安全驗證的多環境部署
- <strong>驗證</strong>：同一應用已部署到 dev/staging/prod
- <strong>技能</strong>：環境管理與安全實作

#### 第 5-6 週：基礎設施專業
- <strong>里程碑</strong>：為複雜多服務應用建立自訂範本
- <strong>驗證</strong>：其他團隊成員能部署並重用該範本
- <strong>技能</strong>：Bicep 精通與基礎設施自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：生產就緒的多代理 AI 解決方案
- <strong>驗證</strong>：系統能處理實際負載並具監控
- <strong>技能</strong>：多代理協調與效能優化

#### 第 9-10 週：生產準備
- <strong>里程碑</strong>：具完整合規的企業級部署
- <strong>驗證</strong>：通過安全審查與成本優化稽核
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評量與認證

#### 知識驗證方法
1. <strong>實務部署</strong>：各章節的運作應用
2. <strong>程式碼審查</strong>：範本與設定品質評估
3. <strong>問題解決</strong>：疑難排解情境與解法
4. <strong>同儕教學</strong>：向其他學習者說明概念
5. <strong>社群貢獻</strong>：分享範本或改進案

#### 職業發展成果
- <strong>作品集專案</strong>: 8 個可投入生產的部署
- <strong>技術能力</strong>: Industry-standard AZD and AI deployment expertise
- <strong>問題解決能力</strong>: 獨立故障排除與最佳化
- <strong>社群認可</strong>: 積極參與 Azure 開發者社群
- <strong>職涯晉升</strong>: 技能可直接應用於雲端與 AI 職務

#### 成功指標
- <strong>部署成功率</strong>: >95% 成功部署
- <strong>故障排除時間</strong>: <30 分鐘解決常見問題
- <strong>效能最佳化</strong>: 在成本與效能上有可展示的改善
- <strong>安全合規</strong>: 所有部署皆符合企業安全標準
- <strong>知識傳承</strong>: 能夠指導其他開發者

### 持續學習與社群參與

#### 緊貼最新動態
- **Azure Updates**: Follow Azure Developer CLI release notes
- <strong>社群活動</strong>: 參與 Azure 與 AI 的開發者活動
- <strong>文件</strong>: 為社群文件與範例做出貢獻
- <strong>回饋機制</strong>: 就課程內容與 Azure 服務提供回饋

#### 職涯發展
- <strong>專業人脈</strong>: 與 Azure 及 AI 專家建立連繫
- <strong>演講機會</strong>: 在會議或聚會分享所學
- <strong>開源貢獻</strong>: 為 AZD 範本與工具做出貢獻
- <strong>指導</strong>: 在 AZD 的學習旅程中協助其他開發者

---

**章節導覽:**
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 開始學習**: [第 1 章：基礎與快速上手](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: 透過完整的 8 章學習系統追蹤你的進展
- **🤝 社群**: 在 [Azure Discord](https://discord.gg/microsoft-azure) 尋求支援與討論

<strong>學習進度追蹤</strong>: 使用此結構化指南，透過循序漸進且實務導向的學習掌握 Azure Developer CLI，並獲得可衡量的成果與專業發展效益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的原文應視為具權威性的版本。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而導致的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->