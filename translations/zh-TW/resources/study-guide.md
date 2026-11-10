# 學習指南 - 全面學習目標

<strong>學習路徑導航</strong>
- **📚 課程首頁**：[初學者的 AZD](../README.md)
- **📖 開始學習**：[第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：[課程完成度](../README.md#-course-completion--certification)

## 介紹

本全面學習指南提供結構化的學習目標、關鍵概念、實作練習及評量材料，協助您精通 Azure Developer CLI (azd)。使用此指南追蹤您的學習進度，確保涵蓋所有重要主題。

## 學習目標

完成本指南後，您將能夠：
- 精通 Azure Developer CLI 的所有基本與進階概念
- 培養部署與管理 Azure 應用程式的實務技能
- 建立疑難排解與優化部署的信心
- 理解適合生產環境的部署實務與安全性考量

## 學習成果

完成本指南所有章節後，您將能夠：
- 使用 azd 設計、部署及管理完整的應用架構
- 實作全面的監控、安全性與成本優化策略
- 獨立排解複雜的部署問題
- 建立自訂範本並為 azd 社群做出貢獻

## 八章學習架構

### 第 1 章：基礎與快速入門（第 1 週）
<strong>時長</strong>：30-45 分鐘 | <strong>難度</strong>：⭐

#### 學習目標
- 理解 Azure Developer CLI 核心概念與術語
- 成功安裝並設定 AZD 在您的開發平台上
- 使用現有範本部署您的第一個應用程式
- 有效操作 AZD 指令列介面

#### 關鍵概念精通
- AZD 專案結構與組成元件（azure.yaml、infra/、src/）
- 以範本為基礎的部署工作流程
- 環境配置基礎
- 資源群組與訂閱管理

#### 實作練習
1. <strong>安裝驗證</strong>：安裝 AZD 並使用 `azd version` 驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設定</strong>：配置您的第一組環境變數
4. <strong>資源探索</strong>：在 Azure 入口網站中瀏覽已部署資源

#### 評量問題
- AZD 專案的核心組成元件有哪些？
- 如何從範本初始化新專案？
- `azd up` 與 `azd deploy` 有什麼差異？
- 如何使用 AZD 管理多個環境？

---

### 第 2 章：AI-第一開發（第 2 週）
<strong>時長</strong>：1-2 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 融合 Microsoft Foundry 服務於 AZD 工作流程中
- 部署並設定 AI 支援的應用程式
- 理解 RAG（檢索增強生成）實作模式
- 管理 AI 模型部署與擴展

#### 關鍵概念精通
- Microsoft Foundry Models 服務整合與 API 管理
- AI 搜尋配置與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化

#### 實作練習
1. **AI 聊天部署**：部署 azure-search-openai-demo 範本
2. **RAG 實作**：配置文件索引與檢索
3. <strong>模型配置</strong>：設定多個不同用途 AI 模型
4. **AI 監控**：為 AI 工作負載實作 Application Insights

#### 評量問題
- 如何在 AZD 範本中配置 Microsoft Foundry Models 服務？
- RAG 架構的關鍵組成元件有哪些？
- 如何管理 AI 模型容量與擴展？
- AI 應用的重要監控指標有哪些？

---

### 第 3 章：配置與驗證身分（第 3 週）
<strong>時長</strong>：45-60 分鐘 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 精通環境配置與管理策略
- 實作安全驗證模式與託管身分
- 使用適當命名慣例組織資源
- 配置多環境部署（開發、預備、正式）

#### 關鍵概念精通
- 環境階層與配置優先權
- 託管身分與服務主體驗證
- Key Vault 整合以管理機密
- 特定環境參數管理

#### 實作練習
1. <strong>多環境設置</strong>：配置開發、預備及正式環境
2. <strong>安全配置</strong>：實作託管身分驗證
3. <strong>機密管理</strong>：整合 Azure Key Vault 管理敏感資料
4. <strong>參數管理</strong>：建立環境特定的配置

#### 評量問題
- 如何在 AZD 中配置不同環境？
- 使用託管身分比用服務主體有何優點？
- 如何安全地管理應用程式機密？
- AZD 的配置階層是什麼？

---

### 第 4 章：基礎建設即代碼與部署（第 4-5 週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐⭐

#### 學習目標
- 建立並客製 Bicep 基礎建設範本
- 實作進階部署模式與工作流程
- 理解資源配置策略
- 設計具擴展性的多服務架構

- 使用 Azure 容器應用及 AZD 部署容器化應用程式


#### 關鍵概念精通
- Bicep 範本結構與最佳實踐
- 資源依賴性與部署順序
- 參數檔與範本模組化
- 自訂鉤子與部署自動化
- 容器應用部署模式（快速入門、正式環境、微服務）

#### 實作練習
1. <strong>自訂範本建立</strong>：建置多服務應用程式範本
2. **Bicep 精通**：建立模組化、可重用的基礎建設元件
3. <strong>部署自動化</strong>：實作部署前後鉤子
4. <strong>架構設計</strong>：部署複雜微服務架構
5. <strong>容器應用部署</strong>：使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 和 [Microservices Architecture](../../../examples/container-app/microservices) 範例

#### 評量問題
- 如何為 AZD 建立自訂 Bicep 範本？
- 組織基礎建設程式碼的最佳實踐為何？
- 如何處理範本中資源的依賴性？
- 哪些部署模式支持零停機更新？

---

### 第 5 章：多代理 AI 解決方案（第 6-7 週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 設計與實作多代理 AI 架構
- 編排代理協調與通訊
- 部署具生產準備的 AI 解決方案並進行監控
- 理解代理專業分工與工作流程模式
- 整合容器化微服務為多代理解決方案的一部分

#### 關鍵概念精通
- 多代理架構模式與設計原則
- 代理通訊協定與資料流程
- AI 代理的負載平衡與擴展策略
- 多代理系統的生產監控
- 容器化環境中的服務間通訊

#### 實作練習
1. <strong>零售架構檢視</strong>：分析零售藍圖並辨識部署前必須實作的應用元件
2. <strong>代理客製化</strong>：修改客戶與庫存代理行為
3. <strong>架構擴展</strong>：實作負載平衡與自動擴展
4. <strong>生產監控</strong>：建立全面監控與警示系統
5. <strong>微服務整合</strong>：擴展 [Microservices Architecture](../../../examples/container-app/microservices) 範例以支援基於代理的工作流程

#### 評量問題
- 如何設計有效的多代理通訊模式？
- 擴展 AI 代理工作負載的主要考量為何？
- 如何監控與偵錯多代理 AI 系統？
- 保障 AI 代理可靠性的生產模式有哪些？

---

### 第 6 章：部署前驗證與規劃（第 8 週）
<strong>時長</strong>：1 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 執行全面的容量規劃與資源驗證
- 選擇具有成本效益的最佳 Azure SKU
- 實作自動化預檢查與驗證
- 規劃具成本優化策略的部署

#### 關鍵概念精通
- Azure 資源配額與容量限制
- SKU 選擇標準與成本優化
- 自動化驗證腳本與測試
- 部署規劃與風險評估

#### 實作練習
1. <strong>容量分析</strong>：分析應用程式資源需求
2. **SKU 優化**：比較並選擇具成本效益的服務階層
3. <strong>驗證自動化</strong>：實作部署前檢查腳本
4. <strong>成本規劃</strong>：建立部署成本估算與預算

#### 評量問題
- 如何在部署前驗證 Azure 容量？
- 影響 SKU 選擇決策的因素有哪些？
- 如何自動化部署前驗證？
- 哪些策略有助於優化部署成本？

---

### 第 7 章：疑難排解與偵錯（第 9 週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 發展 AZD 部署的系統化偵錯方法
- 解決常見部署與配置問題
- 偵錯 AI 特定問題與效能問題
- 實作監控與警示以提前偵測問題

#### 關鍵概念精通
- 診斷技巧與日誌策略
- 常見失敗模式及其解決方案
- 效能監控與優化
- 事件回應與復原程序

#### 實作練習
1. <strong>診斷技巧</strong>：練習在故意失敗的部署環境中排錯
2. <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
3. <strong>效能調整</strong>：優化效能緩慢的應用程式
4. <strong>復原程序</strong>：實作備份與災難復原

#### 評量問題
- AZD 部署中最常見的失敗有哪些？
- 如何偵錯認證與權限問題？
- 哪些監控策略有助於防止生產問題？
- 如何優化 Azure 中的應用程式效能？

---

### 第 8 章：生產與企業模式（第 10-11 週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 實作企業級部署策略
- 設計安全模式與合規框架
- 建立監控、治理與成本管理
- 建立具 AZD 整合的可擴展 CI/CD 管線
- 應用生產容器應用最佳實務（安全、監控、成本、CI/CD）

#### 關鍵概念精通
- 企業安全及合規需求
- 治理框架與政策實作
- 進階監控與成本管理
- CI/CD 整合及自動化部署流程
- 容器工作負載的藍綠部署與金絲雀發布策略

#### 實作練習
1. <strong>企業安全</strong>：實作全面安全模式
2. <strong>治理框架</strong>：設定 Azure Policy 與資源管理
3. <strong>進階監控</strong>：建立儀表板與自動警示
4. **CI/CD 整合**：建置自動化部署管線
5. <strong>生產容器應用</strong>：對 [Microservices Architecture](../../../examples/container-app/microservices) 範例應用安全、監控與成本優化

#### 評量問題
- 如何在 AZD 部署中實施企業安全？
- 哪些治理模式確保合規與成本控管？
- 如何設計可擴展的生產監控系統？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 理解 Azure Developer CLI 基礎與核心概念
- 成功安裝並設定 azd 在您的開發環境中
- 使用現有範本完成首次部署
- 瀏覽 azd 專案結構並理解關鍵組成

#### 關鍵概念精通
- 範本、環境與服務
- azure.yaml 配置結構
- 基本 azd 指令（init、up、down、deploy）
- 基礎建設即代碼原則
- Azure 驗證與授權

#### 實作練習

**練習 1.1：安裝與設置**
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
1. azd 架構的三個核心概念是什麼？
2. azure.yaml 文件的目的為何？
3. 環境如何幫助管理不同部署目標？
4. azd 可以使用哪些驗證方法？
5. 第一次執行 `azd up` 時會發生什麼？

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

**練習 2.2：進階配置**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**練習 2.3：安全配置**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我評量問題
1. azd 如何處理環境變數優先權？
2. 什麼是部署鉤子，什麼時候應該使用？
3. 如何為不同環境配置不同 SKU？
4. 不同驗證方法的安全性影響為何？
5. 如何管理機密與敏感配置資料？

### 模組 3：部署與供應（第 4 週）

#### 學習目標
- 精通部署工作流程與最佳實務
- 理解使用 Bicep 範本的基礎建設即代碼
- 實作複雜的多服務架構
- 優化部署效能與可靠性

#### 關鍵概念精通
- Bicep 範本結構與模組
- 資源依賴性與排序
- 部署策略（藍綠部署、滾動更新）
- 多區域部署
- 資料庫遷移與資料管理

#### 實作練習

**練習 3.1：自訂基礎建設**
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

#### 自我評量問題
1. 使用 Bicep 相較於 ARM 範本的優勢是什麼？
2. 如何在 azd 部署中處理資料庫遷移？
3. 目前有哪些零停機部署策略？
4. 如何管理服務間的依賴關係？
5. 多區域部署的考量因素是什麼？

### 模組 4：部署前驗證（第 5 週）

#### 學習目標
- 實施全面的部署前檢查
- 精通容量規劃和資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動化驗證流程

#### 需要掌握的關鍵概念
- Azure 資源配額與限制
- SKU 選擇標準與成本影響
- 自動化驗證腳本與工具
- 容量規劃方法學
- 性能測試與優化

#### 練習題

**練習 4.1：容量規劃**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**練習 4.2：部署前驗證**
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
1. 哪些因素應影響 SKU 選擇決策？
2. 如何在部署前驗證 Azure 資源的可用性？
3. 部署前檢查系統的主要組成部分有哪些？
4. 如何估算與控制部署成本？
5. 容量規劃需要哪些關鍵監控指標？

### 模組 5：故障排除與除錯（第 6 週）

#### 學習目標
- 精通系統化的故障排除方法
- 培養調試複雜部署問題的專業技能
- 實施全面監控與警示
- 建立事件響應與恢復程序

#### 需要掌握的關鍵概念
- 常見部署失敗模式
- 日誌分析與關聯技術
- 性能監控與優化
- 安全事件偵測與回應
- 災難復原與業務持續性

#### 練習題

**練習 5.1：故障排除場景**
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

**練習 5.3：事件響應**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我評估問題
1. azd 部署的系統性故障排除方法是什麼？
2. 如何跨多個服務與資源關聯日誌？
3. 哪些監控指標對於早期問題偵測至關重要？
4. 如何實施有效的災難復原程序？
5. 事件響應計劃的關鍵組成部分有哪些？

### 模組 6：進階主題與最佳實務（第 7-8 週）

#### 學習目標
- 實施企業級部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂模板並貢獻社群
- 理解進階安全與合規要求

#### 需要掌握的關鍵概念
- CI/CD 管線整合模式
- 自訂模板開發與發佈
- 企業治理與合規
- 進階網路與安全設定
- 性能優化與成本管理

#### 練習題

**練習 6.1：CI/CD 整合**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**練習 6.2：自訂模板開發**
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
1. 如何將 azd 整合到既有的 CI/CD 工作流程？
2. 自訂模板開發有哪些關鍵考量？
3. 如何在 azd 部署中實施治理與合規？
4. 企業級部署的最佳實務是什麼？
5. 如何有效貢獻於 azd 社群？

## 實作專案

### 專案 1：個人作品集網站
<strong>難度</strong>：入門  
<strong>時長</strong>：1-2 週

使用以下技術建立並部署個人作品集網站：
- Azure Storage 靜態網站託管
- 自訂網域設定
- CDN 整合以提升全球效能
- 自動化部署管線

<strong>交付成果</strong>：
- 在 Azure 上運行的網站
- 作品集部署用自訂 azd 模板
- 部署流程文檔
- 成本分析與優化建議

### 專案 2：任務管理應用程式
<strong>難度</strong>：中級  
<strong>時長</strong>：2-3 週

創建一個全端任務管理應用程式，包含：
- 部署於 App Service 的 React 前端
- 具驗證機制的 Node.js API 後端
- 具備遷移功能的 PostgreSQL 資料庫
- Application Insights 監控

<strong>交付成果</strong>：
- 完整的應用程式與用戶驗證
- 資料庫結構與遷移腳本
- 監控儀表板與警示規則
- 多環境部署設定

### 專案 3：微服務電子商務平台
<strong>難度</strong>：進階  
<strong>時長</strong>：4-6 週

設計並實作一個基於微服務的電子商務平台：
- 多個 API 服務（目錄、訂單、付款、使用者）
- 透過 Service Bus 整合消息佇列
- 使用 Redis 快取提升性能
- 全面日誌與監控

<strong>參考範例</strong>：請參閲 [微服務架構](../../../examples/container-app/microservices) 的雙服務學習範例與部署指南。佇列、持久化、身份驗證、支付處理與生產硬化為獨立專案工作。

<strong>交付成果</strong>：
- 完整微服務架構
- 服務間通訊模式
- 性能測試與優化
- 生產就緒的安全性實作

## 評量與認證

### 知識檢核

各模組結束後完成以下評量：

**模組 1 評量**：基礎概念與安裝
- 核心概念多選題
- 實作安裝與設定任務
- 簡易部署練習

**模組 2 評量**：設定與環境管理
- 環境管理情境題
- 配置故障排除練習
- 安全設定實作

**模組 3 評量**：部署與佈建
- 基礎架構設計挑戰
- 多服務部署情境
- 性能優化練習

**模組 4 評量**：部署前驗證
- 容量規劃案例研究
- 成本優化情境
- 驗證流水線實作

**模組 5 評量**：故障排除與除錯
- 問題診斷練習
- 監控實作任務
- 事件響應模擬

**模組 6 評量**：進階主題
- CI/CD 管線設計
- 自訂模板開發
- 企業架構情境題

### 終極專題

設計並實作一個完整方案，展現所有概念的掌握：

<strong>需求</strong>：
- 多層應用架構
- 多環境部署
- 全面監控與警示
- 安全與合規實作
- 成本優化與性能調整
- 完整文件與運維手冊

<strong>評鑑標準</strong>：
- 技術實作品質
- 文件完整性
- 安全與最佳實務遵循
- 性能與成本優化
- 故障排除與監控成效

## 學習資源與參考

### 官方文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群資源
- [AZD 模板庫](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 儲存庫](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure 免費帳號](https://azure.microsoft.com/free/)
- [Azure DevOps 免費層](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 額外工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure 工具擴充套件包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習時程建議

### 全職學習（8 週）
- **第 1-2 週**：模組 1-2（入門、配置）
- **第 3-4 週**：模組 3-4（部署、部署前準備）
- **第 5-6 週**：模組 5-6（故障排除、進階主題）
- **第 7-8 週**：實作專案與終極評量

### 兼職學習（16 週）
- **第 1-4 週**：模組 1（入門）
- **第 5-7 週**：模組 2（配置與環境）
- **第 8-10 週**：模組 3（部署與佈建）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（故障排除與除錯）
- **第 15-16 週**：模組 6（進階主題與評量）

---

## 進度追蹤與評量框架

### 章節完成檢查表

使用這些可衡量的成果追蹤每章進度：

#### 📚 第 1 章：基礎與快速入門
- [ ] <strong>安裝完成</strong>：AZD 已於平台上安裝並驗證
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 模板
- [ ] <strong>環境設定</strong>：配置第一組環境變數
- [ ] <strong>資源瀏覽</strong>：在 Azure 入口網站中查看已部署資源
- [ ] <strong>命令熟練</strong>：熟悉基本 AZD 指令

#### 🤖 第 2 章：AI 為先的開發  
- [ ] **AI 模板部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：配置文件索引與檢索
- [ ] <strong>模型配置</strong>：設置多個不同用途的 AI 模型
- [ ] **AI 監控**：針對 AI 工作負載實施 Application Insights
- [ ] <strong>性能優化</strong>：調整 AI 應用效能

#### ⚙️ 第 3 章：配置與身份驗證
- [ ] <strong>多環境設定</strong>：配置開發、預備與生產環境
- [ ] <strong>安全實作</strong>：設置託管身分識別驗證
- [ ] <strong>祕密管理</strong>：整合 Azure Key Vault 管理敏感資料
- [ ] <strong>參數管理</strong>：創建環境特定的設定
- [ ] <strong>身份驗證熟練</strong>：實施安全存取模式

#### 🏗️ 第 4 章：基礎建設即程式碼與部署
- [ ] <strong>自訂模板建立</strong>：打造多服務應用模板
- [ ] **Bicep 精通**：創建模組化、可重用的基礎架構組件
- [ ] <strong>部署自動化</strong>：實施部署前/後掛勾
- [ ] <strong>架構設計</strong>：部署複雜微服務架構
- [ ] <strong>模板優化</strong>：優化模板以提升性能與降低成本

#### 🎯 第 5 章：多智能體 AI 解決方案
- [ ] <strong>零售架構檢視</strong>：識別缺失的應用組件並規劃實作與驗證
- [ ] <strong>智能體客製化</strong>：修改客戶與庫存智能體行為
- [ ] <strong>架構擴展</strong>：實施負載平衡與自動擴展
- [ ] <strong>生產監控</strong>：建立全面監控與警示
- [ ] <strong>性能調校</strong>：優化多智能體系統效能

#### 🔍 第 6 章：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用資源需求
- [ ] **SKU 優化**：選擇成本效益最高的服務方案
- [ ] <strong>驗證自動化</strong>：實施部署前檢查腳本
- [ ] <strong>成本規劃</strong>：制定部署成本預估與預算
- [ ] <strong>風險評估</strong>：識別並緩解部署風險

#### 🚨 第 7 章：故障排除與除錯
- [ ] <strong>診斷技能</strong>：成功調試故意破壞的部署
- [ ] <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
- [ ] <strong>性能調校</strong>：優化執行效率差的應用
- [ ] <strong>恢復程序</strong>：實施備份與災難復原
- [ ] <strong>監控設置</strong>：建立主動監控與警示

#### 🏢 第 8 章：生產與企業級模式
- [ ] <strong>企業安全</strong>：實施完善的安全模式
- [ ] <strong>治理框架</strong>：建立 Azure 政策與資源管理
- [ ] <strong>進階監控</strong>：建立儀表板與自動警示
- [ ] **CI/CD 整合**：構建自動部署管線
- [ ] <strong>合規性實作</strong>：符合企業合規要求

### 學習時間軸與里程碑

#### 第 1-2 週：基礎建設
- <strong>里程碑</strong>：使用 AZD 部署首個 AI 應用
- <strong>驗證</strong>：可透過公開 URL 訪問的運作中應用
- <strong>技能</strong>：基本 AZD 工作流程與 AI 服務整合

#### 第 3-4 週：配置精通
- <strong>里程碑</strong>：多環境部署與安全驗證
- <strong>驗證</strong>：同一應用部署於 dev/staging/prod
- <strong>技能</strong>：環境管理與安全實作

#### 第 5-6 週：基礎建設專業
- <strong>里程碑</strong>：為複雜多服務應用打造自訂模板
- <strong>驗證</strong>：其他團隊成員成功使用該模板部署
- <strong>技能</strong>：Bicep 精通與基礎架構自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：生產就緒的多智能體 AI 解決方案
- <strong>驗證</strong>：系統能處理實際負載且具監控能力
- <strong>技能</strong>：多智能體協調與性能優化

#### 第 9-10 週：生產準備
- <strong>里程碑</strong>：企業級部署，完全符合合規
- <strong>驗證</strong>：通過安全審查與成本優化稽核
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評量與認證

#### 知識驗證方式
1. <strong>實作部署</strong>：每章完成運作中的應用
2. <strong>程式碼審查</strong>：模板與配置品質評估
3. <strong>問題解決</strong>：故障排除場景與解決方案
4. <strong>同儕教學</strong>：向其他學員解釋概念
5. <strong>社群貢獻</strong>：分享模板或改善方案

#### 專業發展成果
- <strong>作品集專案</strong>：學習部署與架構練習；生產準備需另行實作和審查
- <strong>技術技能</strong>：具備業界標準的 AZD 與 AI 部署專業知識
- <strong>解決問題能力</strong>：獨立故障排除與優化
- <strong>社群認可</strong>：積極參與 Azure 開發者社群
- <strong>職涯提升</strong>：技能直接適用於雲端與 AI 角色

#### 成功指標
- <strong>部署成功率</strong>：>95% 成功部署
- <strong>故障排除時間</strong>：一般問題<30分鐘
- <strong>效能最佳化</strong>：成本與效能顯著改善
- <strong>安全審查</strong>：依照組織需求記錄控管與剩餘缺口；完成課程不代表合規認證
- <strong>知識傳授</strong>：能指導其他開發者

### 持續學習與社群參與

#### 保持最新
- **Azure 動態**：追蹤 Azure Developer CLI 發行說明
- <strong>社群活動</strong>：參與 Azure 與 AI 開發者活動
- <strong>文件貢獻</strong>：參與社群文件與範例撰寫
- <strong>反饋迴圈</strong>：提供課程內容與 Azure 服務回饋

#### 職涯發展
- <strong>專業網絡</strong>：連結 Azure 與 AI 專家
- <strong>演講機會</strong>：於會議或聚會分享學習成果
- <strong>開源貢獻</strong>：參與 AZD 範本與工具開發
- <strong>導師指導</strong>：引導其他開發者的 AZD 學習歷程

---

**章節導覽：**
- **📚 課程首頁**：[AZD 初學者](../README.md)
- **📖 開始學習**：[第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：透過完整 8 章學習系統追蹤你的進展
- **🤝 社群**：[Azure Discord](https://discord.gg/microsoft-azure) 提供支持與討論

<strong>學習進度追蹤</strong>：利用此結構化指南，透過循序漸進且實務導向的學習，掌握 Azure Developer CLI，並獲得可衡量的成果與職涯發展收益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->