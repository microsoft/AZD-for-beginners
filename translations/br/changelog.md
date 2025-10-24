<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:10:24+00:00",
  "source_file": "changelog.md",
  "language_code": "br"
}
-->
# Registro de Alterações - AZD Para Iniciantes

## Introdução

Este registro de alterações documenta todas as mudanças, atualizações e melhorias notáveis no repositório AZD Para Iniciantes. Seguimos os princípios de versionamento semântico e mantemos este log para ajudar os usuários a entenderem o que mudou entre as versões.

## Objetivos de Aprendizado

Ao revisar este registro de alterações, você irá:
- Manter-se informado sobre novos recursos e adições de conteúdo
- Compreender as melhorias feitas na documentação existente
- Acompanhar correções de bugs e garantir precisão
- Seguir a evolução dos materiais de aprendizado ao longo do tempo

## Resultados de Aprendizado

Após revisar as entradas do registro de alterações, você será capaz de:
- Identificar novos conteúdos e recursos disponíveis para aprendizado
- Entender quais seções foram atualizadas ou aprimoradas
- Planejar seu caminho de aprendizado com base nos materiais mais atuais
- Contribuir com feedback e sugestões para melhorias futuras

## Histórico de Versões

### [v3.4.0] - 24/10/2025

#### Melhorias na Pré-visualização e Validação de Infraestrutura
**Esta versão introduz suporte abrangente ao novo recurso de pré-visualização do Azure Developer CLI e aprimora a experiência dos usuários em workshops.**

#### Adicionado
- **🧪 Documentação do recurso azd provision --preview**: Cobertura completa da nova capacidade de pré-visualização de infraestrutura
  - Referência de comandos e exemplos de uso no guia rápido
  - Integração detalhada no guia de provisionamento com casos de uso e benefícios
  - Integração de verificação prévia para validação de implantação mais segura
  - Atualizações no guia de introdução com práticas de implantação focadas em segurança
- **🚧 Banner de Status do Workshop**: Banner HTML profissional indicando o status de desenvolvimento do workshop
  - Design em gradiente com indicadores de construção para comunicação clara com o usuário
  - Data da última atualização para transparência
  - Design responsivo para dispositivos móveis

#### Aprimorado
- **Segurança da Infraestrutura**: Funcionalidade de pré-visualização integrada em toda a documentação de implantação
- **Validação Pré-implantação**: Scripts automatizados agora incluem testes de pré-visualização de infraestrutura
- **Fluxo de Trabalho do Desenvolvedor**: Sequências de comandos atualizadas para incluir pré-visualização como prática recomendada
- **Experiência do Workshop**: Expectativas claras definidas para os usuários sobre o status de desenvolvimento do conteúdo

#### Alterado
- **Melhores Práticas de Implantação**: Fluxo de trabalho com pré-visualização agora é a abordagem recomendada
- **Fluxo da Documentação**: Validação de infraestrutura movida para mais cedo no processo de aprendizado
- **Apresentação do Workshop**: Comunicação profissional de status com cronograma de desenvolvimento claro

#### Melhorado
- **Abordagem Focada em Segurança**: Alterações na infraestrutura agora podem ser validadas antes da implantação
- **Colaboração em Equipe**: Resultados da pré-visualização podem ser compartilhados para revisão e aprovação
- **Consciência de Custos**: Melhor compreensão dos custos de recursos antes do provisionamento
- **Mitigação de Riscos**: Redução de falhas de implantação por meio de validação antecipada

#### Implementação Técnica
- **Integração Multi-documento**: Recurso de pré-visualização documentado em 4 arquivos principais
- **Padrões de Comando**: Sintaxe consistente e exemplos em toda a documentação
- **Integração de Melhores Práticas**: Pré-visualização incluída em fluxos de validação e scripts
- **Indicadores Visuais**: Marcação clara de NOVOS recursos para fácil descoberta

#### Infraestrutura do Workshop
- **Comunicação de Status**: Banner HTML profissional com estilo em gradiente
- **Experiência do Usuário**: Status de desenvolvimento claro evita confusão
- **Apresentação Profissional**: Mantém a credibilidade do repositório enquanto define expectativas
- **Transparência de Cronograma**: Data da última atualização em outubro de 2025 para responsabilidade

### [v3.3.0] - 24/09/2025

#### Materiais de Workshop Aprimorados e Experiência de Aprendizado Interativa
**Esta versão introduz materiais de workshop abrangentes com guias interativos baseados em navegador e caminhos de aprendizado estruturados.**

#### Adicionado
- **🎥 Guia Interativo do Workshop**: Experiência de workshop baseada em navegador com capacidade de pré-visualização MkDocs
- **📝 Instruções Estruturadas do Workshop**: Caminho de aprendizado guiado em 7 etapas, desde a descoberta até a personalização
  - 0-Introdução: Visão geral do workshop e configuração
  - 1-Selecionar-Template-AI: Processo de descoberta e seleção de template
  - 2-Validar-Template-AI: Procedimentos de implantação e validação
  - 3-Decompor-Template-AI: Compreensão da arquitetura do template
  - 4-Configurar-Template-AI: Configuração e personalização
  - 5-Personalizar-Template-AI: Modificações avançadas e iterações
  - 6-Desmontar-Infraestrutura: Gerenciamento de limpeza e recursos
  - 7-Conclusão: Resumo e próximos passos
- **🛠️ Ferramentas do Workshop**: Configuração do MkDocs com tema Material para uma experiência de aprendizado aprimorada
- **🎯 Caminho de Aprendizado Prático**: Metodologia de 3 etapas (Descoberta → Implantação → Personalização)
- **📱 Integração com GitHub Codespaces**: Configuração de ambiente de desenvolvimento sem complicações

#### Aprimorado
- **Laboratório de Workshop de IA**: Estendido com experiência de aprendizado estruturada de 2-3 horas
- **Documentação do Workshop**: Apresentação profissional com navegação e recursos visuais
- **Progressão de Aprendizado**: Orientação clara passo a passo, desde a seleção de templates até a implantação em produção
- **Experiência do Desenvolvedor**: Ferramentas integradas para fluxos de trabalho de desenvolvimento simplificados

#### Melhorado
- **Acessibilidade**: Interface baseada em navegador com busca, funcionalidade de copiar e alternância de tema
- **Aprendizado no Seu Ritmo**: Estrutura flexível do workshop para acomodar diferentes velocidades de aprendizado
- **Aplicação Prática**: Cenários reais de implantação de templates de IA
- **Integração Comunitária**: Integração com Discord para suporte e colaboração no workshop

#### Recursos do Workshop
- **Busca Integrada**: Descoberta rápida de palavras-chave e lições
- **Blocos de Código Copiáveis**: Funcionalidade de copiar ao passar o mouse em todos os exemplos de código
- **Alternância de Tema**: Suporte a modos claro/escuro para diferentes preferências
- **Recursos Visuais**: Capturas de tela e diagramas para melhor compreensão
- **Integração de Ajuda**: Acesso direto ao Discord para suporte comunitário

### [v3.2.0] - 17/09/2025

#### Reestruturação de Navegação e Sistema de Aprendizado Baseado em Capítulos
**Esta versão introduz uma estrutura de aprendizado baseada em capítulos com navegação aprimorada em todo o repositório.**

#### Adicionado
- **📚 Sistema de Aprendizado Baseado em Capítulos**: Curso reestruturado em 8 capítulos progressivos de aprendizado
  - Capítulo 1: Fundamentos e Início Rápido (⭐ - 30-45 min)
  - Capítulo 2: Desenvolvimento Focado em IA (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuração e Autenticação (⭐⭐ - 45-60 min)
  - Capítulo 4: Infraestrutura como Código e Implantação (⭐⭐⭐ - 1-1,5 horas)
  - Capítulo 5: Soluções de IA Multiagente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validação e Planejamento Pré-implantação (⭐⭐ - 1 hora)
  - Capítulo 7: Solução de Problemas e Depuração (⭐⭐ - 1-1,5 horas)
  - Capítulo 8: Padrões de Produção e Empresariais (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegação Abrangente**: Cabeçalhos e rodapés de navegação consistentes em toda a documentação
- **🎯 Rastreamento de Progresso**: Lista de verificação de conclusão do curso e sistema de verificação de aprendizado
- **🗺️ Orientação de Caminho de Aprendizado**: Pontos de entrada claros para diferentes níveis de experiência e objetivos
- **🔗 Navegação Cruzada**: Capítulos relacionados e pré-requisitos claramente vinculados

#### Aprimorado
- **Estrutura do README**: Transformado em uma plataforma de aprendizado estruturada com organização baseada em capítulos
- **Navegação na Documentação**: Cada página agora inclui contexto de capítulo e orientação de progressão
- **Organização de Templates**: Exemplos e templates mapeados para capítulos de aprendizado apropriados
- **Integração de Recursos**: Guias rápidos, FAQs e guias de estudo conectados a capítulos relevantes
- **Integração de Workshops**: Laboratórios práticos mapeados para múltiplos objetivos de aprendizado de capítulos

#### Alterado
- **Progressão de Aprendizado**: Mudança de documentação linear para aprendizado flexível baseado em capítulos
- **Posicionamento de Configuração**: Guia de configuração reposicionado como Capítulo 3 para melhor fluxo de aprendizado
- **Integração de Conteúdo de IA**: Melhor integração de conteúdo específico de IA ao longo da jornada de aprendizado
- **Conteúdo de Produção**: Padrões avançados consolidados no Capítulo 8 para aprendizes empresariais

#### Melhorado
- **Experiência do Usuário**: Navegação clara com indicadores de progressão de capítulos
- **Acessibilidade**: Padrões de navegação consistentes para facilitar a travessia do curso
- **Apresentação Profissional**: Estrutura de curso estilo universitário adequada para treinamento acadêmico e corporativo
- **Eficiência de Aprendizado**: Redução do tempo para encontrar conteúdo relevante por meio de organização aprimorada

#### Implementação Técnica
- **Cabeçalhos de Navegação**: Navegação de capítulos padronizada em mais de 40 arquivos de documentação
- **Rodapé de Navegação**: Orientação de progressão consistente e indicadores de conclusão de capítulos
- **Links Cruzados**: Sistema abrangente de links internos conectando conceitos relacionados
- **Mapeamento de Capítulos**: Templates e exemplos claramente associados a objetivos de aprendizado

#### Aprimoramento do Guia de Estudo
- **📚 Objetivos de Aprendizado Abrangentes**: Guia de estudo reestruturado para alinhar com o sistema de 8 capítulos
- **🎯 Avaliação Baseada em Capítulos**: Cada capítulo inclui objetivos de aprendizado específicos e exercícios práticos
- **📋 Rastreamento de Progresso**: Cronograma semanal de aprendizado com resultados mensuráveis e listas de verificação de conclusão
- **❓ Perguntas de Avaliação**: Perguntas de validação de conhecimento para cada capítulo com resultados profissionais
- **🛠️ Exercícios Práticos**: Atividades práticas com cenários reais de implantação e solução de problemas
- **📊 Progressão de Habilidades**: Avanço claro de conceitos básicos para padrões empresariais com foco em desenvolvimento de carreira
- **🎓 Estrutura de Certificação**: Resultados de desenvolvimento profissional e sistema de reconhecimento comunitário
- **⏱️ Gerenciamento de Cronograma**: Plano de aprendizado estruturado de 10 semanas com validação de marcos

### [v3.1.0] - 17/09/2025

#### Soluções de IA Multiagente Aprimoradas
**Esta versão melhora a solução de varejo multiagente com melhor nomenclatura de agentes e documentação aprimorada.**

#### Alterado
- **Terminologia Multiagente**: Substituído "Agente Cora" por "Agente Cliente" em toda a solução de varejo multiagente para maior clareza
- **Arquitetura de Agentes**: Atualizada toda a documentação, templates ARM e exemplos de código para usar nomenclatura consistente "Agente Cliente"
- **Exemplos de Configuração**: Padrões de configuração de agentes modernizados com convenções de nomenclatura atualizadas
- **Consistência na Documentação**: Garantido que todas as referências usem nomes de agentes profissionais e descritivos

#### Aprimorado
- **Pacote de Templates ARM**: Template retail-multiagent-arm-template atualizado com referências ao Agente Cliente
- **Diagramas de Arquitetura**: Diagramas Mermaid atualizados com nomenclatura de Agente Cliente
- **Exemplos de Código**: Classes Python e exemplos de implementação agora usam nomenclatura CustomerAgent
- **Variáveis de Ambiente**: Atualizados todos os scripts de implantação para usar convenções CUSTOMER_AGENT_NAME

#### Melhorado
- **Experiência do Desenvolvedor**: Papéis e responsabilidades de agentes mais claros na documentação
- **Prontidão para Produção**: Melhor alinhamento com convenções de nomenclatura empresariais
- **Materiais de Aprendizado**: Nomenclatura de agentes mais intuitiva para fins educacionais
- **Usabilidade de Templates**: Compreensão simplificada das funções de agentes e padrões de implantação

#### Detalhes Técnicos
- Diagramas de arquitetura Mermaid atualizados com referências CustomerAgent
- Substituídos nomes de classes CoraAgent por CustomerAgent em exemplos Python
- Configurações JSON de templates ARM modificadas para usar tipo de agente "cliente"
- Variáveis de ambiente atualizadas de CORA_AGENT_* para padrões CUSTOMER_AGENT_*
- Comandos de implantação e configurações de contêineres atualizados

### [v3.0.0] - 12/09/2025

#### Mudanças Principais - Foco em Desenvolvedores de IA e Integração com Azure AI Foundry
**Esta versão transforma o repositório em um recurso abrangente de aprendizado focado em IA com integração ao Azure AI Foundry.**

#### Adicionado
- **🤖 Caminho de Aprendizado Focado em IA**: Reestruturação completa priorizando desenvolvedores e engenheiros de IA
- **Guia de Integração com Azure AI Foundry**: Documentação abrangente para conectar o AZD com serviços do Azure AI Foundry
- **Padrões de Implantação de Modelos de IA**: Guia detalhado cobrindo seleção de modelos, configuração e estratégias de implantação em produção
- **Laboratório de Workshop de IA**: Workshop prático de 2-3 horas para converter aplicativos de IA em soluções implantáveis com AZD
- **Melhores Práticas de IA em Produção**: Padrões prontos para empresas para escalar, monitorar e proteger cargas de trabalho de IA
- **Guia de Solução de Problemas Específico de IA**: Solução de problemas abrangente para Azure OpenAI, Cognitive Services e questões de implantação de IA
- **Galeria de Templates de IA**: Coleção destacada de templates do Azure AI Foundry com classificações de complexidade
- **Materiais de Workshop**: Estrutura completa de workshop com laboratórios práticos e materiais de referência

#### Aprimorado
- **Estrutura do README**: Focado em desenvolvedores de IA com 45% de dados de interesse da comunidade do Discord do Azure AI Foundry
- **Caminhos de Aprendizado**: Jornada dedicada para desenvolvedores de IA ao lado de caminhos tradicionais para estudantes e engenheiros DevOps
- **Recomendações de Templates**: Templates de IA destacados incluindo azure-search-openai-demo, contoso-chat e openai-chat-app-quickstart
- **Integração Comunitária**: Suporte aprimorado à comunidade Discord com canais e discussões específicas de IA

#### Foco em Segurança e Produção
- **Padrões de Identidade Gerenciada**: Configurações de autenticação e segurança específicas de IA
- **Otimização de Custos**: Rastreamento de uso de tokens e controles de orçamento para cargas de trabalho de IA
- **Implantação Multi-região**: Estratégias para implantação global de aplicativos de IA
- **Monitoramento de Desempenho**: Métricas específicas de IA e integração com Application Insights

#### Qualidade da Documentação
- **Estrutura de Curso Linear**: Progressão lógica de padrões básicos para avançados de implantação de IA
- **URLs Validadas**: Todos os links de repositórios externos verificados e acessíveis
- **Referência Completa**: Todos os links internos da documentação validados e funcionais
- **Pronto para Produção**: Padrões de implantação empresariais com exemplos reais

### [v2.0.0] - 09/09/2025

#### Mudanças Principais - Reestruturação do Repositório e Aprimoramento Profissional
**Esta versão representa uma revisão significativa na estrutura do repositório e na apresentação do conteúdo.**

#### Adicionado
- **Estrutura de Aprendizado Organizada**: Todas as páginas de documentação agora incluem seções de Introdução, Objetivos de Aprendizado e Resultados de Aprendizado
- **Sistema de Navegação**: Links de lições anteriores/próximas adicionados em toda a documentação para progressão guiada no aprendizado
- **Guia de Estudo**: Guia de estudo abrangente (study-guide.md) com objetivos de aprendizado, exercícios práticos e materiais de avaliação
- **Apresentação Profissional**: Removidos todos os ícones de emoji para melhorar a acessibilidade e aparência profissional
- **Estrutura de Conteúdo Aprimorada**: Organização e fluxo dos materiais de aprendizado melhorados

#### Alterado
- **Formato da Documentação**: Padronização de toda a documentação com uma estrutura consistente focada no aprendizado
- **Fluxo de Navegação**: Implementação de uma progressão lógica em todos os materiais de aprendizado
- **Apresentação do Conteúdo**: Remoção de elementos decorativos em favor de uma formatação clara e profissional
- **Estrutura de Links**: Atualização de todos os links internos para suportar o novo sistema de navegação

#### Melhorias
- **Acessibilidade**: Remoção de dependências de emojis para melhor compatibilidade com leitores de tela
- **Aparência Profissional**: Apresentação limpa e estilo acadêmico, adequada para aprendizado corporativo
- **Experiência de Aprendizado**: Abordagem estruturada com objetivos e resultados claros para cada lição
- **Organização do Conteúdo**: Melhor fluxo lógico e conexão entre tópicos relacionados

### [v1.0.0] - 2025-09-09

#### Lançamento Inicial - Repositório Abrangente de Aprendizado AZD

#### Adicionado
- **Estrutura Principal da Documentação**
  - Série completa de guias introdutórios
  - Documentação abrangente de implantação e provisionamento
  - Recursos detalhados de solução de problemas e guias de depuração
  - Ferramentas e procedimentos de validação pré-implantação

- **Módulo de Introdução**
  - Fundamentos do AZD: Conceitos principais e terminologia
  - Guia de Instalação: Instruções específicas para configuração da plataforma
  - Guia de Configuração: Configuração do ambiente e autenticação
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
  - Folha de Referência de Comandos: Referência rápida para comandos essenciais
  - Glossário: Definições abrangentes de terminologia e acrônimos
  - FAQ: Respostas detalhadas para perguntas comuns
  - Links para recursos externos e conexões com a comunidade

- **Exemplos e Modelos**
  - Exemplo de Aplicativo Web Simples
  - Modelo de implantação de site estático
  - Configuração de Aplicativo em Contêiner
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
- **Compatibilidade de Versões**: Atualizado com os serviços mais recentes do Azure e recursos do azd

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
- **IA em Nuvem Híbrida**: Padrões de implantação multi-nuvem e híbridos para cargas de trabalho de IA

#### Funcionalidades Avançadas
- **Automação de Pipeline de IA**: Integração de MLOps com pipelines do Azure Machine Learning
- **Segurança Avançada**: Padrões de confiança zero, endpoints privados e proteção contra ameaças avançadas
- **Otimização de Desempenho**: Estratégias avançadas de ajuste e escalonamento para aplicativos de IA de alta performance
- **Distribuição Global**: Padrões de entrega de conteúdo e cache na edge para aplicativos de IA

### Versão 3.0.0 (Planejada) - Substituída pela Versão Atual
#### Adições Propostas - Agora Implementadas na v3.0.0
- ✅ **Conteúdo Focado em IA**: Integração abrangente com Azure AI Foundry (Concluído)
- ✅ **Tutoriais Interativos**: Laboratório prático de IA (Concluído)
- ✅ **Módulo de Segurança Avançada**: Padrões de segurança específicos para IA (Concluído)
- ✅ **Otimização de Desempenho**: Estratégias de ajuste de cargas de trabalho de IA (Concluído)

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
- **Painel da Comunidade**: Métricas em tempo real da comunidade e rastreamento de contribuições

## Contribuindo para o Changelog

### Relatando Alterações
Ao contribuir para este repositório, certifique-se de que as entradas do changelog incluam:

1. **Número da Versão**: Seguindo a versão semântica (major.minor.patch)
2. **Data**: Data de lançamento ou atualização no formato AAAA-MM-DD
3. **Categoria**: Adicionado, Alterado, Obsoleto, Removido, Corrigido, Segurança
4. **Descrição Clara**: Descrição concisa do que foi alterado
5. **Avaliação de Impacto**: Como as alterações afetam os usuários existentes

### Categorias de Alteração

#### Adicionado
- Novos recursos, seções de documentação ou funcionalidades
- Novos exemplos, modelos ou recursos de aprendizado
- Ferramentas, scripts ou utilitários adicionais

#### Alterado
- Modificações em funcionalidades ou documentação existentes
- Atualizações para melhorar clareza ou precisão
- Reestruturação de conteúdo ou organização

#### Obsoleto
- Recursos ou abordagens que estão sendo descontinuados
- Seções de documentação programadas para remoção
- Métodos que possuem alternativas melhores

#### Removido
- Recursos, documentação ou exemplos que não são mais relevantes
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
- Alterações significativas que exigem ação do usuário
- Reestruturação importante de conteúdo ou organização
- Mudanças que alteram a abordagem ou metodologia fundamental

#### Versão Secundária (X.Y.0)
- Novos recursos ou adições de conteúdo
- Melhorias que mantêm compatibilidade retroativa
- Exemplos, ferramentas ou recursos adicionais

#### Versão de Correção (X.Y.Z)
- Correções de bugs e erros
- Melhorias menores em conteúdo existente
- Esclarecimentos e pequenos aprimoramentos

## Feedback e Sugestões da Comunidade

Incentivamos ativamente o feedback da comunidade para melhorar este recurso de aprendizado:

### Como Fornecer Feedback
- **Issues no GitHub**: Relate problemas ou sugira melhorias (questões específicas de IA são bem-vindas)
- **Discussões no Discord**: Compartilhe ideias e interaja com a comunidade Azure AI Foundry
- **Pull Requests**: Contribua com melhorias diretas no conteúdo, especialmente modelos e guias de IA
- **Discord do Azure AI Foundry**: Participe do canal #Azure para discussões sobre AZD + IA
- **Fóruns da Comunidade**: Participe de discussões mais amplas entre desenvolvedores do Azure

### Categorias de Feedback
- **Precisão do Conteúdo de IA**: Correções para informações de integração e implantação de serviços de IA
- **Experiência de Aprendizado**: Sugestões para melhorar o fluxo de aprendizado para desenvolvedores de IA
- **Conteúdo de IA Ausente**: Solicitações de modelos, padrões ou exemplos adicionais de IA
- **Acessibilidade**: Melhorias para atender às diversas necessidades de aprendizado
- **Integração de Ferramentas de IA**: Sugestões para melhor integração de fluxos de trabalho de desenvolvimento de IA
- **Padrões de IA em Produção**: Solicitações de padrões de implantação de IA para empresas

### Compromisso de Resposta
- **Resposta a Issues**: Dentro de 48 horas para problemas relatados
- **Solicitações de Recursos**: Avaliação dentro de uma semana
- **Contribuições da Comunidade**: Revisão dentro de uma semana
- **Questões de Segurança**: Prioridade imediata com resposta acelerada

## Cronograma de Manutenção

### Atualizações Regulares
- **Revisões Mensais**: Precisão do conteúdo e validação de links
- **Atualizações Trimestrais**: Adições e melhorias importantes de conteúdo
- **Revisões Semestrais**: Reestruturação e aprimoramento abrangente
- **Lançamentos Anuais**: Atualizações de versão principal com melhorias significativas

### Monitoramento e Garantia de Qualidade
- **Testes Automatizados**: Validação regular de exemplos de código e links
- **Integração de Feedback da Comunidade**: Incorporação regular de sugestões dos usuários
- **Atualizações Tecnológicas**: Alinhamento com os serviços mais recentes do Azure e lançamentos do azd
- **Auditorias de Acessibilidade**: Revisão regular para princípios de design inclusivo

## Política de Suporte a Versões

### Suporte às Versões Atuais
- **Última Versão Principal**: Suporte completo com atualizações regulares
- **Versão Principal Anterior**: Atualizações de segurança e correções críticas por 12 meses
- **Versões Legadas**: Suporte da comunidade apenas, sem atualizações oficiais

### Orientação para Migração
Quando versões principais são lançadas, fornecemos:
- **Guias de Migração**: Instruções passo a passo para transição
- **Notas de Compatibilidade**: Detalhes sobre alterações significativas
- **Suporte a Ferramentas**: Scripts ou utilitários para auxiliar na migração
- **Suporte da Comunidade**: Fóruns dedicados para dúvidas sobre migração

---

**Navegação**
- **Lição Anterior**: [Guia de Estudos](resources/study-guide.md)
- **Próxima Lição**: Retornar ao [README Principal](README.md)

**Fique Atualizado**: Acompanhe este repositório para notificações sobre novos lançamentos e atualizações importantes nos materiais de aprendizado.

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.