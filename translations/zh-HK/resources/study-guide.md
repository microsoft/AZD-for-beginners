# 學習指南 - 全面學習目標

<strong>學習路徑導航</strong>
- **📚 課程首頁**：[AZD 初學者](../README.md)
- **📖 開始學習**：[第1章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：[課程完成](../README.md#-course-completion--certification)

## 介紹

這本全面的學習指南提供結構化的學習目標、關鍵概念、練習題目和評估材料，幫助你掌握 Azure Developer CLI (azd)。使用此指南追蹤學習進度，確保已覆蓋所有重要主題。

## 學習目標

完成本學習指南後，你將能：
- 精通 Azure Developer CLI 的所有基礎與進階概念
- 培養部署及管理 Azure 應用的實務技能
- 增強故障排除與優化部署的自信
- 理解生產環境就緒部署流程及安全考量

## 學習成果

完成所有章節後，你將能：
- 使用 azd 設計、部署及管理完整應用架構
- 實施全面監控、安全及成本優化策略
- 獨立排除複雜部署問題
- 建立自訂模板並對 azd 社群做出貢獻

## 8 章學習架構

### 第1章：基礎與快速入門（第1週）
<strong>時長</strong>：30-45 分鐘 | <strong>難度</strong>：⭐

#### 學習目標
- 了解 Azure Developer CLI 核心概念及術語
- 成功安裝並配置 AZD 開發環境
- 使用現有模板部署你的首個應用
- 熟悉 AZD 命令列介面操作

#### 關鍵概念
- AZD 專案結構與組件（azure.yaml、infra/、src/）
- 基於模板的部署工作流程
- 環境設定基礎
- 資源群組及訂閱管理

#### 實作練習
1. <strong>安裝驗證</strong>：安裝 AZD 並使用 `azd version` 驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設定</strong>：配置你的第一組環境變數
4. <strong>資源瀏覽</strong>：在 Azure 入口網站中瀏覽已部署資源

#### 評估問題
- AZD 專案有哪些核心組件？
- 如何從模板初始化新專案？
- `azd up` 與 `azd deploy` 有何不同？
- 如何使用 AZD 管理多個環境？

---

### 第2章：AI-First 開發（第2週）
<strong>時長</strong>：1-2 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 在 AZD 工作流程中整合 Microsoft Foundry 服務
- 部署及配置 AI 驅動的應用程式
- 理解 RAG（檢索增強生成）實作模式
- 管理 AI 模型部署及資源擴展

#### 關鍵概念
- Microsoft Foundry 模型服務整合及 API 管理
- AI 搜尋配置與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化

#### 實作練習
1. **AI 聊天部署**：部署 azure-search-openai-demo 模板
2. **RAG 實作**：配置文件索引及檢索
3. <strong>模型設定</strong>：設定多個不同用途的 AI 模型
4. **AI 監控**：實作 Application Insights 監控 AI 工作負載

#### 評估問題
- 如何在 AZD 模板中配置 Microsoft Foundry 模型服務？
- RAG 架構的關鍵組件有哪些？
- 如何管理 AI 模型的容量與擴展？
- AI 應用中哪些監控指標最重要？

---

### 第3章：配置與驗證（第3週）
<strong>時長</strong>：45-60 分鐘 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 精通環境配置及管理策略
- 實作安全認證模式及管理身分
- 使用適當命名規則組織資源
- 配置多環境部署（開發、測試、正式）

#### 關鍵概念
- 環境階層及配置優先權
- 管理身分與服務主體認證
- Key Vault 整合以管理機密
- 環境特定參數管理

#### 實作練習
1. <strong>多環境設定</strong>：配置開發、測試及正式環境
2. <strong>安全配置</strong>：實施管理身分認證
3. <strong>機密管理</strong>：整合 Azure Key Vault 管理敏感資料
4. <strong>參數管理</strong>：建立環境專屬設定

#### 評估問題
- 如何使用 AZD 配置不同環境？
- 使用管理身分優於服務主體的好處？
- 如何安全管理應用機密？
- AZD 的配置階層是什麼？

---

### 第4章：基礎設施即程式碼與部署（第4-5週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐⭐

#### 學習目標
- 建立及自訂 Bicep 基礎設施模板
- 實作進階部署模式與工作流程
- 理解資源佈建策略
- 設計可擴充的多服務架構

- 使用 Azure Container Apps 和 AZD 部署容器化應用

#### 關鍵概念
- Bicep 模板結構與最佳實踐
- 資源依賴性與部署順序
- 參數檔與模板模組化
- 自訂鉤子與部署自動化
- 容器應用部署模式（快速啟動、生產、微服務）

#### 實作練習
1. <strong>自訂模板建立</strong>：構建多服務應用模板
2. **Bicep 精通**：建立模組化重用基礎設施元件
3. <strong>部署自動化</strong>：實作部署前後掛勾
4. <strong>架構設計</strong>：部署複雜微服務架構
5. <strong>容器應用部署</strong>：使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 與 [Microservices Architecture](../../../examples/container-app/microservices) 範例

#### 評估問題
- 如何為 AZD 建立自訂 Bicep 模板？
- 管理基礎設施程式碼的最佳實踐是什麼？
- 如何處理模板中的資源依賴？
- 哪些部署模式支持零停機更新？

---

### 第5章：多代理 AI 解決方案（第6-7週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 設計並實作多代理 AI 架構
- 協調代理之間的溝通與協作
- 部署具生產準備性的 AI 解決方案及監控
- 理解代理專精化及工作流模式
- 將容器化微服務整合至多代理解決方案

#### 關鍵概念
- 多代理架構模式及設計原則
- 代理通訊協定與資料流
- AI 代理平衡負載及擴展策略
- 多代理系統生產監控
- 容器化環境中服務間通訊

#### 實作練習
1. <strong>零售解決方案部署</strong>：部署完整多代理零售情境
2. <strong>代理自訂</strong>：修改客戶與庫存代理行為
3. <strong>架構擴展</strong>：實作負載平衡與自動擴展
4. <strong>生產監控</strong>：設定全方位監控與警示
5. <strong>微服務整合</strong>：擴充 [Microservices Architecture](../../../examples/container-app/microservices) 範例以支援代理工作流

#### 評估問題
- 如何設計有效的多代理通訊模式？
- AI 代理工作負載擴展時的重點考量？
- 如何監控與除錯多代理 AI 系統？
- 哪些生產模式能確保 AI 代理的可靠性？

---

### 第6章：部署前驗證與規劃（第8週）
<strong>時長</strong>：1 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 進行全面容量規劃及資源驗證
- 選擇最佳 Azure SKU 以提高成本效益
- 實作自動化預檢與驗證
- 制定成本優化的部署規劃

#### 關鍵概念
- Azure 資源配額與容量限制
- SKU 選擇標準與成本優化
- 自動化驗證腳本與測試
- 部署規劃與風險評估

#### 實作練習
1. <strong>容量分析</strong>：分析應用需求資源
2. **SKU 優化**：比較並選擇具成本效益的服務等級
3. <strong>驗證自動化</strong>：實作部署前檢查腳本
4. <strong>成本規劃</strong>：建立部署成本估算與預算

#### 評估問題
- 如何在部署前驗證 Azure 容量？
- 影響 SKU 選擇的因素有哪幾項？
- 如何自動化部署前驗證？
- 哪些策略有助於優化部署成本？

---

### 第7章：故障排除與除錯（第9週）
<strong>時長</strong>：1-1.5 小時 | <strong>難度</strong>：⭐⭐

#### 學習目標
- 發展系統性除錯 AZD 部署的方法
- 解決常見部署與配置問題
- 除錯 AI 專屬問題與效能瓶頸
- 實施監控與警示以提前發現問題

#### 關鍵概念
- 診斷技巧與日誌策略
- 常見失敗模式及對應解決方案
- 效能監控與優化
- 事件回應與復原程序

#### 實作練習
1. <strong>診斷演練</strong>：模擬故障部署進行排錯
2. <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
3. <strong>效能調校</strong>：優化執行緩慢的應用程式
4. <strong>復原程序</strong>：實作備份與災難復原

#### 評估問題
- AZD 部署中最常見的失敗有哪些？
- 如何除錯身份驗證與權限問題？
- 哪些監控策略能防止生產問題？
- 如何優化 Azure 上的應用效能？

---

### 第8章：生產與企業模式（第10-11週）
<strong>時長</strong>：2-3 小時 | <strong>難度</strong>：⭐⭐⭐⭐

#### 學習目標
- 實作企業級部署策略
- 設計安全模式及合規框架
- 建立監控、治理與成本管理
- 建構具可擴充性的 CI/CD 管線整合 AZD
- 針對生產容器應用部署應用最佳實務（安全、監控、成本、CI/CD）

#### 關鍵概念
- 企業安全與合規要求
- 治理框架與政策實施
- 進階監控與成本管理
- CI/CD 整合與自動化部署管線
- 容器化工作負載的藍綠部署與金絲雀部署策略

#### 實作練習
1. <strong>企業安全性</strong>：實作完整安全模式
2. <strong>治理框架</strong>：設定 Azure 政策與資源管理
3. <strong>進階監控</strong>：建置儀表板與自動警示
4. **CI/CD 整合**：構建自動部署管線
5. <strong>生產容器應用</strong>：為 [Microservices Architecture](../../../examples/container-app/microservices) 範例應用安全、監控及成本優化

#### 評估問題
- 如何在 AZD 部署中實施企業安全？
- 哪些治理模式可確保合規與成本控管？
- 如何設計具可擴充性的生產監控？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 了解 Azure Developer CLI 基礎與核心概念
- 成功於開發環境安裝並配置 azd
- 使用現有模板完成首個部署
- 瀏覽 azd 專案結構並理解關鍵組件

#### 關鍵概念
- 模板、環境與服務
- azure.yaml 配置結構
- 基本 azd 命令（init、up、down、deploy）
- 基礎設施即程式碼原則
- Azure 認證與授權

#### 實作練習

**練習 1.1：安裝與設定**
```bash
# 完成以下任務：
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**練習 1.2：首次部署**
```bash
# 部署一個簡單的網頁應用程式：
1. Initialize project: azd init --template todo-nodejs-mongo
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
2. azure.yaml 檔案的用途為何？
3. 環境如何協助管理不同部署目標？
4. azd 可使用哪些認證方式？
5. 第一次執行 `azd up` 會發生什麼事？

---

## 進度追蹤與評估框架
```bash
# 建立及配置多個環境：
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**練習 2.2：進階配置**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**練習 2.3：安全配置**
```bash
# 實施安全最佳實踐：
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我評估問題
1. azd 如何處理環境變數優先權？
2. 什麼是部署掛勾，何時使用？
3. 如何為不同環境配置不同 SKU？
4. 各種認證方式的安全影響為何？
5. 如何管理秘密和敏感配置資料？

### 模組 3：部署與佈建（第4週）

#### 學習目標
- 熟悉部署工作流程與最佳實務
- 了解使用 Bicep 模板的基礎設施即程式碼
- 實作複雜的多服務架構
- 優化部署效能與可靠度

#### 關鍵概念
- Bicep 模板結構與模組
- 資源依賴及順序
- 部署策略（藍綠部署、滾動更新）
- 多區域部署
- 資料庫遷移與資料管理

#### 實作練習

**練習 3.1：自訂基礎設施**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**練習 3.2：多服務應用**
```bash
# 部署微服務架構：
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**練習 3.3：資料庫整合**
```bash
# 實施數據庫部署模式：
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我評估問題
1. 使用 Bicep 相較於 ARM 模板的優勢是什麼？
2. 如何在 azd 部署中處理資料庫遷移？
3. 有哪些零停機部署策略？
4. 如何管理服務間依賴？
5. 多區域部署需考慮哪些事項？

### 模組 4：部署前驗證（第5週）

#### 學習目標
- 實施全面的部署前檢查
- 精通容量規劃與資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動化驗證流程

#### 需掌握的關鍵概念
- Azure 資源配額與限制
- SKU 選擇標準及成本影響
- 自動化驗證腳本與工具
- 容量規劃方法論
- 性能測試與優化

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
# 優化服務配置：
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  
#### 自我評估問題
1. 影響 SKU 選擇決策的因素有哪些？
2. 如何在部署前驗證 Azure 資源是否可用？
3. 部署前檢查系統的關鍵組成部分是什麼？
4. 如何預估並控制部署成本？
5. 容量規劃中哪些監控是必須的？

### 模組 5：故障排除與除錯 (第 6 週)

#### 學習目標
- 掌握系統性故障排除方法
- 發展複雜部署問題的除錯專長
- 實施全面監控與警示
- 建立事故響應與復原程序

#### 需掌握的關鍵概念
- 常見部署故障模式
- 日誌分析與關聯技巧
- 性能監控與優化
- 安全事件偵測與響應
- 災難復原與業務持續性

#### 練習題

**練習 5.1：故障排除場景**  
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
# 設置全面監控：
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**練習 5.3：事故響應**  
```bash
# 建立事件回應程序：
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  
#### 自我評估問題
1. 故障排除 azd 部署的系統化方法為何？
2. 如何跨多個服務及資源關聯日誌？
3. 哪些監控指標是早期問題偵測的關鍵？
4. 如何實施有效的災難復原程序？
5. 事故響應計畫的關鍵組成有哪些？

### 模組 6：進階主題與最佳實踐 (第 7-8 週)

#### 學習目標
- 實施企業級部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂模板並貢獻社群
- 了解進階安全與合規需求

#### 需掌握的關鍵概念
- CI/CD 管線整合模式
- 自訂模板開發與分發
- 企業治理與合規
- 進階網路與安全設定
- 性能優化與成本管理

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
  
**練習 6.2：自訂模板開發**  
```bash
# 創建及發佈自訂範本：
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**練習 6.3：企業應用實作**  
```bash
# 實施企業級功能：
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  
#### 自我評估問題
1. 如何將 azd 整合至現有 CI/CD 工作流程？
2. 自訂模板開發的主要考量是什麼？
3. 如何在 azd 部署中實施治理與合規？
4. 企業規模部署的最佳實踐為何？
5. 如何有效地為 azd 社群做出貢獻？

## 實作專案

### 專案 1：個人作品集網站  
<strong>複雜度</strong>：初級  
<strong>時長</strong>：1-2 週

使用以下技術建立並部署個人作品集網站：  
- Azure Storage 靜態網站託管  
- 自訂網域設定  
- CDN 整合提升全球效能  
- 自動化部署管線  

<strong>交付成果</strong>：  
- 運作中之 Azure 部署網站  
- 作品集部署的自訂 azd 範本  
- 部署流程文件  
- 成本分析與優化建議  

### 專案 2：任務管理應用程式  
<strong>複雜度</strong>：中級  
<strong>時長</strong>：2-3 週

建立完整堆疊的任務管理應用：  
- React 前端部署於 App Service  
- 帶身份驗證的 Node.js API 後端  
- PostgreSQL 資料庫及遷移  
- Application Insights 監控  

<strong>交付成果</strong>：  
- 含用戶認證之完整應用程式  
- 資料庫架構與遷移腳本  
- 監控儀表板與警示規則  
- 多環境部署配置  

### 專案 3：微服務電子商務平台  
<strong>複雜度</strong>：進階  
<strong>時長</strong>：4-6 週

設計並實作微服務架構的電商平台：  
- 多個 API 服務（目錄、訂單、付款、用戶）  
- Service Bus 訊息隊列整合  
- Redis 快取提升效能  
- 全面日誌與監控  

<strong>參考示例</strong>：請參考 [Microservices Architecture](../../../examples/container-app/microservices) 以取得生產環境範本與部署指南

<strong>交付成果</strong>：  
- 完整微服務架構  
- 服務間通訊模式  
- 效能測試與優化  
- 生產環境安全實作  

## 評量與證書認證

### 知識檢測

於各模組結束後完成以下評量：

**模組 1 評量**：基礎概念與安裝  
- 核心概念選擇題  
- 實作安裝與配置任務  
- 簡單部署練習  

**模組 2 評量**：配置與環境  
- 環境管理場景  
- 配置故障排除練習  
- 安全配置實作  

**模組 3 評量**：部署與佈建  
- 基礎建設設計挑戰  
- 多服務部署場景  
- 性能優化練習  

**模組 4 評量**：部署前驗證  
- 容量規劃案例  
- 成本優化場景  
- 驗證流程實作  

**模組 5 評量**：故障排除與除錯  
- 問題診斷練習  
- 監控實作任務  
- 事故響應模擬  

**模組 6 評量**：進階主題  
- CI/CD 管線設計  
- 自訂模板開發  
- 企業架構場景  

### 期末整合專案

設計並實作完整解決方案，展現對所有概念的精通：

<strong>需求</strong>：  
- 多層應用架構  
- 多部署環境  
- 全面監控與警示  
- 安全與合規實施  
- 成本優化與性能調整  
- 完整文件與操作手冊  

<strong>評估標準</strong>：  
- 技術實作品質  
- 文件完整性  
- 安全與最佳實踐遵循  
- 性能與成本優化  
- 故障排除與監控效能  

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

### 附加工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習時間規劃建議

### 全職學習 (8 週)
- **第 1-2 週**：模組 1-2（入門、配置）
- **第 3-4 週**：模組 3-4（部署、部署前準備）
- **第 5-6 週**：模組 5-6（故障排除、進階主題）
- **第 7-8 週**：實作專案與期末評量

### 兼職學習 (16 週)
- **第 1-4 週**：模組 1（入門）
- **第 5-7 週**：模組 2（配置與環境）
- **第 8-10 週**：模組 3（部署與佈建）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（故障排除與除錯）
- **第 15-16 週**：模組 6（進階主題與評量）

---

## 進度追蹤與評量架構

### 章節完成檢查表

使用以下可量化成果追蹤各章節進度：

#### 📚 章節 1：基礎與快速入門
- [ ] <strong>安裝完成</strong>：AZD 已安裝並於平台驗證無誤
- [ ] <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
- [ ] <strong>環境設定</strong>：配置首個環境變數
- [ ] <strong>資源瀏覽</strong>：在 Azure 入口網站檢視部署資源
- [ ] <strong>指令熟練</strong>：熟悉基本 AZD 指令操作

#### 🤖 章節 2：AI 優先開發
- [ ] **AI 範本部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：配置文件索引與檢索
- [ ] <strong>模型配置</strong>：設置多模型適用於不同用途
- [ ] **AI 監控**：實作 Application Insights 監控 AI 工作負載
- [ ] <strong>效能優化</strong>：調校 AI 應用效能

#### ⚙️ 章節 3：配置與身份驗證
- [ ] <strong>多環境設置</strong>：配置開發、測試及正式環境
- [ ] <strong>安全實作</strong>：設定受管理身份驗證
- [ ] <strong>機密管理</strong>：整合 Azure Key Vault 處理敏感資料
- [ ] <strong>參數管理</strong>：建立環境特定配置
- [ ] <strong>認證掌握</strong>：實作安全存取模式

#### 🏗️ 章節 4：基礎架構即程式碼與部署
- [ ] <strong>自訂模板建立</strong>：製作多服務應用模板
- [ ] **Bicep 精通**：打造模組化、可重用的基礎架構元件
- [ ] <strong>自動化部署</strong>：實施部署前後掛勾
- [ ] <strong>架構設計</strong>：部署複雜微服務架構
- [ ] <strong>模板優化</strong>：優化模板以提升效能及降低成本

#### 🎯 章節 5：多代理 AI 解決方案
- [ ] <strong>零售解決方案部署</strong>：完成多代理零售場景部署
- [ ] <strong>代理客製化</strong>：調整客戶與庫存代理行為
- [ ] <strong>架構擴充</strong>：實作負載平衡與自動縮放
- [ ] <strong>生產監控</strong>：設置全面監控與警示系統
- [ ] <strong>效能調校</strong>：優化多代理系統的性能

#### 🔍 章節 6：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用所需資源
- [ ] **SKU 優化**：選擇成本效益最高的服務等級
- [ ] <strong>驗證自動化</strong>：實施部署前檢查腳本
- [ ] <strong>成本規劃</strong>：制定部署成本預算與估計
- [ ] <strong>風險評估</strong>：識別並降低部署風險

#### 🚨 章節 7：故障排除與除錯
- [ ] <strong>診斷技能</strong>：成功除錯刻意破壞的部署
- [ ] <strong>日誌分析</strong>：有效運用 Azure Monitor 與 Application Insights
- [ ] <strong>效能調優</strong>：優化效能不佳的應用
- [ ] <strong>復原程序</strong>：實施備份與災難復原流程
- [ ] <strong>監控設置</strong>：建立主動監控與警示系統

#### 🏢 章節 8：生產與企業模式
- [ ] <strong>企業安全</strong>：實施全面安全模式
- [ ] <strong>治理架構</strong>：建立 Azure Policy 與資源管理
- [ ] <strong>進階監控</strong>：打造儀表板與自動化警示
- [ ] **CI/CD 整合**：建置自動化部署管線
- [ ] <strong>合規性實施</strong>：符合法規及企業合規需求

### 學習時程與里程碑

#### 第 1-2 週：基礎建設
- <strong>里程碑</strong>：使用 AZD 部署首個 AI 應用
- <strong>驗證</strong>：可公開訪問的運作中應用
- <strong>技能</strong>：基礎 AZD 工作流程及 AI 服務整合

#### 第 3-4 週：配置精通
- <strong>里程碑</strong>：多環境部署含安全認證
- <strong>驗證</strong>：相同應用於 dev/staging/prod 部署
- <strong>技能</strong>：環境管理與安全實作

#### 第 5-6 週：基礎架構專家
- <strong>里程碑</strong>：自訂複合多服務應用模板
- <strong>驗證</strong>：團隊成員復用並部署模板
- <strong>技能</strong>：Bicep 精通與基礎架構自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：生產準備完成的多代理 AI 解決方案
- <strong>驗證</strong>：系統能應付實際負載並監控運行
- <strong>技能</strong>：多代理協調與性能優化

#### 第 9-10 週：生產就緒
- <strong>里程碑</strong>：企業級部署含全面合規
- <strong>驗證</strong>：通過安全審核及成本優化稽核
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評量與證書認證

#### 知識驗證方式
1. <strong>實作部署</strong>：各章節應用部署成果  
2. <strong>程式碼審查</strong>：模板及配置品質評估  
3. <strong>問題解決</strong>：故障排除場景與解決方案  
4. <strong>同儕教學</strong>：向其他學員解說概念  
5. <strong>社群貢獻</strong>：分享模板或改進內容  

#### 專業發展成果
- <strong>作品集項目</strong>：8 個生產就緒部署
- <strong>技術技能</strong>：行業標準的 AZD 和 AI 部署專業知識
- <strong>問題解決能力</strong>：獨立排錯與優化
- <strong>社區認可</strong>：積極參與 Azure 開發者社區
- <strong>職業發展</strong>：技能直接應用於雲端及 AI 職位

#### 成功指標
- <strong>部署成功率</strong>：>95% 成功部署率
- <strong>排錯時間</strong>：常見問題 <30 分鐘解決
- <strong>效能優化</strong>：成本及效能的明顯改善
- <strong>安全合規</strong>：所有部署皆符合企業安全標準
- <strong>知識傳承</strong>：具備指導其他開發者能力

### 持續學習與社區參與

#### 緊貼最新
- **Azure 更新**：關注 Azure Developer CLI 發佈說明
- <strong>社區活動</strong>：參加 Azure 與 AI 開發者活動
- <strong>文件撰寫</strong>：為社區文件與範例作出貢獻
- <strong>反饋迴圈</strong>：就課程內容和 Azure 服務提供反饋

#### 職業發展
- <strong>專業網絡</strong>：連結 Azure 與 AI 專家
- <strong>講演機會</strong>：在會議或聚會分享心得
- <strong>開源貢獻</strong>：參與 AZD 範本及工具開發
- <strong>導師指導</strong>：引導其他開發者學習 AZD

---

**章節導航：**
- **📚 課程主頁**：[AZD For Beginners](../README.md)
- **📖 開始學習**：[第 1 章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：透過完整 8 章學習系統跟蹤你的進展
- **🤝 社區**：[Azure Discord](https://discord.gg/microsoft-azure) 支援與討論

<strong>學習進度追蹤</strong>：使用此結構化指南，透過漸進式實用學習掌握 Azure Developer CLI，並獲得可衡量績效及職業發展效益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力確保準確性，但請注意，自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議使用專業人工翻譯。對因使用此翻譯而產生的任何誤解或誤釋，我們概不負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->