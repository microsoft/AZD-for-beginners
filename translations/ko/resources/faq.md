<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-17T14:40:25+00:00",
  "source_file": "resources/faq.md",
  "language_code": "ko"
}
-->
# 자주 묻는 질문 (FAQ)

**챕터별 도움말**
- **📚 코스 홈**: [AZD For Beginners](../README.md)
- **🚆 설치 문제**: [챕터 1: 설치 및 설정](../docs/getting-started/installation.md)
- **🤖 AI 관련 질문**: [챕터 2: AI-First 개발](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 문제 해결**: [챕터 7: 문제 해결 및 디버깅](../docs/troubleshooting/common-issues.md)

## 소개

이 포괄적인 FAQ는 Azure Developer CLI (azd)와 Azure 배포에 대한 가장 일반적인 질문에 대한 답변을 제공합니다. 일반적인 문제에 대한 빠른 해결책을 찾고, 모범 사례를 이해하며, azd 개념과 워크플로우에 대한 명확한 설명을 얻을 수 있습니다.

## 학습 목표

이 FAQ를 검토함으로써 다음을 할 수 있습니다:
- Azure Developer CLI의 일반적인 질문과 문제에 대한 빠른 답변 찾기
- 실용적인 Q&A 형식을 통해 주요 개념과 용어 이해
- 자주 발생하는 문제와 오류 시나리오에 대한 해결책 접근
- 최적화에 대한 일반적인 질문을 통해 모범 사례 학습
- 전문가 수준의 질문을 통해 고급 기능과 역량 발견
- 비용, 보안 및 배포 전략에 대한 지침을 효율적으로 참조

## 학습 결과

이 FAQ를 정기적으로 참조함으로써 다음을 할 수 있습니다:
- 제공된 솔루션을 사용하여 일반적인 Azure Developer CLI 문제를 독립적으로 해결
- 배포 전략 및 구성에 대한 정보에 입각한 결정을 내림
- azd와 다른 Azure 도구 및 서비스 간의 관계 이해
- 커뮤니티 경험과 전문가 추천을 기반으로 모범 사례 적용
- 인증, 배포 및 구성 문제를 효과적으로 해결
- FAQ 통찰력과 추천을 사용하여 비용과 성능 최적화

## 목차

- [시작하기](../../../resources)
- [인증 및 접근](../../../resources)
- [템플릿 및 프로젝트](../../../resources)
- [배포 및 인프라](../../../resources)
- [구성 및 환경](../../../resources)
- [문제 해결](../../../resources)
- [비용 및 청구](../../../resources)
- [모범 사례](../../../resources)
- [고급 주제](../../../resources)

---

## 시작하기

### Q: Azure Developer CLI (azd)란 무엇인가요?
**A**: Azure Developer CLI (azd)는 개발자 중심의 명령줄 도구로, 로컬 개발 환경에서 Azure로 애플리케이션을 배포하는 시간을 단축시켜줍니다. 템플릿을 통해 모범 사례를 제공하며 전체 배포 라이프사이클을 지원합니다.

### Q: azd는 Azure CLI와 어떻게 다른가요?
**A**: 
- **Azure CLI**: Azure 리소스를 관리하기 위한 범용 도구
- **azd**: 애플리케이션 배포 워크플로우에 초점을 맞춘 개발자 도구
- azd는 Azure CLI를 내부적으로 사용하지만 일반적인 개발 시나리오에 대한 고급 추상화를 제공합니다.
- azd는 템플릿, 환경 관리 및 배포 자동화를 포함합니다.

### Q: azd를 사용하려면 Azure CLI가 설치되어 있어야 하나요?
**A**: 네, azd는 인증 및 일부 작업을 위해 Azure CLI가 필요합니다. 먼저 Azure CLI를 설치한 후 azd를 설치하세요.

### Q: azd는 어떤 프로그래밍 언어를 지원하나요?
**A**: azd는 언어에 구애받지 않습니다. 다음과 같은 언어를 지원합니다:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 정적 웹사이트
- 컨테이너화된 애플리케이션

### Q: 기존 프로젝트에서 azd를 사용할 수 있나요?
**A**: 네! 다음 중 하나를 선택할 수 있습니다:
1. `azd init`을 사용하여 기존 프로젝트에 azd 구성을 추가
2. 기존 프로젝트를 azd 템플릿 구조에 맞게 조정
3. 기존 아키텍처를 기반으로 사용자 정의 템플릿 생성

---

## 인증 및 접근

### Q: azd를 사용하여 Azure에 인증하려면 어떻게 해야 하나요?
**A**: `azd auth login`을 사용하면 Azure 인증을 위한 브라우저 창이 열립니다. CI/CD 시나리오에서는 서비스 주체 또는 관리 ID를 사용하세요.

### Q: 여러 Azure 구독에서 azd를 사용할 수 있나요?
**A**: 네. `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`를 사용하여 각 환경에서 사용할 구독을 지정하세요.

### Q: azd로 배포하려면 어떤 권한이 필요하나요?
**A**: 일반적으로 다음이 필요합니다:
- 리소스 그룹 또는 구독에 대한 **Contributor** 역할
- 역할 할당이 필요한 리소스를 배포할 경우 **User Access Administrator**
- 필요한 권한은 템플릿 및 배포되는 리소스에 따라 다릅니다.

### Q: azd를 CI/CD 파이프라인에서 사용할 수 있나요?
**A**: 물론입니다! azd는 CI/CD 통합을 위해 설계되었습니다. 인증을 위해 서비스 주체를 사용하고 환경 변수를 설정하세요.

### Q: GitHub Actions에서 인증을 처리하려면 어떻게 해야 하나요?
**A**: 서비스 주체 자격 증명을 사용하여 Azure Login 액션을 사용하세요:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## 템플릿 및 프로젝트

### Q: azd 템플릿은 어디에서 찾을 수 있나요?
**A**: 
- 공식 템플릿: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- 커뮤니티 템플릿: GitHub에서 "azd-template" 검색
- `azd template list`를 사용하여 사용 가능한 템플릿을 탐색

### Q: 사용자 정의 템플릿을 생성하려면 어떻게 해야 하나요?
**A**: 
1. 기존 템플릿 구조를 시작점으로 사용
2. `azure.yaml`, 인프라 파일 및 애플리케이션 코드를 수정
3. `azd up`으로 철저히 테스트
4. 적절한 태그와 함께 GitHub에 게시

### Q: 템플릿 없이 azd를 사용할 수 있나요?
**A**: 네, 기존 프로젝트에서 `azd init`을 사용하여 필요한 구성 파일을 생성하세요. `azure.yaml` 및 인프라 파일을 수동으로 구성해야 합니다.

### Q: 공식 템플릿과 커뮤니티 템플릿의 차이점은 무엇인가요?
**A**: 
- **공식 템플릿**: Microsoft에서 유지 관리, 정기적으로 업데이트, 포괄적인 문서 제공
- **커뮤니티 템플릿**: 개발자가 생성, 전문적인 사용 사례 가능, 품질 및 유지 관리가 다양함

### Q: 프로젝트의 템플릿을 업데이트하려면 어떻게 해야 하나요?
**A**: 템플릿은 자동으로 업데이트되지 않습니다. 다음을 수행할 수 있습니다:
1. 소스 템플릿에서 변경 사항을 수동으로 비교 및 병합
2. 업데이트된 템플릿을 사용하여 `azd init`으로 새로 시작
3. 업데이트된 템플릿에서 특정 개선 사항을 선택적으로 적용

---

## 배포 및 인프라

### Q: azd는 어떤 Azure 서비스를 배포할 수 있나요?
**A**: azd는 Bicep/ARM 템플릿을 통해 모든 Azure 서비스를 배포할 수 있습니다. 예를 들어:
- App Services, Container Apps, Functions
- 데이터베이스(SQL, PostgreSQL, Cosmos DB)
- 스토리지, Key Vault, Application Insights
- 네트워킹, 보안 및 모니터링 리소스

### Q: 여러 지역에 배포할 수 있나요?
**A**: 네, Bicep 템플릿에서 여러 지역을 구성하고 각 환경에 적합한 위치 매개변수를 설정하세요.

### Q: 데이터베이스 스키마 마이그레이션은 어떻게 처리하나요?
**A**: `azure.yaml`에서 배포 훅을 사용하세요:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: 애플리케이션 없이 인프라만 배포할 수 있나요?
**A**: 네, `azd provision`을 사용하여 템플릿에 정의된 인프라 구성 요소만 배포하세요.

### Q: 기존 Azure 리소스에 배포하려면 어떻게 해야 하나요?
**A**: 이는 복잡하며 직접적으로 지원되지 않습니다. 다음을 수행할 수 있습니다:
1. 기존 리소스를 Bicep 템플릿에 가져오기
2. 템플릿에서 기존 리소스 참조 사용
3. 리소스를 조건부로 생성하거나 참조하도록 템플릿 수정

### Q: Bicep 대신 Terraform을 사용할 수 있나요?
**A**: 현재 azd는 주로 Bicep/ARM 템플릿을 지원합니다. Terraform 지원은 공식적으로 제공되지 않지만 커뮤니티 솔루션이 있을 수 있습니다.

---

## 구성 및 환경

### Q: 다른 환경(dev, staging, prod)을 관리하려면 어떻게 해야 하나요?
**A**: `azd env new <environment-name>`을 사용하여 별도의 환경을 생성하고 각 환경에 대해 다른 설정을 구성하세요:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: 환경 구성은 어디에 저장되나요?
**A**: 프로젝트 디렉토리 내 `.azure` 폴더에 저장됩니다. 각 환경은 자체 폴더와 구성 파일을 가집니다.

### Q: 환경별 구성을 설정하려면 어떻게 해야 하나요?
**A**: `azd env set`을 사용하여 환경 변수를 구성하세요:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: 환경 구성을 팀원들과 공유할 수 있나요?
**A**: `.azure` 폴더에는 민감한 정보가 포함되어 있으므로 버전 관리에 커밋하지 마세요. 대신:
1. 필요한 환경 변수를 문서화
2. 환경을 설정하는 배포 스크립트 사용
3. 민감한 구성은 Azure Key Vault를 사용

### Q: 템플릿 기본값을 재정의하려면 어떻게 해야 하나요?
**A**: 템플릿 매개변수에 해당하는 환경 변수를 설정하세요:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## 문제 해결

### Q: `azd up`이 실패하는 이유는 무엇인가요?
**A**: 일반적인 원인:
1. **인증 문제**: `azd auth login` 실행
2. **권한 부족**: Azure 역할 할당 확인
3. **리소스 이름 충돌**: AZURE_ENV_NAME 변경
4. **할당량/용량 문제**: 지역 가용성 확인
5. **템플릿 오류**: Bicep 템플릿 유효성 검사

### Q: 배포 실패를 디버깅하려면 어떻게 해야 하나요?
**A**: 
1. `azd deploy --debug`를 사용하여 자세한 출력 확인
2. Azure 포털 배포 기록 확인
3. Azure 포털의 활동 로그 검토
4. `azd show`를 사용하여 현재 환경 상태 표시

### Q: 환경 변수가 작동하지 않는 이유는 무엇인가요?
**A**: 확인해야 할 사항:
1. 변수 이름이 템플릿 매개변수와 정확히 일치하는지
2. 값에 공백이 포함된 경우 적절히 인용되었는지
3. 환경이 선택되었는지: `azd env select <environment>`
4. 변수가 올바른 환경에 설정되었는지

### Q: 실패한 배포를 정리하려면 어떻게 해야 하나요?
**A**: 
```bash
azd down --force --purge
```
이 명령은 모든 리소스와 환경 구성을 제거합니다.

### Q: 배포 후 애플리케이션에 접근할 수 없는 이유는 무엇인가요?
**A**: 확인해야 할 사항:
1. 배포가 성공적으로 완료되었는지
2. 애플리케이션이 실행 중인지(Azure 포털에서 로그 확인)
3. 네트워크 보안 그룹이 트래픽을 허용하는지
4. DNS/사용자 지정 도메인이 올바르게 구성되었는지

---

## 비용 및 청구

### Q: azd 배포 비용은 얼마나 되나요?
**A**: 비용은 다음에 따라 달라집니다:
- 배포된 Azure 서비스
- 서비스 계층/SKU 선택
- 지역별 가격 차이
- 사용 패턴

[Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)를 사용하여 비용을 추정하세요.

### Q: azd 배포 비용을 제어하려면 어떻게 해야 하나요?
**A**: 
1. 개발 환경에 낮은 계층 SKU 사용
2. Azure 예산 및 알림 설정
3. 필요하지 않을 때 `azd down`을 사용하여 리소스 제거
4. 적절한 지역 선택(지역별 비용 차이 있음)
5. Azure 비용 관리 도구 사용

### Q: azd 템플릿에 무료 계층 옵션이 있나요?
**A**: 많은 Azure 서비스가 무료 계층을 제공합니다:
- App Service: 무료 계층 사용 가능
- Azure Functions: 월 1백만 회 무료 실행
- Cosmos DB: 400 RU/s 무료 계층
- Application Insights: 월 5GB 무료

가능한 경우 템플릿을 무료 계층으로 구성하세요.

### Q: 배포 전에 비용을 추정하려면 어떻게 해야 하나요?
**A**: 
1. 템플릿의 `main.bicep`을 검토하여 생성되는 리소스를 확인
2. 특정 SKU를 사용하여 Azure 가격 계산기 사용
3. 먼저 개발 환경에 배포하여 실제 비용 모니터링
4. Azure 비용 관리 도구를 사용하여 상세 비용 분석

---

## 모범 사례

### Q: azd 프로젝트 구조에 대한 모범 사례는 무엇인가요?
**A**: 
1. 애플리케이션 코드와 인프라를 분리
2. `azure.yaml`에서 의미 있는 서비스 이름 사용
3. 빌드 스크립트에서 적절한 오류 처리 구현
4. 환경별 구성 사용
5. 포괄적인 문서 포함

### Q: azd에서 여러 서비스를 어떻게 구성해야 하나요?
**A**: 권장 구조를 사용하세요:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: `.azure` 폴더를 버전 관리에 커밋해야 하나요?
**A**: **아니요!** `.azure` 폴더에는 민감한 정보가 포함되어 있습니다. `.gitignore`에 추가하세요:
```gitignore
.azure/
```

### Q: 비밀 및 민감한 구성은 어떻게 처리해야 하나요?
**A**: 
1. 비밀은 Azure Key Vault를 사용
2. 애플리케이션 구성에서 Key Vault 비밀 참조
3. 비밀을 버전 관리에 커밋하지 않음
4. 서비스 간 인증을 위해 관리 ID 사용

### Q: azd를 사용한 CI/CD 권장 접근 방식은 무엇인가요?
**A**: 
1. 각 단계(dev/staging/prod)에 별도의 환경 사용
2. 배포 전에 자동화된 테스트 구현
3. 인증을 위해 서비스 주체 사용
4. 파이프라인 비밀/변수에 민감한 구성 저장
5. 프로덕션 배포를 위한 승인 게이트 구현

---

## 고급 주제

### Q: azd에 사용자 정의 기능을 확장할 수 있나요?
**A**: 네, `azure.yaml`에서 배포 훅을 통해 가능합니다:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: 기존 DevOps 프로세스와 azd를 통합하려면 어떻게 해야 하나요?
**A**: 
1. 기존 파이프라인 스크립트에서 azd 명령 사용
2. 팀 간에 azd 템플릿 표준화
3. 기존 모니터링 및 알림과 통합
4. 파이프라인 통합을 위한 azd의 JSON 출력 사용

### Q: Azure DevOps와 azd를 사용할 수 있나요?
**A**: 네, azd는 모든 CI/CD 시스템과 작동합니다. Azure DevOps 파이프라인을 생성하여 azd 명령을 사용하세요.

### Q: azd에 기여하거나 커뮤니티 템플릿을 생성하려면 어떻게 해야 하나요?
**A**: 
1. **azd 도구**: [Azure/azure-dev](https://github.com/Azure/azure-dev)에 기여
2. **템플릿**: [템플릿 가이드라인](https://github.com/Azure-Samples/awesome-azd)을 따라 템플릿을 만드세요.  
3. **문서화**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)에 문서를 기여하세요.  

### Q: azd의 로드맵은 무엇인가요?  
**A**: 계획된 기능과 개선 사항은 [공식 로드맵](https://github.com/Azure/azure-dev/projects)을 확인하세요.  

### Q: 다른 배포 도구에서 azd로 어떻게 마이그레이션하나요?  
**A**:  
1. 현재 배포 아키텍처 분석  
2. 동일한 Bicep 템플릿 생성  
3. 현재 서비스에 맞게 `azure.yaml` 구성  
4. 개발 환경에서 철저히 테스트  
5. 환경을 점진적으로 마이그레이션  

---

## 아직 질문이 있으신가요?  

### **먼저 검색하세요**  
- [공식 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)를 확인하세요.  
- [GitHub 이슈](https://github.com/Azure/azure-dev/issues)에서 유사한 문제를 검색하세요.  

### **도움 받기**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - 커뮤니티 지원  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 기술적 질문  
- [Azure Discord](https://discord.gg/azure) - 실시간 커뮤니티 채팅  

### **문제 보고**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - 버그 보고 및 기능 요청  
- 관련 로그, 오류 메시지, 재현 단계 포함  

### **더 알아보기**  
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*이 FAQ는 정기적으로 업데이트됩니다. 마지막 업데이트: 2025년 9월 9일*  

---

**탐색**  
- **이전 학습**: [용어집](glossary.md)  
- **다음 학습**: [학습 가이드](study-guide.md)  

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역을 사용함으로써 발생할 수 있는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.