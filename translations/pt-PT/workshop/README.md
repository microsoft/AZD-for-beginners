<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Workshop AZD para Desenvolvedores de IA
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Um workshop prático para construir aplicações de IA com o Azure Developer CLI.</strong><br>
      Complete 7 módulos para dominar os modelos AZD e os fluxos de trabalho de implementação de IA.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Última atualização: Março 2026
      </span>
    </div>
  </div>
</div>

# Workshop AZD para Desenvolvedores de IA

Bem-vindo ao workshop prático para aprender o Azure Developer CLI (AZD) com foco na implementação de aplicações de IA. Este workshop ajuda-o a obter um entendimento aplicado dos modelos AZD em 3 passos:

1. **Descobrir** - encontre o modelo certo para si.
1. **Implementar** - implemente e valide que funciona
1. **Personalizar** - modifique e itere para ser seu!

Ao longo deste workshop, também será apresentado a ferramentas e fluxos de trabalho essenciais para desenvolvedores, para ajudar a agilizar toda a sua jornada de desenvolvimento.

<br/>

## Guia Baseado no Navegador

As lições do workshop estão em Markdown. Pode navegar por elas diretamente no GitHub – ou iniciar uma pré-visualização baseada no navegador como mostrado na imagem abaixo.

![Workshop](../../../translated_images/pt-PT/workshop.75906f133e6f8ba0.webp)

Para usar esta opção – faça um fork do repositório para o seu perfil e inicie o GitHub Codespaces. Assim que o terminal do VS Code estiver ativo, digite este comando:

Esta pré-visualização no navegador funciona no GitHub Codespaces, contentores de desenvolvimento ou numa cópia local com Python e MkDocs instalados.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Em alguns segundos, verá uma caixa de diálogo pop-up. Selecione a opção `Abrir no navegador`. O guia baseado na web será então aberto numa nova aba do navegador. Alguns benefícios desta pré-visualização:

1. **Pesquisa incorporada** - encontre palavras-chave ou lições rapidamente.
1. **Ícone de copiar** - passe o rato por cima dos blocos de código para ver esta opção
1. **Alternar tema** - alterne entre temas claro e escuro
1. **Obtenha ajuda** - clique no ícone do Discord no rodapé para participar!

<br/>

## Visão Geral do Workshop

**Duração:** 3-4 horas  
**Nível:** Iniciante a Intermédio  
**Pré-requisitos:** Familiaridade com Azure, conceitos de IA, VS Code e ferramentas de linha de comando.

Este é um workshop prático onde aprende fazendo. Após completar os exercícios, recomendamos rever o currículo AZD Para Iniciantes para continuar a sua aprendizagem em Segurança e Melhores Práticas de Produtividade.

| Tempo| Módulo  | Objetivo |
|:---|:---|:---|
| 15 mins | [Introdução](docs/instructions/0-Introduction.md) | Definir o contexto, compreender os objetivos |
| 30 mins | [Selecionar Modelo IA](docs/instructions/1-Select-AI-Template.md) | Explorar opções e escolher ponto de partida | 
| 30 mins | [Validar Modelo IA](docs/instructions/2-Validate-AI-Template.md) | Implementar solução padrão no Azure |
| 30 mins | [Desconstruir Modelo IA](docs/instructions/3-Deconstruct-AI-Template.md) | Explorar estrutura e configuração |
| 30 mins | [Configurar Modelo IA](docs/instructions/4-Configure-AI-Template.md) | Ativar e testar funcionalidades disponíveis |
| 30 mins | [Personalizar Modelo IA](docs/instructions/5-Customize-AI-Template.md) | Adaptar o modelo às suas necessidades |
| 30 mins | [Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) | Limpar e libertar recursos |
| 15 mins | [Conclusão e Próximos Passos](docs/instructions/7-Wrap-up.md) | Recursos de aprendizagem, desafio do workshop |

<br/>

## O Que Vai Aprender

Pense no Modelo AZD como uma sandbox de aprendizagem para explorar várias capacidades e ferramentas para desenvolvimento end-to-end na Microsoft Foundry. Até ao fim deste workshop, deverá ter uma noção intuitiva de diversas ferramentas e conceitos neste contexto.

| Conceito  | Objetivo |
|:---|:---|
| **Azure Developer CLI** | Compreender comandos e fluxos de trabalho da ferramenta|
| **Modelos AZD**| Compreender estrutura e configuração do projeto|
| **Azure AI Agent**| Provisionar e implementar projeto Microsoft Foundry  |
| **Azure AI Search**| Ativar engenharia contextual com agentes |
| **Observabilidade**| Explorar tracing, monitorização e avaliações |
| **Red Teaming**| Explorar testes adversariais e mitigação |

<br/>

## Estrutura do Workshop

O workshop está estruturado para o levar numa jornada desde a descoberta do modelo, à implementação, desconstrução e personalização – usando como base o modelo oficial [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents).

### [Módulo 1: Selecionar Modelo IA](docs/instructions/1-Select-AI-Template.md) (30 mins)

- O que são Modelos IA?
- Onde posso encontrar Modelos IA?
- Como posso começar a construir Agentes de IA?
- **Lab**: Início rápido em Codespaces ou contentor de desenvolvimento

### [Módulo 2: Validar Modelo IA](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Qual é a Arquitetura do Modelo IA?
- Qual é o Fluxo de Trabalho de Desenvolvimento AZD?
- Como posso obter ajuda com o Desenvolvimento AZD?
- **Lab**: Implementar e validar modelo de Agentes de IA

### [Módulo 3: Desconstruir Modelo IA](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Explore o seu ambiente em `.azure/` 
- Explore a configuração dos seus recursos em `infra/` 
- Explore a configuração AZD em `azure.yaml`s
- **Lab**: Modificar Variáveis de Ambiente e Reimplantar

### [Módulo 4: Configurar Modelo IA](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Explorar: Geração Aumentada por Recuperação
- Explorar: Avaliação de Agentes e Red Teaming
- Explorar: Tracing e Monitorização
- **Lab**: Explorar Agente IA + Observabilidade 

### [Módulo 5: Personalizar Modelo IA](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Definir: PRD com Requisitos do Cenário
- Configurar: Variáveis de Ambiente para AZD
- Implementar: Ganchos de Ciclo de Vida para tarefas adicionais
- **Lab**: Personalizar modelo para o meu cenário

### [Módulo 6: Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Recapitulação: O que são Modelos AZD?
- Recapitulação: Por que usar o Azure Developer CLI?
- Próximos passos: Experimente um modelo diferente!
- **Lab**: Desprovisionar infraestrutura e limpeza

<br/>

## Desafio do Workshop

Quer desafiar-se a fazer mais? Aqui estão algumas sugestões de projetos – ou partilhe as suas ideias connosco!!

| Projeto | Descrição |
|:---|:---|
|1. **Desconstruir Um Modelo IA Complexo** | Use o fluxo de trabalho e ferramentas que delineámos e veja se consegue implementar, validar e personalizar um modelo diferente de solução IA. _O que aprendeu?_|
|2. **Personalizar Com o Seu Cenário**  | Experimente escrever um PRD (Documento de Requisitos do Produto) para um cenário diferente. Depois use o GitHub Copilot no seu repositório de modelo no Agent Model – e peça-lhe para gerar um fluxo de trabalho de personalização para si. _O que aprendeu? Como poderia melhorar estas sugestões?_|
| | |

## Tem feedback?

1. Publique um problema neste repositório – identifique-o com `Workshop` para facilitar.
1. Junte-se ao Discord Microsoft Foundry – conecte-se com os seus pares!


| | | 
|:---|:---|
| **📚 Página Principal do Curso**| [AZD Para Iniciantes](../README.md)|
| **📖 Documentação** | [Comece com modelos IA](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Modelos IA** | [Modelos Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Próximos Passos** | [Iniciar Workshop](#visão-geral-do-workshop) |
| | |

<br/>

---

**Navegação:** [Curso Principal](../README.md) | [Introdução](docs/instructions/0-Introduction.md) | [Módulo 1: Selecionar Modelo](docs/instructions/1-Select-AI-Template.md)

**Pronto para começar a construir aplicações de IA com AZD?**

[Iniciar Workshop: Introdução →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->