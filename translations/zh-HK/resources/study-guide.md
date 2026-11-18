# 學習指南 - 全面學習目標

<strong>學習路徑導航</strong>
- **📚 課程主頁**: [AZD 初學者指南](../README.md)
- **📖 開始學習**: [第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: [課程完成狀態](../README.md#-course-completion--certification)

## 介紹

本全面學習指南提供結構化學習目標、核心概念、實作練習及評估材料，幫助你精通 Azure Developer CLI (azd)。使用此指南追蹤學習進度，確保涵蓋所有關鍵主題。

## 學習目標

完成本指南後，你將能：
- 精通 Azure Developer CLI 的所有基礎及進階概念
- 培養部署與管理 Azure 應用的實務技能
- 建立問題排查與部署優化的信心
- 理解生產環境就緒的部署實務及安全考量

## 學習成果

完成本學習指南所有章節後，你將能：
- 使用 azd 設計、部署及管理完整的應用架構
- 實作全面監控、安全與成本優化策略
- 獨立排解複雜部署問題
- 製作自訂範本並參與 azd 社群貢獻

## 八章學習結構

### 第一章：基礎與快速入門 (第一週)
<strong>時間</strong>: 30-45 分鐘 | <strong>難度</strong>: ⭐

#### 學習目標
- 理解 Azure Developer CLI 核心概念與術語
- 成功安裝並設定 AZD 開發環境
- 使用現成範本部署你的首個應用程式
- 有效操作 AZD 指令介面

#### 需掌握的重點概念
- AZD 專案架構與組件（azure.yaml、infra/、src/）
- 範本導向部署工作流程
- 環境設定基礎
- 資源群組與訂閱管理

#### 實務練習
1. <strong>安裝驗證</strong>：安裝 AZD 並用 `azd version` 進行驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設置</strong>：配置你的第一組環境變數
4. <strong>資源探索</strong>：在 Azure 入口網站中瀏覽已部署資源

#### 評估問題
- AZD 專案的核心組件有哪些？
- 如何從範本初始化一個新專案？
- `azd up` 與 `azd deploy` 有什麼差異？
- 如何用 AZD 管理多個環境？

---

### 第二章：AI 優先開發 (第二週)
<strong>時間</strong>: 含工作坊共4-5小時 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 整合 Microsoft Foundry 服務於 AZD 工作流程
- 使用 GA `microsoft.foundry` 套件於 AZD 1.37.0+ 版本進行托管代理開發
- 部署與配置 AI 驅動的應用程式
- 理解 RAG（檢索增強生成）實作模式
- 管理 AI 模型部署與擴展

#### 需掌握的重點概念
- Microsoft Foundry Models 服務整合與 API 管理
- AI 搜尋配置與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化
- 本地代理檢視器與雲端追蹤、原始碼部署及版本控管中的評估資產

#### 實務練習
1. **AI 聊天部署**：部署 azure-search-openai-demo 範本
2. **RAG 實作**：配置文件索引與檢索
3. <strong>模型配置</strong>：設定多個不同用途的 AI 模型
4. **AI 監控**：為 AI 工作負載實作 Application Insights
5. **GA 托管代理**：依循 [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga)；比較本地與雲端回應、查看評估結果並驗證清理權限

#### 評估問題
- 如何在 AZD 範本中配置 Microsoft Foundry Models 服務？
- RAG 架構的關鍵組件有哪些？
- 如何管理 AI 模型容量與擴展？
- 對 AI 應用重要的監控指標有哪些？
- `microsoft.foundry` 包含哪些擴充功能？為什麼評估會分開安裝？
- 為什麼本地代理測試仍會產生 Azure 模型費用？
- 當你重用現有 Foundry 專案時，`azd down` 會留下什麼？

---

### 第三章：配置與身份驗證 (第三週)
<strong>時間</strong>: 45-60 分鐘 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 精通環境配置與管理策略
- 實作安全身份驗證模式與託管身份
- 使用適當命名規則組織資源
- 配置多環境部署（開發、測試、生產）

#### 需掌握的重點概念
- 環境層級與配置優先順序
- 託管身份與服務主體身份驗證
- 與 Key Vault 整合以管理密碼
- 環境專屬參數管理

#### 實務練習
1. <strong>多環境設定</strong>：配置開發、測試與生產環境
2. <strong>安全配置</strong>：實作託管身份身份驗證
3. <strong>密碼管理</strong>：整合 Azure Key Vault 管理敏感資料
4. <strong>參數管理</strong>：建立環境特定配置

#### 評估問題
- 如何在 AZD 中配置不同環境？
- 使用託管身份比起服務主體有什麼優點？
- 如何安全管理應用程式秘密？
- AZD 中的配置層級是什麼？

---

### 第四章：基於代碼架構與部署 (第四至五週)
<strong>時間</strong>: 1-1.5 小時 | <strong>難度</strong>: ⭐⭐⭐

#### 學習目標
- 建立並自訂 Bicep 基礎設施範本
- 實作進階部署模式與工作流程
- 理解資源佈建策略
- 設計可擴展的多服務架構

- 使用 Azure Container Apps 與 AZD 部署容器化應用


#### 需掌握的重點概念
- Bicep 範本結構與最佳實踐
- 資源相依與部署排序
- 參數文件與範本模組化
- 自訂掛鉤與部署自動化
- 容器應用部署模式（快速入門、生產環境、微服務）

#### 實務練習
1. <strong>自訂範本製作</strong>：建立多服務應用範本
2. **Bicep 精通**：建立模組化、可重用基礎設施組件
3. <strong>部署自動化</strong>：實作部署前後掛鉤
4. <strong>架構設計</strong>：部署複雜微服務架構
5. <strong>容器應用部署</strong>：使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 與 [微服務架構](../../../examples/container-app/microservices) 範例

#### 評估問題
- 如何為 AZD 建立自訂 Bicep 範本？
- 協同基礎設施代碼有哪些最佳實踐？
- 如何處理範本中的資源相依性？
- 哪些部署模式可支援零停機更新？

---

### 第五章：多代理 AI 解決方案 (第六至七週)
<strong>時間</strong>: 2-3 小時 | <strong>難度</strong>: ⭐⭐⭐⭐

#### 學習目標
- 設計並實作多代理 AI 架構
- 編排代理協作與通訊
- 部署生產環境就緒的 AI 解決方案並監控
- 理解代理專精與工作流程模式
- 整合容器化微服務成多代理解決方案一環

#### 需掌握的重點概念
- 多代理架構模式與設計原則
- 代理通訊協定與資料流
- AI 代理的負載平衡與擴展策略
- 多代理系統的生產監控
- 容器化環境中的服務間通訊

#### 實務練習
1. <strong>零售架構審視</strong>：分析零售藍圖，辨識部署前必須完成的應用元件
2. <strong>代理客製化</strong>：修改客戶與庫存代理行為
3. <strong>架構擴展</strong>：實作負載平衡與自動擴展
4. <strong>生產監控</strong>：建立全面監控與警示
5. <strong>微服務整合</strong>：將 [微服務架構](../../../examples/container-app/microservices) 範例延伸以支援代理工作流程

#### 評估問題
- 如何設計有效的多代理通訊模式？
- AI 代理工作負載擴展需考量哪些關鍵因素？
- 如何監控與偵錯多代理 AI 系統？
- 什麼生產模式能確保 AI 代理的可靠性？

---

### 第六章：部署前驗證與規劃 (第八週)
<strong>時間</strong>: 1 小時 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 進行全面容量規劃與資源驗證
- 選擇成本效益最佳的 Azure SKU
- 實作自動化的部署前檢查與驗證
- 規劃兼顧成本優化的部署方案

#### 需掌握的重點概念
- Azure 資源配額與容量限制
- SKU 選擇準則與成本優化
- 自動驗證腳本與測試
- 部署規劃與風險評估

#### 實務練習
1. <strong>容量分析</strong>：分析應用所需資源
2. **SKU 優化**：比較並選擇具成本效益的服務等級
3. <strong>驗證自動化</strong>：實作部署前檢查腳本
4. <strong>成本規劃</strong>：製作部署成本估算與預算

#### 評估問題
- 如何在部署前驗證 Azure 容量？
- 哪些因素會影響 SKU 選擇決策？
- 如何實現部署前自動驗證？
- 有哪些策略可優化部署成本？

---

### 第七章：故障排除與除錯 (第九週)
<strong>時間</strong>: 1-1.5 小時 | <strong>難度</strong>: ⭐⭐

#### 學習目標
- 發展系統化除錯方法以處理 AZD 部署問題
- 解決常見部署與配置問題
- 除錯 AI 特定問題與效能瓶頸
- 實作監控與警示以主動偵測問題

#### 需掌握的重點概念
- 診斷技巧與日誌策略
- 常見錯誤模式及對策
- 效能監控與優化
- 事故反應與復原流程

#### 實務練習
1. <strong>診斷技能</strong>：練習故意破壞的部署案例
2. <strong>日誌分析</strong>：有效運用 Azure Monitor 與 Application Insights
3. <strong>效能調優</strong>：優化執行緩慢的應用
4. <strong>復原程序</strong>：實作備份與災難復原

#### 評估問題
- AZD 部署最常見失敗有哪些？
- 如何除錯身份驗證與權限問題？
- 哪些監控策略有助於避免生產問題？
- 如何優化 Azure 中的應用效能？

---

### 第八章：生產環境與企業模式 (第十至十一週)
<strong>時間</strong>: 2-3 小時 | <strong>難度</strong>: ⭐⭐⭐⭐

#### 學習目標
- 實作企業級部署策略
- 設計安全模式與合規框架
- 建立監控、治理與成本管控
- 利用 AZD 建構可擴展 CI/CD 管線
- 應用生產容器應用的最佳實務（安全、監控、成本、CI/CD）

#### 需掌握的重點概念
- 企業安全與合規要求
- 治理框架與政策執行
- 進階監控與成本管理
- CI/CD 整合與自動部署管線
- 容器負載的藍綠部署與金絲雀部署策略

#### 實務練習
1. <strong>企業安全</strong>：實作全面安全模式
2. <strong>治理框架</strong>：設置 Azure Policy 及資源管理
3. <strong>進階監控</strong>：建立儀表板與自動警示
4. **CI/CD 整合**：建構自動部署管線
5. <strong>生產容器應用</strong>：對 [微服務架構](../../../examples/container-app/microservices) 範例應用安全、監控及成本優化

#### 評估問題
- 如何在 AZD 部署中實作企業安全？
- 哪些治理模式可確保合規性與成本控制？
- 如何設計可擴展的生產監控？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 理解 Azure Developer CLI 的基礎與核心概念
- 成功在開發環境安裝配置 azd
- 使用現成範本完成首次部署
- 瀏覽 azd 專案結構並理解核心組件

#### 需掌握的重點概念
- 範本、環境與服務
- azure.yaml 配置結構
- 基本 azd 指令（init、up、down、deploy）
- 基礎設施即代碼原則
- Azure 身份驗證與授權

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
1. azd 架構中三大核心概念是什麼？
2. azure.yaml 檔案的用途為何？
3. 環境如何協助管理不同部署目標？
4. azd 可使用哪些身份驗證方法？
5. 第一次執行 `azd up` 會發生什麼？

---

## 進度追蹤與評估架構
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
1. azd 如何處理環境變數優先順序？
2. 什麼是部署掛鉤？何時使用？
3. 如何為不同環境配置不同 SKU？
4. 不同身份驗證方法的安全影響為何？
5. 如何管理秘密與敏感配置資料？

### 模組三：部署與佈建 (第四週)

#### 學習目標
- 精通部署工作流程與最佳實踐
- 理解使用 Bicep 範本的基礎設施即代碼
- 實作複雜多服務架構
- 優化部署效能與可靠性

#### 需掌握的重點概念
- Bicep 範本結構與模組
- 資源相依與排序
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
1. 使用 Bicep 而非 ARM 模板的優點是什麼？
2. 您如何在 azd 部署中處理資料庫遷移？
3. 有哪些策略可實現零停機部署？
4. 您如何管理服務之間的依賴關係？
5. 多區域部署需要考慮哪些事項？

### 模組 4：部署前驗證（第 5 週）

#### 學習目標
- 實施全面的部署前檢查
- 精通容量規劃與資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動驗證流程

#### 需掌握的核心概念
- Azure 資源配額與限制
- SKU 選擇標準與成本影響
- 自動驗證腳本與工具
- 容量規劃方法論
- 效能測試與優化

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
2. 您如何在部署前驗證 Azure 資源可用性？
3. 部署前檢查系統的關鍵組成是什麼？
4. 您如何估算與控制部署成本？
5. 容量規劃中哪些監控是必要的？

### 模組 5：疑難排解與除錯（第 6 週）

#### 學習目標
- 精通系統化疑難排解方法
- 發展除錯複雜部署問題的專業技能
- 實施全面監控與警示
- 建立事故應變與復原程序

#### 需掌握的核心概念
- 常見部署失敗模式
- 記錄分析與關聯技術
- 效能監控與優化
- 安全事件偵測與回應
- 災難復原與業務連續性

#### 實作練習

**練習 5.1：疑難排解情境**
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

**練習 5.3：事故回應**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我評估問題
1. 系統化疑難排解 azd 部署的做法是什麼？
2. 如何跨多服務及資源關聯日誌？
3. 哪些監控指標對於早期問題偵測最為關鍵？
4. 如何落實有效的災難復原程序？
5. 事故回應計劃的關鍵組成是什麼？

### 模組 6：進階主題與最佳實踐（第 7-8 週）

#### 學習目標
- 實施企業級部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂模板並參與社群貢獻
- 了解進階安全與合規需求

#### 需掌握的核心概念
- CI/CD 管線整合模式
- 自訂模板開發與發佈
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

**練習 6.3：企業等級實作**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### 自我評估問題
1. 如何將 azd 整合到現有 CI/CD 工作流程？
2. 自訂模板開發應考慮哪些關鍵點？
3. 如何在 azd 部署中執行治理與合規？
4. 企業級部署的最佳實踐是什麼？
5. 如何有效貢獻 azd 社群？

## 實務專案

### 專案 1：個人作品集網站
<strong>難度</strong>：初學者  
<strong>時長</strong>：1-2 週

建立並部署一個個人作品集網站，採用：
- Azure 儲存靜態網站託管
- 自訂網域設定
- CDN 整合以提升全球效能
- 自動化部署流程

<strong>交付成果</strong>：
- 順利部署於 Azure 上的網站
- 作品集部署自訂 azd 模板
- 部署流程文件化
- 成本分析與優化建議

### 專案 2：任務管理應用程式
<strong>難度</strong>：中階  
<strong>時長</strong>：2-3 週

建置一個全端任務管理應用程式，包含：
- 部署至 App Service 的 React 前端
- 具有認證的 Node.js API 後端
- 支援遷移的 PostgreSQL 資料庫
- Application Insights 監控

<strong>交付成果</strong>：
- 完整應用程式與使用者認證
- 資料庫結構與遷移腳本
- 監控儀表板與警示規則
- 多環境部署配置

### 專案 3：微服務電商平台
<strong>難度</strong>：進階  
<strong>時長</strong>：4-6 週

設計並實作基於微服務的電商平台：
- 多個 API 服務（目錄、訂單、付款、用戶）
- Service Bus 訊息佇列整合
- Redis 快取效能優化
- 全面日誌與監控

<strong>參考範例</strong>：請見 [微服務架構](../../../examples/container-app/microservices) 的兩服務學習範例及部署指南。佇列、持久化、認證、付款處理及生產強化為獨立專案工作。

<strong>交付成果</strong>：
- 完整微服務架構
- 服務間通訊模式
- 效能測試與優化
- 生產就緒安全實作

## 評估與認證

### 知識檢核

每個模組後完成下列評估：

**模組 1 評估**：基礎概念與安裝
- 核心概念多選題
- 實務安裝與設定任務
- 簡單部署練習

**模組 2 評估**：設定與環境
- 環境管理情境題
- 設定故障排解練習
- 安全設定實作

**模組 3 評估**：部署與資源配置
- 基礎架構設計挑戰
- 多服務部署案例
- 效能優化練習

**模組 4 評估**：部署前驗證
- 容量規劃案例研究
- 成本優化情境
- 驗證流程實作

**模組 5 評估**：疑難排解與除錯
- 問題診斷練習
- 監控實作任務
- 事故應變模擬

**模組 6 評估**：進階主題
- CI/CD 管線設計
- 自訂模板開發
- 企業架構情境

### 期末專案

設計並實作展現所有概念掌握的完整解決方案：

<strong>需求</strong>：
- 多層應用架構
- 多個部署環境
- 全面監控與警示
- 安全與合規實作
- 成本優化與效能調整
- 完整文件與運維手冊

<strong>評估標準</strong>：
- 技術實作品質
- 文件完整性
- 安全及最佳實踐遵循
- 效能與成本優化
- 疑難排解與監控成效

## 學習資源與參考資料

### 官方文件
- [Azure Developer CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群資源
- [AZD 範本庫](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 倉庫](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure 免費帳戶](https://azure.microsoft.com/free/)
- [Azure DevOps 免費層](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 附加工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure 工具擴充套件包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習進度建議

### 全職學習（8 週）
- **第 1-2 週**：模組 1-2（快速入門、設定）
- **第 3-4 週**：模組 3-4（部署、部署前準備）
- **第 5-6 週**：模組 5-6（疑難排解、進階主題）
- **第 7-8 週**：實務專案與期末評估

### 兼職學習（16 週）
- **第 1-4 週**：模組 1（快速入門）
- **第 5-7 週**：模組 2（設定與環境）
- **第 8-10 週**：模組 3（部署與資源配置）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（疑難排解與除錯）
- **第 15-16 週**：模組 6（進階主題與評估）

---

## 進度追蹤與評估架構

### 章節完成清單

使用這些可衡量成果追蹤你每章的進度：

#### 📚 第一章：基礎與快速入門
- [ ] <strong>安裝完成</strong>：已安裝並驗證 AZD 在你的平台上
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
- [ ] <strong>環境設定</strong>：設定首個環境變數
- [ ] <strong>資源瀏覽</strong>：在 Azure 入口網站中探索部署資源
- [ ] <strong>指令熟練</strong>：熟悉基本 AZD 指令

#### 🤖 第二章：以 AI 為先的開發  
- [ ] **AI 範本部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：配置文件索引與檢索
- [ ] <strong>模型設定</strong>：設置多個不同用途的 AI 模型
- [ ] **AI 監控**：為 AI 工作負載實施 Application Insights
- [ ] <strong>效能優化</strong>：優化 AI 應用效能

#### ⚙️ 第三章：設定與身分驗證
- [ ] <strong>多環境設置</strong>：配置 dev、staging 和 prod 環境
- [ ] <strong>安全實作</strong>：設定受控身分驗證
- [ ] <strong>祕密管理</strong>：整合 Azure Key Vault 管理敏感資料
- [ ] <strong>參數管理</strong>：建立環境專屬設定
- [ ] <strong>認證精通</strong>：實作安全存取模式

#### 🏗️ 第四章：基礎架構即程式碼與部署
- [ ] <strong>自訂範本建立</strong>：打造多服務應用範本
- [ ] **Bicep 精通**：創建模組化、可重用的基礎架構元件
- [ ] <strong>部署自動化</strong>：實現部署前後掛勾程序
- [ ] <strong>架構設計</strong>：部署複雜微服務架構
- [ ] <strong>範本優化</strong>：優化範本以提升效能與降低成本

#### 🎯 第五章：多代理 AI 解決方案
- [ ] <strong>零售架構審查</strong>：辨識缺失應用元件並規劃實施與驗證
- [ ] <strong>代理客製化</strong>：修改客戶與庫存代理行為
- [ ] <strong>架構擴展</strong>：實現負載平衡與自動擴展
- [ ] <strong>生產監控</strong>：設置全面監控與警示
- [ ] <strong>效能調優</strong>：優化多代理系統效能

#### 🔍 第六章：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用所需資源
- [ ] **SKU 優化**：選擇成本效益高的服務階層
- [ ] <strong>驗證自動化</strong>：實施部署前檢查腳本
- [ ] <strong>成本規劃</strong>：製作部署成本預算估算
- [ ] <strong>風險評估</strong>：辨識並減輕部署風險

#### 🚨 第七章：疑難排解與除錯
- [ ] <strong>診斷技巧</strong>：成功除錯故意損壞的部署
- [ ] <strong>日誌分析</strong>：有效利用 Azure Monitor 和 Application Insights
- [ ] <strong>效能調優</strong>：優化效能遲緩應用
- [ ] <strong>復原程序</strong>：實作備份與災難復原
- [ ] <strong>監控配置</strong>：建立主動監控與警示

#### 🏢 第八章：生產與企業模式
- [ ] <strong>企業安全</strong>：實施全面安全模式
- [ ] <strong>治理架構</strong>：設置 Azure 政策與資源管理
- [ ] <strong>進階監控</strong>：建立儀表板與自動警示
- [ ] **CI/CD 整合**：建立自動化部署流程
- [ ] <strong>合規實作</strong>：符合企業合規需求

### 學習時間表與重要里程碑

#### 第 1-2 週：基礎建構
- <strong>里程碑</strong>：使用 AZD 部署第一個 AI 應用
- <strong>驗證</strong>：可透過公開 URL 存取的工作應用程式
- <strong>技能</strong>：基本 AZD 工作流程與 AI 服務整合

#### 第 3-4 週：設定精通
- <strong>里程碑</strong>：多環境部署並具安全認證
- <strong>驗證</strong>：同一應用程式部署於 dev/staging/prod
- <strong>技能</strong>：環境管理與安全實作

#### 第 5-6 週：基礎架構專家
- <strong>里程碑</strong>：多服務複雜應用的自訂模板
- <strong>驗證</strong>：團隊其他成員使用可重用模板部署
- <strong>技能</strong>：Bicep 精通與基礎架構自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：生產就緒多代理 AI 解決方案
- <strong>驗證</strong>：系統能處理實際負載並具監控
- <strong>技能</strong>：多代理協調與效能優化

#### 第 9-10 週：生產就緒
- <strong>里程碑</strong>：企業級部署並完全符合規範
- <strong>驗證</strong>：通過安全審查與成本優化審核
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評估與認證

#### 知識驗證方法
1. <strong>實務部署</strong>：每章節的應用範例
2. <strong>程式碼審查</strong>：範本及配置品質評估
3. <strong>問題解決</strong>：故障排除場景與方案
4. <strong>同儕教學</strong>：向其他學員解說概念
5. <strong>社群貢獻</strong>：分享範本或改進

#### 專業發展成果
- <strong>作品集專案</strong>：學習部署及架構練習；生產環境就緒需另行實作與審核
- <strong>技術技能</strong>：業界標準的 AZD 和 AI 部署專長
- <strong>問題解決能力</strong>：獨立排除問題與優化
- <strong>社群認可</strong>：積極參與 Azure 開發者社群
- <strong>職涯晉升</strong>：技能直接適用於雲端與 AI 職位

#### 成功指標
- <strong>部署成功率</strong>：>95% 部署成功率
- <strong>故障排除時間</strong>：常見問題 <30 分鐘解決
- <strong>效能優化</strong>：明顯的成本與效能提升
- <strong>安全評核</strong>：紀錄控管項目及組織需求的剩餘差距；修課不代表合規保證
- <strong>知識傳承</strong>：具備輔導其他開發者能力

### 持續學習與社群參與

#### 保持最新
- **Azure 更新**：追蹤 Azure Developer CLI 版本說明
- <strong>社群活動</strong>：參加 Azure 及 AI 開發者活動
- <strong>文件貢獻</strong>：貢獻社群文件與範例
- <strong>回饋循環</strong>：針對課程內容與 Azure 服務提供意見

#### 職涯發展
- <strong>專業人脈</strong>：連結 Azure 及 AI 專家
- <strong>演講機會</strong>：於研討會或聚會發表學習成果
- <strong>開源貢獻</strong>：貢獻 AZD 範本與工具
- <strong>輔導</strong>：引導其他開發者的 AZD 學習歷程

---

**章節導覽：**
- **📚 課程首頁**：[AZD For Beginners](../README.md)
- **📖 開始學習**：[第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：透過完整 8 章學習系統追蹤你的進步
- **🤝 社群**：[Azure Discord](https://discord.gg/microsoft-azure) 提供支援與討論

<strong>學習進度追蹤</strong>：使用此結構化指南透過循序漸進的實作學習精通 Azure Developer CLI，並具備可量化成果及專業發展效益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->