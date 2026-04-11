# 5. Customize a Template

!!! tip "이 모듈을 완료하면 다음을 수행할 수 있습니다"

    - [ ] 기본 AI 에이전트 기능 탐색
    - [ ] 자체 인덱스를 사용한 AI 검색 추가
    - [ ] 추적(Tracing) 지표 활성화 및 분석
    - [ ] 평가 실행
    - [ ] 레드팀 스캔 실행
    - [ ] **랩 5: 맞춤화 계획 작성** 

---

## 5.1 AI Agent Capabilities

!!! success "랩 01에서 이 작업을 완료했습니다"

- **File Search**: 지식 검색을 위한 OpenAI의 내장 파일 검색
- **Citations**: 응답에서 자동 소스 표기
- **Customizable Instructions**: 에이전트의 동작과 성격 수정
- **Tool Integration**: 맞춤 기능을 위한 확장 가능한 도구 시스템

---

## 5.2 Knowledge Retrieval Options

!!! task "완료하려면 변경을 적용하고 다시 배포해야 합니다"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- Built-in to Foundry Agents
- 문서 자동 처리 및 인덱싱
- 추가 구성 불필요

**Azure AI Search (Optional):**

- 하이브리드 의미 기반 및 벡터 검색
- 맞춤 인덱스 관리
- 고급 검색 기능
- 필요: `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [추적 및 모니터링](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "완료하려면 변경을 적용하고 다시 배포해야 합니다"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**추적(Tracing):**

- OpenTelemetry 통합
- 요청/응답 추적
- 성능 지표
- Microsoft Foundry 포털에서 사용 가능

**로깅(Logging):**

- Container Apps의 애플리케이션 로그
- 상관 ID가 포함된 구조화된 로깅
- 실시간 및 이력 로그 보기

---

## 5.4 [에이전트 평가](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**로컬 평가:**

- 품질 평가를 위한 내장 평가자
- 맞춤 평가 스크립트
- 성능 벤치마킹

**연속 모니터링:**

- 실시간 상호작용에 대한 자동 평가
- 품질 지표 추적
- 성능 회귀 감지

**CI/CD 통합:**

- GitHub Actions 워크플로
- 자동화된 테스트 및 평가
- 통계적 비교 테스트

---

## 5.5 [AI 레드팀 에이전트](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI 레드팀:**

- 자동 보안 스캔
- AI 시스템에 대한 위험 평가
- 여러 범주에 걸친 안전성 평가

**인증:**

- Azure 서비스용 관리 ID
- 선택적 Azure App Service 인증
- 개발을 위한 기본 인증 폴백



!!! quote "이 실습을 마치면 다음을 갖추게 됩니다"
    - [ ] 시나리오 요구사항 정의
    - [ ] 환경 변수 맞춤화 (config)
    - [ ] 에이전트 지침 맞춤화 (task)
    - [ ] 맞춤 템플릿 배포 (app)
    - [ ] 배포 후 작업 완료 (수동)
    - [ ] 테스트 평가 실행

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Customize It For You!

### 5.6.1. Scenario Requirements

#### **Agent Deployments:** 

   - Shopper Agent: 고객이 제품을 찾고 비교하도록 지원
   - Loyalty Agent: 고객 보상 및 프로모션 관리

#### **Model Deployments:**

   - `gpt-4.1`: 기본 채팅 모델
   - `o3`: 복잡한 쿼리를 위한 추론 모델
   - `gpt-4.1-nano`: 간단한 상호작용을 위한 경량 모델
   - `text-embedding-3-large`: 검색을 위한 고품질 임베딩

#### **Features:**

   - 추적 및 모니터링 활성화
   - 제품 카탈로그용 AI 검색
   - 품질 보증을 위한 평가 프레임워크
   - 보안 검증을 위한 레드팀

---

### 5.6.2 Scenario Implementation


#### 5.6.2.1. Pre-Deployment Config

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# 환경 이름 설정
azd env set AZURE_ENV_NAME "retail-ai-agents"

# 리전 구성(모델 가용성에 따라 선택)
azd env set AZURE_LOCATION "eastus2"

# 모든 선택적 서비스 활성화
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# 기본 채팅 모델 구성(gpt-4.1 — gpt-4.1에 가장 근접한 사용 가능한 모델)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# 향상된 검색을 위한 임베딩 모델 구성
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# 에이전트 이름 설정(첫 번째 에이전트를 생성합니다)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# 검색 인덱스 구성
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Agent Instructions

생성 `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

생성 `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Deployment Script

#### 5.6.2.3: Deployment Script

생성 `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# 사전 요구 사항 확인
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# 환경 설정
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# 선택한 지역의 할당량 확인
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# 인프라 및 애플리케이션 배포
echo "🏗️  Deploying Azure infrastructure..."
azd up

# 배포 출력 캡처
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# 웹 앱 URL 가져오기
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Post-Deployment Config

생성 `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# 배포 정보를 가져옵니다
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# 수동 구성 지침
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Testing and Validation

생성 `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# 환경 변수가 설정되어 있는지 확인
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# 웹 애플리케이션 가용성 테스트
APP_URL=$(azd env get-values | grep '^APP_URL=' | cut -d'=' -f2- | tr -d '"')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# 구성된 경우 평가 실행
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Expected Outcomes

After following this implementation guide, you will have:

1. **배포된 인프라:**

      - 모델 배포가 포함된 Microsoft Foundry 프로젝트
      - 웹 애플리케이션을 호스팅하는 Container Apps
      - 제품 카탈로그용 AI Search 서비스
      - 모니터링을 위한 Application Insights

2. **초기 에이전트:**

      - 기본 지침으로 설정된 Shopper Agent
      - 파일 검색 기능 활성화
      - 추적 및 모니터링 구성됨

3. **맞춤화 준비:**

      - Loyalty Agent를 추가하기 위한 프레임워크
      - 사용자 지정 지침 템플릿
      - 테스트 및 검증 스크립트
      - 모니터링 및 평가 설정

4. **프로덕션 준비:**

      - 레드팀을 통한 보안 스캔
      - 성능 모니터링
      - 품질 평가 프레임워크
      - 확장 가능한 아키텍처

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)을 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 있을 수 있음을 유의해 주시기 바랍니다. 원문(원어로 작성된 문서)을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문 번역가의 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 어떤 오해나 잘못된 해석에 대해서도 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->