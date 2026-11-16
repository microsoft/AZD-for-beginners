# 學習指南 - 全面學習目標

<strong>學習路徑導航</strong>
- **📚 課程首頁**: [AZD 初學者](../README.md)
- **📖 開始學習**: [第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: [課程完成情況](../README.md#-course-completion--certification)

## 介紹

這份全面的學習指南提供結構化的學習目標、關鍵概念、實作練習與評估材料，幫助你掌握 Azure Developer CLI (azd)。請利用此指南追蹤你的學習進度，確保涵蓋所有重要主題。

## 學習目標

完成本學習指南後，你將能夠：
- 精通 Azure Developer CLI 的所有基礎與進階概念
- 培養部署與管理 Azure 應用的實作技能
- 建立排錯與優化部署的信心
- 了解生產環境部署實務與安全考量

## 學習成果

完成本指南所有章節後，你將能夠：
- 使用 azd 設計、部署及管理完整應用架構
- 實作全面監控、安全與成本優化策略
- 獨立排解複雜部署問題
- 創建自訂範本並貢獻至 azd 社群

## 8 章節學習結構

### 第一章：基礎與快速入門（第 1 週）
<strong>時長</strong>：30-45 分鐘 | <strong>難度</strong>：⭐

#### 學習目標
- 了解 Azure Developer CLI 核心概念與術語
- 成功安裝並設定 AZD 開發環境
- 使用既有範本部署首個應用程式
- 有效操作 AZD 命令列介面

#### 必須掌握的關鍵概念
- AZD 專案結構與組成元件（azure.yaml、infra/、src/）
- 以範本為基礎的部署工作流程
- 環境配置基礎
- 資源群組與訂閱管理

#### 實作練習
1. <strong>安裝驗證</strong>：安裝 AZD 並使用 `azd version` 驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設定</strong>：設定首個環境變數
4. <strong>資源瀏覽</strong>：在 Azure 入口網站中瀏覽部署資源

#### 評估問題
- AZD 專案的核心組件有哪些？
- 如何從範本初始化一個新專案？
- `azd up` 與 `azd deploy` 之間有什麼差異？
- 如何使用 AZD 管理多個環境？

---

### 第二章：AI 優先開發（第 2 週）
<strong>時長</strong>：1-2 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 將 Microsoft Foundry 服務整合進 AZD 工作流程
- 部署與配置 AI 驅動的應用程式
- 了解 RAG（檢索增強生成）實作模式
- 管理 AI 模型部署與擴展

#### 必須掌握的關鍵概念
- Microsoft Foundry Models 服務整合與 API 管理
- AI 搜尋配置與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化

#### 實作練習
1. **AI 聊天部署**：部署 azure-search-openai-demo 範本
2. **RAG 實作**：配置文件索引與檢索
3. <strong>模型設定</strong>：建立多個具備不同用途的 AI 模型
4. **AI 監控**：為 AI 工作負載實作 Application Insights

#### 評估問題
- 如何在 AZD 範本中配置 Microsoft Foundry Models 服務？
- RAG 架構的關鍵組件有哪些？
- 如何管理 AI 模型容量與擴展？
- AI 應用的監控指標有哪些重要性？

---

### 第三章：配置與認證（第 3 週）
<strong>時長</strong>：45-60 分鐘 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 精通環境配置與管理策略
- 實作安全認證模式與託管身份
- 使用適當命名約定組織資源
- 配置多環境部署（開發、測試、正式）

#### 必須掌握的關鍵概念
- 環境層級與配置優先順序
- 託管身份與服務主體認證
- 金鑰保管整合以管理機密
- 環境專屬參數管理

#### 實作練習
1. <strong>多環境設定</strong>：配置開發、測試和正式環境
2. <strong>安全配置</strong>：實作託管身份認證
3. <strong>機密管理</strong>：整合 Azure Key Vault 存取敏感資料
4. <strong>參數管理</strong>：建立環境專屬設定

#### 評估問題
- 如何使用 AZD 配置不同環境？
- 使用託管身份優於服務主體的好處是什麼？
- 如何安全管理應用程式機密？
- AZD 中的配置層級是如何？

---

### 第四章：基礎架構即程式碼與部署（第 4-5 週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐⭐

#### 學習目標
- 建立並自訂 Bicep 基礎架構範本
- 實作進階部署模式與工作流程
- 理解資源佈建策略
- 設計可擴展的多服務架構

- 使用 Azure Container Apps 與 AZD 部署容器化應用程式


#### 必須掌握的關鍵概念
- Bicep 範本結構與最佳實務
- 資源依賴關係與部署順序
- 參數檔與範本模組化
- 自訂鉤子與部署自動化
- 容器應用部署模式（快速入門、生產、微服務）

#### 實作練習
1. <strong>自訂範本建立</strong>：建構多服務應用程式範本
2. **Bicep 精通**：打造模組化且可重複使用的基礎架構元件
3. <strong>部署自動化</strong>：實作部署前後鉤子
4. <strong>架構設計</strong>：部署複雜微服務架構
5. <strong>容器應用部署</strong>：使用 AZD 部署 [簡易 Flask API](../../../examples/container-app/simple-flask-api) 與 [微服務架構](../../../examples/container-app/microservices) 範例

#### 評估問題
- 如何為 AZD 建立自訂 Bicep 範本？
- 基礎架構程式碼組織的最佳實務是什麼？
- 如何處理範本中的資源依賴關係？
- 哪些部署模式支援零停機更新？

---

### 第五章：多智能體 AI 解決方案（第 6-7 週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 設計與實作多智能體 AI 架構
- 協調智能體間的通信與工作流程
- 部署帶監控的生產級 AI 解決方案
- 理解智能體專精化及工作流程模式
- 整合容器化微服務於多智能體解決方案

#### 必須掌握的關鍵概念
- 多智能體架構模式與設計原則
- 智能體間通信協定與資料流
- AI 智能體負載均衡與擴展策略
- 多智能體系統生產監控
- 容器化環境中服務間通信

#### 實作練習
1. <strong>零售架構分析</strong>：檢視零售藍圖並識別部署前必須實作的應用元件
2. <strong>智能體自訂</strong>：修改顧客與庫存智能體行為
3. <strong>架構擴展</strong>：實作負載均衡與自動擴展
4. <strong>生產監控</strong>：設定完整監控與警示
5. <strong>微服務整合</strong>：擴展 [微服務架構](../../../examples/container-app/microservices) 範例以支援基於智能體的工作流程

#### 評估問題
- 如何設計有效的多智能體通信模式？
- AI 智能體工作負載擴展的關鍵考量是什麼？
- 如何監控並除錯多智能體 AI 系統？
- 哪些生產模式能確保 AI 智能體的可靠性？

---

### 第六章：部署前驗證與規劃（第 8 週）
<strong>時長</strong>：1 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 執行全面容量規劃與資源驗證
- 選擇符合成本效益的最適 Azure SKU
- 實作自動化的部署前檢查與驗證
- 以成本優化策略規劃部署

#### 必須掌握的關鍵概念
- Azure 資源配額與容量限制
- SKU 選擇標準與成本優化
- 自動化驗證腳本與測試
- 部署規劃與風險評估

#### 實作練習
1. <strong>容量分析</strong>：分析應用資源需求
2. **SKU 優化**：比較並選擇具成本效益的服務等級
3. <strong>驗證自動化</strong>：實作部署前檢查腳本
4. <strong>成本規劃</strong>：建立部署成本預估與預算

#### 評估問題
- 如何在部署前驗證 Azure 容量？
- 影響 SKU 選擇決策的因素有哪些？
- 如何自動化部署前驗證？
- 什麼策略有助於優化部署成本？

---

### 第七章：故障排除與除錯（第 9 週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 發展系統性除錯策略以排除 AZD 部署問題
- 解決常見部署與配置問題
- 除錯 AI 特定問題與效能瓶頸
- 實作監控與警示以主動偵測問題

#### 必須掌握的關鍵概念
- 診斷技術與日誌策略
- 常見失敗模式與解決方案
- 效能監控與優化
- 事件回應與恢復程序

#### 實作練習
1. <strong>診斷技巧</strong>：練習處理故意錯誤的部署
2. <strong>日誌分析</strong>：有效利用 Azure Monitor 與 Application Insights
3. <strong>效能調校</strong>：優化慢速執行應用
4. <strong>恢復程序</strong>：實作備份與災難復原

#### 評估問題
- AZD 部署中最常見的失敗原因是什麼？
- 如何除錯認證與權限問題？
- 哪些監控策略有助於防範生產環境問題？
- 如何在 Azure 中優化應用效能？

---

### 第八章：生產與企業模式（第 10-11 週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 實作企業級部署策略
- 設計安全模式與合規架構
- 建立監控、治理與成本管理機制
- 創建具備 AZD 整合的可擴展 CI/CD 管線
- 應用生產容器應用最佳實務（安全、監控、成本、CI/CD）

#### 必須掌握的關鍵概念
- 企業安全與合規需求
- 治理架構與政策實作
- 高級監控與成本管理
- CI/CD 整合與自動化部署管線
- 藍綠部署與金絲雀部署策略於容器化工作負載

#### 實作練習
1. <strong>企業安全</strong>：實作全面安全模式
2. <strong>治理框架</strong>：建立 Azure Policy 與資源管理
3. <strong>高級監控</strong>：設計監控儀表板與自動警示
4. **CI/CD 整合**：打造自動化部署管線
5. <strong>生產容器應用</strong>：將安全、監控與成本優化套用到 [微服務架構](../../../examples/container-app/microservices) 範例

#### 評估問題
- 如何在 AZD 部署中實施企業安全？
- 哪些治理模式可確保合規與成本控制？
- 如何設計可擴展的生產監控系統？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 了解 Azure Developer CLI 基礎與核心概念
- 成功安裝並配置 azd 開發環境
- 使用既有範本完成首次部署
- 瀏覽 azd 專案結構並理解主要元件

#### 必須掌握的關鍵概念
- 範本、環境與服務
- azure.yaml 配置結構
- 基本 azd 指令（init、up、down、deploy）
- 基礎架構即程式碼原則
- Azure 認證與授權機制

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
2. azure.yaml 文件的用途為何？
3. 環境設定如何協助管理不同部署目標？
4. azd 可用的認證方法有哪些？
5. 首次執行 `azd up` 會發生什麼事？

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

#### 自我評估問題
1. azd 如何處理環境變數的優先次序？
2. 什麼是部署鉤子，何時應使用？
3. 如何為不同環境配置不同的 SKU？
4. 不同認證方式的安全影響為何？
5. 如何管理機密與敏感配置資料？

### 模組 3：部署與佈建（第 4 週）

#### 學習目標
- 精通部署工作流程與最佳實務
- 了解使用 Bicep 範本的基礎架構即程式碼
- 實作複雜多服務架構
- 優化部署效能與可靠性

#### 必須掌握的關鍵概念
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
1. 使用 Bicep 相較於 ARM 範本的優點是什麼？
2. azd 部署中如何處理資料庫遷移？
3. 有哪些零停機部署策略？
4. 如何管理服務間相依性？
5. 多區域部署的考量有哪些？

### 模組 4：部署前驗證（第 5 週）

#### 學習目標
- 實施全面的預部署檢查
- 精通容量規劃與資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動驗證管線

#### 需掌握的關鍵概念
- Azure 資源配額與限制
- SKU 選擇標準與成本影響
- 自動驗證腳本與工具
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

**練習 4.2：預先驗證**
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
1. 什麼因素應該影響 SKU 的選擇決策？
2. 你如何在部署前驗證 Azure 資源的可用性？
3. 預先檢查系統的主要組成部分是什麼？
4. 你如何估算及控制部署成本？
5. 容量規劃中必須的監控是什麼？

### 模組 5：疑難排解與除錯（第 6 週）

#### 學習目標
- 精通系統化的疑難排解方法
- 培養調試複雜部署問題的專業技能
- 實施全面監控與警報
- 建立事件回應與復原程序

#### 需掌握的關鍵概念
- 常見的部署失敗模式
- 日誌分析與關聯技術
- 性能監控與優化
- 安全事件偵測與回應
- 災難復原與業務持續性

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
1. azd 部署的系統化疑難排解步驟是什麼？
2. 你如何關聯多個服務與資源的日誌？
3. 哪些監控指標對於早期問題偵測最重要？
4. 你如何實施有效的災難復原程序？
5. 事件回應計劃的主要組成部分是什麼？

### 模組 6：進階主題與最佳實踐（第 7-8 週）

#### 學習目標
- 實施企業級部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂範本並貢獻社群
- 理解進階安全與合規要求

#### 需掌握的關鍵概念
- CI/CD 管線整合模式
- 自訂範本開發與發佈
- 企業治理與合規
- 進階網路與安全配置
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
1. 你如何將 azd 整合到現有的 CI/CD 工作流中？
2. 自訂範本開發的主要考量是什麼？
3. 你如何在 azd 部署中實施治理與合規？
4. 企業級部署的最佳實踐有哪些？
5. 你如何有效地貢獻給 azd 社群？

## 實作專案

### 專案 1：個人作品集網站
<strong>難度</strong>：初學者  
<strong>期間</strong>：1-2 週

建置與部署個人作品集網站，使用：
- Azure 儲存體靜態網站託管
- 自訂網域配置
- CDN 整合以提升全球效能
- 自動化部署管線

<strong>交付物</strong>：
- 部署於 Azure 的可用網站
- 作品集部署的自訂 azd 範本
- 部署流程文件化
- 成本分析與優化建議

### 專案 2：任務管理應用程式
<strong>難度</strong>：中階  
<strong>期間</strong>：2-3 週

建置完整堆疊任務管理應用，包含：
- 部署至 App Service 的 React 前端
- 含有身份驗證的 Node.js API 後端
- 含遷移功能的 PostgreSQL 資料庫
- Application Insights 監控

<strong>交付物</strong>：
- 含用戶身份驗證的完整應用
- 資料庫架構與遷移腳本
- 監控儀表板與警報規則
- 多環境部署配置

### 專案 3：微服務電子商務平台
<strong>難度</strong>：進階  
<strong>期間</strong>：4-6 週

設計與實作微服務架構電子商務平台：
- 多個 API 服務（目錄、訂單、付款、用戶）
- 使用 Service Bus 的訊息佇列整合
- Redis 快取以提升效能
- 全方位日誌與監控

<strong>參考範例</strong>：請參閱 [微服務架構](../../../examples/container-app/microservices) 了解兩個服務的學習範例與部署指南。佇列、持久化、身份認證、付款處理與生產強化為獨立專案工作。

<strong>交付物</strong>：
- 完整的微服務架構
- 服務間通訊模式
- 性能測試與優化
- 生產準備的安全實作

## 評量與認證

### 知識檢測

完成每個模組後的評量：

**模組 1 評量**：基礎概念與安裝
- 關於核心概念的多選題
- 實際安裝與配置任務
- 簡單部署練習

**模組 2 評量**：配置與環境
- 環境管理場景題
- 配置疑難排解練習
- 安全配置實作

**模組 3 評量**：部署與佈建
- 基礎設計挑戰
- 多服務部署場景
- 性能優化練習

**模組 4 評量**：預部署驗證
- 容量規劃案例研究
- 成本優化場景
- 驗證管線實作

**模組 5 評量**：疑難排解與除錯
- 問題診斷練習
- 監控實作任務
- 事件回應模擬

**模組 6 評量**：進階主題
- CI/CD 管線設計
- 自訂範本開發
- 企業架構場景

### 最終頂石專案

設計並實作完整解決方案，展現對所有概念的精通：

<strong>需求</strong>：
- 多層應用架構
- 多重部署環境
- 全面性監控與警報
- 安全與合規實施
- 成本優化與性能調校
- 完整文件與操作手冊

<strong>評估標準</strong>：
- 技術實作品質
- 文件完整度
- 安全與最佳實踐遵循
- 性能及成本優化
- 疑難排解與監控效能

## 學習資源與參考資料

### 官方文件
- [Azure 開發者 CLI 文件](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群資源
- [AZD 範本畫廊](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 倉庫](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure 免費帳號](https://azure.microsoft.com/free/)
- [Azure DevOps 免費方案](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 附加工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure 工具擴充套件包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習時間表建議

### 全職學習（8 週）
- **第 1-2 週**：模組 1-2（入門、配置）
- **第 3-4 週**：模組 3-4（部署、預部署）
- **第 5-6 週**：模組 5-6（疑難排解、進階主題）
- **第 7-8 週**：實作專案與最終評量

### 兼職學習（16 週）
- **第 1-4 週**：模組 1（入門）
- **第 5-7 週**：模組 2（配置與環境）
- **第 8-10 週**：模組 3（部署與佈建）
- **第 11-12 週**：模組 4（預部署驗證）
- **第 13-14 週**：模組 5（疑難排解與除錯）
- **第 15-16 週**：模組 6（進階主題與評量）

---

## 進度追蹤與評估架構

### 章節完成清單

使用以下可衡量成果追蹤每章進度：

#### 📚 第 1 章：基礎與快速上手
- [ ] <strong>安裝完成</strong>：於平台安裝並驗證 AZD
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
- [ ] <strong>環境設定</strong>：設定第一組環境變數
- [ ] <strong>資源瀏覽</strong>：於 Azure 入口網站探索已部署資源
- [ ] <strong>命令掌握</strong>：熟悉基本 AZD 命令

#### 🤖 第 2 章：AI 優先開發  
- [ ] **AI 範本部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：配置文件索引與檢索
- [ ] <strong>模型配置</strong>：建立多個不同用途 AI 模型
- [ ] **AI 監控**：為 AI 工作負載實施 Application Insights
- [ ] <strong>性能優化</strong>：調校 AI 應用性能

#### ⚙️ 第 3 章：配置與身份驗證
- [ ] <strong>多環境設置</strong>：配置開發、測試及生產環境
- [ ] <strong>安全實施</strong>：設置託管身份驗證
- [ ] <strong>秘密管理</strong>：整合 Azure Key Vault 管理敏感資料
- [ ] <strong>參數管理</strong>：建立環境專屬配置
- [ ] <strong>身份驗證掌握</strong>：實施安全存取模式

#### 🏗️ 第 4 章：基礎架構即程式碼與部署
- [ ] <strong>自訂範本建立</strong>：打造多服務應用程式範本
- [ ] **Bicep 掌握**：建立模組化與可重用基礎架構元件
- [ ] <strong>部署自動化</strong>：實施部署前後掛鉤
- [ ] <strong>架構設計</strong>：部署複雜的微服務架構
- [ ] <strong>範本優化</strong>：為性能和成本優化範本

#### 🎯 第 5 章：多代理 AI 解決方案
- [ ] <strong>零售架構檢視</strong>：識別遺漏的應用元件並規劃實作與驗證
- [ ] <strong>代理自訂</strong>：修改客戶與庫存代理行為
- [ ] <strong>架構擴展</strong>：實施負載均衡與自動擴展
- [ ] <strong>生產監控</strong>：設置全面監控與警報
- [ ] <strong>性能調校</strong>：優化多代理系統性能

#### 🔍 第 6 章：預部署驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用的資源需求
- [ ] **SKU 優化**：選擇具成本效益的服務層級
- [ ] <strong>驗證自動化</strong>：實施預部署檢查腳本
- [ ] <strong>成本規劃</strong>：制定部署成本預估與預算
- [ ] <strong>風險評估</strong>：識別並減輕部署風險

#### 🚨 第 7 章：疑難排解與除錯
- [ ] <strong>診斷技能</strong>：成功排除故意損壞部署的除錯
- [ ] <strong>日誌分析</strong>：有效運用 Azure 監控與 Application Insights
- [ ] <strong>性能優化</strong>：優化效能不佳的應用
- [ ] <strong>復原程序</strong>：實施備份與災難復原
- [ ] <strong>監控設置</strong>：建立主動式監控與警報

#### 🏢 第 8 章：生產與企業模式
- [ ] <strong>企業安全</strong>：實施全面安全模式
- [ ] <strong>治理框架</strong>：配置 Azure 策略與資源管理
- [ ] <strong>進階監控</strong>：建立儀表板及自動化警報
- [ ] **CI/CD 整合**：建立自動化部署管線
- [ ] <strong>合規實施</strong>：符合集規範的企業要求

### 學習時間表與里程碑

#### 第 1-2 週：基礎建立
- <strong>里程碑</strong>：使用 AZD 部署首個 AI 應用
- <strong>驗證</strong>：可透過公開 URL 存取的可用應用
- <strong>技能</strong>：基本 AZD 工作流程與 AI 服務整合

#### 第 3-4 週：配置精通
- <strong>里程碑</strong>：多環境部署與安全身份驗證
- <strong>驗證</strong>：相同應用部署於開發／測試／生產環境
- <strong>技能</strong>：環境管理與安全實施

#### 第 5-6 週：基礎架構專業
- <strong>里程碑</strong>：複雜多服務應用的自訂範本
- <strong>驗證</strong>：由其他團隊成員部署的可重用範本
- <strong>技能</strong>：掌握 Bicep 與基礎架構自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：生產就緒的多代理 AI 解決方案
- <strong>驗證</strong>：系統處理實際負載並具監控
- <strong>技能</strong>：多代理協調與性能優化

#### 第 9-10 週：生產準備
- <strong>里程碑</strong>：企業級部署與全面合規
- <strong>驗證</strong>：通過安全審查與成本優化審計
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評量與認證

#### 知識驗證方法
1. <strong>實務部署</strong>：各章節的功能性應用
2. <strong>程式碼審查</strong>：範本與配置品質評估
3. <strong>問題解決</strong>：疑難排解場景與解決方案
4. <strong>同儕教學</strong>：向其他學習者說明概念
5. <strong>社群貢獻</strong>：分享範本或改進

#### 專業發展成果
- <strong>作品集專案</strong>：學習部署與架構練習；生產準備需另行實作與審核
- <strong>技術技能</strong>：業界標準的 AZD 與 AI 部署專業知識
- <strong>問題解決能力</strong>：獨立疑難排解與優化
- <strong>社群認可</strong>：積極參與 Azure 開發者社群
- <strong>職業發展</strong>：直接適用於雲端和 AI 角色的技能

#### 成功指標
- <strong>部署成功率</strong>：>95% 的成功部署
- <strong>故障排除時間</strong>：常見問題少於 30 分鐘
- <strong>效能優化</strong>：在成本和效能上有明顯改善
- <strong>安全審查</strong>：根據組織需求記錄控管與剩餘缺口；課程完成不代表合規認證
- <strong>知識轉移</strong>：能指導其他開發者

### 持續學習與社群參與

#### 保持最新
- **Azure 更新**：關注 Azure Developer CLI 發佈說明
- <strong>社群活動</strong>：參與 Azure 和 AI 開發者活動
- <strong>文件撰寫</strong>：貢獻社群文件和範例
- <strong>回饋機制</strong>：對課程內容和 Azure 服務提供回饋

#### 職涯發展
- <strong>專業網絡</strong>：與 Azure 和 AI 專家建立聯繫
- <strong>講演機會</strong>：在會議或聚會中分享學習心得
- <strong>開源貢獻</strong>：貢獻 AZD 範本和工具
- <strong>導師指導</strong>：引導其他開發者的 AZD 學習歷程

---

**章節導航：**
- **📚 課程首頁**：[AZD 初學者指南](../README.md)
- **📖 開始學習**：[第一章：基礎與快速起步](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：透過全面的 8 章學習系統追蹤你的進展
- **🤝 社群**：[Azure Discord](https://discord.gg/microsoft-azure) 用於支援與討論

<strong>學習進度追蹤</strong>：使用此結構化指南，透過漸進且實務的學習，掌握 Azure Developer CLI，取得可量化成果及專業發展效益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->