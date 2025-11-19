<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-19T21:00:24+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "ko"
}
-->
# 간단한 Flask API - 컨테이너 앱 예제

**학습 경로:** 초급 ⭐ | **소요 시간:** 25-35분 | **비용:** 월 $0-15

Azure Developer CLI(azd)를 사용하여 Azure Container Apps에 배포된 완전한 Python Flask REST API입니다. 이 예제는 컨테이너 배포, 자동 확장 및 모니터링 기본 사항을 보여줍니다.

## 🎯 학습 목표

- 컨테이너화된 Python 애플리케이션을 Azure에 배포하기
- 자동 확장 및 제로 스케일 구성하기
- 상태 확인 및 준비 상태 점검 구현하기
- 애플리케이션 로그 및 메트릭 모니터링하기
- Azure Developer CLI를 사용하여 빠르게 배포하기

## 📦 포함된 내용

✅ **Flask 애플리케이션** - CRUD 작업이 포함된 완전한 REST API (`src/app.py`)  
✅ **Dockerfile** - 프로덕션 준비된 컨테이너 구성  
✅ **Bicep 인프라** - 컨테이너 앱 환경 및 API 배포  
✅ **AZD 구성** - 한 번의 명령으로 배포 설정  
✅ **상태 확인** - 라이브니스 및 준비 상태 점검 구성  
✅ **자동 확장** - HTTP 부하에 따라 0-10 복제본  

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

## 사전 요구 사항

### 필수
- **Azure Developer CLI (azd)** - [설치 가이드](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure 구독** - [무료 계정](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker 설치](https://www.docker.com/products/docker-desktop/) (로컬 테스트용)

### 사전 요구 사항 확인

```bash
# azd 버전 확인 (1.5.0 이상 필요)
azd version

# Azure 로그인 확인
azd auth login

# Docker 확인 (선택 사항, 로컬 테스트용)
docker --version
```

## ⏱️ 배포 타임라인

| 단계 | 소요 시간 | 진행 내용 |
|------|-----------|-----------|
| 환경 설정 | 30초 | azd 환경 생성 |
| 컨테이너 빌드 | 2-3분 | Flask 앱 Docker 빌드 |
| 인프라 프로비저닝 | 3-5분 | 컨테이너 앱, 레지스트리, 모니터링 생성 |
| 애플리케이션 배포 | 2-3분 | 이미지를 푸시하고 컨테이너 앱에 배포 |
| **총합** | **8-12분** | 배포 완료 |

## 빠른 시작

```bash
# 예제로 이동
cd examples/container-app/simple-flask-api

# 환경 초기화 (고유한 이름 선택)
azd env new myflaskapi

# 모든 것 배포 (인프라 + 애플리케이션)
azd up
# 다음이 요청됩니다:
# 1. Azure 구독 선택
# 2. 위치 선택 (예: eastus2)
# 3. 배포 완료까지 8-12분 대기

# API 엔드포인트 가져오기
azd env get-values

# API 테스트
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

# 예상 출력은 다음과 같습니다:
# - 서비스: api
# - 엔드포인트: https://ca-api-[env].xxx.azurecontainerapps.io
# - 상태: 실행 중
```

### 2단계: API 엔드포인트 테스트

```bash
# API 엔드포인트 가져오기
API_URL=$(azd env get-value API_ENDPOINT)

# 상태 확인
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

**성공 기준:**
- ✅ 상태 확인 엔드포인트가 HTTP 200 반환
- ✅ 루트 엔드포인트가 API 정보를 표시
- ✅ POST가 항목을 생성하고 HTTP 201 반환
- ✅ GET이 생성된 항목을 반환

### 3단계: 로그 보기

```bash
# 실시간 로그 스트리밍
azd logs api --follow

# 다음을 볼 수 있습니다:
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
|------------|--------|------|
| `/health` | GET | 상태 확인 |
| `/api/items` | GET | 모든 항목 나열 |
| `/api/items` | POST | 새 항목 생성 |
| `/api/items/{id}` | GET | 특정 항목 가져오기 |
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

### 확장 구성

API는 HTTP 트래픽에 따라 자동으로 확장됩니다:
- **최소 복제본**: 0 (유휴 상태일 때 제로로 확장)
- **최대 복제본**: 10
- **복제본당 동시 요청**: 50

## 개발

### 로컬 실행

```bash
# 종속성 설치
cd src
pip install -r requirements.txt

# 앱 실행
python app.py

# 로컬에서 테스트
curl http://localhost:8000/health
```

### 컨테이너 빌드 및 테스트

```bash
# 도커 이미지 빌드
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

### 코드만 배포

```bash
# 애플리케이션 코드만 배포 (인프라 변경 없음)
azd deploy api
```

### 구성 업데이트

```bash
# 환경 변수를 업데이트합니다
azd env set API_KEY "new-api-key"

# 새 구성으로 다시 배포합니다
azd deploy api
```

## 모니터링

### 로그 보기

```bash
# 실시간 로그 스트림
azd logs api --follow

# 마지막 100줄 보기
azd logs api --tail 100
```

### 메트릭 모니터링

```bash
# Azure Monitor 대시보드 열기
azd monitor --overview

# 특정 메트릭 보기
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## 테스트

### 상태 확인

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

### 모든 항목 가져오기

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## 비용 최적화

이 배포는 제로 스케일을 사용하므로 API가 요청을 처리할 때만 비용이 발생합니다:

- **유휴 비용**: ~$0/월 (제로로 확장됨)
- **활성 비용**: ~$0.000024/초 복제본당
- **예상 월 비용** (가벼운 사용): $5-15

### 추가 비용 절감

```bash
# 개발 환경에서 최대 복제본 수 축소
azd env set MAX_REPLICAS 3

# 더 짧은 유휴 시간 초과 설정 사용
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5분
```

## 문제 해결

### 컨테이너가 시작되지 않음

```bash
# 컨테이너 로그 확인
azd logs api --tail 100

# Docker 이미지가 로컬에서 빌드되는지 확인
docker build -t test ./src
```

### API에 접근할 수 없음

```bash
# 인그레스가 외부인지 확인
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### 응답 시간이 길음

```bash
# CPU/메모리 사용량 확인
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 필요하면 리소스 확장
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## 정리

```bash
# 모든 리소스 삭제
azd down --force --purge
```

## 다음 단계

### 이 예제 확장

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

4. **관리 ID 추가** - Azure 서비스에 대한 보안 액세스
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### 관련 예제

- **[Database App](../../../../../examples/database-app)** - SQL Database가 포함된 완전한 예제
- **[Microservices](../../../../../examples/container-app/microservices)** - 다중 서비스 아키텍처
- **[Container Apps Master Guide](../README.md)** - 모든 컨테이너 패턴

### 학습 자료

- 📚 [AZD For Beginners Course](../../../README.md) - 메인 코스 홈
- 📚 [Container Apps Patterns](../README.md) - 더 많은 배포 패턴
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - 커뮤니티 템플릿

## 추가 자료

### 문서
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask 프레임워크 가이드
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - 공식 Azure 문서
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd 명령 참조

### 튜토리얼
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - 첫 앱 배포하기
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python 개발 가이드
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - 코드로 인프라 관리

### 도구
- **[Azure Portal](https://portal.azure.com)** - 리소스를 시각적으로 관리
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE 통합

---

**🎉 축하합니다!** 자동 확장 및 모니터링이 포함된 프로덕션 준비 Flask API를 Azure Container Apps에 배포했습니다.

**질문이 있으신가요?** [이슈 열기](https://github.com/microsoft/AZD-for-beginners/issues) 또는 [FAQ](../../../resources/faq.md)를 확인하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->