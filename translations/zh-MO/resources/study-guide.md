# 學習指南 - 全面學習目標

<strong>學習路徑導航</strong>
- **📚 課程首頁**: [AZD 新手入門](../README.md)
- **📖 開始學習**: [第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: [課程完成狀態](../README.md#-course-completion--certification)

## 介紹

本綜合學習指南提供結構化的學習目標、核心概念、實作練習及評估資料，幫助你掌握 Azure Developer CLI (azd)。請使用本指南追蹤學習進度，確保涵蓋所有重要主題。

## 學習目標

完成本指南後，您將能：
- 掌握 Azure Developer CLI 的基本及進階概念
- 培養部署與管理 Azure 應用的實務技能
- 建立故障排除與部署優化的信心
- 了解生產環境部署實務及安全性考量

## 學習成果

完成全部章節後，您將能：
- 設計、部署並管理完整的應用架構，使用 azd
- 實施全面的監控、安全與成本優化策略
- 獨立解決複雜部署問題
- 創建自訂模板並參與 azd 社群貢獻

## 8 章節學習結構

### 第一章：基礎與快速入門（第一週）
<strong>時間</strong>：30-45 分鐘 | <strong>難度</strong>：⭐

#### 學習目標
- 理解 Azure Developer CLI 的核心概念與術語
- 成功安裝並設定 AZD 開發平台
- 使用現成模板部署首個應用程式
- 有效操作 AZD 指令介面

#### 需掌握的核心概念
- AZD 專案結構與組件 (azure.yaml, infra/, src/)
- 基於模板的部署工作流程
- 環境配置基礎
- 資源群組與訂閱管理

#### 實作練習
1. <strong>安裝驗證</strong>：安裝 AZD 並使用 `azd version` 驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設定</strong>：設置首個環境變數
4. <strong>資源探索</strong>：在 Azure 入口網站導覽已部署資源

#### 評估問題
- AZD 專案的核心組件有哪些？
- 如何從範本初始化一個新專案？
- `azd up` 與 `azd deploy` 有何不同？
- 如何使用 AZD 管理多個環境？

---

### 第二章：AI 優先開發（第二週）
<strong>時間</strong>：1-2 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 將 Microsoft Foundry 服務整合入 AZD 工作流程
- 部署與設定 AI 驅動應用程式
- 了解 RAG（檢索增強生成）實作模式
- 管理 AI 模型部署與擴展

#### 需掌握的核心概念
- Microsoft Foundry Models 服務整合與 API 管理
- AI 搜索設定與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化

#### 實作練習
1. **AI 聊天部署**：部署 azure-search-openai-demo 範本
2. **RAG 實作**：設定文件索引與檢索
3. <strong>模型配置</strong>：設置多個不同用途的 AI 模型
4. **AI 監控**：為 AI 工作負載實施 Application Insights

#### 評估問題
- 如何在 AZD 範本中配置 Microsoft Foundry Models 服務？
- RAG 架構的關鍵組件有哪些？
- 如何管理 AI 模型的容量與擴展？
- AI 應用的重要監控指標有哪些？

---

### 第三章：配置與認證（第三週）
<strong>時間</strong>：45-60 分鐘 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 掌握環境配置與管理策略
- 實作安全認證模式與管理身分識別
- 使用適切命名規範組織資源
- 配置多環境部署（開發、測試、正式）

#### 需掌握的核心概念
- 環境階層與配置優先順序
- 管理身分識別與服務主體認證
- 金鑰保管庫整合以管理機密
- 不同環境的參數管理

#### 實作練習
1. <strong>多環境設定</strong>：配置開發、測試及正式環境
2. <strong>安全配置</strong>：實作管理身分識別認證
3. <strong>機密管理</strong>：整合 Azure Key Vault 處理敏感資料
4. <strong>參數管理</strong>：為不同環境建立專屬配置

#### 評估問題
- 如何使用 AZD 配置不同環境？
- 使用管理身分識別比服務主體有何優勢？
- 如何安全管理應用程式的機密？
- AZD 中的配置階層結構是什麼？

---

### 第四章：基礎架構即程式碼與部署（第四至五週）
<strong>時間</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐⭐

#### 學習目標
- 建立並客製 Bicep 基礎架構模板
- 實作進階部署模式與工作流程
- 了解資源佈建策略
- 設計可擴展的多服務架構

- 使用 Azure Container Apps 與 AZD 部署容器化應用


#### 需掌握的核心概念
- Bicep 模板結構與最佳實踐
- 資源依賴關係與部署順序
- 參數檔與模板模組化
- 自訂鉤子與部署自動化
- 容器應用部署模式（快速起步、生產環境、微服務）

#### 實作練習
1. <strong>自訂模板製作</strong>：建立多服務應用模板
2. **Bicep 熟練**：創建模組化且可重用的基礎架構元件
3. <strong>部署自動化</strong>：實作部署前後鉤子
4. <strong>架構設計</strong>：部署複雜的微服務架構
5. <strong>容器應用部署</strong>：使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 及 [微服務架構](../../../examples/container-app/microservices) 範例

#### 評估問題
- 如何為 AZD 製作自訂 Bicep 模板？
- 基礎架構程式碼的最佳組織實踐為何？
- 如何處理模板中的資源依賴關係？
- 哪些部署模式支援零停機更新？

---

### 第五章：多代理 AI 解決方案（第六至七週）
<strong>時間</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 設計與實作多代理 AI 架構
- 協調代理間的通訊與協作
- 部署生產級 AI 解決方案並監控
- 了解代理專精與工作流模式
- 整合容器化微服務為多代理解決方案一部分

#### 需掌握的核心概念
- 多代理架構模式與設計原則
- 代理通訊協定與資料流
- AI 代理的負載平衡與擴展策略
- 多代理系統的生產監控
- 容器化環境中服務間通訊

#### 實作練習
1. <strong>零售架構檢視</strong>：分析零售藍圖，確認部署前必須完成的應用元件
2. <strong>代理客製化</strong>：修改客戶與庫存代理行為
3. <strong>架構擴展</strong>：實作負載平衡與自動擴展
4. <strong>生產監控</strong>：建立完善的監控與警示系統
5. <strong>微服務整合</strong>：擴充 [微服務架構](../../../examples/container-app/microservices) 範例以支援基於代理的工作流

#### 評估問題
- 如何設計有效的多代理通訊模式？
- 擴展 AI 代理工作負載時需考慮哪些要點？
- 如何監控與偵錯多代理 AI 系統？
- 什麼生產模式確保 AI 代理的可靠性？

---

### 第六章：部署前驗證與規劃（第八週）
<strong>時間</strong>：1 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 執行全面容量規劃與資源驗證
- 選擇最佳 Azure SKU 以達成本效益
- 實作自動化部署前檢查與驗證
- 規劃成本優化的部署方案

#### 需掌握的核心概念
- Azure 資源配額與容量限制
- SKU 選擇標準及成本最佳化
- 自動驗證腳本與測試
- 部署規劃與風險評估

#### 實作練習
1. <strong>容量分析</strong>：評估應用程式所需資源
2. **SKU 優化**：比較並選擇具成本效益的服務等級
3. <strong>驗證自動化</strong>：實作部署前檢查腳本
4. <strong>成本規劃</strong>：製作部署成本估算與預算

#### 評估問題
- 如何在部署前驗證 Azure 容量？
- 哪些因素影響 SKU 選擇決策？
- 如何自動化部署前的驗證？
- 有哪些策略有助優化部署成本？

---

### 第七章：故障排除與除錯（第九週）
<strong>時間</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 建立系統性的 AZD 部署除錯方法
- 解決常見部署及配置問題
- 除錯 AI 特定問題與效能瓶頸
- 實施監控與警示進行預防性偵測

#### 需掌握的核心概念
- 診斷技術及日誌策略
- 常見故障模式與解決方案
- 效能監控與優化
- 事件响应與復原程序

#### 實作練習
1. <strong>診斷練習</strong>：測試故意出錯的部署
2. <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
3. <strong>效能調校</strong>：優化反應遲緩的應用程式
4. <strong>復原程序</strong>：實現備份與災難復原

#### 評估問題
- 常見的 AZD 部署失敗有哪些？
- 如何除錯認證與權限問題？
- 哪些監控策略有助預防生產問題？
- 如何優化 Azure 中的應用效能？

---

### 第八章：生產及企業模式（第十至十一週）
<strong>時間</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 實施企業級部署策略
- 設計安全模式與合規框架
- 建立監控、治理及成本管理機制
- 建置可擴展的 CI/CD 管線並整合 AZD
- 應用生產容器應用最佳實踐（安全、監控、成本、CI/CD）

#### 需掌握的核心概念
- 企業安全與合規需求
- 治理框架與政策實作
- 進階監控與成本管理
- CI/CD 整合與自動部署管線
- 藍綠與金絲雀部署策略用於容器化工作負載

#### 實作練習
1. <strong>企業安全</strong>：實作全面安全模式
2. <strong>治理框架</strong>：設定 Azure Policy 與資源管理
3. <strong>進階監控</strong>：製作儀表板與自動警示
4. **CI/CD 整合**：建置自動部署管線
5. <strong>生產容器應用</strong>：將安全、監控及成本優化應用於 [微服務架構](../../../examples/container-app/microservices) 範例

#### 評估問題
- 如何在 AZD 部署中實現企業安全？
- 哪些治理模式能確保合規與成本控制？
- 如何設計可擴展的生產系統監控？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 理解 Azure Developer CLI 的基礎與核心概念
- 成功安裝並設定 azd 於開發環境
- 使用現有模板完成首次部署
- 導覽 azd 專案結構並理解核心組件

#### 需掌握的核心概念
- 模板、環境與服務
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
1. azd 架構的三大核心概念為何？
2. azure.yaml 檔案的用途是什麼？
3. 環境如何協助管理不同部署目標？
4. azd 可使用哪些認證方法？
5. 首次執行 `azd up` 時會發生什麼？

---

## 進度追蹤與評估框架
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
2. 什麼是部署鉤子？什麼時候使用？
3. 如何配置不同環境的 SKU？
4. 不同認證方法的安全性影響為何？
5. 如何管理機密及敏感配置資料？

### 模組三：部署與佈建（第四週）

#### 學習目標
- 精通部署工作流程與最佳實踐
- 理解基礎架構即程式碼及 Bicep 模板
- 實作複雜的多服務架構
- 優化部署效能與可靠性

#### 需掌握的核心概念
- Bicep 模板結構與模組
- 資源依賴與排序
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

**練習 3.2：多服務應用**
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
1. 使用 Bicep 比 ARM 模板有哪些優勢？
2. 如何在 azd 部署中處理資料庫遷移？
3. 有哪些策略可實現零停機部署？
4. 如何管理服務間的相依關係？
5. 多區域部署需考慮哪些要點？

### 模組四：部署前驗證（第五週）

#### 學習目標
- 實施全面的部署前檢查
- 精通容量規劃和資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動化驗證流程

#### 需掌握的關鍵概念
- Azure 資源配額和限制
- SKU 選擇標準及成本影響
- 自動化驗證腳本與工具
- 容量規劃方法論
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
1. 什麼因素會影響 SKU 選擇決策？
2. 如何在部署前驗證 Azure 資源的可用性？
3. 部署前檢查系統的主要組成部分是什麼？
4. 如何估算和控制部署成本？
5. 容量規劃需關注哪些關鍵監控指標？

### 模組 5：疑難排解與除錯 (第 6 週)

#### 學習目標
- 精通系統化疑難排解方法
- 培養複雜部署問題除錯專業能力
- 實施全面監控與警示機制
- 建立事件回應與恢復程序

#### 需掌握的關鍵概念
- 常見部署失敗模式
- 日誌分析與關聯技術
- 性能監控與優化
- 安全事件偵測與回應
- 災難恢復與業務持續性

#### 練習題

**練習 5.1：疑難排解場景**
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
1. 系統化疑難排解 azd 部署的流程是什麼？
2. 如何關聯多個服務和資源的日誌？
3. 哪些監控指標對早期問題偵測最為關鍵？
4. 如何實施有效的災難恢復程序？
5. 事件回應計劃的主要組成部分有哪些？

### 模組 6：進階主題與最佳實務 (第 7-8 週)

#### 學習目標
- 實施企業級部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂模板並貢獻社群
- 了解進階安全與合規要求

#### 需掌握的關鍵概念
- CI/CD 流水線整合模式
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
1. 如何將 azd 整合到現有的 CI/CD 工作流程中？
2. 自訂模板開發需考慮的關鍵要素有哪些？
3. 如何在 azd 部署中實施治理與合規？
4. 企業規模部署的最佳實務是什麼？
5. 如何有效地為 azd 社群做出貢獻？

## 實戰專案

### 專案 1：個人作品集網站
<strong>複雜度</strong>：初學者  
<strong>時長</strong>：1-2 週

使用以下技術建置並部署個人作品集網站：
- Azure 儲存體上的靜態網站託管
- 自訂網域設定
- CDN 合作以提升全球效能
- 自動化部署流程

<strong>交付成果</strong>：
- 在 Azure 上成功運行的網站
- 用於作品集部署的自訂 azd 模板
- 部署流程文檔
- 成本分析與優化建議

### 專案 2：任務管理應用程式
<strong>複雜度</strong>：中階  
<strong>時長</strong>：2-3 週

建立一個全端任務管理應用程式，包含：
- 部署到 App Service 的 React 前端
- Node.js 後端 API，包含身份驗證
- PostgreSQL 資料庫及遷移
- Application Insights 監控

<strong>交付成果</strong>：
- 完整的應用程式與用戶身份驗證
- 資料庫結構與遷移腳本
- 監控儀表板與警示規則
- 多環境部署配置

### 專案 3：微服務電商平台
<strong>複雜度</strong>：進階  
<strong>時長</strong>：4-6 週

設計並實作基於微服務的電商平台：
- 多個 API 服務（目錄、訂單、支付、用戶）
- 與 Service Bus 整合的訊息佇列
- 使用 Redis 快取提升效能
- 全面日誌和監控

<strong>參考範例</strong>：請參考 [Microservices Architecture](../../../examples/container-app/microservices) 了解兩服務學習範例及部署指南。佇列、持久性、身份驗證、支付處理及生產強化屬另行專案工作。

<strong>交付成果</strong>：
- 完整微服務架構
- 服務間通訊模式
- 性能測試與優化
- 生產環境級的安全實作

## 評核與證照

### 知識檢核

完成各模組後，請完成以下評核：

**模組 1 評核**：基礎概念與安裝
- 核心概念選擇題
- 實作安裝與設定任務
- 簡單部署練習

**模組 2 評核**：配置與環境
- 環境管理情境
- 配置故障排解練習
- 安全配置實作

**模組 3 評核**：部署與資源配置
- 基礎設施設計挑戰
- 多服務部署情境
- 性能優化練習

**模組 4 評核**：部署前驗證
- 容量規劃案例研究
- 成本優化情境
- 驗證管線實作

**模組 5 評核**：疑難排解與除錯
- 問題診斷練習
- 監控實作任務
- 事件回應模擬

**模組 6 評核**：進階主題
- CI/CD 流水線設計
- 自訂模板開發
- 企業架構情境

### 最終頂點專案

設計並實作一個展示所有概念精通度的完整解決方案：

<strong>需求</strong>：
- 多層應用架構
- 多部署環境
- 完整的監控與警示
- 安全與合規實施
- 成本優化與性能調校
- 完整文件和操作手冊

<strong>評估標準</strong>：
- 技術實作品質
- 文件完整性
- 安全性與最佳實務符合度
- 性能及成本優化
- 疑難排解與監控效能

## 學習資源與參考資料

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

### 其他工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習進度建議

### 全職學習 (8 週)
- **第 1-2 週**：模組 1-2（入門、配置）
- **第 3-4 週**：模組 3-4（部署、部署前準備）
- **第 5-6 週**：模組 5-6（疑難排解、進階主題）
- **第 7-8 週**：實作專案與最終評核

### 兼職學習 (16 週)
- **第 1-4 週**：模組 1（入門）
- **第 5-7 週**：模組 2（配置與環境）
- **第 8-10 週**：模組 3（部署與資源配置）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（疑難排解與除錯）
- **第 15-16 週**：模組 6（進階主題與評核）

---

## 進度追蹤與評估框架

### 章節完成核對清單

透過以下可衡量成果追蹤每個章節的學習進度：

#### 📚 第 1 章：基礎與快速上手
- [ ] <strong>完成安裝</strong>：成功安裝並驗證 AZD 平台
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
- [ ] <strong>環境設定</strong>：配置首個環境變數
- [ ] <strong>資源導覽</strong>：在 Azure 入口網站探查部署資源
- [ ] <strong>命令熟練</strong>：熟悉基本 AZD 命令操作

#### 🤖 第 2 章：AI優先開發  
- [ ] **AI 範本部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：配置文件編索與檢索
- [ ] <strong>模型配置</strong>：設置多種 AI 模型執行不同任務
- [ ] **AI 監控**：為 AI 工作負載推行 Application Insights
- [ ] <strong>性能優化</strong>：調校 AI 應用性能

#### ⚙️ 第 3 章：配置與驗證
- [ ] <strong>多環境設置</strong>：配置開發、測試及生產環境
- [ ] <strong>安全實現</strong>：配置管理身分驗證
- [ ] <strong>秘密管理</strong>：整合 Azure Key Vault 管理敏感資料
- [ ] <strong>參數管理</strong>：建立環境特有的配置參數
- [ ] <strong>驗證掌握</strong>：實現安全存取模式

#### 🏗️ 第 4 章：基礎設施即程式碼與部署
- [ ] <strong>自訂範本建立</strong>：打造多服務應用範本
- [ ] **Bicep 精通**：建立模組化且可重用的基礎設施元件
- [ ] <strong>部署自動化</strong>：實現部署前後掛鉤腳本
- [ ] <strong>架構設計</strong>：部署複雜微服務架構
- [ ] <strong>範本優化</strong>：優化範本以提升性能與降低成本

#### 🎯 第 5 章：多代理 AI 解決方案
- [ ] <strong>零售架構回顧</strong>：確認缺失應用元件，並計畫其落實與驗證
- [ ] <strong>代理客製化</strong>：調整客戶和庫存代理行為
- [ ] <strong>架構擴展</strong>：實現負載平衡與自動擴充
- [ ] <strong>生產監控</strong>：設定全面監控與警示
- [ ] <strong>效能調校</strong>：優化多代理系統表現

#### 🔍 第 6 章：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用所需資源量
- [ ] **SKU 優化**：選擇具成本效益的服務層級
- [ ] <strong>驗證自動化</strong>：實現部署前檢查腳本
- [ ] <strong>成本規劃</strong>：制定部署成本預估與預算
- [ ] <strong>風險評估</strong>：識別並降低部署風險

#### 🚨 第 7 章：疑難排解與除錯
- [ ] <strong>診斷技能</strong>：成功除錯故意設置錯誤的部署
- [ ] <strong>日誌分析</strong>：有效運用 Azure Monitor 與 Application Insights
- [ ] <strong>性能調校</strong>：優化效能遲緩的應用
- [ ] <strong>恢復程序</strong>：實施備份與災難恢復
- [ ] <strong>監控設置</strong>：建立主動監控與警示

#### 🏢 第 8 章：生產與企業模式
- [ ] <strong>企業安全</strong>：實施完整安全模式
- [ ] <strong>治理框架</strong>：建立 Azure Policy 與資源管理
- [ ] <strong>進階監控</strong>：建立儀表板與自動警示
- [ ] **CI/CD 整合**：打造自動化部署流程
- [ ] <strong>合規實施</strong>：符合企業合規要求

### 學習時間軸與里程碑

#### 第 1-2 週：基礎建設
- <strong>里程碑</strong>：使用 AZD 部署首個 AI 應用程式
- <strong>驗證</strong>：可透過公開 URL 訪問功能正常的應用
- <strong>技能</strong>：AZD 基本工作流程與 AI 服務整合

#### 第 3-4 週：配置精通
- <strong>里程碑</strong>：多環境部署並實現安全驗證
- <strong>驗證</strong>：相同應用成功部署到開發、預備、正式環境
- <strong>技能</strong>：環境管理與安全實務

#### 第 5-6 週：基礎設施專長
- <strong>里程碑</strong>：為複雜多服務應用打造自訂範本
- <strong>驗證</strong>：另一組成員成功部署此可重用範本
- <strong>技能</strong>：精通 Bicep 及基礎設施自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：部署生產就緒的多代理 AI 解決方案
- <strong>驗證</strong>：系統能應對實務負載並具監控能力
- <strong>技能</strong>：多代理協調與效能優化

#### 第 9-10 週：生產準備
- <strong>里程碑</strong>：達到企業級部署與全面合規
- <strong>驗證</strong>：通過安全審查與成本優化稽核
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評核與認證

#### 知識驗證方法
1. <strong>實務部署</strong>：各章節均有實作工作可驗證
2. <strong>程式碼審查</strong>：範本及配置品質評估
3. <strong>問題解決</strong>：疑難排解場景與解決方案
4. <strong>同儕教學</strong>：向其他學習者解說概念
5. <strong>社群貢獻</strong>：分享範本或優化建議

#### 職業發展成果
- <strong>作品集專案</strong>：學習部署與架構練習；生產準備需獨立實作與評審
- <strong>技術技能</strong>：具備業界水準的 AZD 與 AI 部署專業
- <strong>問題解決能力</strong>：獨立疑難排解與優化能力
- <strong>社群認可</strong>：積極參與 Azure 開發者社群
- <strong>職涯提升</strong>：直接適用於雲端及人工智能職位的技能

#### 成功指標
- <strong>部署成功率</strong>：>95% 成功部署
- <strong>問題排除時間</strong>：常見問題少於30分鐘解決
- <strong>效能優化</strong>：在成本與效能上有明顯提升
- <strong>安全審查</strong>：紀錄控制措施與相對於組織需求的未解決差距；完成課程不代表合規認證
- <strong>知識傳承</strong>：能夠指導其他開發者

### 持續學習與社群參與

#### 保持最新
- **Azure 更新**：關注 Azure 開發者 CLI 釋出說明
- <strong>社群活動</strong>：參與 Azure 及 AI 開發者活動
- <strong>文件貢獻</strong>：參與社群文件及範例撰寫
- <strong>回饋機制</strong>：對課程內容及 Azure 服務提供回饋

#### 職涯發展
- <strong>專業網絡</strong>：連結 Azure 及 AI 專家
- <strong>演講機會</strong>：於研討會或聚會中分享學習心得
- <strong>開源貢獻</strong>：貢獻於 AZD 模板及工具
- <strong>指導輔導</strong>：引導其他開發者的 AZD 學習歷程

---

**章節導航：**
- **📚 課程首頁**：[AZD For Beginners](../README.md)
- **📖 開始學習**：[第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：通過完整的8章學習系統追蹤你的進步
- **🤝 社群**：[Azure Discord](https://discord.gg/microsoft-azure) 提供支援與討論

<strong>學習進度追蹤</strong>：利用此結構化指南，通過逐步且實用的學習，掌握 Azure 開發者 CLI，達成可衡量的成果並獲得專業成長利益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們力求準確，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們不對因使用本翻譯而引起的任何誤解或曲解承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->