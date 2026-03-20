# Guia de Estudo - Objetivos de Aprendizagem Abrangentes

**Navegação do Caminho de Aprendizagem**
- **📚 Início do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Começar a Aprender**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Acompanhamento de Progresso**: [Conclusão do Curso](../README.md#-course-completion--certification)

## Introdução

Este guia de estudo abrangente fornece objetivos de aprendizagem estruturados, conceitos-chave, exercícios práticos e materiais de avaliação para ajudá-lo a dominar o Azure Developer CLI (azd). Use este guia para acompanhar seu progresso e garantir que você cobriu todos os tópicos essenciais.

## Objetivos de Aprendizagem

Ao concluir este guia de estudo, você irá:
- Dominar todos os conceitos fundamentais e avançados do Azure Developer CLI
- Desenvolver habilidades práticas em implantar e gerenciar aplicações no Azure
- Adquirir confiança em solucionar problemas e otimizar implantações
- Entender práticas de implantação prontas para produção e considerações de segurança

## Resultados de Aprendizagem

Após completar todas as seções deste guia de estudo, você será capaz de:
- Projetar, implantar e gerenciar arquiteturas completas de aplicações usando azd
- Implementar estratégias abrangentes de monitoramento, segurança e otimização de custos
- Solucionar problemas complexos de implantação de forma independente
- Criar templates personalizados e contribuir para a comunidade azd

## Estrutura de Aprendizagem em 8 Capítulos

### Capítulo 1: Fundamentos & Início Rápido (Semana 1)
**Duração**: 30-45 minutos | **Complexidade**: ⭐

#### Objetivos de Aprendizagem
- Entender os conceitos principais e a terminologia do Azure Developer CLI
- Instalar e configurar com sucesso o AZD na sua plataforma de desenvolvimento
- Implantar sua primeira aplicação usando um template existente
- Navegar efetivamente na interface de linha de comando do AZD

#### Conceitos Principais a Dominar
- Estrutura e componentes do projeto AZD (azure.yaml, infra/, src/)
- Fluxos de trabalho de implantação baseados em templates
- Noções básicas de configuração de ambiente
- Gerenciamento de grupos de recursos e assinaturas

#### Exercícios Práticos
1. **Verificação da Instalação**: Instale o AZD e verifique com `azd version`
2. **Primeira Implantação**: Implante com sucesso o template todo-nodejs-mongo
3. **Configuração de Ambiente**: Configure suas primeiras variáveis de ambiente
4. **Exploração de Recursos**: Navegue pelos recursos implantados no Azure Portal

#### Questões de Avaliação
- Quais são os componentes principais de um projeto AZD?
- Como você inicializa um novo projeto a partir de um template?
- Qual é a diferença entre `azd up` e `azd deploy`?
- Como você gerencia múltiplos ambientes com AZD?

---

### Capítulo 2: Desenvolvimento com Foco em IA (Semana 2)
**Duração**: 1-2 horas | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Integrar serviços Microsoft Foundry com fluxos de trabalho do AZD
- Implantar e configurar aplicações com recursos de IA
- Entender padrões de implementação RAG (Retrieval-Augmented Generation)
- Gerenciar implantações de modelos de IA e escalonamento

#### Conceitos Principais a Dominar
- Integração do serviço Microsoft Foundry Models e gerenciamento de API
- Configuração do AI Search e indexação vetorial
- Estratégias de implantação de modelos e planejamento de capacidade
- Monitoramento de aplicações de IA e otimização de performance

#### Exercícios Práticos
1. **Implantação de Chat com IA**: Implante o template azure-search-openai-demo
2. **Implementação RAG**: Configure indexação e recuperação de documentos
3. **Configuração de Modelos**: Configure múltiplos modelos de IA com propósitos diferentes
4. **Monitoramento de IA**: Implemente Application Insights para cargas de trabalho de IA

#### Questões de Avaliação
- Como você configura serviços Microsoft Foundry Models em um template AZD?
- Quais são os componentes-chave de uma arquitetura RAG?
- Como você gerencia capacidade e escalonamento de modelos de IA?
- Quais métricas de monitoramento são importantes para aplicações de IA?

---

### Capítulo 3: Configuração & Autenticação (Semana 3)
**Duração**: 45-60 minutos | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Dominar estratégias de configuração e gerenciamento de ambientes
- Implementar padrões de autenticação seguros e identidade gerenciada
- Organizar recursos com convenções de nomenclatura apropriadas
- Configurar implantações multi-ambiente (dev, staging, prod)

#### Conceitos Principais a Dominar
- Hierarquia de ambientes e precedência de configuração
- Identidade gerenciada e autenticação por service principal
- Integração com Key Vault para gerenciamento de secrets
- Gerenciamento de parâmetros específicos de ambiente

#### Exercícios Práticos
1. **Configuração Multi-Ambiente**: Configure ambientes dev, staging e prod
2. **Configuração de Segurança**: Implemente autenticação com identidade gerenciada
3. **Gerenciamento de Segredos**: Integre Azure Key Vault para dados sensíveis
4. **Gerenciamento de Parâmetros**: Crie configurações específicas por ambiente

#### Questões de Avaliação
- Como você configura ambientes diferentes com AZD?
- Quais são os benefícios de usar identidade gerenciada em vez de service principals?
- Como você gerencia segredos de aplicação de forma segura?
- Qual é a hierarquia de configuração no AZD?

---

### Capítulo 4: Infraestrutura como Código & Implantação (Semana 4-5)
**Duração**: 1-1.5 horas | **Complexidade**: ⭐⭐⭐

#### Objetivos de Aprendizagem
- Criar e personalizar templates de infraestrutura em Bicep
- Implementar padrões avançados de implantação e fluxos de trabalho
- Entender estratégias de provisionamento de recursos
- Projetar arquiteturas escaláveis de múltiplos serviços

- Implantar aplicações conteinerizadas usando Azure Container Apps e AZD


#### Conceitos Principais a Dominar
- Estrutura de templates Bicep e melhores práticas
- Dependências de recursos e ordenação de implantação
- Arquivos de parâmetros e modularidade de templates
- Hooks customizados e automação de implantação
- Padrões de implantação de container app (quick start, production, microservices)

#### Exercícios Práticos
1. **Criação de Template Personalizado**: Construa um template de aplicação multi-serviço
2. **Domínio de Bicep**: Crie componentes de infraestrutura modulares e reutilizáveis
3. **Automação de Implantação**: Implemente hooks pré/pós-implantação
4. **Design de Arquitetura**: Implemente arquitetura complexa de microsserviços
5. **Implantação de Container App**: Implante os exemplos [Simple Flask API](../../../examples/container-app/simple-flask-api) e [Microservices Architecture](../../../examples/container-app/microservices) usando AZD

#### Questões de Avaliação
- Como você cria templates Bicep personalizados para AZD?
- Quais são as melhores práticas para organizar código de infraestrutura?
- Como você lida com dependências de recursos em templates?
- Quais padrões de implantação suportam atualizações sem downtime?

---

### Capítulo 5: Soluções de IA com Multi-Agentes (Semana 6-7)
**Duração**: 2-3 horas | **Complexidade**: ⭐⭐⭐⭐

#### Objetivos de Aprendizagem
- Projetar e implementar arquiteturas de IA com múltiplos agentes
- Orquestrar coordenação e comunicação entre agentes
- Implantar soluções de IA prontas para produção com monitoramento
- Entender especialização de agentes e padrões de fluxo de trabalho
- Integrar microsserviços conteinerizados como parte de soluções multi-agente

#### Conceitos Principais a Dominar
- Padrões de arquitetura multi-agente e princípios de design
- Protocolos de comunicação de agentes e fluxo de dados
- Estratégias de balanceamento de carga e escalonamento para agentes de IA
- Monitoramento em produção para sistemas multi-agente
- Comunicação entre serviços em ambientes conteinerizados

#### Exercícios Práticos
1. **Implantação de Solução para Varejo**: Implante o cenário completo multi-agente para varejo
2. **Customização de Agentes**: Modifique comportamentos dos agentes Customer e Inventory
3. **Escalonamento de Arquitetura**: Implemente balanceamento de carga e auto-scaling
4. **Monitoramento em Produção**: Configure monitoramento e alertas abrangentes
5. **Integração de Microsserviços**: Estenda o exemplo [Microservices Architecture](../../../examples/container-app/microservices) para suportar fluxos de trabalho baseados em agentes

#### Questões de Avaliação
- Como você projeta padrões de comunicação eficazes entre múltiplos agentes?
- Quais são as considerações chave para escalonar cargas de trabalho de agentes de IA?
- Como você monitora e depura sistemas de IA multi-agente?
- Quais padrões de produção garantem confiabilidade para agentes de IA?

---

### Capítulo 6: Validação & Planejamento Pré-Implantação (Semana 8)
**Duração**: 1 hora | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Realizar planejamento de capacidade e validação de recursos abrangentes
- Selecionar SKUs Azure ideais para custo-efetividade
- Implementar verificações automatizadas pré-implantação
- Planejar implantações com estratégias de otimização de custos

#### Conceitos Principais a Dominar
- Cotas de recursos do Azure e limitações de capacidade
- Critérios de seleção de SKU e otimização de custos
- Scripts de validação automatizados e testes
- Planejamento de implantação e avaliação de riscos

#### Exercícios Práticos
1. **Análise de Capacidade**: Analise requisitos de recursos para suas aplicações
2. **Otimização de SKU**: Compare e selecione níveis de serviço custo-efetivos
3. **Automação de Validação**: Implemente scripts de verificação pré-implantação
4. **Planejamento de Custos**: Crie estimativas de custo de implantação e orçamentos

#### Questões de Avaliação
- Como você valida a capacidade do Azure antes da implantação?
- Quais fatores influenciam as decisões de seleção de SKU?
- Como você automatiza a validação pré-implantação?
- Quais estratégias ajudam a otimizar custos de implantação?

---

### Capítulo 7: Solução de Problemas & Depuração (Semana 9)
**Duração**: 1-1.5 horas | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Desenvolver abordagens sistemáticas de depuração para implantações AZD
- Resolver problemas comuns de implantação e configuração
- Depurar problemas específicos de IA e questões de desempenho
- Implementar monitoramento e alertas para detecção proativa de problemas

#### Conceitos Principais a Dominar
- Técnicas de diagnóstico e estratégias de logging
- Padrões comuns de falha e suas soluções
- Monitoramento de performance e otimização
- Procedimentos de resposta a incidentes e recuperação

#### Exercícios Práticos
1. **Habilidades de Diagnóstico**: Pratique com implantações intencionalmente quebradas
2. **Análise de Logs**: Use Azure Monitor e Application Insights de forma eficaz
3. **Ajuste de Performance**: Otimize aplicações com desempenho lento
4. **Procedimentos de Recuperação**: Implemente backup e recuperação de desastres

#### Questões de Avaliação
- Quais são as falhas de implantação AZD mais comuns?
- Como você depura problemas de autenticação e permissões?
- Quais estratégias de monitoramento ajudam a prevenir problemas em produção?
- Como você otimiza o desempenho de aplicações no Azure?

---

### Capítulo 8: Padrões de Produção & Empresariais (Semana 10-11)
**Duração**: 2-3 horas | **Complexidade**: ⭐⭐⭐⭐

#### Objetivos de Aprendizagem
- Implementar estratégias de implantação de nível empresarial
- Projetar padrões de segurança e frameworks de conformidade
- Estabelecer monitoramento, governança e gestão de custos
- Criar pipelines CI/CD escaláveis com integração AZD
- Aplicar melhores práticas para implantações de container app em produção (segurança, monitoramento, custo, CI/CD)

#### Conceitos Principais a Dominar
- Requisitos de segurança empresarial e conformidade
- Frameworks de governança e implementação de policies
- Monitoramento avançado e gestão de custos
- Integração CI/CD e pipelines de implantação automatizada
- Estratégias de implantação blue-green e canary para workloads conteinerizados

#### Exercícios Práticos
1. **Segurança Empresarial**: Implemente padrões de segurança abrangentes
2. **Framework de Governança**: Configure Azure Policy e gerenciamento de recursos
3. **Monitoramento Avançado**: Crie dashboards e alertas automatizados
4. **Integração CI/CD**: Construa pipelines de implantação automatizados
5. **Container Apps em Produção**: Aplique segurança, monitoramento e otimização de custos ao exemplo [Microservices Architecture](../../../examples/container-app/microservices)

#### Questões de Avaliação
- Como você implementa segurança empresarial em implantações AZD?
- Quais padrões de governança garantem conformidade e controle de custos?
- Como você projeta monitoramento escalável para sistemas em produção?
- Quais padrões de CI/CD funcionam melhor com fluxos de trabalho AZD?

#### Objetivos de Aprendizagem
- Entender os fundamentos do Azure Developer CLI e conceitos centrais
- Instalar e configurar com sucesso o azd no seu ambiente de desenvolvimento
- Completar sua primeira implantação usando um template existente
- Navegar na estrutura de projeto azd e entender componentes chave

#### Conceitos Principais a Dominar
- Templates, ambientes e serviços
- Estrutura de configuração azure.yaml
- Comandos básicos do azd (init, up, down, deploy)
- Princípios de Infraestrutura como Código
- Autenticação e autorização no Azure

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

**Exercício 1.2: Primeira Implantação**
```bash
# Implantar uma aplicação web simples:
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
1. Quais são os três conceitos centrais da arquitetura azd?
2. Qual é o propósito do arquivo azure.yaml?
3. Como os ambientes ajudam a gerenciar diferentes alvos de implantação?
4. Quais métodos de autenticação podem ser usados com azd?
5. O que acontece quando você executa `azd up` pela primeira vez?

---

## Acompanhamento de Progresso e Estrutura de Avaliação
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
# Implemente as melhores práticas de segurança:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Perguntas de Autoavaliação
1. Como o azd trata a precedência de variáveis de ambiente?
2. O que são deployment hooks e quando você deve usá-los?
3. Como você configura SKUs diferentes para ambientes distintos?
4. Quais são as implicações de segurança dos diferentes métodos de autenticação?
5. Como você gerencia segredos e dados de configuração sensíveis?

### Módulo 3: Implantação e Provisionamento (Semana 4)

#### Objetivos de Aprendizagem
- Dominar fluxos de trabalho e melhores práticas de implantação
- Entender Infraestrutura como Código com templates Bicep
- Implementar arquiteturas complexas de múltiplos serviços
- Otimizar performance e confiabilidade da implantação

#### Conceitos Principais a Dominar
- Estrutura de templates Bicep e módulos
- Dependências de recursos e ordenação
- Estratégias de implantação (blue-green, rolling updates)
- Implantações multi-região
- Migrações de banco de dados e gerenciamento de dados

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
# Implantar uma arquitetura de microsserviços:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercício 3.3: Integração de Banco de Dados**
```bash
# Implemente padrões de implantação de banco de dados:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Perguntas de Autoavaliação
1. Quais são as vantagens de usar Bicep em vez de templates ARM?
2. Como você lida com migrações de banco de dados em implantações azd?
3. Quais estratégias existem para implantações sem downtime?
4. Como você gerencia dependências entre serviços?
5. Quais são as considerações para implantações multi-região?

### Módulo 4: Validação Pré-Implantação (Semana 5)

#### Objetivos de Aprendizagem
- Implementar verificações abrangentes pré-implantação
- Dominar o planejamento de capacidade e a validação de recursos
- Entender a seleção de SKU e otimização de custos
- Construir pipelines de validação automatizados

#### Conceitos-chave para Dominar
- Cotas e limites de recursos do Azure
- Critérios de seleção de SKU e implicações de custo
- Scripts e ferramentas de validação automatizada
- Metodologias de planejamento de capacidade
- Testes de desempenho e otimização

#### Exercícios Práticos

**Exercício 4.1: Planejamento de Capacidade**
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
1. Quais fatores devem influenciar as decisões de seleção de SKU?
2. Como você valida a disponibilidade de recursos do Azure antes da implantação?
3. Quais são os componentes chave de um sistema de verificação pré-voo?
4. Como você estima e controla os custos de implantação?
5. Qual monitoramento é essencial para o planejamento de capacidade?

### Módulo 5: Solução de Problemas e Depuração (Semana 6)

#### Objetivos de Aprendizagem
- Dominar metodologias sistemáticas de solução de problemas
- Desenvolver expertise em depuração de problemas complexos de implantação
- Implementar monitoramento e alertas abrangentes
- Construir procedimentos de resposta a incidentes e recuperação

#### Conceitos-chave para Dominar
- Padrões comuns de falhas de implantação
- Técnicas de análise e correlação de logs
- Monitoramento de desempenho e otimização
- Detecção e resposta a incidentes de segurança
- Recuperação de desastres e continuidade de negócios

#### Exercícios Práticos

**Exercício 5.1: Cenários de Solução de Problemas**
```bash
# Pratique a resolução de problemas comuns:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercício 5.2: Implementação de Monitoramento**
```bash
# Configure monitoramento abrangente:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercício 5.3: Resposta a Incidentes**
```bash
# Elaborar procedimentos de resposta a incidentes:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Perguntas de Autoavaliação
1. Qual é a abordagem sistemática para solucionar implantações azd?
2. Como você correlaciona logs entre múltiplos serviços e recursos?
3. Quais métricas de monitoramento são mais críticas para detecção precoce de problemas?
4. Como você implementa procedimentos eficazes de recuperação de desastres?
5. Quais são os componentes chave de um plano de resposta a incidentes?

### Módulo 6: Tópicos Avançados e Melhores Práticas (Semanas 7-8)

#### Objetivos de Aprendizagem
- Implementar padrões de implantação de nível empresarial
- Dominar integração e automação de CI/CD
- Desenvolver templates personalizados e contribuir com a comunidade
- Entender requisitos avançados de segurança e conformidade

#### Conceitos-chave para Dominar
- Padrões de integração de pipeline CI/CD
- Desenvolvimento e distribuição de templates personalizados
- Governança empresarial e conformidade
- Configurações avançadas de rede e segurança
- Otimização de desempenho e gerenciamento de custos

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
# Criar e publicar modelos personalizados:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercício 6.3: Implementação Corporativa**
```bash
# Implementar recursos de nível empresarial:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Perguntas de Autoavaliação
1. Como você integra o azd em fluxos de trabalho CI/CD existentes?
2. Quais são as considerações chave para o desenvolvimento de templates personalizados?
3. Como você implementa governança e conformidade em implantações azd?
4. Quais são as melhores práticas para implantações em escala empresarial?
5. Como você contribui efetivamente para a comunidade azd?

## Projetos Práticos

### Projeto 1: Site Pessoal de Portfólio
**Complexidade**: Iniciante  
**Duração**: 1-2 semanas

Construa e implante um site pessoal de portfólio usando:
- Hospedagem de site estático no Azure Storage
- Configuração de domínio personalizado
- Integração com CDN para desempenho global
- Pipeline de implantação automatizada

**Entregáveis**:
- Site em funcionamento implantado no Azure
- Template azd personalizado para implantações de portfólio
- Documentação do processo de implantação
- Análise de custos e recomendações de otimização

### Projeto 2: Aplicação de Gerenciamento de Tarefas
**Complexidade**: Intermediário  
**Duração**: 2-3 semanas

Crie uma aplicação full-stack de gerenciamento de tarefas com:
- Frontend em React implantado no App Service
- Backend API em Node.js com autenticação
- Banco de dados PostgreSQL com migrações
- Monitoramento com Application Insights

**Entregáveis**:
- Aplicação completa com autenticação de usuário
- Esquema do banco de dados e scripts de migração
- Dashboards de monitoramento e regras de alerta
- Configuração de implantação para múltiplos ambientes

### Projeto 3: Plataforma de E-commerce baseada em Microsserviços
**Complexidade**: Avançado  
**Duração**: 4-6 semanas

Projete e implemente uma plataforma de e-commerce baseada em microsserviços:
- Múltiplos serviços de API (catalog, orders, payments, users)
- Integração com fila de mensagens usando Service Bus
- Cache Redis para otimização de desempenho
- Registro e monitoramento abrangentes

**Exemplo de Referência**: Veja [Arquitetura de Microsserviços](../../../examples/container-app/microservices) para um template pronto para produção e guia de implantação

**Entregáveis**:
- Arquitetura completa de microsserviços
- Padrões de comunicação entre serviços
- Testes de desempenho e otimização
- Implementação de segurança pronta para produção

## Avaliação e Certificação

### Verificações de Conhecimento

Complete estas avaliações após cada módulo:

**Avaliação do Módulo 1**: Conceitos básicos e instalação
- Questões de múltipla escolha sobre conceitos centrais
- Tarefas práticas de instalação e configuração
- Exercício simples de implantação

**Avaliação do Módulo 2**: Configuração e ambientes
- Cenários de gerenciamento de ambientes
- Exercícios de resolução de problemas de configuração
- Implementação de configuração de segurança

**Avaliação do Módulo 3**: Implantação e provisão
- Desafios de design de infraestrutura
- Cenários de implantação de múltiplos serviços
- Exercícios de otimização de desempenho

**Avaliação do Módulo 4**: Validação pré-implantação
- Estudos de caso de planejamento de capacidade
- Cenários de otimização de custos
- Implementação de pipeline de validação

**Avaliação do Módulo 5**: Solução de problemas e depuração
- Exercícios de diagnóstico de problemas
- Tarefas de implementação de monitoramento
- Simulações de resposta a incidentes

**Avaliação do Módulo 6**: Tópicos avançados
- Design de pipeline CI/CD
- Desenvolvimento de templates personalizados
- Cenários de arquitetura empresarial

### Projeto Final Capstone

Projete e implemente uma solução completa que demonstre domínio de todos os conceitos:

**Requisitos**:
- Arquitetura de aplicação em múltiplas camadas
- Múltiplos ambientes de implantação
- Monitoramento e alertas abrangentes
- Implementação de segurança e conformidade
- Otimização de custos e ajuste de desempenho
- Documentação completa e runbooks

**Critérios de Avaliação**:
- Qualidade da implementação técnica
- Completude da documentação
- Aderência às melhores práticas e segurança
- Otimização de desempenho e custos
- Eficácia na solução de problemas e monitoramento

## Recursos de Estudo e Referências

### Documentação Oficial
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Recursos da Comunidade
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Ambientes de Prática
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Ferramentas Adicionais
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Recomendações de Cronograma de Estudo

### Estudo em Tempo Integral (8 semanas)
- **Semanas 1-2**: Módulos 1-2 (Introdução, Configuração)
- **Semanas 3-4**: Módulos 3-4 (Implantação, Pré-implantação)
- **Semanas 5-6**: Módulos 5-6 (Solução de Problemas, Tópicos Avançados)
- **Semanas 7-8**: Projetos Práticos e Avaliação Final

### Estudo em Meio Período (16 semanas)
- **Semanas 1-4**: Módulo 1 (Introdução)
- **Semanas 5-7**: Módulo 2 (Configuração e Ambientes)
- **Semanas 8-10**: Módulo 3 (Implantação e Provisão)
- **Semanas 11-12**: Módulo 4 (Validação Pré-implantação)
- **Semanas 13-14**: Módulo 5 (Solução de Problemas e Depuração)
- **Semanas 15-16**: Módulo 6 (Tópicos Avançados e Avaliação)

---

## Monitoramento de Progresso e Estrutura de Avaliação

### Lista de Verificação de Conclusão de Capítulo

Acompanhe seu progresso em cada capítulo com estes resultados mensuráveis:

#### 📚 Capítulo 1: Fundamentos & Início Rápido
- [ ] **Instalação Completa**: AZD instalado e verificado na sua plataforma
- [ ] **Primeira Implantação**: Template todo-nodejs-mongo implantado com sucesso
- [ ] **Configuração do Ambiente**: Variáveis de ambiente iniciais configuradas
- [ ] **Navegação de Recursos**: Recursos implantados explorados no Azure Portal
- [ ] **Domínio de Comandos**: Confortável com comandos básicos do AZD

#### 🤖 Capítulo 2: Desenvolvimento com Foco em IA  
- [ ] **Deploy de Template de IA**: azure-search-openai-demo implantado com sucesso
- [ ] **Implementação RAG**: Indexação e recuperação de documentos configuradas
- [ ] **Configuração de Modelos**: Configuração de múltiplos modelos de IA com diferentes propósitos
- [ ] **Monitoramento de IA**: Application Insights implementado para cargas de trabalho de IA
- [ ] **Otimização de Desempenho**: Desempenho da aplicação de IA ajustado

#### ⚙️ Capítulo 3: Configuração & Autenticação
- [ ] **Configuração Multi-Ambiente**: Ambientes dev, staging e prod configurados
- [ ] **Implementação de Segurança**: Autenticação com identidade gerenciada configurada
- [ ] **Gerenciamento de Segredos**: Integração com Azure Key Vault para dados sensíveis
- [ ] **Gerenciamento de Parâmetros**: Configurações específicas por ambiente criadas
- [ ] **Domínio de Autenticação**: Padrões de acesso seguro implementados

#### 🏗️ Capítulo 4: Infraestrutura como Código & Implantação
- [ ] **Criação de Template Personalizado**: Template de aplicação multi-serviço criado
- [ ] **Domínio de Bicep**: Componentes de infraestrutura modulares e reutilizáveis criados
- [ ] **Automação de Implantação**: Hooks de pré/pós-implantação implementados
- [ ] **Design de Arquitetura**: Arquitetura complexa de microsserviços implantada
- [ ] **Otimização de Template**: Templates otimizados para desempenho e custo

#### 🎯 Capítulo 5: Soluções de IA Multiagente
- [ ] **Deploy de Solução de Varejo**: Cenário completo multiagente de varejo implantado
- [ ] **Customização de Agentes**: Comportamentos dos agentes de Cliente e Inventário modificados
- [ ] **Escalonamento de Arquitetura**: Balanceamento de carga e auto-scaling implementados
- [ ] **Monitoramento em Produção**: Monitoramento e alertas abrangentes configurados
- [ ] **Ajuste de Desempenho**: Desempenho do sistema multiagente otimizado

#### 🔍 Capítulo 6: Validação Pré-implantação & Planejamento
- [ ] **Análise de Capacidade**: Requisitos de recursos para aplicações analisados
- [ ] **Otimização de SKU**: Seleção de níveis de serviço custo-efetivos realizada
- [ ] **Automação de Validação**: Scripts de verificação pré-implantação implementados
- [ ] **Planejamento de Custos**: Estimativas de custos de implantação e orçamentos criados
- [ ] **Avaliação de Riscos**: Riscos de implantação identificados e mitigados

#### 🚨 Capítulo 7: Solução de Problemas & Depuração
- [ ] **Habilidades de Diagnóstico**: Implantações intencionalmente quebradas debugadas com sucesso
- [ ] **Análise de Logs**: Azure Monitor e Application Insights usados efetivamente
- [ ] **Otimização de Desempenho**: Aplicações com desempenho lento otimizadas
- [ ] **Procedimentos de Recuperação**: Backup e recuperação de desastres implementados
- [ ] **Configuração de Monitoramento**: Monitoramento e alertas proativos criados

#### 🏢 Capítulo 8: Padrões de Produção & Corporativos
- [ ] **Segurança Empresarial**: Padrões de segurança abrangentes implementados
- [ ] **Estrutura de Governança**: Azure Policy e gerenciamento de recursos configurados
- [ ] **Monitoramento Avançado**: Dashboards criados e alertas automatizados
- [ ] **Integração CI/CD**: Pipelines de implantação automatizados construídos
- [ ] **Implementação de Conformidade**: Requisitos de conformidade corporativa atendidos

### Cronograma de Aprendizagem e Marcos

#### Semana 1-2: Construção de Fundamentos
- **Marco**: Implantar a primeira aplicação de IA usando AZD
- **Validação**: Aplicação funcionando acessível via URL pública
- **Habilidades**: Fluxos de trabalho básicos do AZD e integração com serviços de IA

#### Semana 3-4: Domínio de Configuração
- **Marco**: Implantação multi-ambiente com autenticação segura
- **Validação**: Mesma aplicação implantada em dev/staging/prod
- **Habilidades**: Gerenciamento de ambientes e implementação de segurança

#### Semana 5-6: Expertise em Infraestrutura
- **Marco**: Template personalizado para aplicação complexa multi-serviço
- **Validação**: Template reutilizável implantado por outro membro da equipe
- **Habilidades**: Domínio de Bicep e automação de infraestrutura

#### Semana 7-8: Implementação Avançada de IA
- **Marco**: Solução multiagente pronta para produção
- **Validação**: Sistema lidando com carga do mundo real com monitoramento
- **Habilidades**: Orquestração multiagente e otimização de desempenho

#### Semana 9-10: Preparação para Produção
- **Marco**: Implantação de nível empresarial com conformidade completa
- **Validação**: Aprovação em revisão de segurança e auditoria de otimização de custos
- **Habilidades**: Governança, monitoramento e integração CI/CD

### Avaliação e Certificação

#### Métodos de Validação de Conhecimento
1. **Implantações Práticas**: Aplicações funcionando para cada capítulo
2. **Revisões de Código**: Avaliação da qualidade de templates e configurações
3. **Resolução de Problemas**: Cenários de solução de problemas e soluções
4. **Ensino entre Pares**: Explique conceitos para outros aprendizes
5. **Contribuição à Comunidade**: Compartilhe templates ou melhorias

#### Resultados de Desenvolvimento Profissional
- **Projetos de Portfólio**: 8 implantações prontas para produção
- **Habilidades Técnicas**: Especialização em implantações AZD e IA segundo padrões da indústria
- **Habilidades de Resolução de Problemas**: Solução de problemas e otimização independentes
- **Reconhecimento na Comunidade**: Participação ativa na comunidade de desenvolvedores do Azure
- **Avanço na Carreira**: Habilidades aplicáveis diretamente a funções de nuvem e IA

#### Métricas de Sucesso
- **Taxa de Sucesso de Implantação**: >95% de implantações bem-sucedidas
- **Tempo de Resolução de Problemas**: <30 minutos para questões comuns
- **Otimização de Desempenho**: Melhorias demonstráveis em custo e desempenho
- **Conformidade de Segurança**: Todas as implantações atendem aos padrões de segurança empresariais
- **Transferência de Conhecimento**: Capacidade de orientar outros desenvolvedores

### Aprendizado Contínuo e Engajamento com a Comunidade

#### Mantenha-se Atualizado
- **Azure Updates**: Acompanhe as notas de versão do Azure Developer CLI
- **Eventos da Comunidade**: Participe de eventos para desenvolvedores do Azure e de IA
- **Documentação**: Contribua para a documentação e exemplos da comunidade
- **Ciclo de Feedback**: Forneça feedback sobre o conteúdo do curso e os serviços do Azure

#### Desenvolvimento de Carreira
- **Rede Profissional**: Conecte-se com especialistas em Azure e IA
- **Oportunidades de Palestra**: Apresente aprendizados em conferências ou meetups
- **Contribuição em Código Aberto**: Contribua para modelos e ferramentas AZD
- **Mentoria**: Oriente outros desenvolvedores em sua jornada de aprendizado com AZD

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Comece a Aprender**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Rastreamento de Progresso**: Acompanhe seu avanço através do abrangente sistema de aprendizado de 8 capítulos
- **🤝 Comunidade**: [Azure Discord](https://discord.gg/microsoft-azure) para suporte e discussão

**Acompanhamento do Progresso de Estudos**: Use este guia estruturado para dominar o Azure Developer CLI por meio de um aprendizado progressivo e prático com resultados mensuráveis e benefícios para o desenvolvimento profissional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. A versão original do documento no seu idioma nativo deve ser considerada a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->