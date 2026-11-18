# 學習指南 - 全面學習目標

<strong>學習路徑導航</strong>
- **📚 課程首頁**: [AZD 新手入門](../README.md)
- **📖 開始學習**: [第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: [課程完成狀況](../README.md#-course-completion--certification)

## 簡介

本全面學習指南提供結構化的學習目標、核心概念、實作練習及評量素材，協助您精通 Azure Developer CLI（azd）。使用此指南追蹤您的進度，確保您已涵蓋所有重要主題。

## 學習目標

完成本學習指南後，您將能夠：
- 掌握 Azure Developer CLI 的所有基本及進階概念
- 發展部署及管理 Azure 應用程式的實務技能
- 培養故障排除及部署優化的信心
- 理解生產就緒的部署實務與安全考量

## 學習成果

完成本指南所有章節後，您將能夠：
- 使用 azd 設計、部署及管理完整的應用程式架構
- 實施全面的監控、安全及成本優化策略
- 獨立故障排除複雜部署問題
- 創建自訂範本並貢獻於 azd 社群

## 八章學習架構

### 第一章：基礎與快速入門（第 1 週）
<strong>時長</strong>：30-45 分鐘 | <strong>難度</strong>：⭐

#### 學習目標
- 了解 Azure Developer CLI 的核心概念與專有名詞
- 成功安裝及設定 AZD 開發平台
- 使用現有範本部署第一個應用程式
- 有效操作 AZD 指令列介面

#### 需要掌握的核心概念
- AZD 專案結構與組件（azure.yaml、infra/、src/）
- 基於範本的部署工作流程
- 環境設定基礎
- 資源群組及訂閱管理

#### 實務演練
1. <strong>安裝驗證</strong>：安裝 AZD 並使用 `azd version` 驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設置</strong>：配置第一組環境變數
4. <strong>資源探索</strong>：於 Azure 入口網站瀏覽已部署的資源

#### 評量問題
- AZD 專案的核心組件有哪些？
- 如何從範本初始化新專案？
- `azd up` 與 `azd deploy` 有何不同？
- 如何以 AZD 管理多個環境？

---

### 第二章：AI 優先開發（第 2 週）
<strong>時長</strong>：4-5 小時含工作坊 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 整合 Microsoft Foundry 服務與 AZD 工作流程
- 使用 GA `microsoft.foundry` 套件及 AZD 1.37.0 以上版本進行託管代理開發
- 部署與設定 AI 驅動的應用程式
- 了解 RAG（檢索增強生成）實作模式
- 管理 AI 模型部署與擴充

#### 需要掌握的核心概念
- Microsoft Foundry 模型服務整合與 API 管理
- AI 搜尋設定與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化
- 本地代理檢查器對比雲端追蹤、原始碼部署及版本控制中的評估資產

#### 實務演練
1. **AI 聊天部署**：部署 azure-search-openai-demo 範本
2. **RAG 實作**：配置文件索引與檢索
3. <strong>模型設定</strong>：建立多個目的不同的 AI 模型
4. **AI 監控**：為 AI 工作負載實施 Application Insights
5. **GA 託管代理**：跟隨 [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga)；比較本地和雲端回應，檢視評估結果，並確認清理負責權

#### 評量問題
- 如何在 AZD 範本中配置 Microsoft Foundry 模型服務？
- RAG 架構的關鍵組件有哪些？
- 如何管理 AI 模型容量與擴充？
- AI 應用重要的監控指標有哪些？
- `microsoft.foundry` 包含哪些擴充，為何評估功能需另行安裝？
- 為何本地代理測試仍會產生 Azure 模型費用？
- 重用既有 Foundry 專案時，`azd down` 會遺留什麼？

---

### 第三章：設定與認證（第 3 週）
<strong>時長</strong>：45-60 分鐘 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 掌握環境設定與管理策略
- 實施安全認證模式及管理身分
- 使用適當命名規則進行資源組織
- 配置多環境部署（開發、測試、正式）

#### 需要掌握的核心概念
- 環境階層與設定優先權
- 管理身分與服務主體認證
- 使用 Key Vault 管理祕密資訊
- 環境專屬參數管理

#### 實務演練
1. <strong>多環境設置</strong>：配置開發、測試與正式環境
2. <strong>安全配置</strong>：實施管理身分認證
3. <strong>祕密管理</strong>：整合 Azure Key Vault 管理敏感資料
4. <strong>參數管理</strong>：建立環境專屬設定

#### 評量問題
- 如何使用 AZD 配置不同環境？
- 管理身分較服務主體有何優勢？
- 如何安全地管理應用祕密？
- AZD 的設定階層為何？

---

### 第四章：基礎設施即程式碼與部署（第 4-5 週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐⭐

#### 學習目標
- 創建及自訂 Bicep 基礎設施範本
- 實施進階部署模式與工作流程
- 了解資源配置策略
- 設計可擴充的多服務架構

- 使用 Azure Container Apps 及 AZD 部署容器化應用程式


#### 需要掌握的核心概念
- Bicep 範本結構與最佳實踐
- 資源依賴性與部署順序
- 參數檔與範本模組化
- 自訂掛鉤與部署自動化
- 容器應用部署模式（快速入門、生產、微服務）

#### 實務演練
1. <strong>自訂範本建立</strong>：構建多服務應用範本
2. **Bicep 專精**：建立模組化且可重用的基礎設施元件
3. <strong>部署自動化</strong>：實施部署前後掛鉤
4. <strong>架構設計</strong>：部署複雜微服務架構
5. <strong>容器應用部署</strong>：使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 及 [Microservices Architecture](../../../examples/container-app/microservices) 範例

#### 評量問題
- 如何為 AZD 創建自訂 Bicep 範本？
- 組織基礎設施代碼的最佳實踐為何？
- 如何處理範本中的資源依賴關係？
- 哪些部署模式支援零停機時間更新？

---

### 第五章：多代理 AI 解決方案（第 6-7 週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 設計與實作多代理 AI 架構
- 協調代理間的溝通與合作
- 部署具生產就緒的 AI 解決方案並監控
- 理解代理專精與工作流程模式
- 整合容器化微服務作為多代理解決方案的一部分

#### 需要掌握的核心概念
- 多代理架構模式與設計原則
- 代理通訊協定與資料流
- AI 代理的負載均衡與擴展策略
- 多代理系統的生產監控
- 容器化環境中的服務間通訊

#### 實務演練
1. <strong>零售架構檢視</strong>：分析零售藍圖，辨識部署前必須實現的應用元件
2. <strong>代理客製化</strong>：修改客戶與庫存代理行為
3. <strong>架構擴充</strong>：實施負載均衡與自動擴展
4. <strong>生產監控</strong>：建立全面監控及警示系統
5. <strong>微服務整合</strong>：擴充 [Microservices Architecture](../../../examples/container-app/microservices) 範例以支援代理工作流程

#### 評量問題
- 如何設計有效的多代理通訊模式？
- AI 代理工作負載擴展的關鍵考量是什麼？
- 如何監控與除錯多代理 AI 系統？
- 哪些生產模式可確保 AI 代理的可靠性？

---

### 第六章：部署前驗證與規劃（第 8 週）
<strong>時長</strong>：1 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 執行全面容量規劃與資源驗證
- 選擇具成本效益的 Azure SKU
- 實施自動化的預飛行檢查與驗證
- 以成本優化策略規劃部署

#### 需要掌握的核心概念
- Azure 資源配額與容量限制
- SKU 選擇準則與成本優化
- 自動化驗證腳本與測試
- 部署計劃與風險評估

#### 實務演練
1. <strong>容量分析</strong>：分析應用程式的資源需求
2. **SKU 優化**：比較並選擇成本效益最高的服務階層
3. <strong>驗證自動化</strong>：實施部署前檢查腳本
4. <strong>成本規劃</strong>：製作部署成本估算與預算

#### 評量問題
- 如何在部署前驗證 Azure 容量？
- 哪些因素影響 SKU 的選擇決策？
- 如何自動化部署前驗證？
- 什麼策略有助優化部署成本？

---

### 第七章：疑難排解與除錯（第 9 週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 發展系統化的 AZD 部署除錯方法
- 解決常見部署與設定問題
- 除錯 AI 特定問題及效能瓶頸
- 實施監控與警示以主動發現問題

#### 需要掌握的核心概念
- 診斷技巧與日誌策略
- 常見故障模式與解決方案
- 效能監控與優化
- 事件響應與復原程序

#### 實務演練
1. <strong>診斷技能</strong>：練習故意損壞的部署
2. <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
3. <strong>效能調校</strong>：優化執行緩慢的應用程式
4. <strong>復原程序</strong>：實施備份與災難復原

#### 評量問題
- AZD 部署最常見的失敗原因有哪些？
- 如何除錯認證與權限問題？
- 哪些監控策略可協助預防生產問題？
- 如何優化 Azure 中的應用程式效能？

---

### 第八章：生產與企業模式（第 10-11 週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 實施企業級部署策略
- 設計安全模式與合規框架
- 建立監控、治理與成本管理
- 創建具 AZD 整合的可擴充 CI/CD 管線
- 應用生產容器應用部署的最佳實務（安全、監控、成本、CI/CD）

#### 需要掌握的核心概念
- 企業安全與合規需求
- 治理框架與政策實施
- 進階監控與成本管理
- CI/CD 整合與自動部署管線
- 藍綠部署與金絲雀部署策略於容器化工作負載

#### 實務演練
1. <strong>企業安全</strong>：實施全面的安全模式
2. <strong>治理框架</strong>：設定 Azure Policy 與資源管理
3. <strong>進階監控</strong>：建立儀表板及自動警示
4. **CI/CD 整合**：建立自動部署管線
5. <strong>生產容器應用</strong>：為 [Microservices Architecture](../../../examples/container-app/microservices) 範例應用安全、監控與成本優化

#### 評量問題
- 如何在 AZD 部署中實施企業安全？
- 哪些治理模式能保證合規與成本控管？
- 如何設計可擴充的生產監控系統？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 了解 Azure Developer CLI 的基本與核心概念
- 成功於開發環境安裝與設定 azd
- 使用現有範本完成首次部署
- 瀏覽 azd 專案結構並理解關鍵組件

#### 需要掌握的核心概念
- 範本、環境及服務
- azure.yaml 的設定結構
- 基本 azd 指令（init、up、down、deploy）
- 基礎設施即程式碼原則
- Azure 認證與授權

#### 實作練習

**練習 1.1：安裝與設定**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**練習 1.2：首次部署**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**練習 1.3：專案結構分析**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### 自我評量問題
1. azd 架構的三大核心概念是什麼？
2. azure.yaml 檔案的用途為何？
3. 環境如何幫助管理不同的部署目標？
4. azd 可使用哪些認證方式？
5. 初次執行 `azd up` 時會發生什麼事？

---

## 進度追蹤與評量架構
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**練習 2.2：進階設定**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**練習 2.3：安全設定**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我評量問題
1. azd 如何處理環境變數優先權？
2. 什麼是部署掛鉤，何時應該使用？
3. 如何為不同環境配置不同 SKU？
4. 不同認證方式的安全性考量？
5. 如何管理祕密及敏感設定資料？

### 模組三：部署與配置（第 4 週）

#### 學習目標
- 熟練部署工作流程與最佳實踐
- 了解使用 Bicep 範本的基礎設施即程式碼
- 實作複雜多服務架構
- 優化部署效能與可靠性

#### 需要掌握的核心概念
- Bicep 範本結構與模組
- 資源依賴與順序
- 部署策略（藍綠部署、滾動更新）
- 多區域部署
- 資料庫遷移與資料管理

#### 實作練習

**練習 3.1：自訂基礎架構**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**練習 3.2：多服務應用程式**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**練習 3.3：資料庫整合**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我評估問題
1. 使用 Bicep 相較於 ARM 範本的優點是什麼？
2. 你如何在 azd 部署中處理資料庫遷移？
3. 存在哪些零停機時間部署的策略？
4. 你如何管理服務之間的相依性？
5. 多區域部署要考慮哪些事項？

### 模組 4：部署前驗證（第 5 週）

#### 學習目標
- 實作全面的部署前檢查
- 掌握容量規劃與資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動化驗證流水線

#### 需掌握的核心概念
- Azure 資源配額與限制
- SKU 選擇標準及相關成本影響
- 自動化驗證腳本與工具
- 容量規劃方法論
- 效能測試與優化

#### 練習

**練習 4.1：容量規劃**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**練習 4.2：預檢驗**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**練習 4.3：SKU 優化**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 自我評估問題
1. SKU 選擇決策應受哪些因素影響？
2. 你如何在部署前驗證 Azure 資源可用性？
3. 預檢驗系統的關鍵組成是什麼？
4. 如何估算和控制部署成本？
5. 容量規劃需要什麼監控？

### 模組 5：故障排除與除錯（第 6 週）

#### 學習目標
- 精通系統化故障排除方法
- 掌握複雜部署問題的除錯專業技巧
- 實施全面的監控與警報
- 建立事件回應及復原程序

#### 需掌握的核心概念
- 常見部署失敗模式
- 日誌分析與關聯技術
- 效能監控與優化
- 安全事件偵測與回應
- 災難復原與業務持續性

#### 練習

**練習 5.1：故障排除情境**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**練習 5.2：監控實作**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**練習 5.3：事件回應**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我評估問題
1. 對 azd 部署，系統化故障排除的做法是什麼？
2. 如何將來自多服務與資源的日誌進行關聯？
3. 哪些監控指標對於早期問題偵測最關鍵？
4. 如何實施有效的災難復原程序？
5. 事件回應計畫的主要組成部分是什麼？

### 模組 6：進階主題與最佳實務（第 7-8 週）

#### 學習目標
- 實施企業級部署模式
- 掌握 CI/CD 整合與自動化
- 開發自訂範本並貢獻社區
- 了解進階安全與合規需求

#### 需掌握的核心概念
- CI/CD 流水線整合模式
- 自訂範本開發與發行
- 企業治理與合規
- 進階網路與安全設定
- 效能優化與成本管理

#### 練習

**練習 6.1：CI/CD 整合**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**練習 6.2：自訂範本開發**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**練習 6.3：企業實作**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 自我評估問題
1. 如何將 azd 整合進現有的 CI/CD 流程？
2. 自訂範本開發的主要考量是什麼？
3. 如何在 azd 部署中實施治理和合規？
4. 企業級部署的最佳實務有哪些？
5. 如何有效貢獻於 azd 社群？

## 實務專案

### 專案 1：個人作品集網站
<strong>複雜度</strong>：初級  
<strong>時間長度</strong>：1-2 週

使用以下技術建立並部署個人作品集網站：
- Azure Storage 靜態網站託管
- 自訂網域設定
- CDN 整合以提升全球效能
- 自動化部署流水線

<strong>交付成果</strong>：
- 已部署並可運作的網站
- 用於作品集部署的自訂 azd 範本
- 部署流程文件
- 成本分析與優化建議

### 專案 2：任務管理應用程式
<strong>複雜度</strong>：中級  
<strong>時間長度</strong>：2-3 週

建立一個全端任務管理應用程式，包含：
- React 前端部署至 App Service
- 具有認證功能的 Node.js API 後端
- 使用 PostgreSQL 的資料庫及遷移
- Application Insights 監控

<strong>交付成果</strong>：
- 完整具有使用者認證的應用程式
- 資料庫結構與遷移腳本
- 監控儀表板及警報規則
- 多環境部署設定

### 專案 3：微服務電子商務平台
<strong>複雜度</strong>：進階  
<strong>時間長度</strong>：4-6 週

設計並實作基於微服務的電子商務平台：
- 多個 API 服務（目錄、訂單、支付、使用者）
- 使用 Service Bus 的訊息佇列整合
- 使用 Redis 快取以優化效能
- 完整日誌記錄與監控

<strong>參考範例</strong>：請參閱 [Microservices Architecture](../../../examples/container-app/microservices) 的兩服務學習範例與部署指南。佇列、持久化、認證、付款處理及生產硬化為獨立專案作業。

<strong>交付成果</strong>：
- 完整微服務架構
- 服務間通訊模式
- 效能測試與優化
- 生產就緒的安全實作

## 評量與認證

### 知識檢測

完成每個模組後進行下列評量：

**模組 1 評量**：基礎概念與安裝
- 核心概念選擇題
- 實際安裝與配置任務
- 簡單部署練習

**模組 2 評量**：配置與環境
- 環境管理情境
- 配置故障排除練習
- 安全配置實作

**模組 3 評量**：部署與佈建
- 基礎架構設計挑戰
- 多服務部署情境
- 效能優化練習

**模組 4 評量**：部署前驗證
- 容量規劃案例研究
- 成本優化情境
- 驗證流水線實作

**模組 5 評量**：故障排除與除錯
- 問題診斷練習
- 監控實作任務
- 事件回應模擬

**模組 6 評量**：進階主題
- CI/CD 流水線設計
- 自訂範本開發
- 企業架構情境

### 最終專題

設計並實作展現所有概念掌握的完整解決方案：

<strong>需求</strong>：
- 多層應用程式架構
- 多個部署環境
- 完整監控與警報
- 安全與合規實作
- 成本優化與效能調校
- 完整文件與操作手冊

<strong>評估標準</strong>：
- 技術實作品質
- 文件完整性
- 安全與最佳實務遵循
- 效能與成本優化
- 故障排除與監控成效

## 學習資源與參考

### 官方文件
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群資源
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 額外工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習計畫建議

### 全職學習（8 週）
- **第 1-2 週**：模組 1-2（入門、配置）
- **第 3-4 週**：模組 3-4（部署、部署前驗證）
- **第 5-6 週**：模組 5-6（故障排除、進階主題）
- **第 7-8 週**：實務專案與最終評量

### 兼職學習（16 週）
- **第 1-4 週**：模組 1（入門）
- **第 5-7 週**：模組 2（配置與環境）
- **第 8-10 週**：模組 3（部署與佈建）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（故障排除與除錯）
- **第 15-16 週**：模組 6（進階主題與評量）

---

## 進度追踪與評量架構

### 章節完成檢查表

使用這些可衡量的成果追蹤各章學習進度：

#### 📚 第 1 章：基礎與快速入門
- [ ] <strong>安裝完成</strong>：在你的平台上安裝並驗證 AZD
- [ ] <strong>初次部署</strong>：成功部署 todo-nodejs-mongo 範本
- [ ] <strong>環境設定</strong>：設置第一組環境變數
- [ ] <strong>資源瀏覽</strong>：在 Azure 入口網站瀏覽已部署資源
- [ ] <strong>指令精通</strong>：熟悉基本的 AZD 命令

#### 🤖 第 2 章：以 AI 為先的開發  
- [ ] **AI 範本部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：設定文件索引與檢索
- [ ] <strong>模型配置</strong>：設置多種具有不同用途的 AI 模型
- [ ] **AI 監控**：為 AI 工作負載實施 Application Insights
- [ ] <strong>效能優化</strong>：調整 AI 應用效能

#### ⚙️ 第 3 章：配置與認證
- [ ] <strong>多環境設定</strong>：設定 dev、staging、prod 環境
- [ ] <strong>安全實作</strong>：設置 Managed Identity 認證
- [ ] <strong>機密管理</strong>：整合 Azure Key Vault 管理敏感資料
- [ ] <strong>參數管理</strong>：製作環境專屬配置
- [ ] <strong>認證精通</strong>：實施安全存取模式

#### 🏗️ 第 4 章：基礎架構即程式碼與部署
- [ ] <strong>自訂範本製作</strong>：建立多服務應用程式範本
- [ ] **Bicep 精通**：製作模組化、可重用基礎架構元件
- [ ] <strong>部署自動化</strong>：實施部署前後掛勾
- [ ] <strong>架構設計</strong>：部署複雜微服務架構
- [ ] <strong>範本優化</strong>：優化範本的效能與成本

#### 🎯 第 5 章：多代理 AI 解決方案
- [ ] <strong>零售架構檢閱</strong>：識別缺失的應用元件，並規劃其實作與驗證
- [ ] <strong>代理客製化</strong>：修改客戶與庫存代理的行為
- [ ] <strong>架構擴充</strong>：實施負載平衡與自動擴充
- [ ] <strong>生產監控</strong>：建立完整監控與警報系統
- [ ] <strong>效能調校</strong>：優化多代理系統效能

#### 🔍 第 6 章：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用資源需求
- [ ] **SKU 優化**：選擇具成本效益的服務等級
- [ ] <strong>自動驗證</strong>：實作部署前檢查腳本
- [ ] <strong>成本規劃</strong>：製作部署成本估算與預算
- [ ] <strong>風險評估</strong>：識別並降低部署風險

#### 🚨 第 7 章：故障排除與除錯
- [ ] <strong>診斷技能</strong>：成功除錯故意造成的錯誤部署
- [ ] <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
- [ ] <strong>效能調校</strong>：優化執行緩慢的應用程式
- [ ] <strong>復原程序</strong>：實施備份與災難復原
- [ ] <strong>監控設置</strong>：建立主動監控與警報

#### 🏢 第 8 章：生產環境與企業模式
- [ ] <strong>企業安全</strong>：實施全面安全模式
- [ ] <strong>治理架構</strong>：設定 Azure Policy 及資源管理
- [ ] <strong>進階監控</strong>：建立儀表板與自動警報
- [ ] **CI/CD 整合**：建立自動化部署流水線
- [ ] <strong>合規實作</strong>：符合企業合規需求

### 學習時程與里程碑

#### 第 1-2 週：基礎建置
- <strong>里程碑</strong>：使用 AZD 部署首個 AI 應用
- <strong>驗證</strong>：透過公開 URL 存取的工作應用
- <strong>技能</strong>：基本 AZD 工作流程與 AI 服務整合

#### 第 3-4 週：配置精通
- <strong>里程碑</strong>：多環境部署與安全認證
- <strong>驗證</strong>：同一應用部署於 dev/staging/prod
- <strong>技能</strong>：環境管理與安全實施

#### 第 5-6 週：基礎架構專業
- <strong>里程碑</strong>：複雜多服務應用的自訂範本
- <strong>驗證</strong>：由他組成員部署的可重用範本
- <strong>技能</strong>：Bicep 精通與基礎架構自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：生產就緒的多代理 AI 解決方案
- <strong>驗證</strong>：可監控真實負載的系統
- <strong>技能</strong>：多代理協調與效能優化

#### 第 9-10 週：生產準備
- <strong>里程碑</strong>：企業級部署並符合完整合規
- <strong>驗證</strong>：通過安全審查及成本優化稽核
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評量與認證

#### 知識驗證方式
1. <strong>實際部署</strong>：每章節的實際應用程式
2. <strong>程式碼審查</strong>：範本與設定品質評估
3. <strong>問題解決</strong>：疑難排解情境與解決方案
4. <strong>同儕教學</strong>：向其他學習者解釋概念
5. <strong>社群貢獻</strong>：分享範本或改進

#### 專業發展成果
- <strong>作品集專案</strong>：學習部署及架構練習；正式投產需另行實作與審查
- <strong>技術技能</strong>：業界標準的 AZD 及 AI 部署專業知識
- <strong>問題解決能力</strong>：獨立排解與優化能力
- <strong>社群認可</strong>：積極參與 Azure 開發者社群
- <strong>職涯提升</strong>：技能直接適用於雲端與 AI 相關職務

#### 成功指標
- <strong>部署成功率</strong>：>95% 成功部署
- <strong>疑難排解時間</strong>：常見問題少於 30 分鐘解決
- <strong>效能優化</strong>：明顯成本及效能改善
- <strong>安全審查</strong>：記錄控管措施及與組織需求的差距；完成課程不代表合規認證
- <strong>知識傳承</strong>：具備指導其他開發者能力

### 持續學習與社群參與

#### 保持最新
- **Azure 更新**：關注 Azure Developer CLI 版本說明
- <strong>社群活動</strong>：參加 Azure 及 AI 開發者活動
- <strong>文件貢獻</strong>：參與社群文件與範例貢獻
- <strong>反饋機制</strong>：針對課程內容及 Azure 服務提供反饋

#### 職涯發展
- <strong>專業網絡</strong>：連結 Azure 與 AI 專家
- <strong>講演機會</strong>：於研討會或聚會分享所學
- <strong>開源貢獻</strong>：為 AZD 範本與工具貢獻力量
- <strong>指導他人</strong>：引導其他開發者學習 AZD

---

**章節導覽：**
- **📚 課程首頁**： [AZD For Beginners](../README.md)
- **📖 開始學習**： [第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：透過完整八章學習系統追蹤您的進展
- **🤝 社群**： [Azure Discord](https://discord.gg/microsoft-azure) 取得協助與討論

<strong>學習進度追蹤</strong>：使用此結構化指南逐步掌握 Azure Developer CLI，透過實務學習達成具體成果與專業發展利益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->