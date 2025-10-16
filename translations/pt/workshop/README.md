<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:40:45+00:00",
  "source_file": "workshop/README.md",
  "language_code": "pt"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop em Construção 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Este workshop está atualmente em desenvolvimento ativo.</strong><br>
      O conteúdo pode estar incompleto ou sujeito a alterações. Volte em breve para atualizações!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Última Atualização: Outubro de 2025
      </span>
    </div>
  </div>
</div>

# Workshop AZD para Desenvolvedores de IA

Bem-vindo ao workshop prático para aprender a CLI do Azure Developer (AZD) com foco na implementação de aplicações de IA. Este workshop ajuda-o a adquirir um entendimento prático dos templates AZD em 3 etapas:

1. **Descoberta** - encontre o template certo para si.
1. **Implementação** - implemente e valide que funciona.
1. **Personalização** - modifique e adapte para atender às suas necessidades!

Ao longo deste workshop, também será introduzido a ferramentas e fluxos de trabalho essenciais para desenvolvedores, ajudando a simplificar a sua jornada de desenvolvimento de ponta a ponta.

<br/>

## Guia Baseado no Navegador

As lições do workshop estão em Markdown. Pode navegá-las diretamente no GitHub - ou lançar uma pré-visualização no navegador, como mostrado na imagem abaixo.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.pt.png)

Para usar esta opção - faça um fork do repositório para o seu perfil e inicie o GitHub Codespaces. Assim que o terminal do VS Code estiver ativo, digite este comando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Em poucos segundos, verá um diálogo pop-up. Selecione a opção `Abrir no navegador`. O guia baseado no navegador será aberto numa nova aba. Alguns benefícios desta pré-visualização:

1. **Pesquisa integrada** - encontre palavras-chave ou lições rapidamente.
1. **Ícone de cópia** - passe o cursor sobre os blocos de código para ver esta opção.
1. **Alternância de tema** - mude entre temas claro e escuro.
1. **Obtenha ajuda** - clique no ícone do Discord no rodapé para participar!

<br/>

## Visão Geral do Workshop

**Duração:** 3-4 horas  
**Nível:** Iniciante a Intermediário  
**Pré-requisitos:** Familiaridade com Azure, conceitos de IA, VS Code e ferramentas de linha de comando.

Este é um workshop prático onde aprende fazendo. Após concluir os exercícios, recomendamos revisar o currículo AZD Para Iniciantes para continuar a sua jornada de aprendizagem em práticas de Segurança e Produtividade.

| Tempo| Módulo  | Objetivo |
|:---|:---|:---|
| 15 mins | [Introdução](docs/instructions/0-Introduction.md) | Definir o contexto, entender os objetivos |
| 30 mins | [Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) | Explorar opções e escolher um ponto de partida | 
| 30 mins | [Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) | Implementar solução padrão no Azure |
| 30 mins | [Desconstruir Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) | Explorar estrutura e configuração |
| 30 mins | [Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) | Ativar e testar funcionalidades disponíveis |
| 30 mins | [Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) | Adaptar o template às suas necessidades |
| 30 mins | [Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) | Limpar e liberar recursos |
| 15 mins | [Conclusão e Próximos Passos](docs/instructions/7-Wrap-up.md) | Recursos de aprendizagem, desafio do workshop |

<br/>

## O Que Vai Aprender

Pense no Template AZD como um ambiente de aprendizagem para explorar várias capacidades e ferramentas para desenvolvimento de ponta a ponta no Azure AI Foundry. Ao final deste workshop, deverá ter uma compreensão intuitiva de várias ferramentas e conceitos neste contexto.

| Conceito  | Objetivo |
|:---|:---|
| **CLI do Azure Developer** | Compreender comandos e fluxos de trabalho da ferramenta |
| **Templates AZD**| Compreender estrutura e configuração de projetos |
| **Agente de IA do Azure**| Provisionar e implementar projeto no Azure AI Foundry |
| **Pesquisa de IA do Azure**| Ativar engenharia de contexto com agentes |
| **Observabilidade**| Explorar rastreamento, monitorização e avaliações |
| **Testes Adversariais**| Explorar testes adversariais e mitigações |

<br/>

## Estrutura do Workshop

O workshop está estruturado para levá-lo numa jornada desde a descoberta do template, até à implementação, desconstrução e personalização - usando o template oficial [Introdução aos Agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) como base.

### [Módulo 1: Selecionar Template de IA](docs/instructions/1-Select-AI-Template.md) (30 mins)

- O que são Templates de IA?
- Onde posso encontrar Templates de IA?
- Como posso começar a construir Agentes de IA?
- **Laboratório**: Início rápido com GitHub Codespaces

### [Módulo 2: Validar Template de IA](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Qual é a Arquitetura do Template de IA?
- Qual é o Fluxo de Trabalho de Desenvolvimento AZD?
- Como posso obter ajuda com o Desenvolvimento AZD?
- **Laboratório**: Implementar e Validar o template de Agentes de IA

### [Módulo 3: Desconstruir Template de IA](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Explorar o ambiente em `.azure/` 
- Explorar a configuração de recursos em `infra/` 
- Explorar a configuração AZD em `azure.yaml`s
- **Laboratório**: Modificar Variáveis de Ambiente e Reimplementar

### [Módulo 4: Configurar Template de IA](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Explorar: Geração Aumentada por Recuperação
- Explorar: Avaliação de Agentes e Testes Adversariais
- Explorar: Rastreamento e Monitorização
- **Laboratório**: Explorar Agente de IA + Observabilidade 

### [Módulo 5: Personalizar Template de IA](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Definir: PRD com Requisitos de Cenário
- Configurar: Variáveis de Ambiente para AZD
- Implementar: Hooks de Ciclo de Vida para tarefas adicionais
- **Laboratório**: Personalizar template para o meu cenário

### [Módulo 6: Desmontar Infraestrutura](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Recapitular: O que são Templates AZD?
- Recapitular: Por que usar a CLI do Azure Developer?
- Próximos Passos: Experimente um template diferente!
- **Laboratório**: Desprovisionar infraestrutura e limpar

<br/>

## Desafio do Workshop

Quer desafiar-se a fazer mais? Aqui estão algumas sugestões de projetos - ou partilhe as suas ideias connosco!!

| Projeto | Descrição |
|:---|:---|
|1. **Desconstruir um Template de IA Complexo** | Use o fluxo de trabalho e as ferramentas que delineámos e veja se consegue implementar, validar e personalizar um template de solução de IA diferente. _O que aprendeu?_|
|2. **Personalizar com o Seu Cenário**  | Experimente escrever um PRD (Documento de Requisitos de Produto) para um cenário diferente. Depois, use o GitHub Copilot no seu repositório de templates no Modelo de Agente - e peça-lhe para gerar um fluxo de trabalho de personalização para si. _O que aprendeu? Como poderia melhorar estas sugestões?_|
| | |

## Tem feedback?

1. Publique um problema neste repositório - marque-o como `Workshop` para conveniência.
1. Junte-se ao Discord do Azure AI Foundry - conecte-se com os seus pares!


| | | 
|:---|:---|
| **📚 Página Inicial do Curso**| [AZD Para Iniciantes](../README.md)|
| **📖 Documentação** | [Introdução aos templates de IA](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Templates de IA** | [Templates do Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Próximos Passos** | [Aceite o Desafio](../../../workshop) |
| | |

<br/>

---

**Anterior:** [Guia de Resolução de Problemas de IA](../docs/troubleshooting/ai-troubleshooting.md) | **Próximo:** Comece com [Laboratório 1: Fundamentos do AZD](../../../workshop/lab-1-azd-basics)

**Pronto para começar a construir aplicações de IA com AZD?**

[Comece o Laboratório 1: Fundamentos do AZD →](./lab-1-azd-basics/README.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.