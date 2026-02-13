# 자주 묻는 질문 (FAQ)

**챕터별 도움말**
- **📚 코스 홈**: [초보자를 위한 AZD](../README.md)
- **🚆 설치 문제**: [1장: 설치 및 설정](../docs/getting-started/installation.md)
- **🤖 AI 관련 질문**: [2장: AI 우선 개발](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 문제 해결**: [7장: 문제 해결 및 디버깅](../docs/troubleshooting/common-issues.md)

## 소개

이 종합 FAQ는 Azure Developer CLI(azd)와 Azure 배포에 대한 가장 일반적인 질문에 대한 답변을 제공합니다. 자주 발생하는 문제에 대한 빠른 해결책을 찾고, 모범 사례를 이해하며, azd 개념과 워크플로우에 대한 명확한 설명을 제공합니다.

## 학습 목표

이 FAQ를 검토하면:
- 일반적인 Azure Developer CLI 질문과 문제에 대한 빠른 답변을 찾을 수 있습니다.
- 실용적인 Q&A 형식을 통해 핵심 개념과 용어를 이해할 수 있습니다.
- 자주 발생하는 문제 및 오류 시나리오에 대한 문제 해결 솔루션에 접근할 수 있습니다.
- 최적화에 관한 자주 묻는 질문을 통해 모범 사례를 배울 수 있습니다.
- 전문가 수준의 질문을 통해 고급 기능과 역량을 발견할 수 있습니다.
- 비용, 보안 및 배포 전략 안내를 효율적으로 참고할 수 있습니다.

## 학습 성과

이 FAQ를 정기적으로 참고하면 다음을 할 수 있습니다:
- 제공된 솔루션을 사용하여 일반적인 Azure Developer CLI 문제를 독립적으로 해결할 수 있습니다.
- 배포 전략과 구성을 신중하게 결정할 수 있습니다.
- azd와 다른 Azure 도구 및 서비스와의 관계를 이해할 수 있습니다.
- 커뮤니티 경험과 전문가 권장 사항에 기반한 모범 사례를 적용할 수 있습니다.
- 인증, 배포 및 구성 문제를 효과적으로 문제 해결할 수 있습니다.
- FAQ 인사이트와 권장 사항을 사용하여 비용과 성능을 최적화할 수 있습니다.

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

### Q: Azure Developer CLI(azd)란 무엇인가요?
**A**: Azure Developer CLI(azd)는 개발자 중심의 명령줄 도구로, 애플리케이션을 로컬 개발 환경에서 Azure까지 빠르게 이동시켜 줍니다. 템플릿을 통해 모범 사례를 제공하며 전체 배포 수명 주기를 지원합니다.

### Q: azd는 Azure CLI와 어떻게 다른가요?
**A**: 
- **Azure CLI**: Azure 리소스를 관리하기 위한 범용 도구
- **azd**: 애플리케이션 배포 워크플로우에 초점을 맞춘 개발자용 도구
- azd는 내부적으로 Azure CLI를 사용하지만 일반적인 개발 시나리오에 대해 더 높은 수준의 추상화를 제공합니다.
- azd에는 템플릿, 환경 관리 및 배포 자동화 기능이 포함되어 있습니다.

### Q: azd를 사용하려면 Azure CLI가 설치되어 있어야 하나요?
**A**: 네, azd는 인증 및 일부 작업을 위해 Azure CLI가 필요합니다. 먼저 Azure CLI를 설치한 후 azd를 설치하세요.

### Q: azd는 어떤 프로그래밍 언어를 지원하나요?
**A**: azd는 언어 독립적입니다. 다음과 같이 사용할 수 있습니다:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- 정적 웹사이트
- 컨테이너화된 애플리케이션

### Q: 기존 프로젝트와 함께 azd를 사용할 수 있나요?
**A**: 네! 다음 중 하나를 선택할 수 있습니다:
1. `azd init`을 사용하여 기존 프로젝트에 azd 구성을 추가
2. 기존 프로젝트를 azd 템플릿 구조에 맞게 조정
3. 기존 아키텍처를 기반으로 커스텀 템플릿 만들기

---

## 인증 및 접근

### Q: azd로 Azure에 어떻게 인증하나요?
**A**: `azd auth login`을 사용하면 인증을 위해 브라우저 창이 열립니다. CI/CD 시나리오에서는 서비스 주체나 관리형 ID를 사용하세요.

### Q: azd를 여러 Azure 구독에서 사용할 수 있나요?
**A**: 네. 각 환경에 대해 `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`를 사용하여 구독을 지정할 수 있습니다.

### Q: azd로 배포하려면 어떤 권한이 필요한가요?
**A**: 일반적으로 필요합니다:
- 리소스 그룹 또는 구독에 대한 **기여자(Contributor)** 역할
- 역할 할당이 필요한 리소스를 배포하려면 **사용자 액세스 관리자(User Access Administrator)** 역할
- 특정 권한은 템플릿과 배포 중인 리소스에 따라 다릅니다.

### Q: azd를 CI/CD 파이프라인에서 사용할 수 있나요?
**A**: 물론입니다! azd는 CI/CD 통합을 위해 설계되었습니다. 인증에는 서비스 주체를 사용하고, 구성에는 환경 변수를 설정하세요.

### Q: GitHub Actions에서 인증을 어떻게 처리하나요?
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
- 사용 가능한 템플릿을 보려면 `azd template list`를 사용하세요.

### Q: 커스텀 템플릿을 어떻게 만들 수 있나요?
**A**: 
1. 기존 템플릿 구조에서 시작
2. `azure.yaml`, 인프라 파일, 애플리케이션 코드를 수정
3. `azd up`으로 철저히 테스트
4. 적절한 태그와 함께 GitHub에 게시

### Q: 템플릿 없이 azd를 사용할 수 있나요?
**A**: 네, 기존 프로젝트에서 `azd init`을 사용하여 필요한 구성 파일을 생성하세요. `azure.yaml` 및 인프라 파일을 수동으로 구성해야 합니다.

### Q: 공식 템플릿과 커뮤니티 템플릿의 차이점은 무엇인가요?
**A**: 
- **공식 템플릿**: Microsoft가 유지 관리하며 정기적으로 업데이트되고 문서화가 잘 되어 있음
- **커뮤니티 템플릿**: 개발자가 생성, 특수한 사용 사례가 있을 수 있으며 품질과 유지 관리가 다양함

### Q: 프로젝트에서 템플릿을 어떻게 업데이트하나요?
**A**: 템플릿은 자동 업데이트되지 않습니다. 다음 방법 중 하나를 사용하세요:
1. 원본 템플릿과 수동으로 비교하고 변경 사항 병합
2. 업데이트된 템플릿으로 `azd init`을 사용하여 새로 시작
3. 업데이트된 템플릿에서 개별 개선 사항만 선택 적용

---

## 배포 및 인프라

### Q: azd는 어떤 Azure 서비스를 배포할 수 있나요?
**A**: azd는 Bicep/ARM 템플릿을 통해 다음을 포함한 모든 Azure 서비스를 배포할 수 있습니다:
- 앱 서비스, 컨테이너 앱, 함수
- 데이터베이스(SQL, PostgreSQL, Cosmos DB)
- 스토리지, 키 볼트, 애플리케이션 인사이트
- 네트워킹, 보안, 모니터링 리소스

### Q: 여러 지역에 배포할 수 있나요?
**A**: 네, Bicep 템플릿에서 여러 지역을 구성하고 각 환경에 적절한 location 매개변수를 설정하세요.

### Q: 데이터베이스 스키마 마이그레이션은 어떻게 처리하나요?
**A**: `azure.yaml`에 배포 후크를 사용하세요:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: 애플리케이션 없이 인프라만 배포할 수 있나요?
**A**: 네, `azd provision`을 사용하여 템플릿에 정의된 인프라 구성 요소만 배포할 수 있습니다.

### Q: 기존 Azure 리소스에 배포하려면 어떻게 해야 하나요?
**A**: 복잡하며 직접 지원되지 않습니다. 다음 방법을 사용할 수 있습니다:
1. 기존 리소스를 Bicep 템플릿에 가져오기
2. 템플릿에서 기존 리소스 참조 사용
3. 조건부로 리소스를 생성하거나 참조하도록 템플릿 수정

### Q: Bicep 대신 Terraform을 사용할 수 있나요?
**A**: 현재 azd는 주로 Bicep/ARM 템플릿을 지원합니다. 공식적인 Terraform 지원은 없지만 커뮤니티 솔루션이 존재할 수 있습니다.

---

## 구성 및 환경

### Q: 개발, 스테이징, 프로덕션 등 다양한 환경을 어떻게 관리하나요?
**A**: `azd env new <environment-name>`로 별도의 환경을 만들고 각 환경에 대해 다른 설정을 구성하세요:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: 환경 구성은 어디에 저장되나요?
**A**: 프로젝트 디렉터리 내의 `.azure` 폴더에 저장됩니다. 각 환경마다 별도의 구성 파일 폴더가 있습니다.

### Q: 환경별 구성을 어떻게 설정하나요?
**A**: `azd env set`을 사용하여 환경 변수를 구성하세요:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: 환경 구성을 팀 멤버와 공유할 수 있나요?
**A**: `.azure` 폴더에는 민감한 정보가 포함되어 있으므로 버전 관리에 커밋하지 않아야 합니다. 대신:
1. 필요한 환경 변수 문서화
2. 배포 스크립트를 사용해 환경 설정
3. 민감한 구성에는 Azure Key Vault 사용

### Q: 템플릿 기본값을 어떻게 재정의하나요?
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
4. **쿼터/용량 문제**: 지역 가용성 확인
5. **템플릿 오류**: Bicep 템플릿 검증

### Q: 배포 실패를 어떻게 디버깅하나요?
**A**: 
1. 자세한 출력을 위해 `azd deploy --debug` 사용
2. Azure 포털의 배포 이력 확인
3. Azure 포털 활동 로그 검토
4. 현재 환경 상태를 보려면 `azd show` 사용

### Q: 환경 변수가 작동하지 않는 이유는 무엇인가요?
**A**: 확인 사항:
1. 변수 이름이 템플릿 매개변수와 정확히 일치하는지
2. 공백 포함 시 값이 적절히 인용되었는지
3. 올바른 환경이 선택되었는지: `azd env select <environment>`
4. 해당 환경에 변수들이 설정되었는지

### Q: 실패한 배포를 어떻게 정리하나요?
**A**: 
```bash
azd down --force --purge
```
모든 리소스와 환경 구성을 제거합니다.

### Q: 배포 후 애플리케이션에 접근할 수 없는 이유는 무엇인가요?
**A**: 확인 사항:
1. 배포가 성공적으로 완료되었는지
2. 애플리케이션이 실행 중인지(로그를 Azure 포털에서 확인)
3. 네트워크 보안 그룹이 트래픽을 허용하는지
4. DNS/커스텀 도메인이 올바르게 구성되었는지

---

## 비용 및 청구

### Q: azd 배포 비용은 얼마나 드나요?
**A**: 비용은 다음에 따라 다릅니다:
- 배포된 Azure 서비스
- 선택한 서비스 티어/SKU
- 지역별 가격 차이
- 사용 패턴

예상 비용은 [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)를 사용하세요.

### Q: azd 배포 비용을 어떻게 제어하나요?
**A**: 
1. 개발 환경에는 낮은 티어 SKU 사용
2. Azure 예산과 알림 설정
3. 필요하지 않을 때 `azd down`으로 리소스 제거
4. 비용이 지역마다 다르므로 적절한 지역 선택
5. Azure 비용 관리 도구 사용

### Q: azd 템플릿에 무료 티어 옵션이 있나요?
**A**: 여러 Azure 서비스가 무료 티어를 제공합니다:
- 앱 서비스: 무료 티어 이용 가능
- Azure Functions: 월 1백만 회 무료 실행
- Cosmos DB: 400 RU/s 무료 티어
- 애플리케이션 인사이트: 월 5GB까지 무료

가능한 곳에서는 템플릿을 무료 티어 사용으로 구성하세요.

### Q: 배포 전에 비용을 어떻게 추산하나요?
**A**: 
1. 템플릿의 `main.bicep`에서 생성되는 리소스 검토
2. 특정 SKU로 Azure 가격 계산기 사용
3. 먼저 개발 환경에 배포하여 실제 비용 모니터링
4. 자세한 비용 분석을 위해 Azure 비용 관리 사용

---

## 모범 사례

### Q: azd 프로젝트 구조에 대한 모범 사례는 무엇인가요?
**A**: 
1. 애플리케이션 코드와 인프라를 분리 유지
2. `azure.yaml`에 의미 있는 서비스 이름 사용
3. 빌드 스크립트에 적절한 오류 처리 구현
4. 환경별 구성 사용
5. 포괄적인 문서 포함

### Q: 여러 서비스를 azd에서는 어떻게 구성해야 하나요?
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

### Q: 비밀 및 민감한 구성은 어떻게 처리하나요?
**A**: 
1. 비밀은 Azure Key Vault 사용
2. 애플리케이션 구성에서 Key Vault 비밀 참조
3. 비밀을 버전 관리에 절대 커밋하지 않음
4. 서비스 간 인증 시 관리형 ID 사용

### Q: azd와 CI/CD에 대한 권장 접근법은 무엇인가요?
**A**: 
1. 각 단계(dev/staging/prod)에 별도 환경 사용
2. 배포 전에 자동화된 테스트 구현
3. 인증에 서비스 주체 사용
4. 파이프라인 비밀/변수에 민감한 구성 저장
5. 프로덕션 배포에 승인 게이트 적용

---

## 고급 주제

### Q: azd를 커스텀 기능으로 확장할 수 있나요?
**A**: 네, `azure.yaml`의 배포 후크를 통해 가능합니다:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: azd를 기존 DevOps 프로세스에 어떻게 통합하나요?
**A**: 
1. 기존 파이프라인 스크립트에서 azd 명령어 사용
2. 팀 간 azd 템플릿 표준화
3. 기존 모니터링 및 알림과 통합
4. 파이프라인 통합을 위해 azd JSON 출력 사용

### Q: azd를 Azure DevOps와 함께 사용할 수 있나요?
**A**: 네, azd는 모든 CI/CD 시스템과 호환됩니다. azd 명령어를 사용하는 Azure DevOps 파이프라인을 생성하세요.

### Q: azd에 기여하거나 커뮤니티 템플릿을 만들려면 어떻게 하나요?
**A**: 
1. **azd 도구**: [Azure/azure-dev](https://github.com/Azure/azure-dev) 에 기여하기  
2. **템플릿**: [템플릿 가이드라인](https://github.com/Azure-Samples/awesome-azd) 에 따라 템플릿 생성  
3. **문서화**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) 문서에 기여하기  

### Q: azd의 로드맵은 어떻게 되나요?
**A**: 계획된 기능과 개선 사항은 [공식 로드맵](https://github.com/Azure/azure-dev/projects)에서 확인하세요.  

### Q: 다른 배포 도구에서 azd로 어떻게 마이그레이션하나요?
**A**:  
1. 현재 배포 아키텍처 분석  
2. 동등한 Bicep 템플릿 생성  
3. 현재 서비스에 맞게 `azure.yaml` 구성  
4. 개발 환경에서 철저히 테스트  
5. 환경을 점진적으로 마이그레이션  

---

## 아직 궁금한 점이 있나요?

### **먼저 검색하세요**
- [공식 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)를 확인하세요  
- 유사한 문제를 [GitHub 이슈](https://github.com/Azure/azure-dev/issues)에서 검색하세요  

### **도움받기**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - 커뮤니티 지원  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - 기술 질문  
- [Azure Discord](https://discord.gg/azure) - 실시간 커뮤니티 채팅  

### **문제 보고하기**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - 버그 보고 및 기능 요청  
- 관련 로그, 오류 메시지, 재현 단계 포함  

### **더 알아보기**
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*이 FAQ는 정기적으로 업데이트됩니다. 마지막 업데이트: 2025년 9월 9일*  

---

**네비게이션**  
- **이전 강의**: [용어집](glossary.md)  
- **다음 강의**: [학습 가이드](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만, 자동 번역은 오류나 부정확한 부분을 포함할 수 있음을 유의해 주시기 바랍니다. 원문 문서가 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인한 오해나 잘못된 해석에 대해서는 저희가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->