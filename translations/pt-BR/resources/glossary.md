# Glossário - Terminologia Azure e AZD

**Referência para Todos os Capítulos**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Aprenda o Básico**: [Capítulo 1: Fundamentos do AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Termos de IA**: [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Este glossário abrangente fornece definições para termos, conceitos e siglas usados no Azure Developer CLI e no desenvolvimento em nuvem Azure. Referência essencial para compreender documentação técnica, solucionar problemas e comunicar-se efetivamente sobre projetos azd e serviços Azure.

## Objetivos de Aprendizagem

Usando este glossário, você vai:
- Entender terminologia e conceitos essenciais do Azure Developer CLI
- Dominar o vocabulário e termos técnicos do desenvolvimento em nuvem Azure
- Referenciar terminologia de Infraestrutura como Código e implantação de forma eficiente
- Compreender nomes, siglas e propósitos dos serviços Azure
- Acessar definições para terminologia de solução de problemas e depuração
- Aprender conceitos avançados de arquitetura e desenvolvimento em Azure

## Resultados Esperados

Com referência regular a este glossário, você será capaz de:
- Comunicar-se efetivamente usando a terminologia correta do Azure Developer CLI
- Entender documentação técnica e mensagens de erro com mais clareza
- Navegar pelos serviços e conceitos Azure com confiança
- Solucionar problemas usando vocabulário técnico apropriado
- Contribuir para discussões em equipe com linguagem técnica precisa
- Expandir seu conhecimento em desenvolvimento na nuvem Azure sistematicamente

## A

**Modelo ARM**  
Modelo Azure Resource Manager. Formato JSON de Infraestrutura como Código usado para definir e implantar recursos Azure de forma declarativa.

**App Service**  
Oferta de plataforma como serviço (PaaS) do Azure para hospedar aplicações web, APIs REST e backends móveis sem gerenciar infraestrutura.

**Application Insights**  
Serviço de monitoramento de desempenho de aplicações (APM) do Azure que fornece insights profundos sobre desempenho, disponibilidade e uso da aplicação.

**Azure CLI**  
Interface de linha de comando para gerenciamento de recursos Azure. Complementa o AZD, mas possui login separado; a autenticação principal do AZD usa `azd auth login`.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comando focada em desenvolvedores que acelera o processo de construção e implantação de aplicações no Azure usando modelos e Infraestrutura como Código.

**azure.yaml**  
Arquivo principal de configuração para um projeto azd que define serviços, infraestrutura e ganchos de implantação.

**Gerenciador de Recursos Azure (ARM)**  
Serviço de implantação e gerenciamento do Azure que fornece uma camada de gerenciamento para criar, atualizar e excluir recursos.

## B

**Bicep**  
Linguagem específica de domínio (DSL) desenvolvida pela Microsoft para implantar recursos Azure. Fornece sintaxe mais simples que os modelos ARM enquanto compila para ARM.

**Build**  
Processo de compilar código-fonte, instalar dependências e preparar aplicações para implantação.

**Implantação Blue-Green**  
Estratégia de implantação que usa dois ambientes de produção idênticos (azul e verde) para minimizar o tempo de inatividade e risco.

## C

**Container Apps**  
Serviço de contêineres serverless do Azure que permite executar aplicações conteinerizadas sem gerenciar infraestrutura complexa.

**CI/CD**  
Integração Contínua/Entrega Contínua. Práticas automatizadas para integrar mudanças de código e implantar aplicações.

**Cosmos DB**  
Serviço de banco de dados multimodelo e globalmente distribuído do Azure que oferece SLAs abrangentes para taxa de transferência, latência, disponibilidade e consistência.

**Configuração**  
Configurações e parâmetros que controlam o comportamento da aplicação e opções de implantação.

## D

**Implantação**  
Processo de instalar e configurar aplicações e suas dependências na infraestrutura de destino.

**Docker**  
Plataforma para desenvolver, distribuir e executar aplicações usando tecnologia de conteinerização.

**Dockerfile**  
Arquivo de texto contendo instruções para construir uma imagem de contêiner Docker.

## E

**Ambiente**  
Destino de implantação que representa uma instância específica da sua aplicação (ex: desenvolvimento, homologação, produção).

**Variáveis de Ambiente**  
Valores de configuração armazenados como pares chave-valor que aplicações podem acessar em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acessado.

## F

**Function App**  
Serviço de computação serverless do Azure que permite executar código acionado por eventos sem gerenciar infraestrutura.

## G

**GitHub Actions**  
Plataforma CI/CD integrada a repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema de controle de versão distribuído usado para rastrear alterações no código-fonte.

## H

**Ganchos**  
Scripts ou comandos personalizados que executam em pontos específicos durante o ciclo de vida da implantação (pré-provisionamento, pós-provisionamento, pré-implantação, pós-implantação).

**Host**  
Tipo de serviço Azure onde uma aplicação será implantada (ex: appservice, containerapp, function).

## I

**Infraestrutura como Código (IaC)**  
Prática de definir e gerenciar infraestrutura por meio de código em vez de processos manuais.

**Init**  
Processo de inicializar um novo projeto azd, normalmente a partir de um modelo.

## J

**JSON**  
JavaScript Object Notation. Formato de intercambio de dados comumente usado para arquivos de configuração e respostas de API.

**JWT**  
JSON Web Token. Padrão para transmitir informações com segurança entre partes como um objeto JSON.

## K

**Key Vault**  
Serviço Azure para armazenar e gerenciar com segurança segredos, chaves e certificados.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços Azure.

## L

**Load Balancer**  
Serviço que distribui o tráfego de rede recebido entre vários servidores ou instâncias.

**Log Analytics**  
Serviço Azure para coletar, analisar e agir sobre dados de telemetria de ambientes em nuvem e locais.

## M

**Identidade Gerenciada**  
Recurso Azure que fornece aos serviços Azure uma identidade gerenciada automaticamente para autenticação em outros serviços Azure.

**Microsserviços**  
Abordagem arquitetural onde aplicações são construídas como um conjunto de serviços pequenos e independentes.

**Monitor**  
Solução unificada de monitoramento do Azure que oferece observabilidade completa em aplicações e infraestrutura.

## N

**Node.js**  
Ambiente de execução JavaScript construído sobre o motor V8 do Chrome para construir aplicações no lado servidor.

**npm**  
Gerenciador de pacotes para Node.js que gerencia dependências e pacotes.

## O

**Output**  
Valores retornados da implantação da infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Pacote**  
Processo de preparar o código da aplicação e dependências para implantação.

**Parâmetros**  
Valores de entrada passados para modelos de infraestrutura para personalizar implantações.

**PostgreSQL**  
Sistema de banco de dados relacional open-source suportado como serviço gerenciado no Azure.

**Provisionamento**  
Processo de criação e configuração de recursos Azure definidos em modelos de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados em uma assinatura ou região Azure.

## R

**Grupo de Recursos**  
Contêiner lógico para recursos Azure que compartilham mesmo ciclo de vida, permissões e políticas.

**Token de Recurso**  
Cadeia única gerada pelo azd para garantir nomes exclusivos de recursos em implantações.

**API REST**  
Estilo arquitetural para projetar aplicações em rede usando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Serviço**  
Componente da sua aplicação definido no azure.yaml (ex: front-end web, backend API, banco de dados).

**SKU**  
Unidade de Manutenção de Estoque. Representa diferentes camadas de serviço ou níveis de desempenho para recursos Azure.

**Banco de Dados SQL**  
Serviço gerenciado de banco de dados relacional do Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço Azure para construir e implantar aplicações web full-stack a partir de repositórios de código-fonte.

**Conta de Armazenamento**  
Serviço Azure que fornece armazenamento em nuvem para objetos de dados incluindo blobs, arquivos, filas e tabelas.

**Assinatura**  
Contêiner de conta Azure que mantém grupos de recursos e recursos, com gerenciamento de cobrança e acesso associado.

## T

**Template**  
Estrutura de projeto pré-construída contendo código da aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta open-source de Infraestrutura como Código que suporta múltiplos provedores de nuvem incluindo Azure.

**Traffic Manager**  
Balanceador de carga baseado em DNS do Azure para distribuir tráfego entre regiões globais Azure.

## U

**URI**  
Identificador Uniforme de Recursos. Cadeia que identifica um recurso específico.

**URL**  
Localizador Uniforme de Recursos. Tipo de URI que especifica onde um recurso está localizado e como recuperá-lo.

## V

**Rede Virtual (VNet)**  
Bloco fundamental para redes privadas no Azure, proporcionando isolamento e segmentação.

**VS Code**  
Visual Studio Code. Editor de código popular com excelente integração Azure e azd.

## W

**Webhook**  
Callback HTTP acionado por eventos específicos, comumente usado em pipelines CI/CD.

**What-if**  
Recurso Azure que mostra quais mudanças seriam feitas por uma implantação sem executá-la de fato.

## Y

**YAML**  
YAML Ain't Markup Language. Padrão de serialização de dados legível por humanos usado para arquivos de configuração como azure.yaml.

## Z

**Zona**  
Locais fisicamente separados dentro de uma região Azure que fornecem redundância e alta disponibilidade.

---

## Siglas Comuns

| Sigla | Forma Completa | Descrição |
|---------|-----------|-------------|
| AAD | Azure Active Directory (agora Microsoft Entra ID) | Serviço de gerenciamento de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registro de imagens de contêiner |
| AKS | Azure Kubernetes Service | Serviço Kubernetes gerenciado |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço de implantação e gerenciamento do Azure |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Integração Contínua/Entrega Contínua | Práticas automatizadas de desenvolvimento |
| CLI | Command Line Interface | Interface de usuário baseada em texto |
| DNS | Domain Name System | Sistema que traduz nomes de domínio para endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gerenciamento da infraestrutura por meio de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informações |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados Azure |
| RBAC | Role-Based Access Control | Método de controle de acesso baseado em papéis de usuário |
| REST | Representational State Transfer | Estilo arquitetural para serviços web |
| SDK | Software Development Kit | Coleção de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso com disponibilidade/desempenho do serviço |
| SQL | Structured Query Language | Linguagem para gerenciamento de bancos relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | Cadeia que identifica um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica localização do recurso |
| VM | Virtual Machine | Emulação de um sistema de computador |
| VNet | Virtual Network | Rede privada no Azure |
| YAML | YAML Ain't Markup Language | Padrão de serialização de dados |

---

## Mapeamentos de Nomes de Serviços Azure

| Nome Comum | Nome Oficial do Serviço Azure | Tipo de Host azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Site Estático | Azure Static Web Apps | `staticwebapp` |
| Banco de Dados | Azure Database for PostgreSQL | Recurso de infraestrutura, não uma aplicação `host` |
| Banco NoSQL | Azure Cosmos DB | Recurso de infraestrutura, não uma aplicação `host` |
| Armazenamento | Azure Storage Account | Recurso de infraestrutura, não uma aplicação embutida `host` |
| Cache | Azure Managed Redis | Recurso de infraestrutura, não uma aplicação `host` |
| Busca | Azure AI Search | Recurso de infraestrutura, não uma aplicação `host` |
| Mensageria | Azure Service Bus | Recurso de infraestrutura, não uma aplicação `host` |

`services.<name>.host` seleciona um destino de implantação de aplicação; não é uma abreviação para qualquer tipo de recurso Azure. Bancos de dados, caches, serviços de busca e filas normalmente são provisionados através do provedor de infraestrutura e conectados à aplicação via saídas/configuração.

---

## Termos Específicos de Contexto

### Termos de Desenvolvimento
- **Hot Reload**: Atualização automática de aplicações durante o desenvolvimento sem reinício
- **Pipeline de Build**: Processo automatizado para construir e testar código
- **Slot de Implantação**: Ambiente de homologação dentro de um App Service
- **Paridade de Ambiente**: Manter ambientes de desenvolvimento, homologação, e produção semelhantes

### Termos de Segurança
- **Identidade Gerenciada**: Recurso Azure que fornece gerenciamento automático de credenciais
- **Key Vault**: Armazenamento seguro para segredos, chaves e certificados
- **RBAC**: Controle de acesso baseado em papéis para recursos Azure
- **Grupo de Segurança de Rede**: Firewall virtual para controle de tráfego de rede

### Termos de Monitoramento
- **Telemetria**: Coleta automatizada de métricas e dados
- **Application Performance Monitoring (APM)**: Monitoramento de desempenho de software
- **Log Analytics**: Serviço para coletar e analisar dados de logs
- **Regras de Alerta**: Notificações automatizadas baseadas em métricas ou condições

### Termos de Implantação
- **Implantação Blue-Green**: Estratégia de implantação sem tempo de inatividade
- **Implantação Canary**: Distribuição gradual para um subconjunto de usuários
- **Atualização Rolling**: Substituição sequencial de instâncias da aplicação
- **Rollback**: Reversão para versão anterior da aplicação

---

**Dica de Uso**: Use `Ctrl+F` para pesquisar rapidamente termos específicos neste glossário. Termos são cruzadamente referenciados onde aplicável.

---

**Navegação**
- **Lição Anterior**: [Folha de Dicas](cheat-sheet.md)
- **Próxima Lição**: [Perguntas Frequentes](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->