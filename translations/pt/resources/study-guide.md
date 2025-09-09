<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:41:40+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "pt"
}
-->
# Guia de Estudo - AZD para Iniciantes

## Introdução

Este guia de estudo abrangente oferece objetivos de aprendizagem estruturados, conceitos-chave, exercícios práticos e materiais de avaliação para ajudá-lo a dominar o Azure Developer CLI (azd). Utilize este guia para acompanhar o seu progresso e garantir que cobriu todos os tópicos essenciais.

## Objetivos de Aprendizagem

Ao concluir este guia de estudo, você será capaz de:
- Dominar todos os conceitos fundamentais e avançados do Azure Developer CLI
- Desenvolver habilidades práticas para implementar e gerir aplicações no Azure
- Ganhar confiança na resolução de problemas e otimização de implementações
- Compreender práticas de implementação prontas para produção e considerações de segurança

## Resultados de Aprendizagem

Após concluir todas as seções deste guia de estudo, você será capaz de:
- Projetar, implementar e gerir arquiteturas completas de aplicações utilizando azd
- Implementar estratégias abrangentes de monitorização, segurança e otimização de custos
- Resolver problemas complexos de implementação de forma independente
- Criar templates personalizados e contribuir para a comunidade azd

## Estrutura do Curso

### Módulo 1: Primeiros Passos (Semanas 1-2)

#### Objetivos de Aprendizagem
- Compreender os fundamentos e conceitos principais do Azure Developer CLI
- Instalar e configurar com sucesso o azd no seu ambiente de desenvolvimento
- Realizar a sua primeira implementação utilizando um template existente
- Navegar na estrutura de projetos azd e compreender os componentes principais

#### Conceitos-Chave a Dominar
- Templates, ambientes e serviços
- Estrutura de configuração azure.yaml
- Comandos básicos do azd (init, up, down, deploy)
- Princípios de Infraestrutura como Código
- Autenticação e autorização no Azure

#### Exercícios Práticos

**Exercício 1.1: Instalação e Configuração**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercício 1.2: Primeira Implementação**  
```bash
# Deploy a simple web application:
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
2. Qual é o propósito do ficheiro azure.yaml?
3. Como os ambientes ajudam a gerir diferentes alvos de implementação?
4. Quais métodos de autenticação podem ser utilizados com azd?
5. O que acontece quando executa `azd up` pela primeira vez?

### Módulo 2: Configuração e Ambientes (Semana 3)

#### Objetivos de Aprendizagem
- Dominar a gestão e configuração de ambientes
- Compreender configurações avançadas do azure.yaml
- Implementar definições e variáveis específicas para cada ambiente
- Configurar autenticação para diferentes cenários

#### Conceitos-Chave a Dominar
- Hierarquia de ambientes e precedência de variáveis
- Configuração de serviços e parâmetros
- Hooks e eventos de ciclo de vida
- Métodos de autenticação (utilizador, service principal, identidade gerida)
- Gestão de ficheiros de configuração

#### Exercícios Práticos

**Exercício 2.1: Configuração Multi-Ambiente**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Perguntas de Autoavaliação
1. Como o azd lida com a precedência de variáveis de ambiente?
2. O que são deployment hooks e quando devem ser utilizados?
3. Como configurar diferentes SKUs para diferentes ambientes?
4. Quais são as implicações de segurança dos diferentes métodos de autenticação?
5. Como gerir segredos e dados de configuração sensíveis?

### Módulo 3: Implementação e Provisionamento (Semana 4)

#### Objetivos de Aprendizagem
- Dominar fluxos de trabalho de implementação e melhores práticas
- Compreender Infraestrutura como Código com templates Bicep
- Implementar arquiteturas complexas de múltiplos serviços
- Otimizar o desempenho e a fiabilidade das implementações

#### Conceitos-Chave a Dominar
- Estrutura e módulos de templates Bicep
- Dependências de recursos e ordenação
- Estratégias de implementação (blue-green, atualizações contínuas)
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercício 3.3: Integração de Base de Dados**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Perguntas de Autoavaliação
1. Quais são as vantagens de utilizar Bicep em vez de templates ARM?
2. Como lidar com migrações de base de dados em implementações azd?
3. Quais estratégias existem para implementações sem tempo de inatividade?
4. Como gerir dependências entre serviços?
5. Quais são as considerações para implementações multi-região?

### Módulo 4: Validação Pré-Implementação (Semana 5)

#### Objetivos de Aprendizagem
- Implementar verificações abrangentes antes da implementação
- Dominar o planeamento de capacidade e validação de recursos
- Compreender seleção de SKUs e otimização de custos
- Construir pipelines de validação automatizados

#### Conceitos-Chave a Dominar
- Quotas e limites de recursos do Azure
- Critérios de seleção de SKUs e implicações de custos
- Scripts e ferramentas de validação automatizada
- Metodologias de planeamento de capacidade
- Testes de desempenho e otimização

#### Exercícios Práticos

**Exercício 4.1: Planeamento de Capacidade**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercício 4.2: Validação Pré-Implementação**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercício 4.3: Otimização de SKUs**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Perguntas de Autoavaliação
1. Quais fatores devem influenciar decisões de seleção de SKUs?
2. Como validar a disponibilidade de recursos do Azure antes da implementação?
3. Quais são os componentes principais de um sistema de verificação pré-implementação?
4. Como estimar e controlar os custos de implementação?
5. Quais monitorizações são essenciais para o planeamento de capacidade?

### Módulo 5: Resolução de Problemas e Depuração (Semana 6)

#### Objetivos de Aprendizagem
- Dominar metodologias sistemáticas de resolução de problemas
- Desenvolver expertise em depuração de problemas complexos de implementação
- Implementar monitorização e alertas abrangentes
- Construir procedimentos de resposta a incidentes e recuperação

#### Conceitos-Chave a Dominar
- Padrões comuns de falhas de implementação
- Técnicas de análise e correlação de logs
- Monitorização de desempenho e otimização
- Detecção e resposta a incidentes de segurança
- Recuperação de desastres e continuidade de negócios

#### Exercícios Práticos

**Exercício 5.1: Cenários de Resolução de Problemas**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercício 5.2: Implementação de Monitorização**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercício 5.3: Resposta a Incidentes**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Perguntas de Autoavaliação
1. Qual é a abordagem sistemática para resolver problemas de implementações azd?
2. Como correlacionar logs entre múltiplos serviços e recursos?
3. Quais métricas de monitorização são mais críticas para deteção precoce de problemas?
4. Como implementar procedimentos eficazes de recuperação de desastres?
5. Quais são os componentes principais de um plano de resposta a incidentes?

### Módulo 6: Tópicos Avançados e Melhores Práticas (Semanas 7-8)

#### Objetivos de Aprendizagem
- Implementar padrões de implementação de nível empresarial
- Dominar integração e automação de CI/CD
- Desenvolver templates personalizados e contribuir para a comunidade
- Compreender requisitos avançados de segurança e conformidade

#### Conceitos-Chave a Dominar
- Padrões de integração de pipelines CI/CD
- Desenvolvimento e distribuição de templates personalizados
- Governança e conformidade empresarial
- Configurações avançadas de rede e segurança
- Otimização de desempenho e gestão de custos

#### Exercícios Práticos

**Exercício 6.1: Integração de CI/CD**  
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercício 6.3: Implementação Empresarial**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Perguntas de Autoavaliação
1. Como integrar o azd em fluxos de trabalho CI/CD existentes?
2. Quais são as considerações principais para o desenvolvimento de templates personalizados?
3. Como implementar governança e conformidade em implementações azd?
4. Quais são as melhores práticas para implementações em escala empresarial?
5. Como contribuir de forma eficaz para a comunidade azd?

## Projetos Práticos

### Projeto 1: Website de Portfólio Pessoal  
**Complexidade**: Iniciante  
**Duração**: 1-2 semanas  

Construa e implemente um website de portfólio pessoal utilizando:
- Hospedagem de website estático no Azure Storage
- Configuração de domínio personalizado
- Integração de CDN para desempenho global
- Pipeline de implementação automatizado  

**Entregáveis**:
- Website funcional implementado no Azure
- Template azd personalizado para implementações de portfólio
- Documentação do processo de implementação
- Recomendações de análise e otimização de custos  

### Projeto 2: Aplicação de Gestão de Tarefas  
**Complexidade**: Intermédio  
**Duração**: 2-3 semanas  

Crie uma aplicação full-stack de gestão de tarefas com:
- Frontend React implementado no App Service
- Backend API Node.js com autenticação
- Base de dados PostgreSQL com migrações
- Monitorização com Application Insights  

**Entregáveis**:
- Aplicação completa com autenticação de utilizadores
- Scripts de migração e esquema de base de dados
- Dashboards de monitorização e regras de alerta
- Configuração de implementação multi-ambiente  

### Projeto 3: Plataforma de E-commerce com Microserviços  
**Complexidade**: Avançado  
**Duração**: 4-6 semanas  

Desenhe e implemente uma plataforma de e-commerce baseada em microserviços:
- Múltiplos serviços API (catálogo, pedidos, pagamentos, utilizadores)
- Integração de fila de mensagens com Service Bus
- Cache Redis para otimização de desempenho
- Monitorização e logging abrangentes  

**Entregáveis**:
- Arquitetura completa de microserviços
- Padrões de comunicação entre serviços
- Testes de desempenho e otimização
- Implementação de segurança pronta para produção  

## Avaliação e Certificação

### Verificações de Conhecimento

Complete estas avaliações após cada módulo:

**Avaliação do Módulo 1**: Conceitos básicos e instalação  
- Perguntas de escolha múltipla sobre conceitos principais  
- Tarefas práticas de instalação e configuração  
- Exercício simples de implementação  

**Avaliação do Módulo 2**: Configuração e ambientes  
- Cenários de gestão de ambientes  
- Exercícios de resolução de problemas de configuração  
- Implementação de configuração de segurança  

**Avaliação do Módulo 3**: Implementação e provisionamento  
- Desafios de design de infraestrutura  
- Cenários de implementação multi-serviço  
- Exercícios de otimização de desempenho  

**Avaliação do Módulo 4**: Validação pré-implementação  
- Estudos de caso de planeamento de capacidade  
- Cenários de otimização de custos  
- Implementação de pipeline de validação  

**Avaliação do Módulo 5**: Resolução de problemas e depuração  
- Exercícios de diagnóstico de problemas  
- Tarefas de implementação de monitorização  
- Simulações de resposta a incidentes  

**Avaliação do Módulo 6**: Tópicos avançados  
- Design de pipeline CI/CD  
- Desenvolvimento de templates personalizados  
- Cenários de arquitetura empresarial  

### Projeto Final de Conclusão

Desenhe e implemente uma solução completa que demonstre domínio de todos os conceitos:

**Requisitos**:
- Arquitetura de aplicação multi-camada  
- Múltiplos ambientes de implementação  
- Monitorização e alertas abrangentes  
- Implementação de segurança e conformidade  
- Otimização de custos e desempenho  
- Documentação completa e runbooks  

**Critérios de Avaliação**:
- Qualidade técnica da implementação  
- Completude da documentação  
- Adesão às melhores práticas de segurança  
- Otimização de desempenho e custos  
- Efetividade na resolução de problemas e monitorização  

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
- [Pacote de Extensões Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Recomendações de Cronograma de Estudo

### Estudo em Tempo Integral (8 semanas)
- **Semanas 1-2**: Módulos 1-2 (Primeiros Passos, Configuração)  
- **Semanas 3-4**: Módulos 3-4 (Implementação, Validação Pré-Implementação)  
- **Semanas 5-6**: Módulos 5-6 (Resolução de Problemas, Tópicos Avançados)  
- **Semanas 7-8**: Projetos Práticos e Avaliação Final  

### Estudo em Meio Período (16 semanas)
- **Semanas 1-4**: Módulo 1 (Primeiros Passos)  
- **Semanas 5-7**: Módulo 2 (Configuração e Ambientes)  
- **Semanas 8-10**: Módulo 3 (Implementação e Provisionamento)  
- **Semanas 11-12**: Módulo 4 (Validação Pré-Implementação)  
- **Semanas 13-14**: Módulo 5 (Resolução de Problemas e Depuração)  
- **Semanas 15-16**: Módulo 6 (Tópicos Avançados e Avaliação)  

### Estudo Autodirigido
- Complete cada módulo ao seu próprio ritmo  
- Dedique tempo adicional a conceitos desafiadores  
- Repita os exercícios até alcançar domínio  
- Participe em discussões da comunidade e faça perguntas  

## Dicas para o Sucesso

### Estratégias de Aprendizagem Eficazes
1. **Pratique Regularmente**: Implemente aplicações frequentemente para criar memória muscular  
2. **Experimente Sem Medo**: Utilize ambientes de desenvolvimento para testar novas configurações  
3. **Documente o Seu Aprendizado**: Mantenha notas sobre soluções para problemas encontrados  
4. **Participe na Comunidade**: Participe em discussões e contribua para projetos  
5. **Mantenha-se Atualizado**: Acompanhe atualizações do Azure e novas funcionalidades do azd  

### Erros Comuns a Evitar
1. **Ignorar Pré-requisitos**: Certifique-se de que possui conhecimento básico adequado  
2. **Apressar-se nos Conceitos**: Dedique tempo para compreender os fundamentos completamente  
3. **Negligenciar Segurança**: Sempre implemente melhores práticas de segurança desde o início  
4. **Não Testar Adequadamente**: Teste implementações em múltiplos ambientes  
5. **Evitar Documentação**: Boa documentação é essencial para manutenção  

### Construindo Experiência Prática
1. **Comece Pequeno**: Inicie com aplicações simples e aumente gradualmente a complexidade  
2. **Aprenda com Falhas**: Utilize exercícios de resolução de problemas como oportunidades de aprendizado  
3. **Contribuir para Open Source**: Partilhe os seus modelos e soluções com a comunidade  
4. **Ensinar Outros**: Explicar conceitos a outras pessoas reforça a sua própria compreensão  
5. **Manter a Curiosidade**: Explore continuamente novos serviços Azure e padrões de integração  

---

**Navegação**  
- **Lição Anterior**: [FAQ](faq.md)  
- **Próxima Lição**: [Changelog](../changelog.md)  

**Rastreio do Progresso de Estudo**: Utilize este guia para acompanhar a sua jornada de aprendizagem e garantir uma cobertura abrangente de todos os conceitos e práticas do Azure Developer CLI.  

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.