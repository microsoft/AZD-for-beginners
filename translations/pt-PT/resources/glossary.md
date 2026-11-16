# Glossário - Terminologia Azure e AZD

**Referência para Todos os Capítulos**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Aprender o Básico**: [Capítulo 1: Noções Básicas de AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Termos de IA**: [Capítulo 2: Desenvolvimento AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este glossário compreensivo fornece definições para termos, conceitos e acrónimos usados no Azure Developer CLI e no desenvolvimento em nuvem Azure. Referência essencial para compreender documentação técnica, resolver problemas e comunicar eficazmente sobre projetos azd e serviços Azure.

## Objetivos de Aprendizagem

Ao usar este glossário, você irá:
- Compreender a terminologia e conceitos essenciais do Azure Developer CLI
- Dominar o vocabulário e termos técnicos do desenvolvimento em nuvem Azure
- Referenciar eficientemente terminologia de Infraestrutura como Código e deployment
- Compreender nomes de serviços Azure, acrónimos e seus propósitos
- Aceder a definições para terminologia de resolução de problemas e debugging
- Aprender conceitos avançados de arquitetura e desenvolvimento Azure

## Resultados de Aprendizagem

Com referência regular a este glossário, você será capaz de:
- Comunicar eficazmente usando a terminologia correta do Azure Developer CLI
- Compreender documentação técnica e mensagens de erro com mais clareza
- Navegar pelos serviços e conceitos Azure com confiança
- Resolver problemas usando vocabulário técnico apropriado
- Contribuir nas discussões da equipa com linguagem técnica precisa
- Expandir o seu conhecimento de desenvolvimento em nuvem Azure sistematicamente

## A

**ARM Template**  
Template do Azure Resource Manager. Formato Infrastructure as Code baseado em JSON usado para definir e implementar recursos Azure de forma declarativa.

**App Service**  
Oferta plataforma como serviço (PaaS) da Azure para hospedar aplicações web, APIs REST e backends móveis sem gerir infraestrutura.

**Application Insights**  
Serviço Azure de monitorização do desempenho de aplicações (APM) que fornece insights profundos sobre desempenho, disponibilidade e utilização da aplicação.

**Azure CLI**  
Interface de linha de comando para gerir recursos Azure. Complementa o AZD mas tem login separado; autenticação principal do AZD usa `azd auth login`.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comando focada no desenvolvedor que acelera o processo de construção e deployment de aplicações para Azure usando templates e Infrastructure as Code.

**azure.yaml**  
Ficheiro principal de configuração de um projeto azd que define serviços, infraestrutura e hooks de deployment.

**Azure Resource Manager (ARM)**  
Serviço Azure de deployment e gestão que fornece uma camada de gerenciamento para criar, atualizar e eliminar recursos.

## B

**Bicep**  
Linguagem de domínio específico (DSL) desenvolvida pela Microsoft para deployment de recursos Azure. Oferece sintaxe mais simples que templates ARM enquanto compila para ARM.

**Build**  
Processo de compilar código-fonte, instalar dependências e preparar aplicações para deployment.

**Blue-Green Deployment**  
Estratégia de deployment que usa dois ambientes de produção idênticos (azul e verde) para minimizar downtime e risco.

## C

**Container Apps**  
Serviço serverless de containers do Azure que permite executar aplicações conteinerizadas sem gerir infraestrutura complexa.

**CI/CD**  
Integração Contínua/Deployment Contínuo. Práticas automatizadas para integrar alterações de código e implementar aplicações.

**Cosmos DB**  
Serviço de base de dados multimodelo, globalmente distribuído, do Azure que oferece SLAs abrangentes para throughput, latência, disponibilidade e consistência.

**Configuração**  
Definições e parâmetros que controlam o comportamento da aplicação e opções de deployment.

## D

**Deployment**  
Processo de instalar e configurar aplicações e suas dependências na infraestrutura alvo.

**Docker**  
Plataforma para desenvolver, enviar e executar aplicações usando tecnologia de containerização.

**Dockerfile**  
Ficheiro de texto contendo instruções para construir uma imagem de container Docker.

## E

**Ambiente**  
Um alvo de deployment que representa uma instância específica da sua aplicação (ex.: desenvolvimento, staging, produção).

**Variáveis de Ambiente**  
Valores de configuração armazenados como pares chave-valor que as aplicações podem acessar em runtime.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acedido.

## F

**Function App**  
Serviço serverless de computação do Azure que permite executar código orientado a eventos sem gerir infraestrutura.

## G

**GitHub Actions**  
Plataforma CI/CD integrada com repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema de controlo de versões distribuído usado para rastrear alterações em código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que são executados em pontos específicos do ciclo de vida do deployment (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo de serviço Azure onde uma aplicação será implementada (ex.: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Prática de definir e gerir infraestrutura através de código em vez de processos manuais.

**Init**  
Processo de inicializar um novo projeto azd, tipicamente a partir de um template.

## J

**JSON**  
JavaScript Object Notation. Formato de intercâmbio de dados comummente usado em ficheiros de configuração e respostas API.

**JWT**  
JSON Web Token. Standard para transmitir informações com segurança entre partes em forma de objeto JSON.

## K

**Key Vault**  
Serviço do Azure para armazenar e gerir secretos, chaves e certificados de forma segura.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços Azure.

## L

**Load Balancer**  
Serviço que distribui o tráfego de rede entrante por múltiplos servidores ou instâncias.

**Log Analytics**  
Serviço Azure para recolher, analisar e atuar com base em dados de telemetria de ambientes cloud e on-premises.

## M

**Managed Identity**  
Funcionalidade Azure que fornece identidades geridas automaticamente para autenticação em outros serviços Azure.

**Microservices**  
Abordagem arquitectónica onde aplicações são construídas como coleção de pequenos serviços independentes.

**Monitor**  
Solução unificada de monitorização Azure que oferece observabilidade completa em aplicações e infraestrutura.

## N

**Node.js**  
Ambiente de execução JavaScript construído sobre o motor V8 do Chrome para construir aplicações no servidor.

**npm**  
Gestor de pacotes para Node.js que gere dependências e pacotes.

## O

**Output**  
Valores retornados de um deployment de infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Package**  
Processo de preparar código e dependências de uma aplicação para deployment.

**Parameters**  
Valores de entrada passados a templates de infraestrutura para customizar deployments.

**PostgreSQL**  
Sistema de base de dados relacional open-source suportado como serviço gerido no Azure.

**Provisioning**  
Processo de criar e configurar recursos Azure definidos em templates de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados numa subscrição ou região Azure.

## R

**Resource Group**  
Recipiente lógico para recursos Azure que partilham o mesmo ciclo de vida, permissões e políticas.

**Resource Token**  
String única gerada pelo azd para garantir nomes de recursos únicos entre deployments.

**REST API**  
Estilo arquitectónico para desenhar aplicações em rede usando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Service**  
Componente da sua aplicação definido em azure.yaml (ex.: frontend web, backend API, base de dados).

**SKU**  
Stock Keeping Unit. Representa diferentes níveis de serviço ou performance para recursos Azure.

**SQL Database**  
Serviço gerido de base de dados relacional da Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço Azure para construir e implementar aplicações web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço Azure que fornece armazenamento cloud para objetos de dados como blobs, ficheiros, filas e tabelas.

**Subscription**  
Contêiner de conta Azure que contém grupos de recursos e recursos, com faturação e gestão de acesso associadas.

## T

**Template**  
Estrutura pré-construída de projeto contendo código da aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta open-source Infrastructure as Code que suporta múltiplos provedores cloud incluindo Azure.

**Traffic Manager**  
Balanceador de carga baseado em DNS da Azure para distribuir tráfego por regiões Azure globais.

## U

**URI**  
Identificador Uniforme de Recursos. String que identifica um recurso particular.

**URL**  
Localizador Uniforme de Recursos. Tipo de URI que especifica onde um recurso está localizado e como aceder a ele.

## V

**Virtual Network (VNet)**  
Bloco de construção fundamental para redes privadas no Azure, fornecendo isolamento e segmentação.

**VS Code**  
Visual Studio Code. Editor de código popular com excelente integração Azure e azd.

## W

**Webhook**  
Callback HTTP ativado por eventos específicos, normalmente usado em pipelines CI/CD.

**What-if**  
Funcionalidade Azure que mostra quais alterações seriam feitas por um deployment sem executá-lo realmente.

## Y

**YAML**  
YAML Ain't Markup Language. Standard de serialização de dados legível por humanos usado para ficheiros de configuração como azure.yaml.

## Z

**Zone**  
Localizações fisicamente separadas dentro de uma região Azure que oferecem redundância e alta disponibilidade.

---

## Acrónimos Comuns

| Acrónimo | Forma Completa | Descrição |
|---------|-----------|-------------|
| AAD | Azure Active Directory (agora Microsoft Entra ID) | Serviço de gestão de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registo de imagens de containers |
| AKS | Azure Kubernetes Service | Serviço Kubernetes gerido |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço Azure de deployment e gestão |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Práticas automatizadas de desenvolvimento |
| CLI | Command Line Interface | Interface de utilizador baseada em texto |
| DNS | Domain Name System | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gestão de infraestrutura através de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informações |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados Azure |
| RBAC | Role-Based Access Control | Método de controlo de acesso baseado em funções de utilizador |
| REST | Representational State Transfer | Estilo arquitectónico para serviços web |
| SDK | Software Development Kit | Coleção de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso sobre disponibilidade/performance do serviço |
| SQL | Structured Query Language | Linguagem para gerir bases de dados relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | String que identifica um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica localização do recurso |
| VM | Virtual Machine | Emulação de um sistema computacional |
| VNet | Virtual Network | Rede privada no Azure |
| YAML | YAML Ain't Markup Language | Standard de serialização de dados |

---

## Mapeamentos de Nomes de Serviços Azure

| Nome Comum | Nome Oficial do Serviço Azure | Tipo de Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Base de Dados | Azure Database for PostgreSQL | Recurso de infraestrutura, não aplicação `host` |
| Base de Dados NoSQL | Azure Cosmos DB | Recurso de infraestrutura, não aplicação `host` |
| Armazenamento | Azure Storage Account | Recurso de infraestrutura, não aplicação embutida `host` |
| Cache | Azure Managed Redis | Recurso de infraestrutura, não aplicação `host` |
| Pesquisa | Azure AI Search | Recurso de infraestrutura, não aplicação `host` |
| Messaging | Azure Service Bus | Recurso de infraestrutura, não aplicação `host` |

`services.<name>.host` seleciona um alvo de deployment de aplicação; não é um atalho para qualquer tipo de recurso Azure. Bases de dados, caches, serviços de pesquisa e filas são normalmente provisionados através do fornecedor de infraestrutura e ligados à aplicação via outputs/configuração.

---

## Termos Específicos de Contexto

### Termos de Desenvolvimento
- **Hot Reload**: Atualizar automaticamente aplicações durante desenvolvimento sem reiniciar
- **Build Pipeline**: Processo automatizado para construir e testar código
- **Deployment Slot**: Ambiente de staging dentro de um App Service
- **Environment Parity**: Manter ambientes de desenvolvimento, staging e produção similares

### Termos de Segurança
- **Managed Identity**: Funcionalidade Azure que fornece gestão automática de credenciais
- **Key Vault**: Armazenamento seguro para secretos, chaves e certificados
- **RBAC**: Controlo de acesso baseado em funções para recursos Azure
- **Network Security Group**: Firewall virtual para controlar tráfego de rede

### Termos de Monitorização
- **Telemetry**: Recolha automatizada de medições e dados
- **Application Performance Monitoring (APM)**: Monitorização do desempenho do software
- **Log Analytics**: Serviço para recolher e analisar dados de logs
- **Alert Rules**: Notificações automatizadas baseadas em métricas ou condições

### Termos de Deployment
- **Blue-Green Deployment**: Estratégia de deployment sem downtime
- **Canary Deployment**: Lançamento gradual para subset de utilizadores
- **Rolling Update**: Substituição sequencial de instâncias de aplicação
- **Rollback**: Revertendo a versão anterior da aplicação

---

**Dica de Uso**: Use `Ctrl+F` para pesquisar rapidamente termos específicos neste glossário. Os termos estão inter-relacionados quando aplicável.

---

**Navegação**
- **Lição Anterior**: [Folha de Consulta](cheat-sheet.md)
- **Próxima Lição**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->