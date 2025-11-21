<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-20T21:16:15+00:00",
  "source_file": "changelog.md",
  "language_code": "br"
}
-->
# Registro de Alterações - AZD Para Iniciantes

## Introdução

Este registro de alterações documenta todas as mudanças, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este log para ajudar os usuários a entenderem o que mudou entre as versões.

## Objetivos de Aprendizado

Ao revisar este registro de alterações, você irá:
- Ficar informado sobre novos recursos e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de bugs e ajustes para garantir precisão
- Seguir a evolução dos materiais de aprendizado ao longo do tempo

## Resultados de Aprendizado

Após revisar as entradas do registro de alterações, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou melhoradas
- Planejar seu caminho de aprendizado com base nos materiais mais atuais
- Contribuir com feedback e sugestões para futuras melhorias

## Histórico de Versões

### [v3.8.0] - 2025-11-19

#### Documentação Avançada: Monitoramento, Segurança e Padrões de Coordenação Multi-Agente
**Esta versão adiciona lições abrangentes de nível avançado sobre integração com Application Insights, padrões de autenticação e coordenação multi-agente para implantações em produção.**

#### Adicionado
- **📊 Lição de Integração com Application Insights**: em `docs/pre-deployment/application-insights.md`:
  - Implantação focada no AZD com provisionamento automático
  - Modelos completos em Bicep para Application Insights + Log Analytics
  - Aplicações Python funcionais com telemetria personalizada (mais de 1.200 linhas)
  - Padrões de monitoramento de IA/LLM (rastreamento de tokens/custos do Azure OpenAI)
  - 6 diagramas Mermaid (arquitetura, rastreamento distribuído, fluxo de telemetria)
  - 3 exercícios práticos (alertas, dashboards, monitoramento de IA)
  - Exemplos de consultas Kusto e estratégias de otimização de custos
  - Transmissão de métricas ao vivo e depuração em tempo real
  - Tempo de aprendizado de 40-50 minutos com padrões prontos para produção

- **🔐 Lição de Padrões de Autenticação e Segurança**: em `docs/getting-started/authsecurity.md`:
  - 3 padrões de autenticação (strings de conexão, Key Vault, identidade gerenciada)
  - Modelos completos de infraestrutura em Bicep para implantações seguras
  - Código de aplicação Node.js com integração ao Azure SDK
  - 3 exercícios completos (habilitar identidade gerenciada, identidade atribuída pelo usuário, rotação de Key Vault)
  - Melhores práticas de segurança e configurações de RBAC
  - Guia de solução de problemas e análise de custos
  - Padrões de autenticação sem senha prontos para produção

- **🤖 Lição de Padrões de Coordenação Multi-Agente**: em `docs/pre-deployment/coordination-patterns.md`:
  - 5 padrões de coordenação (sequencial, paralelo, hierárquico, orientado a eventos, consenso)
  - Implementação completa de serviço orquestrador (Python/Flask, mais de 1.500 linhas)
  - 3 implementações especializadas de agentes (Pesquisa, Escritor, Editor)
  - Integração com Service Bus para enfileiramento de mensagens
  - Gerenciamento de estado com Cosmos DB para sistemas distribuídos
  - 6 diagramas Mermaid mostrando interações entre agentes
  - 3 exercícios avançados (manipulação de timeout, lógica de repetição, disjuntor)
  - Análise de custos ($240-565/mês) com estratégias de otimização
  - Integração com Application Insights para monitoramento

#### Aprimorado
- **Capítulo de Pré-implantação**: Agora inclui padrões abrangentes de monitoramento e coordenação
- **Capítulo de Introdução**: Aprimorado com padrões profissionais de autenticação
- **Prontidão para Produção**: Cobertura completa de segurança a observabilidade
- **Estrutura do Curso**: Atualizada para referenciar novas lições nos Capítulos 3 e 6

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de segurança e monitoramento ao longo do curso
- **Qualidade da Documentação**: Padrões consistentes de nível A (95-97%) nas novas lições
- **Padrões de Produção**: Cobertura completa de ponta a ponta para implantações empresariais

#### Melhorado
- **Experiência do Desenvolvedor**: Caminho claro do desenvolvimento ao monitoramento em produção
- **Padrões de Segurança**: Padrões profissionais para autenticação e gerenciamento de segredos
- **Observabilidade**: Integração completa com Application Insights no AZD
- **Cargas de Trabalho de IA**: Monitoramento especializado para Azure OpenAI e sistemas multi-agente

#### Validado
- ✅ Todas as lições incluem código funcional completo (não apenas trechos)
- ✅ Diagramas Mermaid para aprendizado visual (19 no total em 3 lições)
- ✅ Exercícios práticos com etapas de verificação (9 no total)
- ✅ Modelos Bicep prontos para produção implantáveis via `azd up`
- ✅ Análise de custos e estratégias de otimização
- ✅ Guias de solução de problemas e melhores práticas
- ✅ Pontos de verificação de conhecimento com comandos de verificação

#### Resultados da Avaliação da Documentação
- **docs/pre-deployment/application-insights.md**: - Guia abrangente de monitoramento
- **docs/getting-started/authsecurity.md**: - Padrões profissionais de segurança
- **docs/pre-deployment/coordination-patterns.md**: - Arquiteturas avançadas de multi-agentes
- **Novo Conteúdo Geral**: - Padrões de alta qualidade consistentes

#### Implementação Técnica
- **Application Insights**: Log Analytics + telemetria personalizada + rastreamento distribuído
- **Autenticação**: Identidade Gerenciada + Key Vault + padrões de RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestração
- **Monitoramento**: Métricas ao vivo + consultas Kusto + alertas + dashboards
- **Gestão de Custos**: Estratégias de amostragem, políticas de retenção, controles de orçamento

### [v3.7.0] - 2025-11-19

#### Melhorias na Qualidade da Documentação e Novo Exemplo do Azure OpenAI
**Esta versão aprimora a qualidade da documentação em todo o repositório e adiciona um exemplo completo de implantação do Azure OpenAI com interface de chat GPT-4.**

#### Adicionado
- **🤖 Exemplo de Chat do Azure OpenAI**: Implantação completa do GPT-4 com implementação funcional em `examples/azure-openai-chat/`:
  - Infraestrutura completa do Azure OpenAI (implantação do modelo GPT-4)
  - Interface de chat em linha de comando Python com histórico de conversas
  - Integração com Key Vault para armazenamento seguro de chaves de API
  - Rastreamento de uso de tokens e estimativa de custos
  - Limitação de taxa e manipulação de erros
  - README abrangente com guia de implantação de 35-45 minutos
  - 11 arquivos prontos para produção (modelos Bicep, app Python, configuração)
- **📚 Exercícios de Documentação**: Adicionados exercícios práticos ao guia de configuração:
  - Exercício 1: Configuração de múltiplos ambientes (15 minutos)
  - Exercício 2: Prática de gerenciamento de segredos (10 minutos)
  - Critérios claros de sucesso e etapas de verificação
- **✅ Verificação de Implantação**: Adicionada seção de verificação ao guia de implantação:
  - Procedimentos de verificação de integridade
  - Lista de critérios de sucesso
  - Resultados esperados para todos os comandos de implantação
  - Referência rápida para solução de problemas

#### Aprimorado
- **examples/README.md**: Atualizado para qualidade de nível A (93%):
  - Adicionado azure-openai-chat a todas as seções relevantes
  - Atualizado número de exemplos locais de 3 para 4
  - Adicionado à tabela de Exemplos de Aplicações de IA
  - Integrado ao Início Rápido para Usuários Intermediários
  - Adicionado à seção de Modelos do Microsoft Foundry para Azure AI
  - Atualizado Matriz de Comparação e seções de descoberta de tecnologia
- **Qualidade da Documentação**: Melhorada de B+ (87%) → A- (92%) na pasta docs:
  - Adicionados resultados esperados aos exemplos de comandos críticos
  - Incluídas etapas de verificação para mudanças de configuração
  - Aprendizado prático aprimorado com exercícios práticos

#### Alterado
- **Progressão de Aprendizado**: Melhor integração de exemplos de IA para aprendizes intermediários
- **Estrutura da Documentação**: Mais exercícios acionáveis com resultados claros
- **Processo de Verificação**: Critérios de sucesso explícitos adicionados aos fluxos de trabalho principais

#### Melhorado
- **Experiência do Desenvolvedor**: Implantação do Azure OpenAI agora leva 35-45 minutos (vs 60-90 para alternativas complexas)
- **Transparência de Custos**: Estimativas claras de custos ($50-200/mês) para o exemplo do Azure OpenAI
- **Caminho de Aprendizado**: Desenvolvedores de IA têm ponto de entrada claro com azure-openai-chat
- **Padrões de Documentação**: Resultados esperados e etapas de verificação consistentes

#### Validado
- ✅ Exemplo do Azure OpenAI totalmente funcional com `azd up`
- ✅ Todos os 11 arquivos de implementação sintaticamente corretos
- ✅ Instruções do README correspondem à experiência real de implantação
- ✅ Links da documentação atualizados em mais de 8 locais
- ✅ Índice de exemplos reflete com precisão 4 exemplos locais
- ✅ Nenhum link externo duplicado em tabelas
- ✅ Todas as referências de navegação corretas

#### Implementação Técnica
- **Arquitetura do Azure OpenAI**: GPT-4 + Key Vault + padrão de Container Apps
- **Segurança**: Pronto para Identidade Gerenciada, segredos no Key Vault
- **Monitoramento**: Integração com Application Insights
- **Gestão de Custos**: Rastreamento de tokens e otimização de uso
- **Implantação**: Comando único `azd up` para configuração completa

### [v3.6.0] - 2025-11-19

#### Atualização Principal: Exemplos de Implantação de Aplicativos em Contêiner
**Esta versão introduz exemplos abrangentes e prontos para produção de implantação de aplicativos em contêiner usando o Azure Developer CLI (AZD), com documentação completa e integração no caminho de aprendizado.**

#### Adicionado
- **🚀 Exemplos de Aplicativos em Contêiner**: Novos exemplos locais em `examples/container-app/`:
  - [Guia Mestre](examples/container-app/README.md): Visão geral completa de implantações em contêiner, início rápido, produção e padrões avançados
  - [API Flask Simples](../../examples/container-app/simple-flask-api): API REST amigável para iniciantes com escala para zero, verificações de integridade, monitoramento e solução de problemas
  - [Arquitetura de Microsserviços](../../examples/container-app/microservices): Implantação multi-serviço pronta para produção (API Gateway, Produto, Pedido, Usuário, Notificação), mensagens assíncronas, Service Bus, Cosmos DB, Azure SQL, rastreamento distribuído, implantação blue-green/canary
- **Melhores Práticas**: Segurança, monitoramento, otimização de custos e orientações de CI/CD para cargas de trabalho em contêiner
- **Exemplos de Código**: `azure.yaml` completo, modelos Bicep e implementações de serviços em várias linguagens (Python, Node.js, C#, Go)
- **Testes e Solução de Problemas**: Cenários de teste de ponta a ponta, comandos de monitoramento, orientação para solução de problemas

#### Alterado
- **README.md**: Atualizado para destacar e vincular novos exemplos de aplicativos em contêiner em "Exemplos Locais - Aplicativos em Contêiner"
- **examples/README.md**: Atualizado para destacar exemplos de aplicativos em contêiner, adicionar entradas na matriz de comparação e atualizar referências de tecnologia/arquitetura
- **Estrutura do Curso e Guia de Estudos**: Atualizado para referenciar novos exemplos de aplicativos em contêiner e padrões de implantação nos capítulos relevantes

#### Validado
- ✅ Todos os novos exemplos implantáveis com `azd up` e seguem as melhores práticas
- ✅ Links cruzados e navegação da documentação atualizados
- ✅ Exemplos cobrem cenários de iniciantes a avançados, incluindo microsserviços em produção

#### Notas
- **Escopo**: Documentação e exemplos em inglês apenas
- **Próximos Passos**: Expandir com padrões adicionais avançados de contêiner e automação de CI/CD em versões futuras

### [v3.5.0] - 2025-11-19

#### Rebranding do Produto: Microsoft Foundry
**Esta versão implementa uma mudança completa no nome do produto de "Azure AI Foundry" para "Microsoft Foundry" em toda a documentação em inglês, refletindo o rebranding oficial da Microsoft.**

#### Alterado
- **🔄 Atualização do Nome do Produto**: Rebranding completo de "Azure AI Foundry" para "Microsoft Foundry"
  - Atualizadas todas as referências na documentação em inglês na pasta `docs/`
  - Pasta renomeada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Arquivo renomeado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referências de conteúdo atualizadas em 7 arquivos de documentação

- **📁 Alterações na Estrutura de Pastas**:
  - `docs/ai-foundry/` renomeada para `docs/microsoft-foundry/`
  - Todos os links cruzados atualizados para refletir a nova estrutura de pastas
  - Links de navegação validados em toda a documentação

- **📄 Renomeação de Arquivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos os links internos atualizados para referenciar o novo nome do arquivo

#### Arquivos Atualizados
- **Documentação de Capítulos** (7 arquivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 atualizações de links de navegação
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referências ao nome do produto atualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Já usando Microsoft Foundry (de atualizações anteriores)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referências atualizadas (visão geral, feedback da comunidade, documentação)
  - `docs/getting-started/azd-basics.md` - 4 links de referência cruzada atualizados
  - `docs/getting-started/first-project.md` - 2 links de navegação de capítulos atualizados
  - `docs/getting-started/installation.md` - 2 links para o próximo capítulo atualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referências atualizadas (navegação, comunidade no Discord)
  - `docs/troubleshooting/common-issues.md` - 1 link de navegação atualizado
  - `docs/troubleshooting/debugging.md` - 1 link de navegação atualizado

- **Arquivos de Estrutura do Curso** (2 arquivos):
  - `README.md` - 17 referências atualizadas (visão geral do curso, títulos de capítulos, seção de templates, insights da comunidade)
  - `course-outline.md` - 14 referências atualizadas (visão geral, objetivos de aprendizado, recursos dos capítulos)

#### Validado
- ✅ Zero referências restantes ao caminho da pasta "ai-foundry" na documentação em inglês
- ✅ Zero referências restantes ao nome do produto "Azure AI Foundry" na documentação em inglês
- ✅ Todos os links de navegação funcionais com a nova estrutura de pastas
- ✅ Renomeação de arquivos e pastas concluída com sucesso
- ✅ Referências cruzadas entre capítulos validadas

#### Notas
- **Escopo**: Alterações aplicadas apenas à documentação em inglês na pasta `docs/`
- **Traduções**: Pastas de tradução (`translations/`) não atualizadas nesta versão
- **Workshop**: Materiais do workshop (`workshop/`) não atualizados nesta versão
- **Exemplos**: Arquivos de exemplo podem ainda referenciar nomes antigos (será corrigido em uma atualização futura)
- **Links Externos**: URLs externas e referências ao repositório GitHub permanecem inalterados

#### Guia de Migração para Contribuidores
Se você possui branches locais ou documentação que referenciam a estrutura antiga:
1. Atualize as referências de pastas: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Atualize as referências de arquivos: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Substitua o nome do produto: "Azure AI Foundry" → "Microsoft Foundry"
4. Valide se todos os links internos da documentação ainda funcionam

---

### [v3.4.0] - 2025-10-24

#### Prévia de Infraestrutura e Melhorias na Validação
**Esta versão introduz suporte abrangente para o novo recurso de prévia do Azure Developer CLI e aprimora a experiência dos usuários do workshop.**

#### Adicionado
- **🧪 Documentação do recurso azd provision --preview**: Cobertura completa da nova capacidade de prévia de infraestrutura
  - Referência de comandos e exemplos de uso em um guia rápido
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação prévia para validação mais segura de implantação
  - Atualizações no guia de introdução com práticas de implantação focadas em segurança
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando o status de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara com o usuário
  - Data da última atualização para transparência
  - Design responsivo para dispositivos móveis

#### Aprimorado
- **Segurança da Infraestrutura**: Funcionalidade de prévia integrada em toda a documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de prévia de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir prévia como prática recomendada
- **Experiência do Workshop**: Expectativas claras definidas para os usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com prévia agora é a abordagem recomendada
- **Fluxo da Documentação**: Validação de infraestrutura movida para mais cedo no processo de aprendizado
- **Apresentação do Workshop**: Comunicação profissional de status com cronograma de desenvolvimento claro

#### Melhorado
- **Abordagem Focada em Segurança**: Alterações na infraestrutura agora podem ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados da prévia podem ser compartilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos de recursos antes da provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação por meio de validação antecipada

#### Implementação Técnica
- **Integração Multi-documento**: Recurso de prévia documentado em 4 arquivos principais
- **Padrões de Comando**: Sintaxe consistente e exemplos em toda a documentação
- **Integração de Melhores Práticas**: Prévia incluída em fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara de NOVOS recursos para fácil descoberta

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência de Cronograma**: Data da última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais do Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão introduz materiais abrangentes de workshop com guias interativos baseados em navegador e caminhos de aprendizado estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada em navegador com capacidade de pré-visualização MkDocs
- **📝 Instruções Estruturadas do Workshop**: Caminho de aprendizado guiado em 7 etapas, desde a descoberta até a personalização
  - 0-Introdução: Visão geral e configuração do workshop
  - 1-Selecionar-Template-AI: Processo de descoberta e seleção de templates
  - 2-Validar-Template-AI: Procedimentos de implantação e validação
  - 3-Decompor-Template-AI: Compreensão da arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Desmontar-Infraestrutura: Limpeza e gerenciamento de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração MkDocs com tema Material para uma experiência de aprendizado aprimorada
- **🎯 Caminho de Aprendizado Prático**: Metodologia de 3 etapas (Descoberta → Implantação → Personalização)
- **📱 Integração com GitHub Codespaces**: Configuração de ambiente de desenvolvimento sem complicações

#### Aprimorado
- **Laboratório de Workshop de IA**: Estendido com experiência de aprendizado estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão de Aprendizado**: Orientação clara passo a passo desde a seleção de templates até a implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com busca, funcionalidade de copiar e alternância de tema
- **Aprendizado Autônomo**: Estrutura flexível do workshop que acomoda diferentes velocidades de aprendizado
- **Aplicação Prática**: Cenários reais de implantação de templates de IA
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Recursos do Workshop
- **Busca Integrada**: Descoberta rápida de palavras-chave e lições
- **Blocos de Código Copiáveis**: Funcionalidade de copiar ao passar o mouse em todos os exemplos de código
- **Alternância de Tema**: Suporte a modo escuro/claro para diferentes preferências
- **Recursos Visuais**: Capturas de tela e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Reestruturação de Navegação e Sistema de Aprendizado Baseado em Capítulos
**Esta versão introduz uma estrutura de aprendizado baseada em capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizado Baseado em Capítulos**: Reestruturou todo o curso em 8 capítulos progressivos de aprendizado
  - Capítulo 1: Fundamentos e Início Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento Focado em IA (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração e Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestrutura como Código e Implantação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções de IA Multiagente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação Pré-implantação e Planejamento (⭐⭐ - 1 hora)
  - Capítulo 7: Solução de Problemas e Depuração (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção e Corporativos (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Rastreamento de Progresso**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizado
- **🗺️ Orientação de Caminho de Aprendizado**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação de Referência Cruzada**: Capítulos relacionados e pré-requisitos claramente vinculados

#### Aprimorado
- **Estrutura do README**: Transformado em uma plataforma de aprendizado estruturada com organização baseada em capítulos
- **Navegação na Documentação**: Cada página agora inclui contexto de capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizado apropriados
- **Integração de Recursos**: Guias rápidos, FAQs e guias de estudo conectados a capítulos relevantes
- **Integração de Workshops**: Laboratórios práticos mapeados para múltiplos objetivos de aprendizado de capítulos

#### Alterado
- **Progressão de Aprendizado**: Mudou de documentação linear para aprendizado flexível baseado em capítulos
- **Posicionamento de Configuração**: Reposicionou o guia de configuração como Capítulo 3 para melhor fluxo de aprendizado
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizado
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes corporativos

#### Melhorado
- **Experiência do Usuário**: Breadcrumbs de navegação claros e indicadores de progressão de capítulos
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura de curso estilo universitário adequada para treinamento acadêmico e corporativo
- **Eficiência de Aprendizado**: Tempo reduzido para encontrar conteúdo relevante por meio de organização aprimorada

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada de capítulos em mais de 40 arquivos de documentação
- **Rodapé de Navegação**: Orientação de progressão consistente e indicadores de conclusão de capítulos
- **Links Cruzados**: Sistema abrangente de links internos conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizado

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizado Abrangentes**: Guia de estudo reestruturado para alinhar com o sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos de aprendizado específicos e exercícios práticos
- **📋 Rastreamento de Progresso**: Cronograma semanal de aprendizado com resultados mensuráveis e listas de verificação de conclusão
- **❓ Perguntas de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implantação e solução de problemas
- **📊 Progressão de Habilidades**: Avanço claro de conceitos básicos para padrões corporativos com foco em desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gerenciamento de Cronograma**: Plano de aprendizado estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Soluções de IA Multiagente Aprimoradas
**Esta versão melhora a solução de varejo multiagente com melhor nomenclatura de agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multiagente**: Substituiu "agente Cora" por "agente Cliente" em toda a solução de varejo multiagente para maior clareza
- **Arquitetura de Agentes**: Atualizou toda a documentação, templates ARM e exemplos de código para usar nomenclatura consistente de "agente Cliente"
- **Exemplos de Configuração**: Modernizou padrões de configuração de agentes com nomenclatura atualizada
- **Consistência na Documentação**: Garantiu que todas as referências utilizem nomes de agentes profissionais e descritivos

#### Aprimorado
- **Pacote de Templates ARM**: Atualizou o template retail-multiagent-arm-template com referências ao agente Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomenclatura de agentes revisada
- **Exemplos de Código**: Classes Python e exemplos de implementação agora utilizam nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Atualizou todos os scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades de agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura corporativas
- **Materiais de Aprendizado**: Nomenclatura de agentes mais intuitiva para fins educacionais
- **Usabilidade de Templates**: Compreensão simplificada das funções de agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências CustomerAgent
- Substituiu nomes de classes CoraAgent por CustomerAgent em exemplos Python
- Modificou configurações JSON de templates ARM para usar o tipo de agente "cliente"
- Atualizou variáveis de ambiente de CORA_AGENT_* para padrões CUSTOMER_AGENT_*
- Atualizou todos os comandos de implantação e configurações de contêiner

### [v3.0.0] - 2025-09-12

#### Mudanças Principais - Foco em Desenvolvedores de IA e Integração com Azure AI Foundry
**Esta versão transforma o repositório em um recurso abrangente de aprendizado focado em IA com integração ao Azure AI Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizado Focado em IA**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração com Azure AI Foundry**: Documentação abrangente para conectar AZD com serviços do Azure AI Foundry
- **Padrões de Implantação de Modelos de IA**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implantação em produção
- **Laboratório de Workshop de IA**: Workshop prático de 2-3 horas para converter aplicativos de IA em soluções implantáveis com AZD
- **Melhores Práticas de IA em Produção**: Padrões prontos para empresas para escalar, monitorar e proteger cargas de trabalho de IA
- **Guia de Solução de Problemas Específico de IA**: Solução de problemas abrangente para Azure OpenAI, Cognitive Services e questões de implantação de IA
- **Galeria de Templates de IA**: Coleção destacada de templates do Azure AI Foundry com classificações de complexidade
- **Materiais do Workshop**: Estrutura completa de workshop com laboratórios práticos e materiais de referência

#### Aprimorado
- **Estrutura do README**: Focado em desenvolvedores de IA com 45% de dados de interesse da comunidade do Discord do Azure AI Foundry
- **Caminhos de Aprendizado**: Jornada dedicada para desenvolvedores de IA ao lado de caminhos tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates de IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte aprimorado à comunidade Discord com canais e discussões específicas de IA

#### Foco em Segurança e Produção
- **Padrões de Identidade Gerenciada**: Configurações de autenticação e segurança específicas de IA
- **Otimização de Custos**: Rastreamento de uso de tokens e controles de orçamento para cargas de trabalho de IA
- **Implantação Multi-regional**: Estratégias para implantação global de aplicativos de IA
- **Monitoramento de Desempenho**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear de Curso**: Progressão lógica de padrões básicos para avançados de implantação de IA
- **URLs Validadas**: Todos os links externos do repositório verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e funcionais
- **Pronto para Produção**: Padrões de implantação corporativos com exemplos reais

### [v2.0.0] - 2025-09-09

#### Mudanças Principais - Reestruturação do Repositório e Aprimoramento Profissional
**Esta versão representa uma revisão significativa na estrutura do repositório e na apresentação do conteúdo.**

#### Adicionado
- **Estrutura de Aprendizado Organizada**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizado e Resultados de Aprendizado
- **Sistema de Navegação**: Adicionados links de lição Anterior/Próxima em toda a documentação para progressão guiada de aprendizado
- **Guia de Estudo**: Guia de estudo abrangente (study-guide.md) com objetivos de aprendizado, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Removidos todos os ícones de emoji para melhorar a acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo de materiais de aprendizado melhorados

#### Alterado
- **Formato da Documentação**: Padronizou toda a documentação com estrutura consistente focada em aprendizado
- **Fluxo de Navegação**: Implementou progressão lógica em todos os materiais de aprendizado
- **Apresentação de Conteúdo**: Elementos decorativos removidos em favor de uma formatação clara e profissional
- **Estrutura de Links**: Atualizados todos os links internos para suportar o novo sistema de navegação

#### Melhorias
- **Acessibilidade**: Dependência de emojis removida para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa, estilo acadêmico, adequada para aprendizado corporativo
- **Experiência de Aprendizado**: Abordagem estruturada com objetivos e resultados claros para cada lição
- **Organização de Conteúdo**: Fluxo lógico aprimorado e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizado AZD

#### Adicionado
- **Estrutura Principal de Documentação**
  - Série completa de guias introdutórios
  - Documentação abrangente de implantação e provisionamento
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Módulo de Introdução**
  - Fundamentos do AZD: Conceitos e terminologia principais
  - Guia de Instalação: Instruções específicas para cada plataforma
  - Guia de Configuração: Configuração de ambiente e autenticação
  - Tutorial do Primeiro Projeto: Aprendizado prático passo a passo

- **Módulo de Implantação e Provisionamento**
  - Guia de Implantação: Documentação completa do fluxo de trabalho
  - Guia de Provisionamento: Infraestrutura como Código com Bicep
  - Melhores práticas para implantações em produção
  - Padrões de arquitetura de múltiplos serviços

- **Módulo de Validação Pré-Implantação**
  - Planejamento de Capacidade: Validação de disponibilidade de recursos do Azure
  - Seleção de SKU: Orientação abrangente sobre níveis de serviço
  - Verificações Pré-Implantação: Scripts de validação automatizados (PowerShell e Bash)
  - Ferramentas de estimativa de custos e planejamento de orçamento

- **Módulo de Solução de Problemas**
  - Problemas Comuns: Problemas frequentemente encontrados e soluções
  - Guia de Depuração: Metodologias sistemáticas de solução de problemas
  - Técnicas e ferramentas avançadas de diagnóstico
  - Monitoramento de desempenho e otimização

- **Recursos e Referências**
  - Folha de Comandos: Referência rápida para comandos essenciais
  - Glossário: Definições abrangentes de terminologia e acrônimos
  - FAQ: Respostas detalhadas para perguntas comuns
  - Links para recursos externos e conexões com a comunidade

- **Exemplos e Modelos**
  - Exemplo de Aplicação Web Simples
  - Modelo de implantação de site estático
  - Configuração de Aplicação em Contêiner
  - Padrões de integração de banco de dados
  - Exemplos de arquitetura de microsserviços
  - Implementações de funções serverless

#### Funcionalidades
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Vários Níveis de Habilidade**: Conteúdo projetado para estudantes e desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários do mundo real
- **Cobertura Abrangente**: Desde conceitos básicos até padrões avançados de empresas
- **Abordagem de Segurança**: Melhores práticas de segurança integradas em todo o conteúdo
- **Otimização de Custos**: Orientação para implantações econômicas e gerenciamento de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Exemplos práticos e testados
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Tratamento Abrangente de Erros**: Solução de problemas para questões comuns
- **Integração de Melhores Práticas**: Padrões e recomendações da indústria
- **Compatibilidade de Versão**: Atualizado com os serviços mais recentes do Azure e recursos do azd

## Melhorias Planejadas para o Futuro

### Versão 3.1.0 (Planejada)
#### Expansão da Plataforma de IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes de IA**: Modelos para implantações de LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados de RAG**: Opções de banco de dados vetorial além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade de IA**: Monitoramento aprimorado para desempenho de modelos, uso de tokens e qualidade de respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência integrada de desenvolvimento AZD + AI Foundry
- **Integração com GitHub Copilot**: Geração de modelos AZD assistida por IA
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automatizada para cenários de IA
- **Conteúdo em Vídeo**: Tutoriais em vídeo suplementares para aprendizes visuais focados em implantações de IA

### Versão 4.0.0 (Planejada)
#### Padrões de IA Empresarial
- **Framework de Governança**: Governança de modelos de IA, conformidade e trilhas de auditoria
- **IA Multi-Tenant**: Padrões para atender múltiplos clientes com serviços de IA isolados
- **Implantação de IA na Edge**: Integração com Azure IoT Edge e instâncias de contêiner
- **IA em Nuvem Híbrida**: Padrões de implantação multi-nuvem e híbrida para cargas de trabalho de IA

#### Funcionalidades Avançadas
- **Automação de Pipelines de IA**: Integração de MLOps com pipelines do Azure Machine Learning
- **Segurança Avançada**: Padrões de confiança zero, endpoints privados e proteção contra ameaças avançadas
- **Otimização de Desempenho**: Estratégias avançadas de ajuste e escalonamento para aplicações de IA de alta demanda
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na edge para aplicações de IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente do Azure AI Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de IA (Concluído)
- ✅ **Módulo de Segurança Avançada**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Desempenho**: Estratégias de ajuste para cargas de trabalho de IA (Concluído)

### Versão 2.1.0 (Planejada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implantação focados em IA (Concluído)
- ✅ **FAQ Expandido**: Perguntas e soluções específicas para IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados de integração com IDEs e editores
- ✅ **Expansão de Monitoramento**: Padrões de monitoramento e alertas específicos para IA (Concluído)

#### Ainda Planejado para Lançamentos Futuros
- **Documentação Amigável para Mobile**: Design responsivo para aprendizado em dispositivos móveis
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada com IDEs**: Extensão VS Code para fluxos de trabalho AZD + IA
- **Painel da Comunidade**: Métricas em tempo real e rastreamento de contribuições da comunidade

## Contribuindo para o Changelog

### Relatando Alterações
Ao contribuir para este repositório, certifique-se de que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo a versão semântica (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Depreciado, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as alterações afetam os usuários existentes

### Categorias de Alteração

#### Adicionado
- Novas funcionalidades, seções de documentação ou capacidades
- Novos exemplos, modelos ou recursos de aprendizado
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Depreciado
- Funcionalidades ou abordagens que estão sendo descontinuadas
- Seções de documentação programadas para remoção
- Métodos que possuem alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens depreciadas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas ou questões relatadas
- Melhorias na precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações para melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Major (X.0.0)
- Alterações significativas que exigem ação do usuário
- Reestruturação importante de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Minor (X.Y.0)
- Novas funcionalidades ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão Patch (X.Y.Z)
- Correções de bugs e erros
- Melhorias menores em conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizado:

### Como Fornecer Feedback
- **Issues no GitHub**: Relate problemas ou sugira melhorias (questões específicas de IA são bem-vindas)
- **Discussões no Discord**: Compartilhe ideias e interaja com a comunidade do Azure AI Foundry
- **Pull Requests**: Contribua com melhorias diretas no conteúdo, especialmente modelos e guias de IA
- **Discord do Azure AI Foundry**: Participe do canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participe de discussões mais amplas entre desenvolvedores do Azure

### Categorias de Feedback
- **Precisão de Conteúdo de IA**: Correções para informações de integração e implantação de serviços de IA
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado de desenvolvedores de IA
- **Conteúdo de IA Ausente**: Solicitações para modelos, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para atender às diversas necessidades de aprendizado
- **Integração de Ferramentas de IA**: Sugestões para melhor integração de fluxos de trabalho de desenvolvimento de IA
- **Padrões de IA em Produção**: Solicitações de padrões de implantação de IA para empresas

### Compromisso de Resposta
- **Resposta a Issues**: Dentro de 48 horas para problemas relatados
- **Solicitações de Funcionalidades**: Avaliação dentro de uma semana
- **Contribuições da Comunidade**: Revisão dentro de uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Validação de precisão de conteúdo e links
- **Atualizações Trimestrais**: Adições e melhorias importantes de conteúdo
- **Revisões Semestrais**: Reestruturação e aprimoramento abrangente
- **Lançamentos Anuais**: Atualizações de versão principal com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos usuários
- **Atualizações Tecnológicas**: Alinhamento com os serviços mais recentes do Azure e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte de Versão

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte da comunidade apenas, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para transição
- **Notas de Compatibilidade**: Detalhes sobre alterações significativas
- **Suporte a Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para perguntas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Retornar ao [README Principal](README.md)

**Fique Atualizado**: Acompanhe este repositório para notificações sobre novos lançamentos e atualizações importantes nos materiais de aprendizado.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->