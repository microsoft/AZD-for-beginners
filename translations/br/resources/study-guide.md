<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-20T21:28:59+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "br"
}
-->
# Guia de Estudos - Objetivos de Aprendizagem Abrangentes

**Navegação no Caminho de Aprendizagem**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Comece a Aprender**: [Capítulo 1: Fundamentos e Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Acompanhamento de Progresso**: [Conclusão do Curso](../README.md#-course-completion--certification)

## Introdução

Este guia de estudos abrangente fornece objetivos de aprendizagem estruturados, conceitos-chave, exercícios práticos e materiais de avaliação para ajudá-lo a dominar o Azure Developer CLI (azd). Use este guia para acompanhar seu progresso e garantir que você cobriu todos os tópicos essenciais.

## Objetivos de Aprendizagem

Ao concluir este guia de estudos, você será capaz de:
- Dominar todos os conceitos fundamentais e avançados do Azure Developer CLI
- Desenvolver habilidades práticas para implantar e gerenciar aplicações no Azure
- Ganhar confiança na solução de problemas e otimização de implantações
- Compreender práticas de implantação prontas para produção e considerações de segurança

## Resultados de Aprendizagem

Após concluir todas as seções deste guia de estudos, você será capaz de:
- Projetar, implantar e gerenciar arquiteturas completas de aplicações usando o azd
- Implementar estratégias abrangentes de monitoramento, segurança e otimização de custos
- Solucionar problemas complexos de implantação de forma independente
- Criar templates personalizados e contribuir para a comunidade azd

## Estrutura de Aprendizagem em 8 Capítulos

### Capítulo 1: Fundamentos e Início Rápido (Semana 1)
**Duração**: 30-45 minutos | **Complexidade**: ⭐

#### Objetivos de Aprendizagem
- Compreender os conceitos e a terminologia principais do Azure Developer CLI
- Instalar e configurar com sucesso o AZD na sua plataforma de desenvolvimento
- Implantar sua primeira aplicação usando um template existente
- Navegar pela interface de linha de comando do AZD de forma eficaz

#### Conceitos-Chave para Dominar
- Estrutura e componentes do projeto AZD (azure.yaml, infra/, src/)
- Fluxos de trabalho de implantação baseados em templates
- Noções básicas de configuração de ambiente
- Gerenciamento de grupos de recursos e assinaturas

#### Exercícios Práticos
1. **Verificação de Instalação**: Instale o AZD e verifique com `azd version`
2. **Primeira Implantação**: Implante o template todo-nodejs-mongo com sucesso
3. **Configuração de Ambiente**: Configure suas primeiras variáveis de ambiente
4. **Exploração de Recursos**: Navegue pelos recursos implantados no Portal do Azure

#### Perguntas de Avaliação
- Quais são os componentes principais de um projeto AZD?
- Como você inicializa um novo projeto a partir de um template?
- Qual é a diferença entre `azd up` e `azd deploy`?
- Como você gerencia múltiplos ambientes com o AZD?

---

### Capítulo 2: Desenvolvimento com Foco em IA (Semana 2)
**Duração**: 1-2 horas | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Integrar serviços Microsoft Foundry com fluxos de trabalho do AZD
- Implantar e configurar aplicações com inteligência artificial
- Compreender padrões de implementação RAG (Geração Aumentada por Recuperação)
- Gerenciar implantações e escalabilidade de modelos de IA

#### Conceitos-Chave para Dominar
- Integração do serviço Azure OpenAI e gerenciamento de APIs
- Configuração de busca com IA e indexação vetorial
- Estratégias de implantação de modelos e planejamento de capacidade
- Monitoramento e otimização de desempenho de aplicações de IA

#### Exercícios Práticos
1. **Implantação de Chat com IA**: Implante o template azure-search-openai-demo
2. **Implementação RAG**: Configure indexação e recuperação de documentos
3. **Configuração de Modelos**: Configure múltiplos modelos de IA com diferentes propósitos
4. **Monitoramento de IA**: Implemente o Application Insights para cargas de trabalho de IA

#### Perguntas de Avaliação
- Como você configura serviços Azure OpenAI em um template AZD?
- Quais são os componentes principais de uma arquitetura RAG?
- Como você gerencia a capacidade e a escalabilidade de modelos de IA?
- Quais métricas de monitoramento são importantes para aplicações de IA?

---

### Capítulo 3: Configuração e Autenticação (Semana 3)
**Duração**: 45-60 minutos | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Dominar estratégias de configuração e gerenciamento de ambientes
- Implementar padrões seguros de autenticação e identidade gerenciada
- Organizar recursos com convenções de nomenclatura adequadas
- Configurar implantações para múltiplos ambientes (dev, staging, prod)

#### Conceitos-Chave para Dominar
- Hierarquia de ambientes e precedência de configuração
- Autenticação com identidade gerenciada e principal de serviço
- Integração com Key Vault para gerenciamento de segredos
- Gerenciamento de parâmetros específicos de ambiente

#### Exercícios Práticos
1. **Configuração de Múltiplos Ambientes**: Configure ambientes dev, staging e prod
2. **Configuração de Segurança**: Implemente autenticação com identidade gerenciada
3. **Gerenciamento de Segredos**: Integre o Azure Key Vault para dados sensíveis
4. **Gerenciamento de Parâmetros**: Crie configurações específicas para cada ambiente

#### Perguntas de Avaliação
- Como você configura diferentes ambientes com o AZD?
- Quais são os benefícios de usar identidade gerenciada em vez de principais de serviço?
- Como você gerencia segredos de forma segura?
- Qual é a hierarquia de configuração no AZD?

---

### Capítulo 4: Infraestrutura como Código e Implantação (Semanas 4-5)
**Duração**: 1-1,5 horas | **Complexidade**: ⭐⭐⭐

#### Objetivos de Aprendizagem
- Criar e personalizar templates de infraestrutura Bicep
- Implementar padrões e fluxos de trabalho avançados de implantação
- Compreender estratégias de provisionamento de recursos
- Projetar arquiteturas escaláveis de múltiplos serviços

- Implantar aplicações em contêiner usando Azure Container Apps e AZD

#### Conceitos-Chave para Dominar
- Estrutura e melhores práticas de templates Bicep
- Dependências de recursos e ordenação de implantações
- Arquivos de parâmetros e modularidade de templates
- Hooks personalizados e automação de implantação
- Padrões de implantação de aplicativos em contêiner (início rápido, produção, microsserviços)

#### Exercícios Práticos
1. **Criação de Template Personalizado**: Construa um template de aplicação de múltiplos serviços
2. **Domínio do Bicep**: Crie componentes de infraestrutura modulares e reutilizáveis
3. **Automação de Implantação**: Implemente hooks pré/pós-implantação
4. **Design de Arquitetura**: Implante uma arquitetura complexa de microsserviços
5. **Implantação de Aplicativos em Contêiner**: Implante os exemplos [Simple Flask API](../../../examples/container-app/simple-flask-api) e [Microservices Architecture](../../../examples/container-app/microservices) usando o AZD

#### Perguntas de Avaliação
- Como você cria templates Bicep personalizados para o AZD?
- Quais são as melhores práticas para organizar o código de infraestrutura?
- Como você lida com dependências de recursos em templates?
- Quais padrões de implantação suportam atualizações sem tempo de inatividade?

---

### Capítulo 5: Soluções de IA com Múltiplos Agentes (Semanas 6-7)
**Duração**: 2-3 horas | **Complexidade**: ⭐⭐⭐⭐

#### Objetivos de Aprendizagem
- Projetar e implementar arquiteturas de IA com múltiplos agentes
- Orquestrar a coordenação e comunicação entre agentes
- Implantar soluções de IA prontas para produção com monitoramento
- Compreender especialização de agentes e padrões de fluxo de trabalho
- Integrar microsserviços em contêiner como parte de soluções de múltiplos agentes

#### Conceitos-Chave para Dominar
- Padrões de arquitetura de múltiplos agentes e princípios de design
- Protocolos de comunicação entre agentes e fluxo de dados
- Estratégias de balanceamento de carga e escalabilidade para agentes de IA
- Monitoramento de produção para sistemas de múltiplos agentes
- Comunicação entre serviços em ambientes de contêiner

#### Exercícios Práticos
1. **Implantação de Solução de Varejo**: Implante o cenário completo de varejo com múltiplos agentes
2. **Customização de Agentes**: Modifique os comportamentos dos agentes Cliente e Estoque
3. **Escalabilidade de Arquitetura**: Implemente balanceamento de carga e escalabilidade automática
4. **Monitoramento de Produção**: Configure monitoramento abrangente e alertas
5. **Integração de Microsserviços**: Estenda o exemplo [Microservices Architecture](../../../examples/container-app/microservices) para suportar fluxos de trabalho baseados em agentes

#### Perguntas de Avaliação
- Como você projeta padrões eficazes de comunicação entre múltiplos agentes?
- Quais são as principais considerações para escalar cargas de trabalho de agentes de IA?
- Como você monitora e depura sistemas de IA com múltiplos agentes?
- Quais padrões de produção garantem confiabilidade para agentes de IA?

---

### Capítulo 6: Validação e Planejamento Pré-Implantação (Semana 8)
**Duração**: 1 hora | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Realizar planejamento de capacidade e validação de recursos de forma abrangente
- Selecionar SKUs do Azure ideais para custo-benefício
- Implementar verificações automáticas e validação pré-implantação
- Planejar implantações com estratégias de otimização de custos

#### Conceitos-Chave para Dominar
- Quotas de recursos do Azure e limitações de capacidade
- Critérios de seleção de SKUs e otimização de custos
- Scripts de validação automatizados e testes
- Planejamento de implantação e avaliação de riscos

#### Exercícios Práticos
1. **Análise de Capacidade**: Analise os requisitos de recursos para suas aplicações
2. **Otimização de SKUs**: Compare e selecione níveis de serviço custo-efetivos
3. **Automação de Validação**: Implemente scripts de verificação pré-implantação
4. **Planejamento de Custos**: Crie estimativas de custos e orçamentos de implantação

#### Perguntas de Avaliação
- Como você valida a capacidade do Azure antes da implantação?
- Quais fatores influenciam as decisões de seleção de SKUs?
- Como você automatiza a validação pré-implantação?
- Quais estratégias ajudam a otimizar os custos de implantação?

---

### Capítulo 7: Solução de Problemas e Depuração (Semana 9)
**Duração**: 1-1,5 horas | **Complexidade**: ⭐⭐

#### Objetivos de Aprendizagem
- Desenvolver abordagens sistemáticas de depuração para implantações AZD
- Resolver problemas comuns de implantação e configuração
- Depurar problemas específicos de IA e questões de desempenho
- Implementar monitoramento e alertas para detecção proativa de problemas

#### Conceitos-Chave para Dominar
- Técnicas de diagnóstico e estratégias de registro
- Padrões comuns de falhas e suas soluções
- Monitoramento de desempenho e otimização
- Procedimentos de resposta a incidentes e recuperação

#### Exercícios Práticos
1. **Habilidades de Diagnóstico**: Pratique com implantações propositalmente quebradas
2. **Análise de Logs**: Use o Azure Monitor e o Application Insights de forma eficaz
3. **Ajuste de Desempenho**: Otimize aplicações com desempenho lento
4. **Procedimentos de Recuperação**: Implemente backup e recuperação de desastres

#### Perguntas de Avaliação
- Quais são as falhas de implantação mais comuns no AZD?
- Como você depura problemas de autenticação e permissões?
- Quais estratégias de monitoramento ajudam a prevenir problemas em produção?
- Como você otimiza o desempenho de aplicações no Azure?

---

### Capítulo 8: Padrões de Produção e Corporativos (Semanas 10-11)
**Duração**: 2-3 horas | **Complexidade**: ⭐⭐⭐⭐

#### Objetivos de Aprendizagem
- Implementar estratégias de implantação em nível corporativo
- Projetar padrões de segurança e estruturas de conformidade
- Estabelecer monitoramento, governança e gerenciamento de custos
- Criar pipelines escaláveis de CI/CD com integração AZD
- Aplicar melhores práticas para implantações de aplicativos em contêiner em produção (segurança, monitoramento, custo, CI/CD)

#### Conceitos-Chave para Dominar
- Requisitos de segurança e conformidade corporativa
- Estruturas de governança e implementação de políticas
- Monitoramento avançado e gerenciamento de custos
- Integração de CI/CD e pipelines de implantação automatizados
- Estratégias de implantação blue-green e canary para cargas de trabalho em contêiner

#### Exercícios Práticos
1. **Segurança Corporativa**: Implemente padrões abrangentes de segurança
2. **Estrutura de Governança**: Configure políticas do Azure e gerenciamento de recursos
3. **Monitoramento Avançado**: Crie dashboards e alertas automatizados
4. **Integração de CI/CD**: Construa pipelines de implantação automatizados
5. **Aplicativos em Contêiner em Produção**: Aplique segurança, monitoramento e otimização de custos ao exemplo [Microservices Architecture](../../../examples/container-app/microservices)

#### Perguntas de Avaliação
- Como você implementa segurança corporativa em implantações AZD?
- Quais padrões de governança garantem conformidade e controle de custos?
- Como você projeta monitoramento escalável para sistemas de produção?
- Quais padrões de CI/CD funcionam melhor com fluxos de trabalho AZD?

#### Objetivos de Aprendizagem
- Compreender os fundamentos e conceitos principais do Azure Developer CLI
- Instalar e configurar com sucesso o azd no seu ambiente de desenvolvimento
- Concluir sua primeira implantação usando um template existente
- Navegar pela estrutura do projeto azd e entender os componentes principais

#### Conceitos-Chave para Dominar
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
1. Quais são os três conceitos principais da arquitetura azd?
2. Qual é o propósito do arquivo azure.yaml?
3. Como os ambientes ajudam a gerenciar diferentes alvos de implantação?
4. Quais métodos de autenticação podem ser usados com o azd?
5. O que acontece quando você executa `azd up` pela primeira vez?

---

## Acompanhamento de Progresso e Estrutura de Avaliação
```bash
# Criar e configurar vários ambientes:
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
1. Como o azd lida com a precedência de variáveis de ambiente?
2. O que são hooks de implantação e quando você deve usá-los?
3. Como você configura diferentes SKUs para diferentes ambientes?
4. Quais são as implicações de segurança dos diferentes métodos de autenticação?
5. Como você gerencia segredos e dados de configuração sensíveis?

### Módulo 3: Implantação e Provisionamento (Semana 4)

#### Objetivos de Aprendizagem
- Dominar fluxos de trabalho e melhores práticas de implantação
- Compreender Infraestrutura como Código com templates Bicep
- Implementar arquiteturas complexas de múltiplos serviços
- Otimizar o desempenho e a confiabilidade da implantação

#### Conceitos-Chave para Dominar
- Estrutura e módulos de templates Bicep
- Dependências de recursos e ordenação
- Estratégias de implantação (blue-green, atualizações contínuas)
- Implantações em múltiplas regiões
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

**Exercício 3.2: Aplicação de Múltiplos Serviços**
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
# Implementar padrões de implantação de banco de dados:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Perguntas de Autoavaliação
1. Quais são as vantagens de usar Bicep em vez de templates ARM?
2. Como você lida com migrações de banco de dados em implantações azd?
3. Quais estratégias existem para implantações sem tempo de inatividade?
4. Como você gerencia dependências entre serviços?
5. Quais são as considerações para implantações em várias regiões?

### Módulo 4: Validação Pré-Implantação (Semana 5)

#### Objetivos de Aprendizagem
- Implementar verificações pré-implantação abrangentes
- Dominar o planejamento de capacidade e validação de recursos
- Compreender a seleção de SKU e otimização de custos
- Construir pipelines de validação automatizados

#### Conceitos-Chave para Dominar
- Quotas e limites de recursos do Azure
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

**Exercício 4.2: Validação Pré-Implantação**
```powershell
# Construir pipeline de validação abrangente:
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
2. Como validar a disponibilidade de recursos do Azure antes da implantação?
3. Quais são os componentes principais de um sistema de verificação pré-implantação?
4. Como estimar e controlar os custos de implantação?
5. Qual monitoramento é essencial para o planejamento de capacidade?

### Módulo 5: Solução de Problemas e Depuração (Semana 6)

#### Objetivos de Aprendizagem
- Dominar metodologias sistemáticas de solução de problemas
- Desenvolver expertise na depuração de problemas complexos de implantação
- Implementar monitoramento e alertas abrangentes
- Construir procedimentos de resposta e recuperação de incidentes

#### Conceitos-Chave para Dominar
- Padrões comuns de falha de implantação
- Técnicas de análise e correlação de logs
- Monitoramento de desempenho e otimização
- Detecção e resposta a incidentes de segurança
- Recuperação de desastres e continuidade de negócios

#### Exercícios Práticos

**Exercício 5.1: Cenários de Solução de Problemas**
```bash
# Pratique resolver problemas comuns:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercício 5.2: Implementação de Monitoramento**
```bash
# Configurar monitoramento abrangente:
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
1. Qual é a abordagem sistemática para solucionar problemas de implantações azd?
2. Como correlacionar logs entre vários serviços e recursos?
3. Quais métricas de monitoramento são mais críticas para a detecção precoce de problemas?
4. Como implementar procedimentos eficazes de recuperação de desastres?
5. Quais são os componentes principais de um plano de resposta a incidentes?

### Módulo 6: Tópicos Avançados e Melhores Práticas (Semana 7-8)

#### Objetivos de Aprendizagem
- Implementar padrões de implantação de nível empresarial
- Dominar integração e automação de CI/CD
- Desenvolver templates personalizados e contribuir para a comunidade
- Compreender requisitos avançados de segurança e conformidade

#### Conceitos-Chave para Dominar
- Padrões de integração de pipelines CI/CD
- Desenvolvimento e distribuição de templates personalizados
- Governança e conformidade empresarial
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

**Exercício 6.2: Desenvolvimento de Templates Personalizados**
```bash
# Criar e publicar modelos personalizados:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercício 6.3: Implementação Empresarial**
```bash
# Implementar recursos de nível empresarial:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Perguntas de Autoavaliação
1. Como integrar azd em fluxos de trabalho CI/CD existentes?
2. Quais são as principais considerações para o desenvolvimento de templates personalizados?
3. Como implementar governança e conformidade em implantações azd?
4. Quais são as melhores práticas para implantações em escala empresarial?
5. Como contribuir de forma eficaz para a comunidade azd?

## Projetos Práticos

### Projeto 1: Site de Portfólio Pessoal
**Complexidade**: Iniciante  
**Duração**: 1-2 semanas

Construa e implante um site de portfólio pessoal usando:
- Hospedagem de site estático no Azure Storage
- Configuração de domínio personalizado
- Integração de CDN para desempenho global
- Pipeline de implantação automatizado

**Entregáveis**:
- Site funcional implantado no Azure
- Template azd personalizado para implantações de portfólio
- Documentação do processo de implantação
- Recomendações de análise e otimização de custos

### Projeto 2: Aplicativo de Gerenciamento de Tarefas
**Complexidade**: Intermediário  
**Duração**: 2-3 semanas

Crie um aplicativo de gerenciamento de tarefas full-stack com:
- Frontend React implantado no App Service
- Backend API Node.js com autenticação
- Banco de dados PostgreSQL com migrações
- Monitoramento com Application Insights

**Entregáveis**:
- Aplicativo completo com autenticação de usuários
- Esquema de banco de dados e scripts de migração
- Dashboards de monitoramento e regras de alerta
- Configuração de implantação para múltiplos ambientes

### Projeto 3: Plataforma de E-commerce com Microsserviços
**Complexidade**: Avançado  
**Duração**: 4-6 semanas

Projete e implemente uma plataforma de e-commerce baseada em microsserviços:
- Vários serviços de API (catálogo, pedidos, pagamentos, usuários)
- Integração de fila de mensagens com Service Bus
- Cache Redis para otimização de desempenho
- Log abrangente e monitoramento

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
- Perguntas de múltipla escolha sobre conceitos principais
- Tarefas práticas de instalação e configuração
- Exercício simples de implantação

**Avaliação do Módulo 2**: Configuração e ambientes
- Cenários de gerenciamento de ambientes
- Exercícios de solução de problemas de configuração
- Implementação de configuração de segurança

**Avaliação do Módulo 3**: Implantação e provisionamento
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

### Projeto Final de Conclusão

Projete e implemente uma solução completa que demonstre domínio de todos os conceitos:

**Requisitos**:
- Arquitetura de aplicação multi-camadas
- Múltiplos ambientes de implantação
- Monitoramento e alertas abrangentes
- Implementação de segurança e conformidade
- Otimização de custos e ajuste de desempenho
- Documentação completa e runbooks

**Critérios de Avaliação**:
- Qualidade da implementação técnica
- Completude da documentação
- Adesão às melhores práticas de segurança
- Otimização de desempenho e custos
- Efetividade na solução de problemas e monitoramento

## Recursos de Estudo e Referências

### Documentação Oficial
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Documentação do Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Recursos da Comunidade
- [Galeria de Templates AZD](https://azure.github.io/awesome-azd/)
- [Organização GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Repositório GitHub do Azure Developer CLI](https://github.com/Azure/azure-dev)

### Ambientes de Prática
- [Conta Gratuita do Azure](https://azure.microsoft.com/free/)
- [Plano Gratuito do Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Ferramentas Adicionais
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Pacote de Extensão Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Recomendações de Cronograma de Estudo

### Estudo em Tempo Integral (8 semanas)
- **Semanas 1-2**: Módulos 1-2 (Introdução, Configuração)
- **Semanas 3-4**: Módulos 3-4 (Implantação, Pré-implantação)
- **Semanas 5-6**: Módulos 5-6 (Solução de Problemas, Tópicos Avançados)
- **Semanas 7-8**: Projetos Práticos e Avaliação Final

### Estudo em Meio Período (16 semanas)
- **Semanas 1-4**: Módulo 1 (Introdução)
- **Semanas 5-7**: Módulo 2 (Configuração e Ambientes)
- **Semanas 8-10**: Módulo 3 (Implantação e Provisionamento)
- **Semanas 11-12**: Módulo 4 (Validação Pré-implantação)
- **Semanas 13-14**: Módulo 5 (Solução de Problemas e Depuração)
- **Semanas 15-16**: Módulo 6 (Tópicos Avançados e Avaliação)

---

## Rastreamento de Progresso e Estrutura de Avaliação

### Lista de Verificação de Conclusão de Capítulos

Acompanhe seu progresso em cada capítulo com estes resultados mensuráveis:

#### 📚 Capítulo 1: Fundamentos e Introdução Rápida
- [ ] **Instalação Concluída**: AZD instalado e verificado na sua plataforma
- [ ] **Primeira Implantação**: Template todo-nodejs-mongo implantado com sucesso
- [ ] **Configuração de Ambiente**: Variáveis de ambiente configuradas pela primeira vez
- [ ] **Navegação de Recursos**: Recursos implantados explorados no Portal do Azure
- [ ] **Domínio de Comandos**: Confortável com comandos básicos do AZD

#### 🤖 Capítulo 2: Desenvolvimento com Foco em IA  
- [ ] **Implantação de Template de IA**: Template azure-search-openai-demo implantado com sucesso
- [ ] **Implementação de RAG**: Indexação e recuperação de documentos configuradas
- [ ] **Configuração de Modelos**: Vários modelos de IA configurados com diferentes propósitos
- [ ] **Monitoramento de IA**: Application Insights implementado para cargas de trabalho de IA
- [ ] **Otimização de Desempenho**: Desempenho de aplicação de IA ajustado

#### ⚙️ Capítulo 3: Configuração e Autenticação
- [ ] **Configuração Multi-Ambiente**: Ambientes dev, staging e prod configurados
- [ ] **Implementação de Segurança**: Autenticação de identidade gerenciada configurada
- [ ] **Gerenciamento de Segredos**: Azure Key Vault integrado para dados sensíveis
- [ ] **Gerenciamento de Parâmetros**: Configurações específicas de ambiente criadas
- [ ] **Domínio de Autenticação**: Padrões de acesso seguro implementados

#### 🏗️ Capítulo 4: Infraestrutura como Código e Implantação
- [ ] **Criação de Template Personalizado**: Template de aplicação multi-serviço criado
- [ ] **Domínio de Bicep**: Componentes de infraestrutura modulares e reutilizáveis criados
- [ ] **Automação de Implantação**: Hooks de pré/pós-implantação implementados
- [ ] **Design de Arquitetura**: Arquitetura complexa de microsserviços implantada
- [ ] **Otimização de Template**: Templates otimizados para desempenho e custo

#### 🎯 Capítulo 5: Soluções de IA Multi-Agente
- [ ] **Implantação de Solução de Varejo**: Cenário completo de varejo multi-agente implantado
- [ ] **Customização de Agentes**: Comportamentos dos agentes de Cliente e Inventário modificados
- [ ] **Escalabilidade de Arquitetura**: Balanceamento de carga e autoescalonamento implementados
- [ ] **Monitoramento de Produção**: Monitoramento e alertas abrangentes configurados
- [ ] **Ajuste de Desempenho**: Sistema multi-agente otimizado para desempenho

#### 🔍 Capítulo 6: Validação Pré-Implantação e Planejamento
- [ ] **Análise de Capacidade**: Requisitos de recursos para aplicações analisados
- [ ] **Otimização de SKU**: Níveis de serviço custo-efetivos selecionados
- [ ] **Automação de Validação**: Scripts de verificação pré-implantação implementados
- [ ] **Planejamento de Custos**: Estimativas de custos de implantação e orçamentos criados
- [ ] **Avaliação de Riscos**: Riscos de implantação identificados e mitigados

#### 🚨 Capítulo 7: Solução de Problemas e Depuração
- [ ] **Habilidades de Diagnóstico**: Implantações propositalmente quebradas depuradas com sucesso
- [ ] **Análise de Logs**: Azure Monitor e Application Insights utilizados de forma eficaz
- [ ] **Ajuste de Desempenho**: Aplicações com desempenho lento otimizadas
- [ ] **Procedimentos de Recuperação**: Backup e recuperação de desastres implementados
- [ ] **Configuração de Monitoramento**: Monitoramento proativo e alertas criados

#### 🏢 Capítulo 8: Padrões de Produção e Empresariais
- [ ] **Segurança Empresarial**: Padrões de segurança abrangentes implementados
- [ ] **Estrutura de Governança**: Azure Policy e gerenciamento de recursos configurados
- [ ] **Monitoramento Avançado**: Dashboards e alertas automatizados criados
- [ ] **Integração CI/CD**: Pipelines de implantação automatizados construídos
- [ ] **Implementação de Conformidade**: Requisitos de conformidade empresarial atendidos

### Cronograma de Aprendizado e Marcos

#### Semana 1-2: Construção de Fundamentos
- **Marco**: Implantar primeira aplicação de IA usando AZD
- **Validação**: Aplicação funcional acessível via URL público
- **Habilidades**: Fluxos de trabalho básicos do AZD e integração de serviços de IA

#### Semana 3-4: Domínio de Configuração
- **Marco**: Implantação multi-ambiente com autenticação segura
- **Validação**: Mesma aplicação implantada em dev/staging/prod
- **Habilidades**: Gerenciamento de ambientes e implementação de segurança

#### Semana 5-6: Expertise em Infraestrutura
- **Marco**: Template personalizado para aplicação multi-serviço complexa
- **Validação**: Template reutilizável implantado por outro membro da equipe
- **Habilidades**: Domínio de Bicep e automação de infraestrutura

#### Semana 7-8: Implementação Avançada de IA
- **Marco**: Solução de IA multi-agente pronta para produção
- **Validação**: Sistema lidando com carga real com monitoramento
- **Habilidades**: Orquestração multi-agente e otimização de desempenho

#### Semana 9-10: Prontidão para Produção
- **Marco**: Implantação de nível empresarial com conformidade completa
- **Validação**: Passa revisão de segurança e auditoria de otimização de custos
- **Habilidades**: Governança, monitoramento e integração CI/CD

### Avaliação e Certificação

#### Métodos de Validação de Conhecimento
1. **Implantações Práticas**: Aplicações funcionais para cada capítulo
2. **Revisões de Código**: Avaliação da qualidade de templates e configurações
3. **Resolução de Problemas**: Cenários de solução de problemas e soluções
4. **Ensino entre Pares**: Explicar conceitos para outros aprendizes
5. **Contribuição da Comunidade**: Compartilhe templates ou melhorias

#### Resultados de Desenvolvimento Profissional
- **Projetos no Portfólio**: 8 implantações prontas para produção
- **Habilidades Técnicas**: Expertise em AZD e implantação de IA com padrões da indústria
- **Capacidades de Resolução de Problemas**: Solução de problemas e otimização de forma independente
- **Reconhecimento na Comunidade**: Participação ativa na comunidade de desenvolvedores Azure
- **Avanço na Carreira**: Habilidades diretamente aplicáveis a funções em nuvem e IA

#### Métricas de Sucesso
- **Taxa de Sucesso nas Implantações**: >95% de implantações bem-sucedidas
- **Tempo de Solução de Problemas**: <30 minutos para problemas comuns
- **Otimização de Desempenho**: Melhorias demonstráveis em custo e desempenho
- **Conformidade de Segurança**: Todas as implantações atendem aos padrões de segurança empresarial
- **Transferência de Conhecimento**: Capacidade de orientar outros desenvolvedores

### Aprendizado Contínuo e Engajamento com a Comunidade

#### Mantenha-se Atualizado
- **Atualizações do Azure**: Acompanhe as notas de lançamento do Azure Developer CLI
- **Eventos da Comunidade**: Participe de eventos de desenvolvedores Azure e IA
- **Documentação**: Contribua com documentação e exemplos da comunidade
- **Ciclo de Feedback**: Forneça feedback sobre o conteúdo do curso e os serviços do Azure

#### Desenvolvimento de Carreira
- **Rede Profissional**: Conecte-se com especialistas em Azure e IA
- **Oportunidades de Palestras**: Apresente aprendizados em conferências ou encontros
- **Contribuição Open Source**: Contribua com templates e ferramentas AZD
- **Mentoria**: Oriente outros desenvolvedores em sua jornada de aprendizado com AZD

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Comece a Aprender**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Acompanhamento de Progresso**: Acompanhe seu avanço através do sistema de aprendizado abrangente de 8 capítulos
- **🤝 Comunidade**: [Azure Discord](https://discord.gg/microsoft-azure) para suporte e discussão

**Acompanhamento do Progresso de Estudo**: Use este guia estruturado para dominar o Azure Developer CLI por meio de aprendizado progressivo e prático, com resultados mensuráveis e benefícios para o desenvolvimento profissional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->