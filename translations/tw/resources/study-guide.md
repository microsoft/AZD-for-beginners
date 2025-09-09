<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:36:49+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "tw"
}
-->
# 學習指南 - AZD 初學者

## 介紹

這份全面的學習指南提供了結構化的學習目標、關鍵概念、練習題以及評估材料，幫助您掌握 Azure Developer CLI (azd)。使用此指南追蹤您的學習進度，確保涵蓋所有重要主題。

## 學習目標

完成此學習指南後，您將能夠：
- 掌握 Azure Developer CLI 的基本和進階概念
- 發展部署和管理 Azure 應用的實際技能
- 建立排除故障和優化部署的信心
- 理解生產級部署實踐及安全考量

## 學習成果

完成所有章節後，您將能夠：
- 使用 azd 設計、部署和管理完整的應用架構
- 實施全面的監控、安全和成本優化策略
- 獨立排除複雜的部署問題
- 創建自定義模板並為 azd 社群做出貢獻

## 課程結構

### 模組 1：入門 (第 1-2 週)

#### 學習目標
- 理解 Azure Developer CLI 的基本原理和核心概念
- 成功在開發環境中安裝和配置 azd
- 使用現有模板完成首次部署
- 探索 azd 專案結構並理解其主要組成部分

#### 需掌握的關鍵概念
- 模板、環境和服務
- azure.yaml 配置結構
- 基本 azd 命令 (init, up, down, deploy)
- 基礎架構即代碼 (Infrastructure as Code) 原則
- Azure 身份驗證和授權

#### 練習題

**練習 1.1：安裝與設置**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**練習 1.2：首次部署**  
```bash
# Deploy a simple web application:
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
1. azd 架構的三個核心概念是什麼？
2. azure.yaml 文件的用途是什麼？
3. 環境如何幫助管理不同的部署目標？
4. azd 可以使用哪些身份驗證方法？
5. 第一次執行 `azd up` 時會發生什麼？

### 模組 2：配置與環境 (第 3 週)

#### 學習目標
- 掌握環境管理和配置
- 理解進階 azure.yaml 配置
- 實施環境特定的設置和變數
- 配置不同場景的身份驗證

#### 需掌握的關鍵概念
- 環境層級和變數優先順序
- 服務配置和參數
- Hooks 和生命周期事件
- 身份驗證方法 (使用者、服務主體、托管身份)
- 配置文件管理

#### 練習題

**練習 2.1：多環境設置**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### 自我評估問題
1. azd 如何處理環境變數的優先順序？
2. 部署 hooks 是什麼？什麼時候應該使用它們？
3. 如何為不同環境配置不同的 SKU？
4. 不同身份驗證方法的安全影響是什麼？
5. 如何管理機密和敏感配置數據？

### 模組 3：部署與配置 (第 4 週)

#### 學習目標
- 掌握部署工作流程和最佳實踐
- 理解使用 Bicep 模板的基礎架構即代碼
- 實施複雜的多服務架構
- 優化部署性能和可靠性

#### 需掌握的關鍵概念
- Bicep 模板結構和模組
- 資源依賴性和排序
- 部署策略 (藍綠部署、滾動更新)
- 多區域部署
- 數據庫遷移和數據管理

#### 練習題

**練習 3.1：自定義基礎架構**  
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**練習 3.3：數據庫整合**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### 自我評估問題
1. 使用 Bicep 相較於 ARM 模板的優勢是什麼？
2. 如何在 azd 部署中處理數據庫遷移？
3. 零停機部署有哪些策略？
4. 如何管理服務之間的依賴性？
5. 多區域部署需要考慮哪些因素？

### 模組 4：部署前驗證 (第 5 週)

#### 學習目標
- 實施全面的部署前檢查
- 掌握容量規劃和資源驗證
- 理解 SKU 選擇和成本優化
- 建立自動化驗證管道

#### 需掌握的關鍵概念
- Azure 資源配額和限制
- SKU 選擇標準及成本影響
- 自動化驗證腳本和工具
- 容量規劃方法
- 性能測試和優化

#### 練習題

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
1. 哪些因素應影響 SKU 選擇決策？
2. 如何在部署前驗證 Azure 資源的可用性？
3. 部署前檢查系統的關鍵組成部分是什麼？
4. 如何估算和控制部署成本？
5. 容量規劃需要哪些重要的監控？

### 模組 5：故障排除與調試 (第 6 週)

#### 學習目標
- 掌握系統化的故障排除方法
- 發展調試複雜部署問題的專業技能
- 實施全面的監控和警報
- 建立事件響應和恢復程序

#### 需掌握的關鍵概念
- 常見的部署失敗模式
- 日誌分析和關聯技術
- 性能監控和優化
- 安全事件檢測和響應
- 災難恢復和業務連續性

#### 練習題

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
1. azd 部署故障排除的系統化方法是什麼？
2. 如何在多個服務和資源之間關聯日誌？
3. 哪些監控指標對早期問題檢測最為重要？
4. 如何實施有效的災難恢復程序？
5. 事件響應計劃的關鍵組成部分是什麼？

### 模組 6：進階主題與最佳實踐 (第 7-8 週)

#### 學習目標
- 實施企業級部署模式
- 掌握 CI/CD 整合與自動化
- 開發自定義模板並為社群做出貢獻
- 理解進階安全和合規要求

#### 需掌握的關鍵概念
- CI/CD 管道整合模式
- 自定義模板開發與分發
- 企業治理與合規
- 進階網絡與安全配置
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

**練習 6.2：自定義模板開發**  
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
2. 自定義模板開發的關鍵考量是什麼？
3. 如何在 azd 部署中實施治理與合規？
4. 企業級部署的最佳實踐是什麼？
5. 如何有效地為 azd 社群做出貢獻？

## 實踐專案

### 專案 1：個人作品集網站  
**複雜度**：初學者  
**時長**：1-2 週  

使用以下技術構建並部署個人作品集網站：
- Azure Storage 上的靜態網站託管
- 自定義域名配置
- CDN 整合以提升全球性能
- 自動化部署管道

**交付成果**：
- 部署在 Azure 上的工作網站
- 用於作品集部署的自定義 azd 模板
- 部署過程的文檔
- 成本分析與優化建議

### 專案 2：任務管理應用  
**複雜度**：中級  
**時長**：2-3 週  

創建一個全棧任務管理應用，包括：
- 部署到 App Service 的 React 前端
- 帶身份驗證的 Node.js API 後端
- 帶遷移功能的 PostgreSQL 數據庫
- Application Insights 監控

**交付成果**：
- 帶身份驗證的完整應用
- 數據庫架構和遷移腳本
- 監控儀表板和警報規則
- 多環境部署配置

### 專案 3：微服務電子商務平台  
**複雜度**：進階  
**時長**：4-6 週  

設計並實施基於微服務的電子商務平台：
- 多個 API 服務 (目錄、訂單、支付、用戶)
- 與 Service Bus 的消息隊列整合
- Redis 緩存以提升性能
- 全面的日誌記錄和監控

**交付成果**：
- 完整的微服務架構
- 服務間通信模式
- 性能測試與優化
- 生產級安全實施

## 評估與認證

### 知識檢查

在每個模組完成後進行以下評估：

**模組 1 評估**：基本概念與安裝  
- 核心概念的選擇題  
- 實際安裝與配置任務  
- 簡單部署練習  

**模組 2 評估**：配置與環境  
- 環境管理場景  
- 配置故障排除練習  
- 安全配置實施  

**模組 3 評估**：部署與配置  
- 基礎架構設計挑戰  
- 多服務部署場景  
- 性能優化練習  

**模組 4 評估**：部署前驗證  
- 容量規劃案例研究  
- 成本優化場景  
- 驗證管道實施  

**模組 5 評估**：故障排除與調試  
- 問題診斷練習  
- 監控實施任務  
- 事件響應模擬  

**模組 6 評估**：進階主題  
- CI/CD 管道設計  
- 自定義模板開發  
- 企業架構場景  

### 最終綜合專案

設計並實施一個完整解決方案，展示對所有概念的掌握：

**要求**：
- 多層應用架構  
- 多個部署環境  
- 全面的監控和警報  
- 安全與合規實施  
- 成本優化與性能調整  
- 完整的文檔和運維手冊  

**評估標準**：
- 技術實施質量  
- 文檔完整性  
- 安全與最佳實踐遵循  
- 性能與成本優化  
- 故障排除與監控效果  

## 學習資源與參考

### 官方文檔
- [Azure Developer CLI 文檔](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep 文檔](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)  

### 社群資源
- [AZD 模板畫廊](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub 組織](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub 儲存庫](https://github.com/Azure/azure-dev)  

### 練習環境
- [Azure 免費帳戶](https://azure.microsoft.com/free/)  
- [Azure DevOps 免費層](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### 其他工具
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools 擴展包](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## 學習時間建議

### 全職學習 (8 週)
- **第 1-2 週**：模組 1-2 (入門、配置)  
- **第 3-4 週**：模組 3-4 (部署、部署前驗證)  
- **第 5-6 週**：模組 5-6 (故障排除、進階主題)  
- **第 7-8 週**：實踐專案與最終評估  

### 兼職學習 (16 週)
- **第 1-4 週**：模組 1 (入門)  
- **第 5-7 週**：模組 2 (配置與環境)  
- **第 8-10 週**：模組 3 (部署與配置)  
- **第 11-12 週**：模組 4 (部署前驗證)  
- **第 13-14 週**：模組 5 (故障排除與調試)  
- **第 15-16 週**：模組 6 (進階主題與評估)  

### 自主學習
- 按自己的節奏完成每個模組  
- 在困難概念上花更多時間  
- 重複練習直到掌握  
- 參加社群討論並提出問題  

## 成功秘訣

### 有效的學習策略
1. **定期練習**：頻繁部署應用以建立操作記憶  
2. **勇於嘗試**：在開發環境中嘗試新配置  
3. **記錄學習**：記錄解決問題的過程和方法  
4. **加入社群**：參與討論並貢獻項目  
5. **保持更新**：關注 Azure 的更新和新功能  

### 常見的錯誤避免
1. **跳過基礎知識**：確保具備必要的基礎知識  
2. **匆忙學習**：花時間深入理解基本概念  
3. **忽略安全性**：從一開始就實施安全最佳實踐  
4. **測試不足**：在多個環境中測試部署  
5. **忽視文檔**：良好的文檔對維護至關重要  

### 建立實踐經驗
1. **從小開始**：從簡單的應用開始，逐步增加複雜度  
2. **從失敗中學習**：將故障排除練習作為學習機會  
3. **貢獻開源**：與社群分享您的模板和解決方案  
4. **教導他人**：向他人解釋概念能加強您自己的理解  
5. **保持好奇心**：不斷探索新的 Azure 服務和整合模式  

---

**導航**  
- **上一課**：[常見問題](faq.md)  
- **下一課**：[更新日誌](../changelog.md)  

**學習進度追蹤**：使用本指南追蹤您的學習旅程，確保全面掌握所有 Azure Developer CLI 的概念和實踐。  

---

**免責聲明**：  
本文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。儘管我們致力於提供準確的翻譯，請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議尋求專業人工翻譯。我們對因使用此翻譯而引起的任何誤解或錯誤解釋不承擔責任。