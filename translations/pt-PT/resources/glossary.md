# Glossário - Terminologia Azure e AZD

**Referência para Todos os Capítulos**  
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)  
- **📖 Aprender o Básico**: [Capítulo 1: Fundamentos do AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Termos de IA**: [Capítulo 2: Desenvolvimento com Prioridade à IA](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## Introdução

Este glossário abrangente fornece definições para termos, conceitos e acrónimos usados na Azure Developer CLI e no desenvolvimento cloud Azure. Referência essencial para compreender documentação técnica, resolver problemas e comunicar eficazmente sobre projetos azd e serviços Azure.

## Objetivos de Aprendizagem

Ao usar este glossário, você irá:  
- Compreender a terminologia e os conceitos essenciais do Azure Developer CLI  
- Dominar o vocabulário e termos técnicos do desenvolvimento cloud Azure  
- Consultar terminologia de Infrastructure as Code e implantação eficientemente  
- Compreender os nomes dos serviços Azure, acrónimos e suas finalidades  
- Aceder a definições para termos de resolução de problemas e depuração  
- Aprender conceitos avançados de arquitetura e desenvolvimento Azure  

## Resultados de Aprendizagem

Com a referência regular a este glossário, você poderá:  
- Comunicar eficazmente usando terminologia adequada do Azure Developer CLI  
- Compreender documentação técnica e mensagens de erro mais claramente  
- Navegar por serviços e conceitos Azure com confiança  
- Resolver problemas utilizando vocabulário técnico apropriado  
- Contribuir para discussões em equipa com linguagem técnica precisa  
- Expandir sistematicamente seu conhecimento sobre desenvolvimento cloud Azure  

## A

**ARM Template**  
Modelo Azure Resource Manager. Formato Infrastructure as Code baseado em JSON usado para definir e implantar recursos Azure de forma declarativa.

**App Service**  
Oferta platform-as-a-service (PaaS) da Azure para alojamento de aplicações web, APIs REST e backends móveis sem gestão de infraestrutura.

**Application Insights**  
Serviço de monitorização de desempenho de aplicações (APM) da Azure que fornece insights profundos sobre desempenho, disponibilidade e utilização da aplicação.

**Azure CLI**  
Interface de linha de comandos para gestão de recursos Azure. Usada pelo azd para autenticação e algumas operações.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comandos centrada no programador que acelera o processo de criação e implantação de aplicações para Azure usando templates e Infrastructure as Code.

**azure.yaml**  
Ficheiro de configuração principal de um projeto azd que define serviços, infraestrutura e hooks de implantação.

**Azure Resource Manager (ARM)**  
Serviço de implantação e gestão da Azure que providencia uma camada de gestão para criar, atualizar e eliminar recursos.

## B

**Bicep**  
Linguagem específica da Microsoft para deploy de recursos Azure. Fornece sintaxe mais simples do que os templates ARM enquanto compila para ARM.

**Build**  
Processo de compilar código-fonte, instalar dependências e preparar aplicações para implantação.

**Blue-Green Deployment**  
Estratégia de implantação que usa dois ambientes de produção idênticos (azul e verde) para minimizar tempo de inatividade e riscos.

## C

**Container Apps**  
Serviço serverless de contentores da Azure que permite executar aplicações containerizadas sem gerir infraestrutura complexa.

**CI/CD**  
Integração Contínua/Entrega Contínua. Práticas automatizadas para integrar alterações no código e implantar aplicações.

**Cosmos DB**  
Serviço de base de dados multimodelo e globalmente distribuído da Azure que fornece SLAs completos para throughput, latência, disponibilidade e consistência.

**Configuration**  
Definições e parâmetros que controlam o comportamento da aplicação e opções de implantação.

## D

**Deployment**  
Processo de instalar e configurar aplicações e suas dependências na infraestrutura alvo.

**Docker**  
Plataforma para desenvolver, distribuir e executar aplicações usando tecnologia de contentores.

**Dockerfile**  
Ficheiro de texto contendo instruções para construir uma imagem de contentor Docker.

## E

**Environment**  
Destino de implantação que representa uma instância específica da sua aplicação (por exemplo, desenvolvimento, staging, produção).

**Environment Variables**  
Valores de configuração armazenados como pares chave-valor que as aplicações podem aceder em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acedido.

## F

**Function App**  
Serviço serverless de computação da Azure que permite executar código ativado por eventos sem gerir infraestrutura.

## G

**GitHub Actions**  
Plataforma CI/CD integrada com repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema distribuído de controlo de versões usado para rastrear alterações no código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que executam em pontos específicos do ciclo de vida da implantação (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo de serviço Azure onde uma aplicação será implantada (por exemplo, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Prática de definir e gerir infraestrutura através de código em vez de processos manuais.

**Init**  
Processo de inicializar um novo projeto azd, tipicamente a partir de um template.

## J

**JSON**  
JavaScript Object Notation. Formato de intercâmbio de dados comum para ficheiros de configuração e respostas API.

**JWT**  
JSON Web Token. Standard para transmissão segura de informação entre partes como objeto JSON.

## K

**Key Vault**  
Serviço Azure para armazenar e gerir com segurança segredos, chaves e certificados.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços Azure.

## L

**Load Balancer**  
Serviço que distribui o tráfego de rede recebido por múltiplos servidores ou instâncias.

**Log Analytics**  
Serviço Azure para recolher, analisar e atuar sobre dados telemétricos de ambientes cloud e on-premises.

## M

**Managed Identity**  
Funcionalidade Azure que fornece identidades geridas automaticamente para autenticação em outros serviços Azure.

**Microservices**  
Abordagem arquitetural onde aplicações são construídas como coleções de pequenos serviços independentes.

**Monitor**  
Solução de monitorização unificada da Azure que fornece observabilidade completa de aplicações e infraestrutura.

## N

**Node.js**  
Runtime JavaScript baseado no motor V8 do Chrome para construir aplicações server-side.

**npm**  
Gestor de pacotes para Node.js que gere dependências e pacotes.

## O

**Output**  
Valores retornados da implantação da infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Package**  
Processo de preparar o código da aplicação e as dependências para implantação.

**Parameters**  
Valores de entrada passados a templates de infraestrutura para personalizar implantações.

**PostgreSQL**  
Sistema de base de dados relacional open-source suportado como serviço gerido na Azure.

**Provisioning**  
Processo de criar e configurar recursos Azure definidos em templates de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados numa subscrição ou região Azure.

## R

**Resource Group**  
Contentor lógico para recursos Azure que partilham o mesmo ciclo de vida, permissões e políticas.

**Resource Token**  
String única gerada pelo azd para garantir nomes de recurso únicos entre implantações.

**REST API**  
Estilo arquitetural para desenhar aplicações em rede utilizando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Service**  
Componente da sua aplicação definido em azure.yaml (por exemplo, frontend web, backend API, base de dados).

**SKU**  
Stock Keeping Unit. Representa diferentes níveis de serviço ou desempenho para recursos Azure.

**SQL Database**  
Serviço de base de dados relacional gerido da Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço Azure para construir e implantar aplicações web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço Azure que fornece armazenamento cloud para objetos de dados incluindo blobs, ficheiros, filas e tabelas.

**Subscription**  
Contentor de conta Azure que contém grupos de recursos e recursos, com faturação e gestão de acesso associadas.

## T

**Template**  
Estrutura de projeto pré-construída contendo código da aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta open-source de Infrastructure as Code que suporta múltiplos providers cloud incluindo Azure.

**Traffic Manager**  
Load balancer baseado em DNS da Azure para distribuir tráfego entre regiões globais Azure.

## U

**URI**  
Uniform Resource Identifier. String que identifica um recurso particular.

**URL**  
Uniform Resource Locator. Tipo de URI que especifica onde um recurso está localizado e como acessá-lo.

## V

**Virtual Network (VNet)**  
Bloco fundamental para redes privadas na Azure, providenciando isolamento e segmentação.

**VS Code**  
Visual Studio Code. Editor de código popular com excelente integração Azure e azd.

## W

**Webhook**  
Callback HTTP ativado por eventos específicos, comummente usado em pipelines CI/CD.

**What-if**  
Funcionalidade Azure que mostra que alterações seriam feitas por uma implantação sem a executar efetivamente.

## Y

**YAML**  
YAML Ain't Markup Language. Standard de serialização de dados legível para humanos usado em ficheiros de configuração como azure.yaml.

## Z

**Zone**  
Locais fisicamente separados dentro de uma região Azure que providenciam redundância e alta disponibilidade.

---

## Acrónimos Comuns

| Acrónimo | Forma Completa | Descrição |
|---------|-----------|-------------|
| AAD | Azure Active Directory (agora Microsoft Entra ID) | Serviço de gestão de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registo de imagens de contentor |
| AKS | Azure Kubernetes Service | Serviço Kubernetes gerido |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço de implantação e gestão Azure |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Integração Contínua/Entrega Contínua | Práticas de desenvolvimento automatizado |
| CLI | Command Line Interface | Interface de texto |
| DNS | Domain Name System | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gestão de infraestrutura através de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informação |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados Azure |
| RBAC | Role-Based Access Control | Método de controlo de acesso baseado em funções |
| REST | Representational State Transfer | Estilo arquitetural para web services |
| SDK | Software Development Kit | Coleção de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso de disponibilidade/desempenho do serviço |
| SQL | Structured Query Language | Linguagem para gestão de bases de dados relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | String que identifica um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica localização de recurso |
| VM | Virtual Machine | Emulação de um sistema informático |
| VNet | Virtual Network | Rede privada na Azure |
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
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termos Específicos por Contexto

### Termos de Desenvolvimento  
- **Hot Reload**: Atualização automática das aplicações durante o desenvolvimento sem reinício  
- **Build Pipeline**: Processo automatizado para construir e testar código  
- **Deployment Slot**: Ambiente de staging dentro de um App Service  
- **Environment Parity**: Manter ambientes de desenvolvimento, staging e produção semelhantes  

### Termos de Segurança  
- **Managed Identity**: Funcionalidade Azure que fornece gestão automática de credenciais  
- **Key Vault**: Armazenamento seguro para segredos, chaves e certificados  
- **RBAC**: Controlo de acesso baseado em funções para recursos Azure  
- **Network Security Group**: Firewall virtual para controlar tráfego de rede  

### Termos de Monitorização  
- **Telemetry**: Recolha automatizada de medições e dados  
- **Application Performance Monitoring (APM)**: Monitorização do desempenho do software  
- **Log Analytics**: Serviço para recolher e analisar dados de logs  
- **Alert Rules**: Notificações automatizadas baseadas em métricas ou condições  

### Termos de Implantação  
- **Blue-Green Deployment**: Estratégia de implantação sem tempo de inatividade  
- **Canary Deployment**: Implementação gradual para subconjunto de utilizadores  
- **Rolling Update**: Substituição sequencial de instâncias da aplicação  
- **Rollback**: Reversão para versão anterior da aplicação  

---

**Dica de Utilização**: Use `Ctrl+F` para pesquisar rapidamente termos específicos neste glossário. Os termos são cruzados com referências onde aplicável.

---

**Navegação**  
- **Lição Anterior**: [Cheat Sheet](cheat-sheet.md)  
- **Próxima Lição**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->