# Guia de Estudo - Objetivos de Aprendizagem Abrangentes

**Navegação do Percurso de Aprendizagem**
- **📚 Início do Curso**: [AZD Para Principiantes](../README.md)
- **📖 Começar a Aprender**: [Capítulo 1: Fundamentos & Arranque Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Acompanhamento de Progresso**: [Conclusão do Curso](../README.md#-course-completion--certification)

## Introdução

Este guia de estudo abrangente fornece objetivos de aprendizagem estruturados, conceitos-chave, exercícios práticos e materiais de avaliação para ajudar a dominar o Azure Developer CLI (azd). Utilize este guia para acompanhar o seu progresso e garantir que cobriu todos os tópicos essenciais.

## Objetivos de Aprendizagem

Ao completar este guia de estudo, irá:
- Dominar todos os conceitos fundamentais e avançados do Azure Developer CLI
- Desenvolver competências práticas na implementação e gestão de aplicações Azure
- Ganhar confiança na resolução de problemas e otimização de implementações
- Compreender práticas de implementação prontas para produção e considerações de segurança

## Resultados de Aprendizagem

Após concluir todas as secções deste guia de estudo, será capaz de:
- Projetar, implementar e gerir arquiteturas completas de aplicações usando azd
- Implementar estratégias abrangentes de monitorização, segurança e otimização de custos
- Resolver problemas complexos de implementação de forma autónoma
- Criar templates personalizados e contribuir para a comunidade azd

## Estrutura de Aprendizagem em 8 Capítulos

### Capítulo 1: Fundamentos & Arranque Rápido (Semana 1)
**Duração**: 30-45 minutos | **Complexidade**: ⭐

#### Objetivos de Aprendizagem
- Compreender os conceitos e terminologia fundamentais do Azure Developer CLI
- Instalar e configurar com sucesso o AZD na sua plataforma de desenvolvimento
- Implementar a sua primeira aplicação usando um template existente
- Navegar eficazmente na interface de linha de comando AZD

#### Conceitos-Chave a Dominar
- Estrutura e componentes do projeto AZD (azure.yaml, infra/, src/)
- Fluxos de trabalho de implementação baseados em templates
- Noções básicas de configuração de ambientes
- Gestão de grupos de recursos e subscrições

#### Exercícios Práticos
1. **Verificação de Instalação**: Instalar o AZD e verificar com `azd version`
2. **Primeira Implementação**: Implementar com sucesso o template todo-nodejs-mongo
3. **Configuração do Ambiente**: Configurar as suas primeiras variáveis de ambiente
4. **Exploração de Recursos**: Navegar pelos recursos implementados no Portal Azure

#### Perguntas de Avaliação
- Quais são os componentes principais de um projeto AZD?
- Como inicializa um novo projeto a partir de um template?
- Qual a diferença entre `azd up` e `azd deploy`?
- Como gerir múltiplos ambientes com o AZD?

---

### Capítulo 2: Desenvolvimento AI-First (Semana 2)
**Duração**: 1-2 horas | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Integrar serviços Microsoft Foundry nos fluxos de trabalho AZD
- Implementar e configurar aplicações impulsionadas por IA
- Compreender os padrões de implementação RAG (Generação com Recuperação Aumentada)
- Gerir implementações e escalamento de modelos de IA

#### Conceitos-Chave a Dominar
- Integração dos serviços Microsoft Foundry Models e gestão de APIs
- Configuração de pesquisa AI e indexação vetorial
- Estratégias de implementação de modelos e planeamento de capacidade
- Monitorização de aplicações AI e otimização de desempenho

#### Exercícios Práticos
1. **Implementação de Chat AI**: Implementar o template azure-search-openai-demo
2. **Implementação RAG**: Configurar indexação e recuperação de documentos
3. **Configuração de Modelos**: Configurar múltiplos modelos AI com propósitos distintos
4. **Monitorização AI**: Implementar Application Insights para cargas de trabalho AI

#### Perguntas de Avaliação
- Como configura os serviços Microsoft Foundry Models num template AZD?
- Quais são os componentes chave de uma arquitetura RAG?
- Como gere a capacidade e escalamento dos modelos AI?
- Quais métricas de monitorização são importantes para aplicações AI?

---

### Capítulo 3: Configuração & Autenticação (Semana 3)
**Duração**: 45-60 minutos | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Dominar estratégias de configuração e gestão de ambientes
- Implementar padrões de autenticação seguros e identidade gerida
- Organizar recursos com convenções de nomes adequadas
- Configurar implementações multi-ambiente (dev, staging, prod)

#### Conceitos-Chave a Dominar
- Hierarquia de ambientes e precedência de configuração
- Autenticação com identidade gerida e service principal
- Integração de Key Vault para gestão de segredos
- Gestão de parâmetros específicos para cada ambiente

#### Exercícios Práticos
1. **Configuração Multi-Ambiente**: Configurar ambientes dev, staging e prod
2. **Configuração de Segurança**: Implementar autenticação com identidade gerida
3. **Gestão de Segredos**: Integrar Azure Key Vault para dados sensíveis
4. **Gestão de Parâmetros**: Criar configurações específicas para cada ambiente

#### Perguntas de Avaliação
- Como configura diferentes ambientes com AZD?
- Quais são as vantagens de usar identidade gerida vs service principals?
- Como gere os segredos da aplicação de forma segura?
- Qual é a hierarquia de configuração no AZD?

---

### Capítulo 4: Infraestrutura como Código & Implementação (Semana 4-5)
**Duração**: 1-1.5 horas | **Complexidade**: ⭐⭐⭐

#### Objetivos de Aprendizagem
- Criar e personalizar templates de infraestrutura Bicep
- Implementar padrões avançados de implementação e fluxos de trabalho
- Compreender estratégias de provisionamento de recursos
- Projetar arquiteturas multi-serviço escaláveis

- Implementar aplicações conteinerizadas usando Azure Container Apps e AZD

#### Conceitos-Chave a Dominar
- Estrutura dos templates Bicep e melhores práticas
- Dependências de recursos e ordem de implementação
- Ficheiros de parâmetros e modularidade de templates
- Ganchos personalizados e automação de implementação
- Padrões de implementação de apps conteinerizadas (arranque rápido, produção, microserviços)

#### Exercícios Práticos
1. **Criação de Template Personalizado**: Construir um template de aplicação multi-serviço
2. **Domínio de Bicep**: Criar componentes de infraestrutura modulares e reutilizáveis
3. **Automação de Implementação**: Implementar ganchos pré/pós-implementação
4. **Design de Arquitetura**: Implementar arquitetura complexa de microserviços
5. **Implementação de Apps Conteinerizadas**: Implementar os exemplos [Simple Flask API](../../../examples/container-app/simple-flask-api) e [Microservices Architecture](../../../examples/container-app/microservices) usando AZD

#### Perguntas de Avaliação
- Como criar templates Bicep personalizados para AZD?
- Quais são as melhores práticas para organizar código de infraestrutura?
- Como gerir dependências de recursos nos templates?
- Que padrões de implementação suportam atualizações sem tempo de inatividade?

---

### Capítulo 5: Soluções AI Multi-Agente (Semana 6-7)
**Duração**: 2-3 horas | **Complexidade**: ⭐⭐⭐⭐

#### Objetivos de Aprendizagem
- Projetar e implementar arquiteturas AI multi-agente
- Orquestrar coordenação e comunicação entre agentes
- Implementar soluções AI prontas para produção com monitorização
- Compreender especialização de agentes e padrões de fluxo de trabalho
- Integrar microserviços conteinerizados em soluções multi-agente

#### Conceitos-Chave a Dominar
- Padrões de arquitetura multi-agente e princípios de design
- Protocolos de comunicação entre agentes e fluxo de dados
- Estratégias de equilíbrio de carga e escalamento para agentes AI
- Monitorização de produção para sistemas multi-agente
- Comunicação entre serviços em ambientes conteinerizados

#### Exercícios Práticos
1. **Implementação de Solução Retail**: Implementar o cenário completo multi-agente retail
2. **Personalização de Agentes**: Modificar comportamentos dos agentes Customer e Inventory
3. **Escalamento de Arquitetura**: Implementar balanceamento de carga e autoescalamento
4. **Monitorização de Produção**: Configurar monitorização e alertas abrangentes
5. **Integração de Microserviços**: Estender o exemplo [Microservices Architecture](../../../examples/container-app/microservices) para suportar fluxos de trabalho baseados em agentes

#### Perguntas de Avaliação
- Como projetar padrões eficazes de comunicação multi-agente?
- Quais as considerações principais para escalamento de cargas de trabalho de agentes AI?
- Como monitorizar e depurar sistemas AI multi-agente?
- Que padrões de produção asseguram fiabilidade para agentes AI?

---

### Capítulo 6: Validação & Planeamento Pré-Implementação (Semana 8)
**Duração**: 1 hora | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Realizar planeamento abrangente de capacidade e validação de recursos
- Selecionar SKUs Azure ótimos para custo-efetividade
- Implementar verificações automáticas pré-implementação
- Planear implementações com estratégias de otimização de custos

#### Conceitos-Chave a Dominar
- Quotas de recursos Azure e limitações de capacidade
- Critérios de seleção de SKUs e otimização de custos
- Scripts automáticos de validação e testes
- Planeamento de implementação e avaliação de riscos

#### Exercícios Práticos
1. **Análise de Capacidade**: Analisar requisitos de recursos para as suas aplicações
2. **Otimização de SKU**: Comparar e selecionar níveis de serviço rentáveis
3. **Automação de Validação**: Implementar scripts de verificação pré-implementação
4. **Planeamento de Custos**: Criar estimativas e orçamentos para implementação

#### Perguntas de Avaliação
- Como validar a capacidade Azure antes da implementação?
- Que fatores influenciam as decisões de seleção de SKU?
- Como automatizar a validação pré-implementação?
- Que estratégias ajudam a otimizar os custos de implementação?

---

### Capítulo 7: Resolução de Problemas & Depuração (Semana 9)
**Duração**: 1-1.5 horas | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Desenvolver abordagens sistemáticas de depuração para implementações AZD
- Resolver problemas comuns de implementação e configuração
- Depurar problemas específicos de AI e de desempenho
- Implementar monitorização e alertas para deteção proativa de problemas

#### Conceitos-Chave a Dominar
- Técnicas de diagnóstico e estratégias de logging
- Padrões comuns de falhas e respetivas soluções
- Monitorização e otimização de desempenho
- Procedimentos de resposta a incidentes e recuperação

#### Exercícios Práticos
1. **Competências Diagnósticas**: Praticar com implementações propositadamente falhadas
2. **Análise de Logs**: Utilizar Azure Monitor e Application Insights eficazmente
3. **Otimização de Performance**: Otimizar aplicações com desempenho lento
4. **Procedimentos de Recuperação**: Implementar backups e recuperação de desastres

#### Perguntas de Avaliação
- Quais são as falhas mais comuns em implementações AZD?
- Como depurar problemas de autenticação e permissões?
- Que estratégias de monitorização ajudam a prevenir problemas em produção?
- Como otimizar o desempenho de aplicações em Azure?

---

### Capítulo 8: Padrões de Produção & Empresariais (Semana 10-11)
**Duração**: 2-3 horas | **Complexidade**: ⭐⭐⭐⭐

#### Objetivos de Aprendizagem
- Implementar estratégias de implementação ao nível empresarial
- Projetar padrões de segurança e frameworks de conformidade
- Estabelecer monitorização, governação e gestão de custos
- Criar pipelines CI/CD escaláveis com integração AZD
- Aplicar boas práticas para implementações de apps conteinerizadas em produção (segurança, monitorização, custos, CI/CD)

#### Conceitos-Chave a Dominar
- Requisitos empresariais de segurança e conformidade
- Frameworks de governação e implementação de políticas
- Monitorização avançada e gestão de custos
- Integração CI/CD e pipelines de implementação automáticas
- Estratégias de implementação blue-green e canary para workloads conteinerizados

#### Exercícios Práticos
1. **Segurança Empresarial**: Implementar padrões abrangentes de segurança
2. **Framework de Governação**: Configurar Azure Policy e gestão de recursos
3. **Monitorização Avançada**: Criar dashboards e alertas automáticos
4. **Integração CI/CD**: Construir pipelines automáticos de implementação
5. **Apps Conteinerizadas Produção**: Aplicar segurança, monitorização e otimização de custos no exemplo [Microservices Architecture](../../../examples/container-app/microservices)

#### Perguntas de Avaliação
- Como implementar segurança empresarial em implementações AZD?
- Que padrões de governação garantem conformidade e controlo de custos?
- Como projetar monitorização escalável para sistemas de produção?
- Que padrões CI/CD funcionam melhor com fluxos de trabalho AZD?

#### Objetivos de Aprendizagem
- Compreender fundamentos e conceitos core do Azure Developer CLI
- Instalar e configurar com sucesso o azd no seu ambiente de desenvolvimento
- Completar a sua primeira implementação usando um template existente
- Navegar na estrutura do projeto azd e compreender os componentes chave

#### Conceitos-Chave a Dominar
- Templates, ambientes e serviços
- Estrutura de configuração azure.yaml
- Comandos básicos azd (init, up, down, deploy)
- Princípios de Infraestrutura como Código
- Autenticação e autorização Azure

#### Exercícios Práticos

**Exercício 1.1: Instalação e Configuração**
```bash
# Complete estas tarefas:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercício 1.2: Primeira Implementação**
```bash
# Desplegar uma aplicação web simples:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercício 1.3: Análise da Estrutura do Projeto**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Perguntas de Autoavaliação
1. Quais são os três conceitos core da arquitetura azd?
2. Qual é o propósito do ficheiro azure.yaml?
3. Como ajudam os ambientes a gerir diferentes destinos de implementação?
4. Que métodos de autenticação podem ser usados com azd?
5. O que acontece ao correr `azd up` pela primeira vez?

---

## Acompanhamento de Progresso e Quadro de Avaliação
```bash
# Criar e configurar múltiplos ambientes:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercício 2.2: Configuração Avançada**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercício 2.3: Configuração de Segurança**
```bash
# Implementar as melhores práticas de segurança:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Perguntas de Autoavaliação
1. Como lida o azd com precedência das variáveis de ambiente?
2. O que são deployment hooks e quando devem ser usados?
3. Como configura diferentes SKUs para diferentes ambientes?
4. Quais as implicações de segurança de diferentes métodos de autenticação?
5. Como gere segredos e dados sensíveis de configuração?

### Módulo 3: Implementação e Provisionamento (Semana 4)

#### Objetivos de Aprendizagem
- Dominar fluxos de trabalho e boas práticas de implementação
- Compreender Infraestrutura como Código com templates Bicep
- Implementar arquiteturas complexas multi-serviço
- Otimizar desempenho e fiabilidade das implementações

#### Conceitos-Chave a Dominar
- Estrutura de templates Bicep e módulos
- Dependências e ordenação de recursos
- Estratégias de implementação (blue-green, rolling updates)
- Implementações multi-região
- Migrações de base de dados e gestão de dados

#### Exercícios Práticos

**Exercício 3.1: Infraestrutura Personalizada**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercício 3.2: Aplicação Multi-Serviço**
```bash
# Implantar uma arquitetura de microserviços:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercício 3.3: Integração de Base de Dados**
```bash
# Implementar padrões de implantação de base de dados:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Perguntas de Autoavaliação
1. Quais as vantagens de usar Bicep em vez de templates ARM?
2. Como gerir migrações de base de dados em implementações azd?
3. Que estratégias existem para implementações sem tempo de inatividade?
4. Como gerir dependências entre serviços?
5. Quais as considerações para implementações multi-região?

### Módulo 4: Validação Pré-Implementação (Semana 5)

#### Objetivos de Aprendizagem
- Implementar verificações abrangentes pré-implantação
- Dominar o planeamento da capacidade e validação de recursos
- Compreender a seleção de SKU e otimização de custos
- Construir pipelines automatizados de validação

#### Conceitos Chave para Dominar
- Quotas e limites dos recursos Azure
- Critérios de seleção de SKU e implicações de custo
- Scripts e ferramentas automatizadas de validação
- Metodologias de planeamento de capacidade
- Testes de desempenho e otimização

#### Exercícios Práticos

**Exercício 4.1: Planeamento de Capacidade**
```bash
# Implementar validação de capacidade:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercício 4.2: Validação Pré-voo**
```powershell
# Construir um pipeline de validação abrangente:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercício 4.3: Otimização de SKU**
```bash
# Otimizar configurações de serviço:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Perguntas de Autoavaliação
1. Quais os fatores que devem influenciar as decisões de seleção de SKU?
2. Como valida a disponibilidade de recursos Azure antes da implantação?
3. Quais são os componentes chave de um sistema de verificação pré-voo?
4. Como estima e controla os custos de implantação?
5. Qual o monitoramento essencial para o planeamento de capacidade?

### Módulo 5: Resolução de Problemas e Depuração (Semana 6)

#### Objetivos de Aprendizagem
- Dominar metodologias sistemáticas de resolução de problemas
- Desenvolver especialização em depuração de problemas complexos de implantação
- Implementar monitorização e alertas abrangentes
- Construir procedimentos de resposta e recuperação de incidentes

#### Conceitos Chave para Dominar
- Padrões comuns de falhas na implantação
- Técnicas de análise e correlação de logs
- Monitorização e otimização de desempenho
- Detecção e resposta a incidentes de segurança
- Recuperação de desastres e continuidade do negócio

#### Exercícios Práticos

**Exercício 5.1: Cenários de Resolução de Problemas**
```bash
# Pratique a resolução de problemas comuns:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercício 5.2: Implementação de Monitorização**
```bash
# Configurar monitorização abrangente:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercício 5.3: Resposta a Incidentes**
```bash
# Construir procedimentos de resposta a incidentes:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Perguntas de Autoavaliação
1. Qual é a abordagem sistemática para resolver problemas em implantações azd?
2. Como correlaciona logs entre múltiplos serviços e recursos?
3. Quais métricas de monitorização são mais críticas para a deteção precoce de problemas?
4. Como implementa procedimentos eficazes de recuperação de desastres?
5. Quais são os componentes chave de um plano de resposta a incidentes?

### Módulo 6: Tópicos Avançados e Boas Práticas (Semanas 7-8)

#### Objetivos de Aprendizagem
- Implementar padrões de implantação de nível empresarial
- Dominar a integração e automação CI/CD
- Desenvolver templates personalizados e contribuir para a comunidade
- Compreender requisitos avançados de segurança e conformidade

#### Conceitos Chave para Dominar
- Padrões de integração de pipelines CI/CD
- Desenvolvimento e distribuição de templates personalizados
- Governança empresarial e conformidade
- Configurações avançadas de redes e segurança
- Otimização de desempenho e gestão de custos

#### Exercícios Práticos

**Exercício 6.1: Integração CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercício 6.2: Desenvolvimento de Template Personalizado**
```bash
# Criar e publicar templates personalizados:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercício 6.3: Implementação Empresarial**
```bash
# Implementar funcionalidades de nível empresarial:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Perguntas de Autoavaliação
1. Como integra o azd nos fluxos de trabalho CI/CD existentes?
2. Quais são as considerações chave para o desenvolvimento de templates personalizados?
3. Como implementa governança e conformidade nas implantações azd?
4. Quais são as melhores práticas para implantações à escala empresarial?
5. Como contribui de forma eficaz para a comunidade azd?

## Projetos Práticos

### Projeto 1: Website Pessoal de Portefólio
**Complexidade**: Iniciante  
**Duração**: 1-2 semanas

Construa e implante um website pessoal de portefólio usando:
- Hospedagem de website estático no Azure Storage
- Configuração de domínio personalizado
- Integração CDN para desempenho global
- Pipeline de implantação automatizado

**Entregáveis**:
- Website funcional implantado no Azure
- Template azd personalizado para implantações de portefólio
- Documentação do processo de implantação
- Análise de custos e recomendações de otimização

### Projeto 2: Aplicação de Gestão de Tarefas
**Complexidade**: Intermédio  
**Duração**: 2-3 semanas

Crie uma aplicação full-stack de gestão de tarefas com:
- Frontend React implantado no App Service
- Backend API Node.js com autenticação
- Base de dados PostgreSQL com migrações
- Monitorização com Application Insights

**Entregáveis**:
- Aplicação completa com autenticação de utilizadores
- Esquema da base de dados e scripts de migração
- Dashboards de monitorização e regras de alerta
- Configuração de implantação multi-ambiente

### Projeto 3: Plataforma E-commerce com Microserviços
**Complexidade**: Avançado  
**Duração**: 4-6 semanas

Desenhe e implemente uma plataforma e-commerce baseada em microserviços:
- Múltiplos serviços API (catálogo, encomendas, pagamentos, utilizadores)
- Integração com fila de mensagens via Service Bus
- Cache Redis para otimização de desempenho
- Logging e monitorização completos

**Exemplo de Referência**: Consulte [Microservices Architecture](../../../examples/container-app/microservices) para um template pronto para produção e guia de implantação

**Entregáveis**:
- Arquitetura completa de microserviços
- Padrões de comunicação entre serviços
- Testes e otimização de desempenho
- Implementação pronta para produção em termos de segurança

## Avaliação e Certificação

### Verificações de Conhecimento

Complete estas avaliações após cada módulo:

**Avaliação do Módulo 1**: Conceitos básicos e instalação
- Questões de escolha múltipla sobre conceitos centrais
- Tarefas práticas de instalação e configuração
- Exercício simples de implantação

**Avaliação do Módulo 2**: Configuração e ambientes
- Cenários de gestão de ambientes
- Exercícios de resolução de problemas de configuração
- Implementação de configuração de segurança

**Avaliação do Módulo 3**: Implantação e provisionamento
- Desafios de design de infraestrutura
- Cenários de implantação multi-serviços
- Exercícios de otimização de desempenho

**Avaliação do Módulo 4**: Validação pré-implantação
- Estudos de caso para planeamento de capacidade
- Cenários de otimização de custos
- Implementação de pipelines de validação

**Avaliação do Módulo 5**: Resolução de problemas e depuração
- Exercícios de diagnóstico de problemas
- Tarefas de implementação de monitorização
- Simulações de resposta a incidentes

**Avaliação do Módulo 6**: Tópicos avançados
- Design de pipeline CI/CD
- Desenvolvimento de templates personalizados
- Cenários de arquitetura empresarial

### Projeto Final de Capstone

Desenhe e implemente uma solução completa que demonstre domínio de todos os conceitos:

**Requisitos**:
- Arquitetura de aplicação multi-camada
- Múltiplos ambientes de implantação
- Monitorização e alertas abrangentes
- Implementação de segurança e conformidade
- Otimização de custos e ajuste de desempenho
- Documentação completa e runbooks

**Critérios de Avaliação**:
- Qualidade técnica da implementação
- Completude da documentação
- Cumprimento de segurança e boas práticas
- Otimização de desempenho e custos
- Efetividade na resolução de problemas e monitorização

## Recursos de Estudo e Referências

### Documentação Oficial
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Documentação Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Recursos Comunitários
- [Galeria de Templates AZD](https://azure.github.io/awesome-azd/)
- [Organização GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Repositório GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)

### Ambientes de Prática
- [Conta Grátis Azure](https://azure.microsoft.com/free/)
- [Nível Gratuito Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Ferramentas Adicionais
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Pacote de Extensão Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Recomendações de Plano de Estudo

### Estudo a Tempo Inteiro (8 semanas)
- **Semanas 1-2**: Módulos 1-2 (Introdução, Configuração)
- **Semanas 3-4**: Módulos 3-4 (Implantação, Pré-implantação)
- **Semanas 5-6**: Módulos 5-6 (Resolução de Problemas, Tópicos Avançados)
- **Semanas 7-8**: Projetos Práticos e Avaliação Final

### Estudo a Tempo Parcial (16 semanas)
- **Semanas 1-4**: Módulo 1 (Introdução)
- **Semanas 5-7**: Módulo 2 (Configuração e Ambientes)
- **Semanas 8-10**: Módulo 3 (Implantação e Provisionamento)
- **Semanas 11-12**: Módulo 4 (Validação Pré-implantação)
- **Semanas 13-14**: Módulo 5 (Resolução de Problemas e Depuração)
- **Semanas 15-16**: Módulo 6 (Tópicos Avançados e Avaliação)

---

## Rastreio de Progresso e Estrutura de Avaliação

### Lista de Verificação de Conclusão de Capítulos

Acompanhe o seu progresso em cada capítulo com estes resultados mensuráveis:

#### 📚 Capítulo 1: Fundamentos e Início Rápido
- [ ] **Instalação Completa**: AZD instalado e verificado na sua plataforma
- [ ] **Primeira Implantação**: Modelo todo-nodejs-mongo implantado com sucesso
- [ ] **Configuração de Ambiente**: Variáveis de ambiente configuradas pela primeira vez
- [ ] **Navegação de Recursos**: Recursos implantados explorados no Portal Azure
- [ ] **Domínio de Comandos**: Confortável com comandos básicos do AZD

#### 🤖 Capítulo 2: Desenvolvimento com IA em Primeiro Lugar
- [ ] **Implantação de Template IA**: azure-search-openai-demo implantado com sucesso
- [ ] **Implementação RAG**: Indexação e recuperação de documentos configuradas
- [ ] **Configuração de Modelos**: Múltiplos modelos IA configurados com usos diferentes
- [ ] **Monitorização IA**: Application Insights implementado para cargas IA
- [ ] **Otimização de Desempenho**: Desempenho da aplicação IA ajustado

#### ⚙️ Capítulo 3: Configuração e Autenticação
- [ ] **Configuração Multi-Ambiente**: Ambientes dev, staging e prod configurados
- [ ] **Implementação de Segurança**: Autenticação com identidade gerida configurada
- [ ] **Gestão de Segredos**: Azure Key Vault integrado para dados sensíveis
- [ ] **Gestão de Parâmetros**: Configurações específicas de ambiente criadas
- [ ] **Domínio de Autenticação**: Padrões seguros de acesso implementados

#### 🏗️ Capítulo 4: Infraestrutura como Código e Implantação
- [ ] **Criação de Template Personalizado**: Template aplicação multi-serviço desenvolvido
- [ ] **Domínio Bicep**: Componentes modulares e reutilizáveis criados
- [ ] **Automação de Implantação**: Hooks pré/pós-implantação implementados
- [ ] **Design de Arquitetura**: Arquitetura complexa de microserviços implantada
- [ ] **Otimização de Templates**: Templates otimizados para desempenho e custo

#### 🎯 Capítulo 5: Soluções IA Multi-Agente
- [ ] **Implantação Cenário Retail Multi-Agente**: Implantação completa criada
- [ ] **Personalização de Agentes**: Comportamentos dos agentes Customer e Inventory modificados
- [ ] **Escalamento Arquitetural**: Load balancing e auto-scalabilidade implementados
- [ ] **Monitorização em Produção**: Monitorização e alertas abrangentes configurados
- [ ] **Ajuste de Desempenho**: Sistema multi-agente otimizado

#### 🔍 Capítulo 6: Validação e Planeamento Pré-implantação
- [ ] **Análise de Capacidade**: Requisitos de recursos para aplicações analisados
- [ ] **Otimização de SKU**: Camadas de serviço custo-efetivas selecionadas
- [ ] **Automação de Validação**: Scripts de verificação pré-implantação implementados
- [ ] **Planeamento de Custos**: Estimativas e orçamentos de custos criados
- [ ] **Avaliação de Riscos**: Riscos de implantação identificados e mitigados

#### 🚨 Capítulo 7: Resolução de Problemas e Depuração
- [ ] **Competências Diagnósticas**: Implantação intencionalmente defeituosa depurada com sucesso
- [ ] **Análise de Logs**: Azure Monitor e Application Insights usados eficazmente
- [ ] **Ajuste de Desempenho**: Aplicações de desempenho lento otimizadas
- [ ] **Procedimentos de Recuperação**: Backup e recuperação de desastre implementados
- [ ] **Configuração de Monitorização**: Monitorização proativa e alertas criados

#### 🏢 Capítulo 8: Padrões para Produção e Empresa
- [ ] **Segurança Empresarial**: Padrões de segurança abrangentes implementados
- [ ] **Framework de Governança**: Azure Policy e gestão de recursos configurados
- [ ] **Monitorização Avançada**: Dashboards e alertas automáticos criados
- [ ] **Integração CI/CD**: Pipelines de implantação automatizados construídos
- [ ] **Implementação de Conformidade**: Requisitos de conformidade empresarial cumpridos

### Cronograma de Aprendizagem e Marcos

#### Semana 1-2: Construção de Fundamentos
- **Marco**: Implantar a primeira aplicação IA usando AZD
- **Validação**: Aplicação funcional acessível via URL pública
- **Competências**: Fluxos básicos AZD e integração de serviço IA

#### Semana 3-4: Domínio da Configuração
- **Marco**: Implantação multi-ambiente com autenticação segura
- **Validação**: Mesma aplicação implantada em dev/staging/prod
- **Competências**: Gestão de ambientes e implementação de segurança

#### Semana 5-6: Especialização em Infraestrutura
- **Marco**: Template personalizado para aplicação multi-serviço complexa
- **Validação**: Template reutilizável implantado por outro membro da equipa
- **Competências**: Domínio Bicep e automação de infraestrutura

#### Semana 7-8: Implementação Avançada de IA
- **Marco**: Solução IA multi-agente pronta para produção
- **Validação**: Sistema a lidar com carga real com monitorização
- **Competências**: Orquestração multi-agente e otimização de desempenho

#### Semana 9-10: Prontidão para Produção
- **Marco**: Implantação empresarial com total conformidade
- **Validação**: Passa revisão de segurança e auditoria de custos
- **Competências**: Governança, monitorização e integração CI/CD

### Avaliação e Certificação

#### Métodos de Validação do Conhecimento
1. **Implantações Práticas**: Aplicações funcionais para cada capítulo
2. **Revisões de Código**: Avaliação de qualidade de templates e configurações
3. **Resolução de Problemas**: Cenários e soluções de resolução de problemas
4. **Ensino entre Pares**: Explicar conceitos a outros aprendizes
5. **Contribuição Comunitária**: Partilhar templates ou melhorias

#### Resultados do Desenvolvimento Profissional
- **Projetos de Portfólio**: 8 implementações prontas para produção  
- **Competências Técnicas**: Expertise em implementação AZD e IA segundo os padrões da indústria  
- **Capacidades de Resolução de Problemas**: Diagnóstico e otimização autónomos  
- **Reconhecimento na Comunidade**: Participação ativa na comunidade de desenvolvedores Azure  
- **Avanço Profissional**: Competências diretamente aplicáveis a funções de cloud e IA  

#### Métricas de Sucesso  
- **Taxa de Sucesso nas Implementações**: >95% de implementações bem-sucedidas  
- **Tempo de Resolução de Problemas**: <30 minutos para problemas comuns  
- **Otimização de Performance**: Melhorias comprovadas em custo e desempenho  
- **Conformidade de Segurança**: Todas as implementações cumprem os padrões de segurança empresarial  
- **Transferência de Conhecimento**: Capacidade de orientar outros desenvolvedores  

### Aprendizagem Contínua e Envolvimento na Comunidade  

#### Mantenha-se Atualizado  
- **Atualizações Azure**: Acompanhe as notas de lançamento do Azure Developer CLI  
- **Eventos Comunitários**: Participe em eventos de desenvolvedores Azure e IA  
- **Documentação**: Contribua para documentação e exemplos comunitários  
- **Ciclo de Feedback**: Forneça feedback sobre o conteúdo do curso e os serviços Azure  

#### Desenvolvimento de Carreira  
- **Rede Profissional**: Conecte-se com especialistas em Azure e IA  
- **Oportunidades de Apresentação**: Partilhe aprendizagens em conferências ou encontros  
- **Contribuição Open Source**: Contribua para templates e ferramentas AZD  
- **Mentoria**: Oriente outros desenvolvedores na sua jornada de aprendizagem AZD  

---

**Navegação do Capítulo:**  
- **📚 Página Inicial do Curso**: [AZD For Beginners](../README.md)  
- **📖 Começar a Aprender**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Acompanhamento do Progresso**: Acompanhe o seu avanço através do sistema de aprendizagem de 8 capítulos abrangentes  
- **🤝 Comunidade**: [Azure Discord](https://discord.gg/microsoft-azure) para suporte e discussão  

**Acompanhamento do Progresso de Estudo**: Utilize este guia estruturado para dominar o Azure Developer CLI através de aprendizagem progressiva e prática com resultados mensuráveis e benefícios para o desenvolvimento profissional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos empenhemos em garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->