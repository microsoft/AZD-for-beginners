# 學習指南 - 全面學習目標

<strong>學習路徑導航</strong>
- **📚 課程首頁**: [AZD 新手入門](../README.md)
- **📖 開始學習**: [第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: [課程完成狀態](../README.md#-course-completion--certification)

## 介紹

這份全面的學習指南提供結構化的學習目標、關鍵概念、實作練習與評量材料，幫助你掌握 Azure Developer CLI (azd)。使用此指南追蹤學習進度，確保涵蓋所有重要主題。

## 學習目標

完成本指南後，你將能夠：
- 掌握 Azure Developer CLI 的所有基礎與進階概念
- 培養部署與管理 Azure 應用程式的實務技能
- 建立診斷與優化部署的信心
- 理解生產就緒的部署作法與安全性考量

## 學習成果

完成本指南所有章節後，你將能夠：
- 使用 azd 設計、部署及管理完整的應用程式架構
- 實施全面的監控、安全與成本優化策略
- 獨立排除複雜部署問題
- 建立客製化範本並對 azd 社群作出貢獻

## 8 章學習架構

### 第一章：基礎與快速入門 (第1週)
<strong>時長</strong>: 30-45 分鐘 | <strong>難度</strong>: ⭐

#### 學習目標
- 理解 Azure Developer CLI 的核心概念與術語
- 成功安裝及配置 AZD 至開發平台
- 使用現有範本部署第一個應用程式
- 有效操作 AZD 命令列介面

#### 核心概念
- AZD 專案結構與組件（azure.yaml、infra/、src/）
- 基於範本的部署流程
- 環境配置基礎
- 資源群組與訂閱管理

#### 實作練習
1. <strong>安裝驗證</strong>：安裝 AZD 並使用 `azd version` 驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設定</strong>：配置第一組環境變數
4. <strong>資源瀏覽</strong>：在 Azure 入口網站中瀏覽已部署資源

#### 評量問題
- AZD 專案的核心組件有哪些？
- 如何從範本初始化新專案？
- `azd up` 與 `azd deploy` 有何不同？
- 如何使用 AZD 管理多個環境？

---

### 第二章：AI優先開發 (第2週)
<strong>時長</strong>: 包含工作坊約4-5小時 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 將 Microsoft Foundry 服務整合至 AZD 工作流程
- 使用 GA `microsoft.foundry` 套件與 AZD 1.37.0+ 進行託管代理開發
- 部署與配置 AI 驅動的應用程式
- 理解 RAG (檢索增強生成) 的實作模式
- 管理 AI 模型部署與擴展

#### 核心概念
- Microsoft Foundry Models 服務整合及 API 管理
- AI 搜尋配置與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化
- 本地代理檢查工具與雲端追蹤、原始碼部署及版本控制中的評估資產

#### 實作練習
1. **AI 聊天部署**：部署 azure-search-openai-demo 範本
2. **RAG 實作**：配置文件索引與檢索
3. <strong>模型配置</strong>：設置多個功能不同的 AI 模型
4. **AI 監控**：為 AI 工作負載實施 Application Insights
5. **GA 託管代理**：遵循 [hosted-agent 演練](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga)；比較本地與雲端回應、審閱評估結果並驗證清理所有權

#### 評量問題
- 如何在 AZD 範本中配置 Microsoft Foundry Models 服務？
- RAG 架構的關鍵組件有哪些？
- 如何管理 AI 模型的容量與擴展？
- AI 應用程序監控的重要指標有哪些？
- `microsoft.foundry` 包含哪些擴充功能？為何評估工具獨立安裝？
- 為何本地代理測試仍會產生 Azure 模型費用？
- 重用現有 Foundry 專案時，`azd down` 會留下什麼？

---

### 第三章：配置與驗證 (第3週)
<strong>時長</strong>: 45-60 分鐘 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 精通環境配置與管理策略
- 實施安全認證模式與托管身份
- 使用適當命名規範組織資源
- 配置多環境部署（開發、測試、生產）

#### 核心概念
- 環境層級與設定優先順序
- 托管身份與服務主體認證
- Key Vault 秘密管理整合
- 環境特定參數管理

#### 實作練習
1. <strong>多環境設置</strong>：配置開發、測試及生產環境
2. <strong>安全配置</strong>：實施托管身份認證
3. <strong>秘密管理</strong>：整合 Azure Key Vault 儲存敏感資料
4. <strong>參數管理</strong>：建立環境專屬配置

#### 評量問題
- 如何使用 AZD 配置不同環境？
- 使用托管身份優於服務主體的好處是什麼？
- 如何安全管理應用程式秘密？
- AZD 的配置層級結構為何？

---

### 第四章：基礎架構即程式碼與部署 (第4-5週)
<strong>時長</strong>: 1-1.5 小時 | <strong>難度</strong>: ⭐⭐⭐

#### 學習目標
- 建立及客製化 Bicep 基礎架構範本
- 實施進階部署模式與流程
- 理解資源佈建策略
- 設計可擴充的多服務架構

- 使用 Azure Container Apps 與 AZD 部署容器化應用程式


#### 核心概念
- Bicep 範本結構與最佳實踐
- 資源依賴關係與部署順序
- 參數檔與範本模組化
- 自訂掛勾與部署自動化
- 容器應用部署模式（快速入門、生產、微服務）

#### 實作練習
1. <strong>客製範本建立</strong>：建置多服務應用範本
2. **Bicep 精通**：建立模組化、可重用的基礎架構元件
3. <strong>部署自動化</strong>：實施部署前後掛勾
4. <strong>架構設計</strong>：部署複雜微服務架構
5. <strong>容器應用部署</strong>：使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 及 [微服務架構](../../../examples/container-app/microservices)範例

#### 評量問題
- 如何為 AZD 建立自訂 Bicep 範本？
- 組織基礎架構程式碼的最佳實踐是什麼？
- 如何處理範本中的資源依賴？
- 哪些部署模式支援零停機更新？

---

### 第五章：多代理 AI 解決方案 (第6-7週)
<strong>時長</strong>: 2-3 小時 | <strong>難度</strong>: ⭐⭐⭐⭐

#### 學習目標
- 設計與實作多代理 AI 架構
- 協調代理溝通與協作
- 部署具生產就緒監控的 AI 解決方案
- 理解代理專長化與工作流程模式
- 將容器化微服務整合為多代理解決方案的一部分

#### 核心概念
- 多代理架構模式與設計原則
- 代理通訊協定與資料流程
- AI 代理負載平衡與擴展策略
- 多代理系統生產監控
- 容器化環境中的服務間通訊

#### 實作練習
1. <strong>零售架構回顧</strong>：分析零售藍圖並識別部署前必須實現的應用元件
2. <strong>代理自訂</strong>：修改客戶與庫存代理行為
3. <strong>架構擴展</strong>：實作負載平衡與自動擴縮
4. <strong>生產監控</strong>：設置全面監控與警示
5. <strong>微服務整合</strong>：擴展 [微服務架構](../../../examples/container-app/microservices)範例以支援代理工作流程

#### 評量問題
- 如何設計有效的多代理通訊模式？
- 擴展 AI 代理工作負載的關鍵考量有哪些？
- 如何監控並除錯多代理 AI 系統？
- 哪些生產模式能確保 AI 代理的可靠性？

---

### 第六章：部署前驗證與規劃 (第8週)
<strong>時長</strong>: 1 小時 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 執行全面容量規劃與資源驗證
- 選擇具成本效益的 Azure SKU
- 實施自動化預檢查與驗證
- 制定具成本優化策略的部署計畫

#### 核心概念
- Azure 資源配額與容量限制
- SKU 選擇準則與成本優化
- 自動驗證腳本與測試
- 部署規劃與風險評估

#### 實作練習
1. <strong>容量分析</strong>：分析應用程式資源需求
2. **SKU 優化**：比較並選擇具成本效益的服務層級
3. <strong>驗證自動化</strong>：實施部署前檢查腳本
4. <strong>成本規劃</strong>：製作部署成本估算與預算

#### 評量問題
- 如何在部署前驗證 Azure 容量？
- 有哪些因素影響 SKU 選擇決策？
- 如何自動化部署前驗證？
- 有哪些策略可協助優化部署成本？

---

### 第七章：故障排除與除錯 (第9週)
<strong>時長</strong>: 1-1.5 小時 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 發展系統化的 AZD 部署除錯方法
- 解決常見部署與配置問題
- 除錯 AI 特定問題與效能議題
- 實施監控與警示以主動偵測問題

#### 核心概念
- 診斷技術與日誌策略
- 常見故障模式及其解決方案
- 效能監控與優化
- 事件回應與復原程序

#### 實作練習
1. <strong>診斷技能</strong>：練習處理故意破壞的部署
2. <strong>日誌分析</strong>：有效利用 Azure Monitor 與 Application Insights
3. <strong>效能調校</strong>：優化執行緩慢之應用
4. <strong>復原程序</strong>：實施備份與災難復原

#### 評量問題
- 最常見的 AZD 部署失敗有哪些？
- 如何除錯認證與權限問題？
- 哪些監控策略能幫助避免生產問題？
- 如何優化 Azure 中的應用效能？

---

### 第八章：生產與企業模式 (第10-11週)
<strong>時長</strong>: 2-3 小時 | <strong>難度</strong>: ⭐⭐⭐⭐

#### 學習目標
- 實施企業等級部署策略
- 設計安全模式與符合規範架構
- 建立監控、治理與成本管理
- 創建有 AZD 整合的可擴充 CI/CD 管道
- 應用生產容器應用最佳實踐（安全、監控、成本、CI/CD）

#### 核心概念
- 企業安全與合規需求
- 治理架構與政策執行
- 進階監控與成本管理
- CI/CD 整合與自動化部署管線
- 藍綠部署與金絲雀部署策略的容器化工作負載

#### 實作練習
1. <strong>企業安全</strong>：實施全面安全模式
2. <strong>治理框架</strong>：設定 Azure Policy 與資源管理
3. <strong>進階監控</strong>：建立儀表板與自動警示
4. **CI/CD 整合**：建立自動化部署管線
5. <strong>生產容器應用</strong>：對 [微服務架構](../../../examples/container-app/microservices)範例應用安全、監控和成本優化

#### 評量問題
- 如何在 AZD 部署中實施企業安全？
- 什麼治理模式可確保合規與成本控制？
- 如何設計可擴充監控以應對生產系統？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 理解 Azure Developer CLI 基本概念及核心理念
- 成功安裝並配置 azd 到你的開發環境
- 使用現有範本完成第一次部署
- 瀏覽 azd 專案結構及核心組件

#### 核心概念
- 範本、環境與服務
- azure.yaml 配置結構
- 基本 azd 指令（init、up、down、deploy）
- 基礎架構即程式碼原則
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

#### 自我評估問題
1. azd 架構的三大核心概念是什麼？
2. azure.yaml 檔案的用途是什麼？
3. 環境如何幫助管理不同的部署目標？
4. azd 可以使用哪些認證方法？
5. 第一次執行 `azd up` 時會發生什麼事？

---

## 進度追蹤及評量架構
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

#### 自我評估問題
1. azd 如何處理環境變數優先順序？
2. 什麼是部署掛勾？何時使用？
3. 如何為不同環境配置不同 SKU？
4. 不同認證方法的安全性影響是什麼？
5. 如何管理秘密與敏感配置資料？

### 模組 3：部署與佈建 (第4週)

#### 學習目標
- 精通部署流程與最佳實踐
- 理解使用 Bicep 範本的基礎架構即程式碼
- 實施複雜多服務架構
- 優化部署效能與可靠性

#### 核心概念
- Bicep 範本結構與模組
- 資源依賴與順序
- 部署策略（藍綠、滾動更新）
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

#### 自我評量問題
1. 使用 Bicep 相較於 ARM 模板有什麼優點？
2. 在 azd 部署中如何處理資料庫遷移？
3. 有哪些零停機部署策略？
4. 你如何管理服務之間的依賴關係？
5. 多區域部署有哪些考量？

### 模組 4：部署前驗證（第5週）

#### 學習目標
- 執行全面性的部署前檢查
- 精通容量規劃及資源驗證
- 理解 SKU 選擇與成本優化
- 建立自動化驗證管線

#### 需掌握的關鍵概念
- Azure 資源額度與限制
- SKU 選擇標準及成本影響
- 自動化驗證腳本與工具
- 容量規劃方法論
- 效能測試及優化

#### 實作練習

**練習 4.1：容量規劃**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**練習 4.2：預先檢查驗證**
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

#### 自我評量問題
1. SKU 選擇決策中應該考慮哪些因素？
2. 如何在部署前驗證 Azure 資源可用性？
3. 預先檢查系統的關鍵組成部分是什麼？
4. 如何估算並控制部署成本？
5. 容量規劃必需的監控有哪些？

### 模組 5：故障排除與偵錯（第6週）

#### 學習目標
- 掌握系統化故障排除方法
- 發展偵錯複雜部署問題的專業能力
- 實施全面性監控與警示
- 建立事故應變與恢復程序

#### 需掌握的關鍵概念
- 常見部署失敗模式
- 日誌分析與關聯技巧
- 效能監控與優化
- 安全事件偵測與應對
- 災難復原與業務持續性

#### 實作練習

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

**練習 5.3：事故應變**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我評量問題
1. azd 部署的系統化故障排除方法是什麼？
2. 如何關聯來自多個服務和資源的日誌？
3. 哪些監控指標對於早期問題偵測最關鍵？
4. 如何實施有效的災難復原程序？
5. 事故應變計劃的關鍵組成部分有哪些？

### 模組 6：進階主題與最佳實務（第7-8週）

#### 學習目標
- 實施企業級部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂模板並為社群做出貢獻
- 理解進階安全與合規需求

#### 需掌握的關鍵概念
- CI/CD 管線整合模式
- 自訂模板開發與發行
- 企業治理與合規
- 進階網路與安全設定
- 效能優化與成本管理

#### 實作練習

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

#### 自我評量問題
1. 如何將 azd 整合到現有的 CI/CD 工作流程中？
2. 自訂模板開發的關鍵考量是什麼？
3. 如何在 azd 部署中實施治理與合規？
4. 企業級部署的最佳實務有哪些？
5. 如何有效為 azd 社群做出貢獻？

## 實作專案

### 專案 1：個人作品集網站
<strong>難度</strong>：初學者  
<strong>時間</strong>：1-2 週

使用以下技術建置並部署個人作品集網站：
- 在 Azure 儲存體上靜態網站託管
- 自訂網域設定
- CDN 整合以提升全球效能
- 自動化部署管線

<strong>交付成果</strong>：
- 部署於 Azure 上的可用網站
- 用於作品集部署的自訂 azd 模板
- 部署流程文件
- 成本分析及優化建議

### 專案 2：任務管理應用程式
<strong>難度</strong>：中階  
<strong>時間</strong>：2-3 週

建置全堆疊任務管理應用程式，包含：
- 部署於 App Service 的 React 前端
- 具備身份驗證的 Node.js API 後端
- 搭配遷移功能的 PostgreSQL 資料庫
- Application Insights 監控

<strong>交付成果</strong>：
- 帶有使用者身份認證的完整應用程式
- 資料庫架構與遷移腳本
- 監控儀表板與警示規則
- 多環境部署設定

### 專案 3：微服務電子商務平台
<strong>難度</strong>：進階  
<strong>時間</strong>：4-6 週

設計並實作基於微服務的電子商務平台：
- 多個 API 服務（目錄、訂單、付款、使用者）
- 整合 Service Bus 訊息佇列
- Redis 快取以提升效能
- 全面性日誌與監控

<strong>參考範例</strong>：請參閱 [微服務架構](../../../examples/container-app/microservices) 中的兩服務學習範例與部署指南。佇列、持久層、認證、支付處理及生產強化屬於獨立專案工作。

<strong>交付成果</strong>：
- 完整微服務架構
- 服務間通訊模式
- 效能測試與優化
- 生產就緒的安全實作

## 評量與認證

### 知識檢測

完成每個模組後進行評量：

**模組 1 評量**：基礎概念與安裝
- 核心概念多選題
- 實務安裝與設定任務
- 簡易部署練習

**模組 2 評量**：設定與環境
- 環境管理情境
- 設定故障排除練習
- 安全設定實作

**模組 3 評量**：部署與供應
- 基礎架構設計挑戰
- 多服務部署情境
- 效能優化練習

**模組 4 評量**：部署前驗證
- 容量規劃案例研究
- 成本優化情境
- 驗證管線實作

**模組 5 評量**：故障排除與偵錯
- 問題診斷練習
- 監控實作任務
- 事故應變模擬

**模組 6 評量**：進階主題
- CI/CD 管線設計
- 自訂模板開發
- 企業架構情境

### 最終專題

設計並實作一個完整解決方案，展示對所有概念的精通：

<strong>需求</strong>：
- 多層應用架構
- 多環境部署環境
- 全面監控與警示
- 安全與合規實作
- 成本優化與效能調校
- 完整文件與運維手冊

<strong>評分標準</strong>：
- 技術實作品質
- 文件完備性
- 安全性與最佳實務遵循
- 效能與成本優化
- 故障排除與監控成效

## 學習資源與參考

### 官方文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群資源
- [AZD 模板庫](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 倉庫](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure 免費帳戶](https://azure.microsoft.com/free/)
- [Azure DevOps 免費方案](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 附加工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure 工具擴充包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習建議進度

### 全職學習（8 週）
- **第1-2週**：模組 1-2（入門、設定）
- **第3-4週**：模組 3-4（部署、部署前）
- **第5-6週**：模組 5-6（故障排除、進階主題）
- **第7-8週**：實作專案與最終評量

### 兼職學習（16 週）
- **第1-4週**：模組 1（入門）
- **第5-7週**：模組 2（設定與環境）
- **第8-10週**：模組 3（部署與供應）
- **第11-12週**：模組 4（部署前驗證）
- **第13-14週**：模組 5（故障排除與偵錯）
- **第15-16週**：模組 6（進階主題與評量）

---

## 進度追蹤與評量框架

### 章節完成清單

透過這些可量化成果追蹤每章進度：

#### 📚 第1章：基礎與快速入門
- [ ] <strong>完成安裝</strong>：AZD 已於你的平台安裝並驗證
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 模板
- [ ] <strong>環境設置</strong>：設定首個環境變數
- [ ] <strong>資源瀏覽</strong>：在 Azure 入口網站檢視部署資源
- [ ] <strong>指令掌握</strong>：能熟練操作基礎 AZD 指令

#### 🤖 第2章：AI優先開發  
- [ ] **AI範本部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：已配置文件索引與檢索
- [ ] <strong>模型配置</strong>：設置多個用途不同的 AI 模型
- [ ] **AI監控**：為 AI 工作負載實施 Application Insights
- [ ] <strong>效能優化</strong>：調校 AI 應用效能

#### ⚙️ 第3章：設定與身份驗證
- [ ] <strong>多環境設置</strong>：配置開發、測試與正式環境
- [ ] <strong>安全實作</strong>：設置管理身分識別認證
- [ ] <strong>機密管理</strong>：整合 Azure Key Vault 儲存敏感資料
- [ ] <strong>參數管理</strong>：建立環境專屬設定
- [ ] <strong>身份驗證熟練</strong>：實施安全存取模式

#### 🏗️ 第4章：基礎架構即程式碼與部署
- [ ] <strong>自訂模板建立</strong>：打造多服務應用模板
- [ ] **Bicep 精通**：製作模組化、可重複使用的基礎架構元件
- [ ] <strong>部署自動化</strong>：實施部署前後掛勾
- [ ] <strong>架構設計</strong>：部署複雜微服務架構
- [ ] <strong>模板優化</strong>：為效能與成本優化模板

#### 🎯 第5章：多代理 AI 解決方案
- [ ] <strong>零售架構檢視</strong>：辨識缺失應用元件並規劃實作與驗證
- [ ] <strong>代理自訂</strong>：修改客戶與庫存代理行為
- [ ] <strong>架構擴充</strong>：實施負載平衡與自動擴展
- [ ] <strong>生產監控</strong>：設置全面監控與警示
- [ ] <strong>效能調校</strong>：優化多代理系統表現

#### 🔍 第6章：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用需求資源
- [ ] **SKU優化**：選擇具成本效益的服務層級
- [ ] <strong>驗證自動化</strong>：實施部署前檢查腳本
- [ ] <strong>成本規劃</strong>：制定部署成本預估與預算
- [ ] <strong>風險評估</strong>：辨識並減緩部署風險

#### 🚨 第7章：故障排除與偵錯
- [ ] <strong>診斷技能</strong>：成功偵錯故意損壞的部署
- [ ] <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
- [ ] <strong>效能調校</strong>：優化執行緩慢的應用
- [ ] <strong>復原程序</strong>：實施備份與災難復原
- [ ] <strong>監控設置</strong>：建立主動監控與警示

#### 🏢 第8章：生產與企業模式
- [ ] <strong>企業安全</strong>：實施全面安全模式
- [ ] <strong>治理架構</strong>：設定 Azure Policy 與資源管理
- [ ] <strong>進階監控</strong>：建立儀表板與自動化警示
- [ ] **CI/CD 整合**：打造自動部署管線
- [ ] <strong>合規實作</strong>：符合企業合規要求

### 學習時間表與里程碑

#### 第1-2週：基礎建構
- <strong>里程碑</strong>：使用 AZD 部署首個 AI 應用
- <strong>驗證</strong>：可透過公開 URL 存取的運作中應用
- <strong>技能</strong>：基本 AZD 工作流程及 AI 服務整合

#### 第3-4週：設定精通
- <strong>里程碑</strong>：多環境部署與安全認證
- <strong>驗證</strong>：相同應用部署至 dev/staging/prod
- <strong>技能</strong>：環境管理與安全實作

#### 第5-6週：基礎架構專業
- <strong>里程碑</strong>：複雜多服務應用的自訂模板
- <strong>驗證</strong>：可由其他團隊成員部署的可重用模板
- <strong>技能</strong>：Bicep 精通與基礎架構自動化

#### 第7-8週：進階 AI 實作
- <strong>里程碑</strong>：生產就緒的多代理 AI 解決方案
- <strong>驗證</strong>：系統能應對實際負載並具監控
- <strong>技能</strong>：多代理編排與效能優化

#### 第9-10週：生產就緒
- <strong>里程碑</strong>：符合完整合規的企業級部署
- <strong>驗證</strong>：通過安全審核與成本優化審查
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評量與認證

#### 知識驗證方法
1. <strong>實務部署</strong>：每章節的工作應用
2. <strong>程式碼審查</strong>：範本與設定品質評估
3. <strong>問題解決</strong>：故障處理情境與解決方案
4. <strong>同儕教學</strong>：向其他學習者說明概念
5. <strong>社群貢獻</strong>：分享範本或改進

#### 職業發展成果
- <strong>作品集專案</strong>：學習中的部署與架構練習；生產環境準備需另行實作與審核
- <strong>技術技能</strong>：業界標準的 AZD 與 AI 部署專業知識
- <strong>問題解決能力</strong>：獨立故障排除與優化
- <strong>社群認可</strong>：積極參與 Azure 開發者社群
- <strong>職涯進階</strong>：技能直接適用於雲端與 AI 職位

#### 成功指標
- <strong>部署成功率</strong>：>95% 部署成功
- <strong>故障排除時間</strong>：常見問題 <30 分鐘解決
- <strong>效能優化</strong>：成本與效能上的明顯改善
- <strong>安全審查</strong>：記錄控制措施與與組織要求的差距；完成課程不代表合規認證
- <strong>知識傳承</strong>：具備指導其他開發者的能力

### 持續學習與社群參與

#### 保持最新
- **Azure 更新**：關注 Azure Developer CLI 發行說明
- <strong>社群活動</strong>：參加 Azure 與 AI 開發者活動
- <strong>文件撰寫</strong>：為社群文件與範例做出貢獻
- <strong>反饋環</strong>：提供課程內容與 Azure 服務的回饋

#### 職涯發展
- <strong>專業人脈</strong>：連結 Azure 與 AI 專家
- <strong>演講機會</strong>：在會議或聚會分享學習心得
- <strong>開源貢獻</strong>：參與 AZD 範本與工具貢獻
- <strong>導師角色</strong>：指導其他開發者 AZD 的學習歷程

---

**章節導航：**
- **📚 課程首頁**：[AZD For Beginners](../README.md)
- **📖 開始學習**：[第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：透過完整的 8 章學習系統追蹤您的進展
- **🤝 社群**：[Azure Discord](https://discord.gg/microsoft-azure) 提供支援與討論

<strong>學習進度追蹤</strong>：使用此結構化指南透過逐步的實務學習，掌握 Azure Developer CLI，並獲得可量化的成果與職業發展效益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->