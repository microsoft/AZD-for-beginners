# Simple Flask API - Container App 예제

**학습 경로:** 초급 ⭐ | **소요 시간:** 25-35분 | **비용:** $0-15/월

Azure Developer CLI(azd)를 사용하여 Azure Container Apps에 배포된 완전한 작동 Python Flask REST API입니다. 이 예제는 컨테이너 배포, 자동 확장, 모니터링 기본을 보여줍니다.

## 🎯 학습 내용

- 컨테이너화된 Python 애플리케이션을 Azure에 배포하는 방법
- 스케일 투 제로를 사용한 자동 확장 구성
- 헬스 프로브와 준비 상태 검사 구현
- 애플리케이션 로그 및 메트릭 모니터링
- Azure Developer CLI를 사용한 신속한 배포

## 📦 포함 항목

✅ **Flask 애플리케이션** - CRUD 작업이 포함된 완전한 REST API (`src/app.py`)  
✅ **Dockerfile** - 프로덕션 준비 컨테이너 구성  
✅ **Bicep 인프라** - Container Apps 환경 및 API 배포  
✅ **AZD 구성** - 원클릭 배포 설정  
✅ **헬스 프로브** - Liveness 및 Readiness 검사 구성  
✅ **자동 확장** - HTTP 부하 기준 0-10 복제본  

## 아키텍처

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## 사전 준비 사항

### 필요 항목
- **Azure Developer CLI (azd)** - [설치 가이드](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure 구독** - [무료 계정](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker 설치](https://www.docker.com/products/docker-desktop/) (로컬 테스트용)

### 사전 준비 사항 확인

```bash
# azd 버전 확인 (1.5.0 이상 필요)
azd version

# Azure 로그인 확인
azd auth login

# Docker 확인 (선택 사항, 로컬 테스트용)
docker --version
```

## ⏱️ 배포 일정

| 단계 | 소요 시간 | 수행 내용 |
|-------|----------|--------------||
| 환경 설정 | 30초 | azd 환경 생성 |
| 컨테이너 빌드 | 2-3분 | Flask 앱 Docker 빌드 |
| 인프라 프로비저닝 | 3-5분 | Container Apps, 레지스트리, 모니터링 생성 |
| 애플리케이션 배포 | 2-3분 | 이미지 푸시 및 Container Apps에 배포 |
| **총합** | **8-12분** | 배포 완료 준비 |

## 빠른 시작

```bash
# 예제로 이동
cd examples/container-app/simple-flask-api

# 환경 초기화(고유 이름 선택)
azd env new myflaskapi

# 모든 것 배포(인프라 + 애플리케이션)
azd up
# 다음을 요청받게 됩니다:
# 1. Azure 구독 선택
# 2. 위치 선택(예: eastus2)
# 3. 배포를 위해 8-12분 기다리기

# API 엔드포인트 받기
azd env get-values

# API 테스트하기
curl $(azd env get-value API_ENDPOINT)/health
```

**예상 출력:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ 배포 확인

### 1단계: 배포 상태 확인

```bash
# 배포된 서비스 보기
azd show

# 예상 출력은 다음을 보여줍니다:
# - 서비스: api
# - 엔드포인트: https://ca-api-[env].xxx.azurecontainerapps.io
# - 상태: 실행 중
```

### 2단계: API 엔드포인트 테스트

```bash
# API 엔드포인트 가져오기
API_URL=$(azd env get-value API_ENDPOINT)

# 상태 확인 테스트
curl $API_URL/health

# 루트 엔드포인트 테스트
curl $API_URL/

# 항목 생성
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# 모든 항목 가져오기
curl $API_URL/api/items
```

**성공 조건:**
- ✅ Health 엔드포인트가 HTTP 200 반환
- ✅ 루트 엔드포인트가 API 정보 표시
- ✅ POST가 항목 생성 및 HTTP 201 반환
- ✅ GET이 생성된 항목 반환

### 3단계: 로그 확인

```bash
# azd monitor를 사용하여 실시간 로그 스트리밍
azd monitor --logs

# 또는 Azure CLI 사용:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 다음을 확인할 수 있어야 합니다:
# - Gunicorn 시작 메시지
# - HTTP 요청 로그
# - 애플리케이션 정보 로그
```

## 프로젝트 구조

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API 엔드포인트

| 엔드포인트 | 메서드 | 설명 |
|----------|--------|-------------|
| `/health` | GET | 헬스 체크 |
| `/api/items` | GET | 모든 항목 조회 |
| `/api/items` | POST | 새 항목 생성 |
| `/api/items/{id}` | GET | 특정 항목 조회 |
| `/api/items/{id}` | PUT | 항목 업데이트 |
| `/api/items/{id}` | DELETE | 항목 삭제 |

## 구성

### 환경 변수

```bash
# 사용자 지정 구성 설정
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### 스케일링 구성

API는 HTTP 트래픽에 따라 자동으로 확장됩니다:
- **최소 복제본**: 0 (유휴 시 스케일 투 제로)
- **최대 복제본**: 10
- **복제본당 동시 요청 수**: 50

## 개발

### 로컬 실행

```bash
# 의존성 설치
cd src
pip install -r requirements.txt

# 앱 실행
python app.py

# 로컬에서 테스트
curl http://localhost:8000/health
```

### 컨테이너 빌드 및 테스트

```bash
# Docker 이미지 빌드
docker build -t flask-api:local ./src

# 로컬에서 컨테이너 실행
docker run -p 8000:8000 flask-api:local

# 컨테이너 테스트
curl http://localhost:8000/health
```

## 배포

### 전체 배포

```bash
# 인프라 및 애플리케이션 배포
azd up
```

### 코드 전용 배포

```bash
# 애플리케이션 코드만 배포 (인프라 변경 없음)
azd deploy api
```

### 구성 업데이트

```bash
# 환경 변수 업데이트
azd env set API_KEY "new-api-key"

# 새 구성으로 재배포
azd deploy api
```

## 모니터링

### 로그 보기

```bash
# azd monitor를 사용하여 실시간 로그 스트리밍
azd monitor --logs

# 또는 Azure CLI를 사용하여 컨테이너 앱:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# 마지막 100줄 보기
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### 메트릭 모니터링

```bash
# Azure 모니터 대시보드 열기
azd monitor --overview

# 특정 지표 보기
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## 테스트

### 헬스 체크

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

예상 응답:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### 항목 생성

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### 모든 항목 조회

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## 비용 최적화

이 배포는 스케일 투 제로를 사용하므로 API가 요청을 처리할 때만 비용이 발생합니다:

- **유휴 비용**: 약 $0/월 (스케일 투 제로)
- **활성 비용**: 복제본당 초당 약 $0.000024
- **예상 월 비용** (가벼운 사용량): $5-15

### 비용 추가 절감

```bash
# 개발을 위해 최대 복제본 수를 축소합니다
azd env set MAX_REPLICAS 3

# 더 짧은 유휴 시간 초과를 사용하세요
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5분
```

## 문제 해결

### 컨테이너가 시작되지 않을 때

```bash
# Azure CLI를 사용하여 컨테이너 로그 확인
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker 이미지가 로컬에서 빌드되는지 확인
docker build -t test ./src
```

### API 접근 불가 문제

```bash
# 인그레스가 외부인지 확인하십시오
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 높은 응답 시간 문제

```bash
# CPU/메모리 사용량 확인
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 필요시 자원 확장
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## 정리

```bash
# 모든 리소스를 삭제하십시오
azd down --force --purge
```

## 다음 단계

### 예제 확장하기

1. **데이터베이스 추가** - Azure Cosmos DB 또는 SQL Database 통합  
   ```bash
   # infra/main.bicep에 Cosmos DB 모듈 추가
   # 데이터베이스 연결로 app.py 업데이트
   ```

2. **인증 추가** - Azure AD 또는 API 키 구현  
   ```python
   # app.py에 인증 미들웨어 추가
   from functools import wraps
   ```

3. **CI/CD 설정** - GitHub Actions 워크플로우  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **관리 ID 추가** - Azure 서비스에 대한 보안 접근  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 관련 예제

- **[Database App](../../../../../examples/database-app)** - SQL Database가 포함된 완전한 예제  
- **[Microservices](../../../../../examples/container-app/microservices)** - 다중 서비스 아키텍처  
- **[Container Apps Master Guide](../README.md)** - 모든 컨테이너 패턴

### 학습 자료

- 📚 [AZD 초보자 과정](../../../README.md) - 메인 과정 홈  
- 📚 [Container Apps 패턴](../README.md) - 추가 배포 패턴  
- 📚 [AZD 템플릿 갤러리](https://azure.github.io/awesome-azd/) - 커뮤니티 템플릿

## 추가 자료

### 문서
- **[Flask 문서](https://flask.palletsprojects.com/)** - Flask 프레임워크 가이드  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 공식 Azure 문서  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 명령 참조

### 튜토리얼
- **[Container Apps 빠른 시작](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 첫 앱 배포  
- **[Azure에서 Python](https://learn.microsoft.com/azure/developer/python/)** - Python 개발 가이드  
- **[Bicep 언어](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 코드형 인프라

### 도구
- **[Azure Portal](https://portal.azure.com)** - 시각적 리소스 관리  
- **[VS Code Azure 확장](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 통합

---

**🎉 축하합니다!** 자동 확장 및 모니터링이 포함된 프로덕션 준비가 된 Flask API를 Azure Container Apps에 성공적으로 배포했습니다.

**질문이 있나요?** [이슈 열기](https://github.com/microsoft/AZD-for-beginners/issues) 또는 [FAQ](../../../resources/faq.md)를 확인하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문가의 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->