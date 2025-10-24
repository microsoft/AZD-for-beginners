<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:08:42+00:00",
  "source_file": "changelog.md",
  "language_code": "pt"
}
-->
# Registo de Alterações - AZD Para Iniciantes

## Introdução

Este registo de alterações documenta todas as mudanças, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este registo para ajudar os utilizadores a compreenderem o que mudou entre as versões.

## Objetivos de Aprendizagem

Ao rever este registo de alterações, irá:
- Manter-se informado sobre novas funcionalidades e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de erros para garantir precisão
- Seguir a evolução dos materiais de aprendizagem ao longo do tempo

## Resultados de Aprendizagem

Após rever as entradas do registo de alterações, será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizagem
- Compreender quais secções foram atualizadas ou melhoradas
- Planear o seu percurso de aprendizagem com base nos materiais mais recentes
- Contribuir com feedback e sugestões para futuras melhorias

## Histórico de Versões

### [v3.4.0] - 2025-10-24

#### Melhorias na Pré-visualização e Validação de Infraestrutura
**Esta versão introduz suporte abrangente para a nova funcionalidade de pré-visualização do Azure Developer CLI e melhora a experiência dos utilizadores nos workshops.**

#### Adicionado
- **🧪 Documentação da funcionalidade azd provision --preview**: Cobertura detalhada da nova capacidade de pré-visualização de infraestrutura
  - Referência de comandos e exemplos de uso no guia rápido
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação prévia para validação de implementação mais segura
  - Atualizações no guia de introdução com práticas de implementação seguras
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando o status de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara com o utilizador
  - Data da última atualização para transparência
  - Design responsivo para dispositivos móveis

#### Melhorado
- **Segurança da Infraestrutura**: Funcionalidade de pré-visualização integrada em toda a documentação de implementação
- **Validação Pré-implementação**: Scripts automatizados agora incluem testes de pré-visualização de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir pré-visualização como melhor prática
- **Experiência do Workshop**: Expectativas claras definidas para os utilizadores sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implementação**: Fluxo de trabalho com pré-visualização agora recomendado como abordagem principal
- **Fluxo da Documentação**: Validação de infraestrutura movida para mais cedo no processo de aprendizagem
- **Apresentação do Workshop**: Comunicação profissional de status com cronograma claro de desenvolvimento

#### Melhorado
- **Abordagem de Segurança Primeiro**: Alterações na infraestrutura podem agora ser validadas antes da implementação
- **Colaboração em Equipa**: Resultados da pré-visualização podem ser partilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas na implementação através de validação antecipada

#### Implementação Técnica
- **Integração Multi-documento**: Funcionalidade de pré-visualização documentada em 4 ficheiros principais
- **Padrões de Comando**: Sintaxe consistente e exemplos em toda a documentação
- **Integração de Melhores Práticas**: Pré-visualização incluída em fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara de NOVAS funcionalidades para fácil descoberta

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Utilizador**: Status de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência de Cronograma**: Data da última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 2025-09-24

#### Materiais Aprimorados para Workshops e Experiência de Aprendizagem Interativa
**Esta versão introduz materiais abrangentes para workshops com guias interativos baseados em navegador e percursos de aprendizagem estruturados.**

#### Adicionado
- **🎥 Guia Interativo para Workshops**: Experiência de workshop baseada em navegador com capacidade de pré-visualização MkDocs
- **📝 Instruções Estruturadas para Workshops**: Percurso de aprendizagem guiado em 7 etapas, desde a descoberta até à personalização
  - 0-Introdução: Visão geral e configuração do workshop
  - 1-Selecionar-Template-AI: Processo de descoberta e seleção de templates
  - 2-Validar-Template-AI: Procedimentos de implementação e validação
  - 3-Decompor-Template-AI: Compreensão da arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Desmontar-Infraestrutura: Limpeza e gestão de recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas para Workshops**: Configuração MkDocs com tema Material para uma experiência de aprendizagem aprimorada
- **🎯 Percurso de Aprendizagem Prático**: Metodologia de 3 etapas (Descoberta → Implementação → Personalização)
- **📱 Integração com GitHub Codespaces**: Configuração de ambiente de desenvolvimento sem complicações

#### Melhorado
- **Laboratório de Workshop AI**: Expandido com experiência de aprendizagem estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão de Aprendizagem**: Orientação clara passo a passo desde a seleção de templates até à implementação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com pesquisa, funcionalidade de cópia e alternância de tema
- **Aprendizagem ao Seu Ritmo**: Estrutura flexível do workshop que acomoda diferentes velocidades de aprendizagem
- **Aplicação Prática**: Cenários reais de implementação de templates AI
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Funcionalidades do Workshop
- **Pesquisa Incorporada**: Descoberta rápida de palavras-chave e lições
- **Blocos de Código Copiáveis**: Funcionalidade de copiar ao passar o cursor em todos os exemplos de código
- **Alternância de Tema**: Suporte para modo escuro/claro para diferentes preferências
- **Recursos Visuais**: Capturas de ecrã e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 2025-09-17

#### Reestruturação de Navegação e Sistema de Aprendizagem Baseado em Capítulos
**Esta versão introduz uma estrutura de aprendizagem baseada em capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizagem Baseado em Capítulos**: Reestruturação de todo o curso em 8 capítulos progressivos de aprendizagem
  - Capítulo 1: Fundamentos e Introdução Rápida (⭐ - 30-45 mins)
  - Capítulo 2: Desenvolvimento Focado em AI (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração e Autenticação (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestrutura como Código e Implementação (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluções AI Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação Pré-implementação e Planeamento (⭐⭐ - 1 hora)
  - Capítulo 7: Resolução de Problemas e Depuração (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Padrões de Produção e Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Rastreamento de Progresso**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizagem
- **🗺️ Orientação de Percurso de Aprendizagem**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação Cruzada**: Capítulos relacionados e pré-requisitos claramente ligados

#### Melhorado
- **Estrutura do README**: Transformado numa plataforma de aprendizagem estruturada com organização baseada em capítulos
- **Navegação na Documentação**: Cada página agora inclui contexto de capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizagem apropriados
- **Integração de Recursos**: Guias rápidos, FAQs e guias de estudo conectados a capítulos relevantes
- **Integração de Workshops**: Laboratórios práticos mapeados para múltiplos objetivos de aprendizagem dos capítulos

#### Alterado
- **Progressão de Aprendizagem**: Mudança de documentação linear para aprendizagem flexível baseada em capítulos
- **Posicionamento de Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizagem
- **Integração de Conteúdo AI**: Melhor integração de conteúdo específico de AI ao longo da jornada de aprendizagem
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Melhorado
- **Experiência do Utilizador**: Navegação clara com indicadores de progresso e breadcrumbs de capítulo
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a exploração do curso
- **Apresentação Profissional**: Estrutura de curso estilo universitário adequada para formação académica e corporativa
- **Eficiência de Aprendizagem**: Redução do tempo para encontrar conteúdo relevante através de organização aprimorada

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação padronizada por capítulos em mais de 40 ficheiros de documentação
- **Rodapés de Navegação**: Orientação consistente de progressão e indicadores de conclusão de capítulos
- **Links Cruzados**: Sistema abrangente de ligação interna conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizagem

#### Melhoria do Guia de Estudo
- **📚 Objetivos de Aprendizagem Abrangentes**: Guia de estudo reestruturado para alinhar com o sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos de aprendizagem específicos e exercícios práticos
- **📋 Rastreamento de Progresso**: Cronograma semanal de aprendizagem com resultados mensuráveis e listas de verificação de conclusão
- **❓ Perguntas de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implementação e resolução de problemas
- **📊 Progressão de Competências**: Avanço claro de conceitos básicos para padrões empresariais com foco no desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gestão de Cronograma**: Plano de aprendizagem estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 2025-09-17

#### Melhorias em Soluções AI Multi-Agente
**Esta versão melhora a solução de retalho multi-agente com nomes de agentes mais claros e documentação aprimorada.**

#### Alterado
- **Terminologia Multi-Agente**: Substituído "agente Cora" por "agente Cliente" em toda a solução de retalho multi-agente para maior clareza
- **Arquitetura de Agentes**: Atualização de toda a documentação, templates ARM e exemplos de código para usar consistentemente o nome "agente Cliente"
- **Exemplos de Configuração**: Padrões de configuração de agentes modernizados com convenções de nomenclatura atualizadas
- **Consistência na Documentação**: Garantia de que todas as referências utilizam nomes de agentes profissionais e descritivos

#### Melhorado
- **Pacote de Templates ARM**: Template retail-multiagent-arm-template atualizado com referências ao agente Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomenclatura de agente Cliente
- **Exemplos de Código**: Classes Python e exemplos de implementação agora utilizam nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Todos os scripts de implementação atualizados para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades dos agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura empresariais
- **Materiais de Aprendizagem**: Nomes de agentes mais intuitivos para fins educacionais
- **Usabilidade dos Templates**: Compreensão simplificada das funções dos agentes e padrões de implementação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências a CustomerAgent
- Substituídos nomes de classes CoraAgent por CustomerAgent em exemplos de Python
- Configurações JSON de templates ARM modificadas para usar o tipo de agente "cliente"
- Variáveis de ambiente atualizadas de CORA_AGENT_* para padrões CUSTOMER_AGENT_*
- Comandos de implementação e configurações de contêineres renovados

### [v3.0.0] - 2025-09-12

#### Mudanças Principais - Foco em Desenvolvedores AI e Integração com Azure AI Foundry
**Esta versão transforma o repositório num recurso abrangente de aprendizagem focado em AI com integração ao Azure AI Foundry.**

#### Adicionado
- **🤖 Percurso de Aprendizagem Focado em AI**: Reestruturação completa priorizando desenvolvedores e engenheiros de AI
- **Guia de Integração com Azure AI Foundry**: Documentação abrangente para conectar AZD com serviços Azure AI Foundry
- **Padrões de Implementação de Modelos AI**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implementação em produção
- **Laboratório de Workshop AI**: Workshop prático de 2-3 horas para converter aplicações AI em soluções implementáveis com AZD
- **Melhores Práticas para Produção de AI**: Padrões prontos para empresas para escalar, monitorizar e proteger cargas de trabalho AI
- **Guia de Resolução de Problemas Específico para AI**: Soluções abrangentes para problemas de Azure OpenAI, Cognitive Services e implementações AI
- **Galeria de Templates AI**: Coleção destacada de templates Azure AI Foundry com classificações de complexidade
- **Materiais para Workshops**: Estrutura completa de workshops com laboratórios práticos e materiais de referência

#### Melhorado
- **Estrutura do README**: Focado em desenvolvedores AI com 45% de dados de interesse da comunidade do Discord Azure AI Foundry
- **Percursos de Aprendizagem**: Jornada dedicada para desenvolvedores AI ao lado de percursos tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates AI destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte comunitário aprimorado no Discord com canais e discussões específicas para AI

#### Foco em Segurança e Produção
- **Padrões de Identidade Gerida**: Configurações de autenticação e segurança específicas para AI
- **Otimização de Custos**: Monitorização de uso de tokens e controlo de orçamento para cargas de trabalho AI
- **Implementação Multi-região**: Estratégias para implementação global de aplicações AI
- **Monitorização de Desempenho**: Métricas específicas para AI e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura Linear do Curso**: Progressão lógica desde padrões básicos até avançados de implementação AI
- **URLs Validadas**: Todos os links de repositórios externos verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e funcionais
- **Pronto para Produção**: Padrões de implementação empresarial com exemplos reais

### [v2.0.0] - 2025-09-09

#### Mudanças Principais - Reestruturação do Repositório e Aprimoramento Profissional
**Esta versão representa uma revisão significativa na estrutura do repositório e na apresentação do conteúdo.**

#### Adicionado
- **Estrutura de Aprendizagem Organizada**: Todas as páginas de documentação agora incluem secções de Introdução, Objetivos de Aprendizagem e Resultados de Aprendizagem
- **Sistema de Navegação**: Adicionados links de lição anterior/próxima em toda a documentação para progressão guiada na aprendizagem
- **Guia de Estudo**: Guia de estudo abrangente (study-guide.md) com objetivos de aprendizagem, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Removidos todos os ícones de emoji para melhorar a acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo dos materiais de aprendizagem melhorados

#### Alterado
- **Formato da Documentação**: Padronização de toda a documentação com uma estrutura consistente focada no aprendizado
- **Fluxo de Navegação**: Implementação de uma progressão lógica em todos os materiais de aprendizagem
- **Apresentação de Conteúdo**: Remoção de elementos decorativos em favor de uma formatação clara e profissional
- **Estrutura de Links**: Atualização de todos os links internos para suportar o novo sistema de navegação

#### Melhorias
- **Acessibilidade**: Remoção de dependências de emojis para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa e estilo acadêmico adequado para aprendizado corporativo
- **Experiência de Aprendizado**: Abordagem estruturada com objetivos e resultados claros para cada lição
- **Organização de Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizado AZD

#### Adicionado
- **Estrutura Principal da Documentação**
  - Série completa de guias introdutórios
  - Documentação abrangente de implementação e provisionamento
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implementação

- **Módulo de Introdução**
  - Fundamentos do AZD: Conceitos e terminologia principais
  - Guia de Instalação: Instruções de configuração específicas para cada plataforma
  - Guia de Configuração: Configuração de ambiente e autenticação
  - Tutorial do Primeiro Projeto: Aprendizado prático passo a passo

- **Módulo de Implementação e Provisionamento**
  - Guia de Implementação: Documentação completa do fluxo de trabalho
  - Guia de Provisionamento: Infraestrutura como Código com Bicep
  - Melhores práticas para implementações em produção
  - Padrões de arquitetura de múltiplos serviços

- **Módulo de Validação Pré-Implementação**
  - Planeamento de Capacidade: Validação de disponibilidade de recursos do Azure
  - Seleção de SKU: Orientação abrangente sobre níveis de serviço
  - Verificações Prévias: Scripts de validação automatizados (PowerShell e Bash)
  - Ferramentas de estimativa de custos e planeamento de orçamento

- **Módulo de Solução de Problemas**
  - Problemas Comuns: Problemas frequentemente encontrados e soluções
  - Guia de Depuração: Metodologias sistemáticas de solução de problemas
  - Técnicas e ferramentas avançadas de diagnóstico
  - Monitorização de desempenho e otimização

- **Recursos e Referências**
  - Folha de Comandos: Referência rápida para comandos essenciais
  - Glossário: Definições abrangentes de terminologia e acrônimos
  - FAQ: Respostas detalhadas para perguntas comuns
  - Links para recursos externos e conexões com a comunidade

- **Exemplos e Modelos**
  - Exemplo de Aplicação Web Simples
  - Modelo de implementação de site estático
  - Configuração de aplicação em contêiner
  - Padrões de integração de base de dados
  - Exemplos de arquitetura de microsserviços
  - Implementações de funções sem servidor

#### Funcionalidades
- **Suporte Multi-Plataforma**: Guias de instalação e configuração para Windows, macOS e Linux
- **Vários Níveis de Habilidade**: Conteúdo projetado para estudantes e desenvolvedores profissionais
- **Foco Prático**: Exemplos práticos e cenários do mundo real
- **Cobertura Abrangente**: Desde conceitos básicos até padrões empresariais avançados
- **Abordagem de Segurança em Primeiro Lugar**: Melhores práticas de segurança integradas em todo o conteúdo
- **Otimização de Custos**: Orientação para implementações econômicas e gestão de recursos

#### Qualidade da Documentação
- **Exemplos de Código Detalhados**: Exemplos práticos e testados
- **Instruções Passo a Passo**: Orientação clara e acionável
- **Gestão Abrangente de Erros**: Solução de problemas para questões comuns
- **Integração de Melhores Práticas**: Padrões e recomendações da indústria
- **Compatibilidade de Versão**: Atualizado com os serviços mais recentes do Azure e funcionalidades do azd

## Melhorias Planeadas para o Futuro

### Versão 3.1.0 (Planeada)
#### Expansão da Plataforma de IA
- **Suporte Multi-Modelo**: Padrões de integração para Hugging Face, Azure Machine Learning e modelos personalizados
- **Frameworks de Agentes de IA**: Modelos para implementações de LangChain, Semantic Kernel e AutoGen
- **Padrões Avançados de RAG**: Opções de base de dados vetorial além do Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidade de IA**: Monitorização aprimorada para desempenho de modelos, uso de tokens e qualidade de respostas

#### Experiência do Desenvolvedor
- **Extensão VS Code**: Experiência integrada de desenvolvimento AZD + AI Foundry
- **Integração com GitHub Copilot**: Geração de modelos AZD assistida por IA
- **Tutoriais Interativos**: Exercícios práticos de codificação com validação automatizada para cenários de IA
- **Conteúdo em Vídeo**: Tutoriais em vídeo suplementares para aprendizes visuais com foco em implementações de IA

### Versão 4.0.0 (Planeada)
#### Padrões Empresariais de IA
- **Framework de Governança**: Governança de modelos de IA, conformidade e trilhas de auditoria
- **IA Multi-Cliente**: Padrões para atender vários clientes com serviços de IA isolados
- **Implementação de IA na Periferia**: Integração com Azure IoT Edge e instâncias de contêiner
- **IA em Nuvem Híbrida**: Padrões de implementação multi-nuvem e híbridos para cargas de trabalho de IA

#### Funcionalidades Avançadas
- **Automação de Pipelines de IA**: Integração de MLOps com pipelines do Azure Machine Learning
- **Segurança Avançada**: Padrões de confiança zero, endpoints privados e proteção contra ameaças avançadas
- **Otimização de Desempenho**: Estratégias avançadas de ajuste e escalonamento para aplicações de IA de alta capacidade
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na periferia para aplicações de IA

### Versão 3.0.0 (Planeada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente do Azure AI Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de IA (Concluído)
- ✅ **Módulo de Segurança Avançada**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Desempenho**: Estratégias de ajuste de cargas de trabalho de IA (Concluído)

### Versão 2.1.0 (Planeada) - Parcialmente Implementada na v3.0.0
#### Melhorias Menores - Algumas Concluídas na Versão Atual
- ✅ **Exemplos Adicionais**: Cenários de implementação focados em IA (Concluído)
- ✅ **FAQ Expandido**: Perguntas e soluções específicas para IA (Concluído)
- **Integração de Ferramentas**: Guias aprimorados de integração com IDEs e editores
- ✅ **Expansão de Monitorização**: Padrões de monitorização e alertas específicos para IA (Concluído)

#### Ainda Planeado para Lançamentos Futuros
- **Documentação Amigável para Dispositivos Móveis**: Design responsivo para aprendizado em dispositivos móveis
- **Acesso Offline**: Pacotes de documentação para download
- **Integração Aprimorada com IDEs**: Extensão VS Code para fluxos de trabalho AZD + IA
- **Painel da Comunidade**: Métricas em tempo real da comunidade e acompanhamento de contribuições

## Contribuindo para o Changelog

### Relatando Alterações
Ao contribuir para este repositório, certifique-se de que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo a versão semântica (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato YYYY-MM-DD
3. **Categoria**: Adicionado, Alterado, Obsoleto, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as alterações afetam os utilizadores existentes

### Categorias de Alteração

#### Adicionado
- Novas funcionalidades, seções de documentação ou capacidades
- Novos exemplos, modelos ou recursos de aprendizado
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Obsoleto
- Funcionalidades ou abordagens que estão sendo descontinuadas
- Seções de documentação programadas para remoção
- Métodos que possuem alternativas melhores

#### Removido
- Funcionalidades, documentação ou exemplos que não são mais relevantes
- Informações desatualizadas ou abordagens obsoletas
- Conteúdo redundante ou consolidado

#### Corrigido
- Correções de erros na documentação ou código
- Resolução de problemas ou questões relatadas
- Melhorias na precisão ou funcionalidade

#### Segurança
- Melhorias ou correções relacionadas à segurança
- Atualizações nas melhores práticas de segurança
- Resolução de vulnerabilidades de segurança

### Diretrizes de Versionamento Semântico

#### Versão Principal (X.0.0)
- Alterações significativas que exigem ação do utilizador
- Reestruturação importante de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Secundária (X.Y.0)
- Novas funcionalidades ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão de Correção (X.Y.Z)
- Correções de bugs e erros
- Melhorias menores em conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizado:

### Como Fornecer Feedback
- **GitHub Issues**: Relatar problemas ou sugerir melhorias (questões específicas de IA são bem-vindas)
- **Discussões no Discord**: Compartilhar ideias e interagir com a comunidade Azure AI Foundry
- **Pull Requests**: Contribuir com melhorias diretas no conteúdo, especialmente modelos e guias de IA
- **Discord do Azure AI Foundry**: Participar no canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participar de discussões mais amplas de desenvolvedores Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções nas informações de integração e implementação de serviços de IA
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado de desenvolvedores de IA
- **Conteúdo de IA em Falta**: Solicitações de modelos, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para atender às diversas necessidades de aprendizado
- **Integração de Ferramentas de IA**: Sugestões para melhor integração de fluxos de trabalho de desenvolvimento de IA
- **Padrões de IA em Produção**: Solicitações de padrões de implementação de IA para empresas

### Compromisso de Resposta
- **Resposta a Problemas**: Em até 48 horas para problemas relatados
- **Solicitações de Funcionalidades**: Avaliação em até uma semana
- **Contribuições da Comunidade**: Revisão em até uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Validação de precisão de conteúdo e links
- **Atualizações Trimestrais**: Adições e melhorias importantes de conteúdo
- **Revisões Semestrais**: Reestruturação e aprimoramento abrangente
- **Lançamentos Anuais**: Atualizações de versão principal com melhorias significativas

### Monitorização e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos utilizadores
- **Atualizações Tecnológicas**: Alinhamento com os serviços mais recentes do Azure e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisões regulares para princípios de design inclusivo

## Política de Suporte de Versões

### Suporte à Versão Atual
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Apenas suporte da comunidade, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para transição
- **Notas de Compatibilidade**: Detalhes sobre alterações significativas
- **Suporte a Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para questões de migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudo](resources/study-guide.md)
- **Próxima Lição**: Retornar ao [README Principal](README.md)

**Mantenha-se Atualizado**: Siga este repositório para notificações sobre novos lançamentos e atualizações importantes nos materiais de aprendizado.

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.