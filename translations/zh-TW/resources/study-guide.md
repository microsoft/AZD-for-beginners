# 學習指南 - 全面學習目標

<strong>學習路徑導覽</strong>
- **📚 課程首頁**: [AZD 入門](../README.md)
- **📖 開始學習**: [第1章：基礎與快速開始](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: [課程完成](../README.md#-course-completion--certification)

## 介紹

本全面學習指南提供結構化的學習目標、關鍵概念、實作練習與評量材料，幫助你精通 Azure Developer CLI (azd)。使用此指南來追蹤你的進度並確保已涵蓋所有重要主題。

## 學習目標

完成本學習指南後，你將能：
- 精通 Azure Developer CLI 的所有基礎與進階概念
- 培養部署與管理 Azure 應用程式的實務技能
- 建立排除故障與優化部署的信心
- 了解生產就緒的部署實務與安全考量

## 學習成果

完成本學習指南所有章節後，你將能夠：
- 使用 azd 設計、部署與管理完整的應用程式架構
- 實作完整的監控、安全與成本優化策略
- 獨立排解複雜的部署問題
- 建立自訂範本並對 azd 社群作出貢獻

## 8 章學習結構

### 第 1 章：基礎與快速開始（第1週）
<strong>時長</strong>：30-45 分鐘 | <strong>複雜度</strong>：⭐

#### 學習目標
- 了解 Azure Developer CLI 的核心概念與術語
- 成功在你的開發平台上安裝並設定 AZD
- 使用現有範本部署你的第一個應用程式
- 有效地操作 AZD 命令列介面

#### 應掌握的關鍵概念
- AZD 專案結構與組件 (azure.yaml, infra/, src/)
- 基於範本的部署工作流程
- 環境設定基礎
- 資源群組與訂閱管理

#### 實作練習
1. <strong>安裝驗證</strong>：安裝 AZD 並使用 `azd version` 驗證
2. <strong>首次部署</strong>：成功部署 todo-nodejs-mongo 範本
3. <strong>環境設定</strong>：設定你的第一組環境變數
4. <strong>資源探索</strong>：在 Azure Portal 中瀏覽已部署的資源

#### 評量問題
- AZD 專案的核心組件有哪些？
- 如何從範本初始化一個新專案？
- `azd up` 與 `azd deploy` 之間有何差異？
- 如何使用 AZD 管理多個環境？

---

### 第 2 章：以 AI 為先的開發（第2週）
<strong>時長</strong>：1-2 小時 | <strong>複雜度</strong>：⭐⭐

#### 學習目標
- 將 Microsoft Foundry 服務整合到 AZD 工作流程中
- 部署並設定具 AI 功能的應用程式
- 理解 RAG（Retrieval-Augmented Generation，檢索增強生成）的實作模式
- 管理 AI 模型的部署與擴充

#### 應掌握的關鍵概念
- Microsoft Foundry Models 服務整合與 API 管理
- AI Search 設定與向量索引
- 模型部署策略與容量規劃
- AI 應用監控與效能優化

#### 實作練習
1. **AI 聊天部署**：部署 azure-search-openai-demo 範本
2. **RAG 實作**：設定文件索引與檢索
3. <strong>模型設定</strong>：設定多個具有不同用途的 AI 模型
4. **AI 監控**：為 AI 工作負載實作 Application Insights

#### 評量問題
- 如何在 AZD 範本中設定 Microsoft Foundry Models 服務？
- RAG 架構的關鍵組件有哪些？
- 如何管理 AI 模型的容量和擴展？
- 對 AI 應用而言，哪些監控指標很重要？

---

### 第 3 章：設定與驗證（第3週）
<strong>時長</strong>：45-60 分鐘 | <strong>複雜度</strong>：⭐⭐

#### 學習目標
- 精通環境設定與管理策略
- 實作安全的驗證模式與受管身分 (managed identity)
- 使用適當的命名慣例來組織資源
- 設定多環境部署（dev、staging、prod）

#### 應掌握的關鍵概念
- 環境階層與設定優先順序
- 受管身分與服務主體的驗證方式
- Key Vault 整合以管理機密
- 以環境為單位的參數管理

#### 實作練習
1. <strong>多環境設定</strong>：設定 dev、staging 與 prod 環境
2. <strong>安全性設定</strong>：實作受管身分驗證
3. <strong>機密管理</strong>：整合 Azure Key Vault 儲存敏感資料
4. <strong>參數管理</strong>：建立針對不同環境的設定

#### 評量問題
- 如何使用 AZD 設定不同的環境？
- 使用受管身分比服務主體有哪些好處？
- 如何安全地管理應用程式機密？
- AZD 的設定階層為何？

---

### 第 4 章：基礎建設即程式碼與部署（第4-5週）
<strong>時長</strong>：1-1.5 小時 | <strong>複雜度</strong>：⭐⭐⭐

#### 學習目標
- 建立並自訂 Bicep 基礎建設範本
- 實作進階部署模式與工作流程
- 了解資源佈建策略
- 設計可擴展的多服務架構

- 使用 Azure Container Apps 與 AZD 部署容器化應用程式


#### 應掌握的關鍵概念
- Bicep 範本結構與最佳實務
- 資源相依性與部署排序
- 參數檔與範本模組化
- 自訂鉤子與部署自動化
- Container App 部署模式（快速開始、製程、微服務）

#### 實作練習
1. <strong>自訂範本建立</strong>：建立一個多服務應用程式範本
2. **Bicep 精通**：建立模組化、可重用的基礎建設元件
3. <strong>部署自動化</strong>：實作部署前/後的鉤子
4. <strong>架構設計</strong>：部署複雜的微服務架構
5. **Container App 部署**：使用 AZD 部署 [簡易 Flask API](../../../examples/container-app/simple-flask-api) 與 [微服務架構](../../../examples/container-app/microservices) 範例

#### 評量問題
- 如何為 AZD 建立自訂的 Bicep 範本？
- 組織基礎建設程式碼的最佳實務為何？
- 在範本中如何處理資源相依性？
- 哪些部署模式支援零停機更新？

---

### 第 5 章：多代理 AI 解決方案（第6-7週）
<strong>時長</strong>：2-3 小時 | <strong>複雜度</strong>：⭐⭐⭐⭐

#### 學習目標
- 設計並實作多代理 AI 架構
- 編排代理之間的協調與通訊
- 部署具生產就緒能力的 AI 解決方案並加入監控
- 理解代理專職化與工作流程模式
- 將容器化微服務整合為多代理解決方案的一部分

#### 應掌握的關鍵概念
- 多代理架構模式與設計原則
- 代理通訊協定與資料流
- AI 代理的負載平衡與擴展策略
- 多代理系統的生產監控
- 容器化環境中的服務間通訊

#### 實作練習
1. <strong>零售解決方案部署</strong>：部署完整的多代理零售情境
2. <strong>代理自訂</strong>：修改 Customer 與 Inventory 代理的行為
3. <strong>架構擴展</strong>：實作負載平衡與自動擴展
4. <strong>生產監控</strong>：建立完整的監控與警示
5. <strong>微服務整合</strong>：擴充 [微服務架構](../../../examples/container-app/microservices) 範例以支援基於代理的工作流程

#### 評量問題
- 如何設計有效的多代理通訊模式？
- 擴展 AI 代理工作負載時需要考慮哪些要點？
- 如何監控與除錯多代理 AI 系統？
- 哪些生產模式可確保 AI 代理的可靠性？

---

### 第 6 章：部署前驗證與規劃（第8週）
<strong>時長</strong>：1 小時 | <strong>複雜度</strong>：⭐⭐

#### 學習目標
- 執行完整的容量規劃與資源驗證
- 為成本效益選擇最佳的 Azure SKU
- 實作自動化的部署前檢查與驗證
- 以成本優化策略規劃部署

#### 應掌握的關鍵概念
- Azure 資源配額與容量限制
- SKU 選擇準則與成本優化
- 自動化驗證腳本與測試
- 部署規劃與風險評估

#### 實作練習
1. <strong>容量分析</strong>：分析應用程式的資源需求
2. **SKU 優化**：比較並選擇具成本效益的服務階層
3. <strong>驗證自動化</strong>：實作部署前檢查腳本
4. <strong>成本規劃</strong>：建立部署成本估算與預算

#### 評量問題
- 在部署前如何驗證 Azure 的容量？
- 哪些因素會影響 SKU 的選擇決策？
- 如何自動化部署前的驗證？
- 有哪些策略可協助優化部署成本？

---

### 第 7 章：故障排除與除錯（第9週）
<strong>時長</strong>：1-1.5 小時 | <strong>複雜度</strong>：⭐⭐

#### 學習目標
- 發展針對 AZD 部署的系統性除錯方法
- 解決常見的部署與設定問題
- 除錯 AI 特有的問題與效能議題
- 實作監控與警示以主動偵測問題

#### 應掌握的關鍵概念
- 診斷技巧與日誌策略
- 常見失敗模式與其解法
- 效能監控與優化
- 事件回應與復原程序

#### 實作練習
1. <strong>診斷技巧</strong>：練習處理故意破壞的部署
2. <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
3. <strong>效能調校</strong>：優化效能較差的應用程式
4. <strong>復原程序</strong>：實作備份與災難復原

#### 評量問題
- 最常見的 AZD 部署失敗有哪些？
- 如何除錯驗證與權限問題？
- 哪些監控策略有助於預防生產問題？
- 如何在 Azure 中優化應用程式效能？

---

### 第 8 章：生產與企業級模式（第10-11週）
<strong>時長</strong>：2-3 小時 | <strong>複雜度</strong>：⭐⭐⭐⭐

#### 學習目標
- 實作企業級的部署策略
- 設計安全模式與合規性框架
- 建立監控、治理與成本管理
- 使用 AZD 整合建立可擴展的 CI/CD 管線
- 套用生產環境中 Container App 部署的最佳實務（安全、監控、成本、CI/CD）

#### 應掌握的關鍵概念
- 企業安全與合規需求
- 治理框架與政策實作
- 進階監控與成本管理
- CI/CD 整合與自動化部署管線
- containerized 工作負載的藍綠與金絲雀部署策略

#### 實作練習
1. <strong>企業安全</strong>：實作完整的安全模式
2. <strong>治理框架</strong>：設定 Azure Policy 與資源管理
3. <strong>進階監控</strong>：建立儀表板與自動化警示
4. **CI/CD 整合**：建立自動化部署管線
5. **生產 Container Apps**：對 [微服務架構](../../../examples/container-app/microservices) 範例套用安全、監控與成本優化

#### 評量問題
- 如何在 AZD 部署中實作企業級安全？
- 哪些治理模式可確保合規與成本控制？
- 如何為生產系統設計可擴展的監控？
- 哪些 CI/CD 模式最適合與 AZD 工作流程搭配？

#### 學習目標
- 了解 Azure Developer CLI 的基本原理與核心概念
- 成功在你的開發環境上安裝並設定 azd
- 使用現有範本完成你的第一次部署
- 瀏覽 azd 專案結構並了解關鍵組件

#### 應掌握的關鍵概念
- 範本、環境與服務
- azure.yaml 的設定結構
- 基本 azd 指令 (init, up, down, deploy)
- 基礎建設即程式碼原則
- Azure 驗證與授權

#### 實作練習

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
# 部署一個簡單的 Web 應用程式：
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

#### 自我評量問題
1. azd 架構的三個核心概念是什麼？
2. azure.yaml 檔案的用途為何？
3. 環境如何協助管理不同的部署目標？
4. 可以使用哪些驗證方法搭配 azd？
5. 當你第一次執行 `azd up` 時會發生什麼事？

---

## 進度追蹤與評量框架
```bash
# 建立並設定多個環境：
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

#### 自我評量問題
1. azd 如何處理環境變數的優先順序？
2. 什麼是部署鉤子（deployment hooks），何時應該使用它們？
3. 如何為不同環境設定不同的 SKU？
4. 不同驗證方法有哪些安全性影響？
5. 如何管理機密與敏感設定資料？

### 模組 3：部署與佈建（第4週）

#### 學習目標
- 精通部署工作流程與最佳實務
- 了解使用 Bicep 範本的基礎建設即程式碼
- 實作複雜的多服務架構
- 優化部署效能與可靠性

#### 應掌握的關鍵概念
- Bicep 範本結構與模組
- 資源相依性與排序
- 部署策略（藍綠、滾動更新）
- 多區域部署
- 資料庫遷移與資料管理

#### 實作練習

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

#### 自我評量問題
1. 使用 Bicep 相較於 ARM 範本有何優勢？
2. 在 azd 部署中如何處理資料庫遷移？
3. 有哪些策略可達成零停機部署？
4. 如何管理服務之間的相依性？
5. 多區域部署需要考慮哪些事項？

### 模組 4：部署前驗證（第5週)
- 實作全面的部署前檢查
- 精通容量規劃與資源驗證
- 了解 SKU 選擇與成本優化
- 建立自動化驗證流程

#### 需要掌握的關鍵概念
- Azure 資源配額與限制
- SKU 選擇準則與成本影響
- 自動化驗證腳本與工具
- 容量規劃的方法論
- 效能測試與優化

#### 練習題

**練習 4.1：容量規劃**
```bash
# 實作容量驗證:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**練習 4.2：部署前驗證**
```powershell
# 建立完整的驗證流程：
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**練習 4.3：SKU 最佳化**
```bash
# 優化服務設定：
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### 自我評估問題
1. 哪些因素應該影響 SKU 的選擇決策？
2. 在部署前如何驗證 Azure 資源的可用性？
3. 部署前檢查系統的關鍵組成是什麼？
4. 如何估算並控制部署成本？
5. 對於容量規劃，哪些監控是必要的？

### 模組 5：故障排除與除錯（第 6 週）

#### 學習目標
- 熟練系統化的故障排除方法論
- 發展處理複雜部署問題的除錯專長
- 實作完整的監控與警示
- 建立事件回應與復原程序

#### 需要掌握的關鍵概念
- 常見的部署失敗模式
- 日誌分析與關聯技術
- 效能監控與優化
- 安全事件偵測與回應
- 災難復原與業務持續性

#### 練習題

**練習 5.1：故障排除情境**
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
# 建立全面的監控:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**練習 5.3：事件回應**
```bash
# 建立事件應變程序：
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### 自我評估問題
1. 對 azd 部署，系統化的故障排除方法是什麼？
2. 如何在多個服務與資源之間關聯日誌？
3. 哪些監控指標對於早期問題偵測最為關鍵？
4. 如何實作有效的災難復原程序？
5. 事件回應計畫的主要組成要素是什麼？

### 模組 6：進階主題與最佳實務（第 7-8 週）

#### 學習目標
- 建立企業級的部署模式
- 精通 CI/CD 整合與自動化
- 開發自訂範本並回饋社群
- 理解進階的安全與合規性需求

#### 需要掌握的關鍵概念
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
# 建立並發佈自訂範本：
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
1. 如何將 azd 整合到現有的 CI/CD 工作流程？
2. 自訂範本開發的主要考量為何？
3. 如何在 azd 部署中實作治理與合規？
4. 企業級部署的最佳實務為何？
5. 如何有效地為 azd 社群做出貢獻？

## 實作專案

### 專案 1：個人作品集網站
<strong>複雜度</strong>：入門  
<strong>時長</strong>：1-2 週

使用下列項目建置並部署個人作品集網站：
- 在 Azure Storage 上進行靜態網站託管
- 自訂網域設定
- CDN 整合以提升全球效能
- 自動化部署管線

<strong>交付項目</strong>:
- 已部署並可運作的網站（在 Azure 上）
- 用於作品集部署的自訂 azd 範本
- 部署流程文件
- 成本分析與優化建議

### 專案 2：待辦事項管理應用程式
<strong>複雜度</strong>：中階  
<strong>時長</strong>：2-3 週

建立一個完整的待辦事項管理全端應用，包含：
- 部署到 App Service 的 React 前端
- 含認證的 Node.js API 後端
- 含遷移的 PostgreSQL 資料庫
- Application Insights 監控

<strong>交付項目</strong>:
- 含使用者認證的完整應用
- 資料庫結構與遷移腳本
- 監控儀表板與警示規則
- 多環境部署設定

### 專案 3：微服務電子商務平台
<strong>複雜度</strong>：進階  
<strong>時長</strong>：4-6 週

設計並實作基於微服務的電子商務平台：
- 多個 API 服務（catalog、orders、payments、users）
- 與 Service Bus 的訊息佇列整合
- 使用 Redis 快取以提升效能
- 全面化的日誌與監控

<strong>參考範例</strong>：請參閱 [Microservices Architecture](../../../examples/container-app/microservices) 以取得可投入生產的範本與部署指南

<strong>交付項目</strong>:
- 完整的微服務架構
- 服務間通訊模式
- 效能測試與優化
- 生產就緒的安全實作

## 評量與認證

### 知識檢核

在每個模組之後完成下列評量：

**模組 1 評量**：基礎概念與安裝
- 核心概念的多選題
- 實作安裝與設定任務
- 簡單的部署練習

**模組 2 評量**：設定與環境
- 環境管理情境題
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

**模組 5 評量**：故障排除與除錯
- 問題診斷練習
- 監控實作任務
- 事件回應模擬

**模組 6 評量**：進階主題
- CI/CD 管線設計
- 自訂範本開發
- 企業架構情境

### 最後總結專案

設計並實作一個完整解決方案，以展現所有概念的掌握：

<strong>需求</strong>:
- 多階層應用架構
- 多個部署環境
- 完整的監控與警示
- 安全與合規實作
- 成本優化與效能調校
- 完整文件與操作手冊

<strong>評分標準</strong>:
- 技術實作品質
- 文件完整度
- 安全與最佳實務遵循情形
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

### 其他工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習時程建議

### 全職學習（8 週）
- **第 1-2 週**：模組 1-2（入門、設定）
- **第 3-4 週**：模組 3-4（部署、部署前）
- **第 5-6 週**：模組 5-6（故障排除、進階主題）
- **第 7-8 週**：實作專案與最終評量

### 兼職學習（16 週）
- **第 1-4 週**：模組 1（入門）
- **第 5-7 週**：模組 2（設定與環境）
- **第 8-10 週**：模組 3（部署與佈建）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（故障排除與除錯）
- **第 15-16 週**：模組 6（進階主題與評量）

---

## 進度追蹤與評估架構

### 章節完成檢核表

透過下列可衡量的成果追蹤你完成各章節的進度：

#### 📚 章節 1：基礎與快速上手
- [ ] <strong>安裝完成</strong>：AZD 已在你的平台上安裝並驗證
- [ ] <strong>第一次部署</strong>：成功部署 todo-nodejs-mongo template
- [ ] <strong>環境設定</strong>：已設定第一組環境變數
- [ ] <strong>資源導覽</strong>：在 Azure 入口網站中檢視已部署資源
- [ ] <strong>指令熟悉</strong>：熟悉基本的 AZD 指令

#### 🤖 章節 2：以 AI 為先的開發  
- [ ] **AI 範本部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實作**：已設定文件索引與檢索
- [ ] <strong>模型設定</strong>：為不同用途設置多個 AI 模型
- [ ] **AI 監控**：為 AI 工作負載實作 Application Insights
- [ ] <strong>效能優化</strong>：調校 AI 應用效能

#### ⚙️ 章節 3：設定與認證
- [ ] <strong>多環境設定</strong>：已設定 dev、staging、prod 環境
- [ ] <strong>安全實作</strong>：設置受管理身分識別（managed identity）認證
- [ ] <strong>機密管理</strong>：整合 Azure Key Vault 以保護敏感資料
- [ ] <strong>參數管理</strong>：建立環境專屬的設定
- [ ] <strong>認證熟練</strong>：實作安全存取模式

#### 🏗️ 章節 4：基礎設施即程式碼與部署
- [ ] <strong>自訂範本建立</strong>：建立多服務應用的範本
- [ ] **Bicep 精通**：建立模組化、可重用的基礎設施組件
- [ ] <strong>部署自動化</strong>：實作部署前／後的掛鉤
- [ ] <strong>架構設計</strong>：部署複雜的微服務架構
- [ ] <strong>範本優化</strong>：為效能與成本優化範本

#### 🎯 章節 5：多代理 AI 解決方案
- [ ] <strong>零售解決方案部署</strong>：部署完整的多代理零售情境
- [ ] <strong>代理自訂</strong>：修改 Customer 與 Inventory 代理的行為
- [ ] <strong>架構擴展</strong>：實作負載平衡與自動伸縮
- [ ] <strong>生產監控</strong>：設定完整的監控與警示
- [ ] <strong>效能調校</strong>：優化多代理系統效能

#### 🔍 章節 6：部署前驗證與規劃
- [ ] <strong>容量分析</strong>：分析應用所需的資源
- [ ] **SKU 最佳化**：選擇具成本效益的服務等級
- [ ] <strong>驗證自動化</strong>：實作部署前檢查腳本
- [ ] <strong>成本規劃</strong>：建立部署成本預估與預算
- [ ] <strong>風險評估</strong>：識別並減輕部署風險

#### 🚨 章節 7：故障排除與除錯
- [ ] <strong>診斷技能</strong>：成功除錯故意設計成錯誤的部署
- [ ] <strong>日誌分析</strong>：有效使用 Azure Monitor 與 Application Insights
- [ ] <strong>效能調校</strong>：優化效能較差的應用
- [ ] <strong>復原程序</strong>：實作備份與災難復原
- [ ] <strong>監控設定</strong>：建立主動式監控與警示

#### 🏢 章節 8：生產與企業模式
- [ ] <strong>企業安全</strong>：實作完整的安全模式
- [ ] <strong>治理框架</strong>：設定 Azure Policy 與資源管理
- [ ] <strong>進階監控</strong>：建立儀表板與自動警示
- [ ] **CI/CD 整合**：建立自動化部署管線
- [ ] <strong>合規實作</strong>：符合企業合規要求

### 學習時程與里程碑

#### 第 1-2 週：建立基礎
- <strong>里程碑</strong>：使用 AZD 部署第一個 AI 應用
- <strong>驗證</strong>：可透過公開 URL 存取的應用
- <strong>技能</strong>：基本 AZD 工作流程與 AI 服務整合

#### 第 3-4 週：設定精通
- <strong>里程碑</strong>：具有安全認證的多環境部署
- <strong>驗證</strong>：相同的應用已部署到 dev/staging/prod
- <strong>技能</strong>：環境管理與安全實作

#### 第 5-6 週：基礎設施專業度
- <strong>里程碑</strong>：為複雜多服務應用建立自訂範本
- <strong>驗證</strong>：可被其他團隊成員重複使用的範本
- <strong>技能</strong>：Bicep 精通與基礎設施自動化

#### 第 7-8 週：進階 AI 實作
- <strong>里程碑</strong>：可投入生產的多代理 AI 解決方案
- <strong>驗證</strong>：系統能處理真實世界負載並具監控
- <strong>技能</strong>：多代理協調與效能優化

#### 第 9-10 週：生產就緒
- <strong>里程碑</strong>：具完整合規性的企業級部署
- <strong>驗證</strong>：通過安全審查與成本優化審核
- <strong>技能</strong>：治理、監控與 CI/CD 整合

### 評量與認證

#### 知識驗證方法
1. <strong>實作部署</strong>：每個章節都有可運作的應用
2. <strong>程式碼審查</strong>：範本與設定品質評估
3. <strong>問題解決</strong>：故障排除情境與對策
4. <strong>同儕教學</strong>：向其他學習者解釋概念
5. <strong>社群貢獻</strong>：分享範本或改進內容

#### 職業發展成果
- <strong>作品集專案</strong>: 8 個可投入生產的部署
- <strong>技術技能</strong>: 具備業界標準的 AZD 與 AI 部署專業知識
- <strong>問題解決能力</strong>: 獨立進行疑難排解與優化
- <strong>社群認可</strong>: 積極參與 Azure 開發者社群
- <strong>職涯提升</strong>: 技能可直接應用於雲端與 AI 職務

#### 成功指標
- <strong>部署成功率</strong>: >95% 的部署成功
- <strong>疑難排解時間</strong>: <30 分鐘解決常見問題
- <strong>效能優化</strong>: 在成本與效能上可展現的改進
- <strong>安全合規</strong>: 所有部署皆符合企業安全標準
- <strong>知識傳承</strong>: 能夠指導其他開發者

### 持續學習與社群參與

#### 保持更新
- **Azure 更新**: 追蹤 Azure Developer CLI 釋出說明
- <strong>社群活動</strong>: 參與 Azure 與 AI 開發者活動
- <strong>文件</strong>: 為社群文件與範例做出貢獻
- <strong>回饋機制</strong>: 對課程內容與 Azure 服務提供回饋

#### 職涯發展
- <strong>專業人脈</strong>: 與 Azure 與 AI 專家建立連結
- <strong>演講機會</strong>: 在會議或聚會分享學習成果
- <strong>開源貢獻</strong>: 為 AZD 範本與工具做出貢獻
- <strong>指導</strong>: 在 AZD 學習旅程中指導其他開發者

---

**章節導覽:** 
- **📚 課程首頁**: [AZD 初學者指南](../README.md)
- **📖 開始學習**: [第 1 章：基礎與快速上手](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: 透過完整的 8 章學習系統追蹤你的進展
- **🤝 社群**: [Azure Discord](https://discord.gg/microsoft-azure) 以獲得支援與討論

<strong>學習進度追蹤</strong>: 使用這份結構化指南，透過循序漸進且實務導向的學習掌握 Azure Developer CLI，達成可衡量的成果並獲得職業發展上的好處。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**:
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們致力於準確性，請注意自動翻譯可能包含錯誤或不準確之處。原始語言版本應視為具權威性的來源。對於重要資訊，建議採用專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或曲解負責。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->