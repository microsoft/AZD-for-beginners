# 5. 템플릿 맞춤화하기

!!! tip "이 모듈을 마치면 할 수 있게 됩니다"

    - [ ] 기본 AI 에이전트 기능 탐색하기
    - [ ] 자체 인덱스를 사용해 AI 검색 추가하기
    - [ ] 추적 지표 활성화 및 분석하기
    - [ ] 평가 실행하기
    - [ ] 레드팀 스캔 실행하기
    - [ ] **랩 5: 맞춤화 계획 수립하기** 

---

## 5.1 AI 에이전트 기능

!!! success "랩 01에서 완료했습니다"

- **파일 검색**: 지식 검색을 위한 OpenAI 기본 내장 파일 검색
- <strong>인용</strong>: 응답 시 자동 출처 표기
- **맞춤형 지침**: 에이전트 행동 및 성격 수정 가능
- **도구 통합**: 맞춤 기능을 위한 확장 도구 시스템

---

## 5.2 지식 검색 옵션

!!! task "완료하려면 변경하고 재배포해야 합니다"    
    
    ```bash title=""
    # 환경 변수 설정
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # 데이터 업로드 및 인덱스 생성

    ```

---

**OpenAI 파일 검색 (기본값):**

- Foundry 에이전트에 내장
- 문서 자동 처리 및 인덱싱
- 추가 구성 필요 없음

**Azure AI 검색 (선택 사항):**

- 하이브리드 시맨틱 및 벡터 검색
- 맞춤 인덱스 관리
- 고급 검색 기능
- `USE_AZURE_AI_SEARCH_SERVICE=true` 필요

---

## 5.3 [추적 및 모니터링](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "완료하려면 변경하고 재배포해야 합니다"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**추적:**

- OpenTelemetry 통합
- 요청/응답 추적
- 성능 지표
- Microsoft Foundry 포털에서 사용 가능

**로깅:**

- 컨테이너 앱에서 애플리케이션 로그
- 상관 ID가 포함된 구조화된 로깅
- 실시간 및 과거 로그 조회

---

## 5.4 [에이전트 평가](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**로컬 평가:**

- 품질 평가를 위한 내장 평가기
- 맞춤 평가 스크립트
- 성능 벤치마킹

**지속 모니터링:**

- 실시간 상호작용 자동 평가
- 품질 지표 추적
- 성능 저하 탐지

**CI/CD 통합:**

- GitHub Actions 워크플로우
- 자동화된 테스트 및 평가
- 통계적 비교 테스트

---

## 5.5 [AI 레드 팀 에이전트](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**AI 레드 팀:**

- 자동화된 보안 스캔
- AI 시스템 위험 평가
- 다중 카테고리 안전성 평가

**인증:**

- Azure 서비스용 관리 ID
- 선택적 Azure App Service 인증
- 개발용 베이직 인증 대체

!!! quote "이 랩을 마치면 다음을 갖게 됩니다"
    - [ ] 시나리오 요구사항 정의하기
    - [ ] 환경 변수 맞춤화하기 (구성)
    - [ ] 에이전트 지침 맞춤화하기 (작업)
    - [ ] 맞춤 템플릿 배포하기 (앱)
    - [ ] 배포 후 작업 완료하기 (수동)
    - [ ] 평가 테스트 실행하기

이 예제는 두 개의 특화된 에이전트와 여러 모델 배포로 기업용 리테일 시나리오에 맞게 템플릿을 맞춤화하는 방법을 보여줍니다.

---

## 5.6 당신을 위한 맞춤화!

### 5.6.1. 시나리오 요구사항

#### **에이전트 배포:** 

   - 쇼퍼 에이전트: 고객이 상품을 찾고 비교하도록 지원
   - 로열티 에이전트: 고객 보상 및 프로모션 관리

#### **모델 배포:**

   - `gpt-4.1`: 주 채팅 모델
   - `o3`: 복잡한 쿼리를 위한 추론 모델
   - `gpt-4.1-nano`: 간단한 상호작용용 경량 모델
   - `text-embedding-3-large`: 검색용 고품질 임베딩

#### **기능:**

   - 추적 및 모니터링 활성화
   - 제품 카탈로그용 AI 검색
   - 품질 보증을 위한 평가 프레임워크
   - 보안 검증을 위한 레드 팀

---

### 5.6.2 시나리오 구현

#### 5.6.2.1. 사전 배포 구성

설정 스크립트(`setup-retail.sh`) 생성

```bash title="" linenums="0"
#!/bin/bash

# 환경 이름 설정
azd env set AZURE_ENV_NAME "retail-ai-agents"

# 리전 구성 (모델 가용성에 따라 선택)
azd env set AZURE_LOCATION "eastus2"

# 모든 선택적 서비스 활성화
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# 기본 챗 모델 구성 (gpt-4.1과 가장 가까운 gpt-4.1 사용)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# 향상된 검색을 위한 임베딩 모델 구성
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# 에이전트 이름 설정 (첫 번째 에이전트 생성)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# 검색 인덱스 구성
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: 에이전트 지침

`custom-agents/shopper-agent-instructions.md` 생성:

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

`custom-agents/loyalty-agent-instructions.md` 생성:

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

#### 5.6.2.3: 배포 스크립트

`deploy-retail.sh` 생성:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# 필수 조건 확인
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

# 배포 출력 값 캡처
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# 웹 앱 URL 가져오기
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

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

#### 5.6.2.4: 배포 후 구성

`configure-retail-agents.sh` 생성:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# 배포 정보 가져오기
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

### 5.6.3: 테스트 및 검증

`test-retail-deployment.sh` 생성:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# 환경 변수가 설정되었는지 확인
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# 웹 애플리케이션 가용성 테스트
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
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

### 5.6.4 예상 결과

이 구현 가이드를 따르면 다음을 갖게 됩니다:

1. **배포된 인프라:**

      - 모델 배포가 포함된 Microsoft Foundry 프로젝트
      - 웹 애플리케이션 호스팅용 컨테이너 앱
      - 제품 카탈로그용 AI 검색 서비스
      - 모니터링을 위한 Application Insights

2. **초기 에이전트:**

      - 기본 지침으로 구성된 쇼퍼 에이전트
      - 파일 검색 기능 활성화
      - 구성된 추적 및 모니터링

3. **맞춤화 준비 완료:**

      - 로열티 에이전트 추가용 프레임워크
      - 맞춤 지침 템플릿
      - 테스트 및 검증 스크립트
      - 모니터링 및 평가 설정

4. **운영 준비 완료:**

      - 레드 팀을 통한 보안 스캔
      - 성능 모니터링
      - 품질 평가 프레임워크
      - 확장 가능한 아키텍처

이 예제는 AZD 템플릿을 특정 기업 시나리오에 맞게 확장하고 맞춤화하는 동시에 보안, 모니터링 및 확장성에 대한 모범 사례를 유지하는 방법을 보여줍니다.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문은 해당 언어의 원본 문서를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->