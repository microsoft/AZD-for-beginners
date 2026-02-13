# 學習指南 - 全面學習目標

**學習路徑導航**
- **📚 課程主頁**: [AZD 初學者指南](../README.md)
- **📖 開始學習**: [第一章：基礎與快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**: [課程完成](../README.md#-course-completion--certification)

## 簡介

這份全面的學習指南提供了結構化的學習目標、關鍵概念、練習題目及評估材料，幫助你掌握 Azure Developer CLI (azd)。使用這份指南追蹤你的學習進度，確保你已涵蓋所有重要主題。

## 學習目標

完成這份學習指南後，你將能夠：
- 掌握 Azure Developer CLI 的所有基礎及進階概念
- 發展部署及管理 Azure 應用的實際技能
- 建立解決問題及優化部署的信心
- 理解生產級部署實踐及安全考量

## 學習成果

完成這份學習指南的所有章節後，你將能夠：
- 使用 azd 設計、部署及管理完整的應用架構
- 實施全面的監控、安全及成本優化策略
- 獨立解決複雜的部署問題
- 創建自定義模板並為 azd 社群作出貢獻

## 八章學習結構

### 第一章：基礎與快速入門 (第一週)
**時長**: 30-45 分鐘 | **難度**: ⭐

#### 學習目標
- 理解 Azure Developer CLI 的核心概念及術語
- 成功在你的開發平台上安裝及配置 AZD
- 使用現有模板部署你的第一個應用
- 有效地操作 AZD 命令行介面

#### 需掌握的關鍵概念
- AZD 專案結構及組件 (azure.yaml, infra/, src/)
- 基於模板的部署工作流程
- 環境配置基礎
- 資源群組及訂閱管理

#### 實踐練習
1. **安裝驗證**: 安裝 AZD 並使用 `azd version` 驗證
2. **首次部署**: 成功部署 todo-nodejs-mongo 模板
3. **環境設置**: 配置你的第一組環境變數
4. **資源探索**: 在 Azure Portal 中瀏覽已部署的資源

#### 評估問題
- AZD 專案的核心組件有哪些？
- 如何從模板初始化一個新專案？
- `azd up` 和 `azd deploy` 有什麼區別？
- 如何使用 AZD 管理多個環境？

---

### 第二章：AI 優先開發 (第二週)
**時長**: 1-2 小時 | **難度**: ⭐⭐

#### 學習目標
- 將 Microsoft Foundry 服務整合到 AZD 工作流程中
- 部署及配置 AI 驅動的應用
- 理解 RAG (檢索增強生成) 的實施模式
- 管理 AI 模型的部署及擴展

#### 需掌握的關鍵概念
- Azure OpenAI 服務整合及 API 管理
- AI 搜索配置及向量索引
- 模型部署策略及容量規劃
- AI 應用監控及性能優化

#### 實踐練習
1. **AI 聊天部署**: 部署 azure-search-openai-demo 模板
2. **RAG 實施**: 配置文件索引及檢索
3. **模型配置**: 設置多個用途不同的 AI 模型
4. **AI 監控**: 為 AI 工作負載實施 Application Insights

#### 評估問題
- 如何在 AZD 模板中配置 Azure OpenAI 服務？
- RAG 架構的主要組件是什麼？
- 如何管理 AI 模型的容量及擴展？
- AI 應用的重要監控指標有哪些？

---

### 第三章：配置及身份驗證 (第三週)
**時長**: 45-60 分鐘 | **難度**: ⭐⭐

#### 學習目標
- 掌握環境配置及管理策略
- 實施安全的身份驗證模式及托管身份
- 使用適當的命名規範組織資源
- 配置多環境部署 (開發、測試、正式)

#### 需掌握的關鍵概念
- 環境層次及配置優先級
- 托管身份及服務主體身份驗證
- Key Vault 整合以管理機密
- 環境特定的參數管理

#### 實踐練習
1. **多環境設置**: 配置開發、測試及正式環境
2. **安全配置**: 實施托管身份驗證
3. **機密管理**: 整合 Azure Key Vault 管理敏感數據
4. **參數管理**: 創建環境特定的配置

#### 評估問題
- 如何使用 AZD 配置不同的環境？
- 使用托管身份比服務主體有什麼好處？
- 如何安全地管理應用機密？
- AZD 的配置層次是什麼？

---

### 第四章：基礎設施即代碼及部署 (第四至第五週)
**時長**: 1-1.5 小時 | **難度**: ⭐⭐⭐

#### 學習目標
- 創建及自定義 Bicep 基礎設施模板
- 實施進階部署模式及工作流程
- 理解資源配置策略
- 設計可擴展的多服務架構

- 使用 Azure Container Apps 和 AZD 部署容器化應用

#### 需掌握的關鍵概念
- Bicep 模板結構及最佳實踐
- 資源依賴及部署順序
- 參數文件及模板模組化
- 自定義 hooks 及部署自動化
- 容器應用部署模式 (快速入門、生產、微服務)

#### 實踐練習
1. **自定義模板創建**: 建立多服務應用模板
2. **Bicep 精通**: 創建模組化、可重用的基礎設施組件
3. **部署自動化**: 實施部署前/後 hooks
4. **架構設計**: 部署複雜的微服務架構
5. **容器應用部署**: 使用 AZD 部署 [Simple Flask API](../../../examples/container-app/simple-flask-api) 和 [Microservices Architecture](../../../examples/container-app/microservices) 示例

#### 評估問題
- 如何為 AZD 創建自定義 Bicep 模板？
- 組織基礎設施代碼的最佳實踐是什麼？
- 如何在模板中處理資源依賴？
- 哪些部署模式支持零停機更新？

---

### 第五章：多代理 AI 解決方案 (第六至第七週)
**時長**: 2-3 小時 | **難度**: ⭐⭐⭐⭐

#### 學習目標
- 設計及實施多代理 AI 架構
- 協調代理之間的通信及合作
- 部署生產級 AI 解決方案並進行監控
- 理解代理專業化及工作流程模式
- 整合容器化微服務作為多代理解決方案的一部分

#### 需掌握的關鍵概念
- 多代理架構模式及設計原則
- 代理通信協議及數據流
- AI 代理的負載均衡及擴展策略
- 多代理系統的生產監控
- 容器化環境中的服務間通信

#### 實踐練習
1. **零售解決方案部署**: 部署完整的多代理零售場景
2. **代理自定義**: 修改客戶及庫存代理行為
3. **架構擴展**: 實施負載均衡及自動擴展
4. **生產監控**: 設置全面的監控及警報
5. **微服務整合**: 擴展 [Microservices Architecture](../../../examples/container-app/microservices) 示例以支持基於代理的工作流程

#### 評估問題
- 如何設計有效的多代理通信模式？
- 擴展 AI 代理工作負載的主要考量是什麼？
- 如何監控及調試多代理 AI 系統？
- 哪些生產模式能確保 AI 代理的可靠性？

---

### 第六章：部署前驗證及規劃 (第八週)
**時長**: 1 小時 | **難度**: ⭐⭐

#### 學習目標
- 進行全面的容量規劃及資源驗證
- 選擇最優的 Azure SKU 以達到成本效益
- 實施自動化的部署前檢查及驗證
- 使用成本優化策略進行部署規劃

#### 需掌握的關鍵概念
- Azure 資源配額及容量限制
- SKU 選擇標準及成本優化
- 自動化驗證腳本及測試
- 部署規劃及風險評估

#### 實踐練習
1. **容量分析**: 分析應用的資源需求
2. **SKU 優化**: 比較並選擇具成本效益的服務層級
3. **驗證自動化**: 實施部署前檢查腳本
4. **成本規劃**: 創建部署成本估算及預算

#### 評估問題
- 如何在部署前驗證 Azure 容量？
- 哪些因素影響 SKU 選擇決策？
- 如何自動化部署前驗證？
- 哪些策略有助於優化部署成本？

---

### 第七章：故障排除及調試 (第九週)
**時長**: 1-1.5 小時 | **難度**: ⭐⭐

#### 學習目標
- 發展系統化的 AZD 部署調試方法
- 解決常見的部署及配置問題
- 調試 AI 特定問題及性能問題
- 實施監控及警報以主動檢測問題

#### 需掌握的關鍵概念
- 診斷技術及日誌策略
- 常見故障模式及其解決方案
- 性能監控及優化
- 事件響應及恢復程序

#### 實踐練習
1. **診斷技能**: 練習故意破壞的部署
2. **日誌分析**: 有效使用 Azure Monitor 和 Application Insights
3. **性能調整**: 優化性能較差的應用
4. **恢復程序**: 實施備份及災難恢復

#### 評估問題
- AZD 部署最常見的故障有哪些？
- 如何調試身份驗證及權限問題？
- 哪些監控策略有助於防止生產問題？
- 如何在 Azure 中優化應用性能？

---

### 第八章：生產及企業模式 (第十至第十一週)
**時長**: 2-3 小時 | **難度**: ⭐⭐⭐⭐

#### 學習目標
- 實施企業級部署策略
- 設計安全模式及合規框架
- 建立監控、治理及成本管理
- 使用 AZD 整合建立可擴展的 CI/CD 管道
- 應用生產容器應用部署的最佳實踐 (安全、監控、成本、CI/CD)

#### 需掌握的關鍵概念
- 企業安全及合規要求
- 治理框架及政策實施
- 高級監控及成本管理
- CI/CD 整合及自動化部署管道
- 容器化工作負載的藍綠及金絲雀部署策略

#### 實踐練習
1. **企業安全**: 實施全面的安全模式
2. **治理框架**: 設置 Azure Policy 及資源管理
3. **高級監控**: 創建儀表板及自動警報
4. **CI/CD 整合**: 建立自動化部署管道
5. **生產容器應用**: 將安全、監控及成本優化應用於 [Microservices Architecture](../../../examples/container-app/microservices) 示例

#### 評估問題
- 如何在 AZD 部署中實施企業安全？
- 哪些治理模式能確保合規及成本控制？
- 如何設計可擴展的生產系統監控？
- 哪些 CI/CD 模式最適合 AZD 工作流程？

#### 學習目標
- 理解 Azure Developer CLI 的基礎及核心概念
- 成功在你的開發環境中安裝及配置 azd
- 使用現有模板完成你的首次部署
- 瀏覽 azd 專案結構並理解主要組件

#### 需掌握的關鍵概念
- 模板、環境及服務
- azure.yaml 配置結構
- 基本 azd 命令 (init, up, down, deploy)
- 基礎設施即代碼原則
- Azure 身份驗證及授權

#### 實踐練習

**練習 1.1: 安裝及設置**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**練習 1.2: 首次部署**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**練習 1.3: 專案結構分析**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### 自我評估問題
1. azd 架構的三個核心概念是什麼？
2. azure.yaml 文件的用途是什麼？
3. 環境如何幫助管理不同的部署目標？
4. azd 可以使用哪些身份驗證方法？
5. 第一次運行 `azd up` 時會發生什麼？

---

## 進度追蹤及評估框架
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**練習 2.2: 高級配置**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**練習 2.3: 安全配置**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我評估問題
1. azd 如何處理環境變數的優先級？
2. 部署 hooks 是什麼，什麼時候應該使用它們？
3. 如何為不同的環境配置不同的 SKU？
4. 不同身份驗證方法的安全影響是什麼？
5. 如何管理機密及敏感配置數據？

### 模組 3: 部署及配置 (第四週)

#### 學習目標
- 掌握部署工作流程及最佳實踐
- 理解使用 Bicep 模板的基礎設施即代碼
- 實施複雜的多服務架構
- 優化部署性能及可靠性

#### 需掌握的關鍵概念
- Bicep 模板結構及模組
- 資源依賴及順序
- 部署策略 (藍綠部署、滾動更新)
- 多區域部署
- 數據庫遷移及數據管理

#### 實踐練習

**練習 3.1: 自定義基礎設施**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**練習 3.2: 多服務應用**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**練習 3.3: 數據庫整合**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我評估問題
1. 使用 Bicep 比 ARM 模板有什麼優勢？
2. 如何在 azd 部署中處理數據庫遷移？
3. 哪些策略支持零停機部署？
4. 如何管理服務之間的依賴關係？
5. 多地區部署需要考慮的事項是什麼？

### 模組 4：部署前驗證（第 5 週）

#### 學習目標
- 執行全面的部署前檢查
- 掌握容量規劃及資源驗證
- 理解 SKU 選擇及成本優化
- 建立自動化驗證管道

#### 需要掌握的關鍵概念
- Azure 資源配額及限制
- SKU 選擇標準及成本影響
- 自動化驗證腳本及工具
- 容量規劃方法
- 性能測試及優化

#### 練習題目

**練習 4.1：容量規劃**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**練習 4.2：部署前驗證**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**練習 4.3：SKU 優化**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### 自我評估問題
1. 哪些因素應該影響 SKU 的選擇決策？
2. 如何在部署前驗證 Azure 資源的可用性？
3. 部署前檢查系統的關鍵組成部分是什麼？
4. 如何估算及控制部署成本？
5. 容量規劃中哪些監控是必須的？

### 模組 5：故障排除及除錯（第 6 週）

#### 學習目標
- 掌握系統化的故障排除方法
- 精通複雜部署問題的除錯
- 實施全面的監控及警報
- 建立事件響應及恢復程序

#### 需要掌握的關鍵概念
- 常見的部署失敗模式
- 日誌分析及關聯技術
- 性能監控及優化
- 安全事件檢測及響應
- 災難恢復及業務連續性

#### 練習題目

**練習 5.1：故障排除場景**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**練習 5.2：監控實施**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**練習 5.3：事件響應**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### 自我評估問題
1. azd 部署的系統化故障排除方法是什麼？
2. 如何在多個服務及資源中關聯日誌？
3. 哪些監控指標對於早期問題檢測最為關鍵？
4. 如何實施有效的災難恢復程序？
5. 事件響應計劃的關鍵組成部分是什麼？

### 模組 6：進階主題及最佳實踐（第 7-8 週）

#### 學習目標
- 實施企業級部署模式
- 精通 CI/CD 整合及自動化
- 開發自訂模板並貢獻社群
- 理解進階的安全及合規要求

#### 需要掌握的關鍵概念
- CI/CD 管道整合模式
- 自訂模板開發及分發
- 企業治理及合規
- 進階網絡及安全配置
- 性能優化及成本管理

#### 練習題目

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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**練習 6.3：企業實施**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### 自我評估問題
1. 如何將 azd 整合到現有的 CI/CD 工作流程中？
2. 自訂模板開發的關鍵考量是什麼？
3. 如何在 azd 部署中實施治理及合規？
4. 企業級部署的最佳實踐是什麼？
5. 如何有效地為 azd 社群作出貢獻？

## 實踐項目

### 項目 1：個人作品集網站
**複雜度**：初學者  
**時長**：1-2 週  

建立並部署一個個人作品集網站，使用：
- Azure Storage 的靜態網站託管
- 自訂網域配置
- CDN 整合以提升全球性能
- 自動化部署管道

**交付成果**：
- 部署於 Azure 的運作網站
- 用於作品集部署的自訂 azd 模板
- 部署過程的文檔
- 成本分析及優化建議

### 項目 2：任務管理應用程式
**複雜度**：中級  
**時長**：2-3 週  

建立一個全棧任務管理應用程式，包括：
- 部署到 App Service 的 React 前端
- 帶有身份驗證的 Node.js API 後端
- 帶有遷移的 PostgreSQL 資料庫
- Application Insights 監控

**交付成果**：
- 完整的應用程式，包含用戶身份驗證
- 資料庫架構及遷移腳本
- 監控儀表板及警報規則
- 多環境部署配置

### 項目 3：微服務電子商務平台
**複雜度**：高級  
**時長**：4-6 週  

設計並實施一個基於微服務的電子商務平台，包括：
- 多個 API 服務（目錄、訂單、支付、用戶）
- 與 Service Bus 的消息隊列整合
- 使用 Redis 快取進行性能優化
- 全面的日誌記錄及監控

**參考範例**：請參閱 [Microservices Architecture](../../../examples/container-app/microservices) 以獲取生產就緒模板及部署指南

**交付成果**：
- 完整的微服務架構
- 服務間的通信模式
- 性能測試及優化
- 生產就緒的安全實施

## 評估及認證

### 知識檢查

在每個模組後完成以下評估：

**模組 1 評估**：基礎概念及安裝
- 核心概念的選擇題
- 實際安裝及配置任務
- 簡單的部署練習

**模組 2 評估**：配置及環境
- 環境管理場景
- 配置故障排除練習
- 安全配置實施

**模組 3 評估**：部署及資源配置
- 基礎設施設計挑戰
- 多服務部署場景
- 性能優化練習

**模組 4 評估**：部署前驗證
- 容量規劃案例研究
- 成本優化場景
- 驗證管道實施

**模組 5 評估**：故障排除及除錯
- 問題診斷練習
- 監控實施任務
- 事件響應模擬

**模組 6 評估**：進階主題
- CI/CD 管道設計
- 自訂模板開發
- 企業架構場景

### 最終綜合項目

設計並實施一個完整的解決方案，展示對所有概念的掌握：

**要求**：
- 多層應用程式架構
- 多個部署環境
- 全面的監控及警報
- 安全及合規實施
- 成本優化及性能調整
- 完整的文檔及操作手冊

**評估標準**：
- 技術實施質量
- 文檔完整性
- 安全及最佳實踐的遵守
- 性能及成本優化
- 故障排除及監控的有效性

## 學習資源及參考資料

### 官方文檔
- [Azure Developer CLI 文檔](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep 文檔](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)

### 社群資源
- [AZD 模板庫](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub 儲存庫](https://github.com/Azure/azure-dev)

### 練習環境
- [Azure 免費帳戶](https://azure.microsoft.com/free/)
- [Azure DevOps 免費層](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### 其他工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## 學習時間表建議

### 全職學習（8 週）
- **第 1-2 週**：模組 1-2（入門、配置）
- **第 3-4 週**：模組 3-4（部署、部署前）
- **第 5-6 週**：模組 5-6（故障排除、進階主題）
- **第 7-8 週**：實踐項目及最終評估

### 兼職學習（16 週）
- **第 1-4 週**：模組 1（入門）
- **第 5-7 週**：模組 2（配置及環境）
- **第 8-10 週**：模組 3（部署及資源配置）
- **第 11-12 週**：模組 4（部署前驗證）
- **第 13-14 週**：模組 5（故障排除及除錯）
- **第 15-16 週**：模組 6（進階主題及評估）

---

## 進度追蹤及評估框架

### 章節完成檢查表

透過以下可衡量的成果追蹤每章進度：

#### 📚 第 1 章：基礎及快速入門
- [ ] **完成安裝**：在您的平台上安裝並驗證 AZD
- [ ] **首次部署**：成功部署 todo-nodejs-mongo 模板
- [ ] **環境設置**：配置第一個環境變數
- [ ] **資源導航**：在 Azure Portal 中探索已部署的資源
- [ ] **命令掌握**：熟悉基本的 AZD 命令

#### 🤖 第 2 章：AI 優先開發  
- [ ] **AI 模板部署**：成功部署 azure-search-openai-demo
- [ ] **RAG 實施**：配置文件索引及檢索
- [ ] **模型配置**：設置多個不同用途的 AI 模型
- [ ] **AI 監控**：為 AI 工作負載實施 Application Insights
- [ ] **性能優化**：調整 AI 應用程式性能

#### ⚙️ 第 3 章：配置及身份驗證
- [ ] **多環境設置**：配置開發、測試及生產環境
- [ ] **安全實施**：設置受管理的身份驗證
- [ ] **機密管理**：整合 Azure Key Vault 管理敏感數據
- [ ] **參數管理**：創建特定環境的配置
- [ ] **身份驗證掌握**：實施安全的訪問模式

#### 🏗️ 第 4 章：基礎設施即代碼及部署
- [ ] **自訂模板創建**：建立多服務應用程式模板
- [ ] **Bicep 掌握**：創建模組化、可重用的基礎設施組件
- [ ] **部署自動化**：實施部署前/後掛鉤
- [ ] **架構設計**：部署複雜的微服務架構
- [ ] **模板優化**：優化模板以提升性能及降低成本

#### 🎯 第 5 章：多代理 AI 解決方案
- [ ] **零售解決方案部署**：部署完整的多代理零售場景
- [ ] **代理自訂**：修改客戶及庫存代理行為
- [ ] **架構擴展**：實施負載平衡及自動擴展
- [ ] **生產監控**：設置全面的監控及警報
- [ ] **性能調整**：優化多代理系統性能

#### 🔍 第 6 章：部署前驗證及規劃
- [ ] **容量分析**：分析應用程式的資源需求
- [ ] **SKU 優化**：選擇具成本效益的服務層級
- [ ] **驗證自動化**：實施部署前檢查腳本
- [ ] **成本規劃**：創建部署成本估算及預算
- [ ] **風險評估**：識別及減輕部署風險

#### 🚨 第 7 章：故障排除及除錯
- [ ] **診斷技能**：成功排除故意設置的部署問題
- [ ] **日誌分析**：有效使用 Azure Monitor 及 Application Insights
- [ ] **性能調整**：優化性能較差的應用程式
- [ ] **恢復程序**：實施備份及災難恢復
- [ ] **監控設置**：創建主動監控及警報

#### 🏢 第 8 章：生產及企業模式
- [ ] **企業安全**：實施全面的安全模式
- [ ] **治理框架**：設置 Azure Policy 及資源管理
- [ ] **進階監控**：創建儀表板及自動化警報
- [ ] **CI/CD 整合**：建立自動化部署管道
- [ ] **合規實施**：滿足企業合規要求

### 學習時間表及里程碑

#### 第 1-2 週：基礎建設
- **里程碑**：使用 AZD 部署第一個 AI 應用程式
- **驗證**：可通過公共 URL 訪問的運作應用程式
- **技能**：基本 AZD 工作流程及 AI 服務整合

#### 第 3-4 週：配置掌握
- **里程碑**：多環境部署及安全身份驗證
- **驗證**：相同應用程式部署到開發/測試/生產環境
- **技能**：環境管理及安全實施

#### 第 5-6 週：基礎設施專業知識
- **里程碑**：為複雜的多服務應用程式創建自訂模板
- **驗證**：由其他團隊成員部署的可重用模板
- **技能**：Bicep 掌握及基礎設施自動化

#### 第 7-8 週：進階 AI 實施
- **里程碑**：生產就緒的多代理 AI 解決方案
- **驗證**：系統處理真實負載並設有監控
- **技能**：多代理協作及性能優化

#### 第 9-10 週：生產準備
- **里程碑**：企業級部署，符合所有合規要求
- **驗證**：通過安全審查及成本優化審核
- **技能**：治理、監控及 CI/CD 整合

### 評估及認證

#### 知識驗證方法
1. **實際部署**：每章的運作應用程式
2. **代碼審查**：模板及配置質量評估
3. **問題解決**：故障排除場景及解決方案
4. **同儕教學**：向其他學員解釋概念
5. **社群貢獻**：分享模板或改進建議

#### 專業發展成果
- **作品集項目**：8個可投入生產的部署
- **技術技能**：符合業界標準的AZD及AI部署專業知識
- **解難能力**：獨立排除故障及優化能力
- **社群認可**：積極參與Azure開發者社群
- **職業發展**：直接應用於雲端及AI相關職位的技能

#### 成功指標
- **部署成功率**：>95%成功部署
- **故障排除時間**：常見問題解決時間少於30分鐘
- **性能優化**：成本及性能方面的顯著改善
- **安全合規性**：所有部署符合企業安全標準
- **知識傳遞**：能夠指導其他開發者

### 持續學習及社群參與

#### 保持更新
- **Azure更新**：追蹤Azure Developer CLI的版本更新
- **社群活動**：參加Azure及AI開發者活動
- **文件貢獻**：為社群文件及範例作出貢獻
- **反饋循環**：提供課程內容及Azure服務的反饋意見

#### 職業發展
- **專業網絡**：與Azure及AI專家建立聯繫
- **演講機會**：在會議或聚會中分享學習成果
- **開源貢獻**：為AZD模板及工具作出貢獻
- **指導**：引導其他開發者學習AZD

---

**章節導航：**
- **📚 課程主頁**：[AZD For Beginners](../README.md)
- **📖 開始學習**：[第一章：基礎及快速入門](../README.md#-chapter-1-foundation--quick-start)
- **🎯 進度追蹤**：透過全面的8章學習系統追蹤你的進展
- **🤝 社群**：[Azure Discord](https://discord.gg/microsoft-azure) 提供支援及討論

**學習進度追蹤**：使用這個結構化指南，透過漸進式、實用的學習方式掌握Azure Developer CLI，並獲得可衡量的成果及專業發展效益。

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：  
此文件已使用人工智能翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。我們致力於提供準確的翻譯，但請注意，自動翻譯可能包含錯誤或不準確之處。原始語言的文件應被視為權威來源。對於重要資訊，建議使用專業的人類翻譯。我們對因使用此翻譯而引起的任何誤解或誤釋不承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->